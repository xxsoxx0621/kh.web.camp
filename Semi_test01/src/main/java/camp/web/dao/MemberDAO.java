package camp.web.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import camp.web.dto.MemberDTO;
import camp.web.statics.Statics;



public class MemberDAO {

	private static MemberDAO instance = null;
	public static MemberDAO getInstance() {
		if(instance == null) {
			instance = new MemberDAO();
		}

		return instance;
	}

	private MemberDAO() {}

	private Connection getConnection() throws Exception {

		javax.naming.Context ctx = new InitialContext();
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}


	public boolean isIdExist(String id) throws Exception{

		String sql = "select * from member where user_id = ?";

		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){

			pstat.setString(1, id);

			try(ResultSet rs = pstat.executeQuery()){
				return rs.next();
			}

		}
	}

	public int insert(MemberDTO dto) throws Exception{

		String sql = "insert into member values(?,?,?,?,?,?,?,?,?,?,?,sysdate,member_seq.NEXTVAL)";

		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){

			pstat.setString(1, dto.getUser_id());
			pstat.setString(2, dto.getPassword());
			pstat.setString(3, dto.getName());
			pstat.setString(4, dto.getPhone());
			pstat.setString(5, dto.getEmail());
			pstat.setString(6, dto.getOriginEmail());
			pstat.setString(7, dto.getZip_code());
			pstat.setString(8, dto.getAddress1());
			pstat.setString(9, dto.getAddress2());
			pstat.setString(10, dto.getHint());
			pstat.setString(11, dto.getHint_answer());

			int result = pstat.executeUpdate();

			return result;


		}
	}

	public boolean login(String id, String pw) throws Exception{

		String sql = "select * from member where user_id = ? and password = ?";

		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, id);
			pstat.setString(2, pw);

			try(ResultSet  rs = pstat.executeQuery();){

				return rs.next();

			}


		}

	}

	public boolean isEmailExist(String email) throws Exception{

		String sql = "select * from member where email =?";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql)){

			pstat.setString(1, email);


			try(ResultSet rs = pstat.executeQuery()){
				return rs.next();
			}
		}


	}
	public MemberDTO getId(String email) throws Exception{

		String sql = "select * from member where email =?";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql)){

			pstat.setString(1, email);

			try(ResultSet rs = pstat.executeQuery()){
				if(rs.next()) {
					MemberDTO dto = new MemberDTO();
					dto.setUser_id(rs.getString("user_id"));
					return dto;
				}
			}
			return null;
		}
	}

	public boolean findPw(String id, String question, String answer) throws Exception{

		String sql = "select * from member where user_id = ? and hint =? and hint_answer = ? ";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql)){

			pstat.setString(1, id);
			pstat.setString(2, question);
			pstat.setString(3, answer);


			try(ResultSet rs = pstat.executeQuery()){
				return rs.next();
			}
		}


	}

	public boolean resetPw(String id, String pw) throws Exception{

		String sql = "update member set password =? where user_id = ? ";

		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql)){

			pstat.setString(1, pw);
			pstat.setString(2, id);


			try(ResultSet rs = pstat.executeQuery()){
				return rs.next();
			}
		}
	}

	public List<MemberDTO> getAllInfo(String id) throws Exception{
		String sql = "select * from member where user_id = ?";

		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql)){

			pstat.setString(1, id);


			try(ResultSet rs = pstat.executeQuery()){

				List<MemberDTO> list = new ArrayList<>();


				while(rs.next()) {
					String user_id = rs.getString("user_id");  
					String pw = rs.getString("password"); 
					String name = rs.getString("name"); 
					String phone  = rs.getString("phone");   
					String email = rs.getString("email");
					String originEmail = rs.getString("originEmail");
					String zipcode = rs.getString("zip_code");
					String address1 = rs.getString("address1");
					String address2 = rs.getString("address2");
					String hint = rs.getString("hint");
					String hint_answer = rs.getString("hint_answer");
					Date date = rs.getDate( "signup_date");
					int seq = rs.getInt( "seq");
					MemberDTO dto = new MemberDTO(user_id,pw,name,phone,email,originEmail,zipcode,address1,address2,hint,hint_answer,date,seq);
					list.add(dto);

				}
				return list;     
			}

		}
	}
	public boolean isMatchPw(String id, String pw) throws Exception{

		String sql = "select * from member where user_id = ? and password = ?";

		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql)){

			pstat.setString(1,id);
			pstat.setString(2,pw);

			try(ResultSet rs = pstat.executeQuery()){
				return rs.next();
			}
		}

	}

	public int updateInfo(MemberDTO dto) throws Exception{
		// 변경될 비밀번호가 없을 때,
		String sql = "update member set  phone =?, email =?,originEmail = ? ,zip_code =?, address1 =?, address2 =?, hint =?, hint_answer =? where user_id = ?";

		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql)){


			pstat.setString(1, dto.getPhone());
			pstat.setString(2, dto.getEmail());
			pstat.setString(3, dto.getOriginEmail());
			pstat.setString(4, dto.getZip_code());
			pstat.setString(5, dto.getAddress1());
			pstat.setString(6, dto.getAddress2());
			pstat.setString(7, dto.getHint());
			pstat.setString(8, dto.getHint_answer());
			pstat.setString(9, dto.getUser_id());


			int result = pstat.executeUpdate();

			return result;
		}

	}

	public int updateInfo1(MemberDTO dto) throws Exception{
		// 변경될 비밀번호가 있을 때,
		String sql = "update member set password = ? ,phone =?,email =?, originEmail = ?,zip_code =?, address1 =?, address2 =?, hint =?, hint_answer =? where user_id = ?";


		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql)){

			pstat.setString(1, dto.getPassword());
			pstat.setString(2, dto.getPhone());
			pstat.setString(3, dto.getEmail());
			pstat.setString(4, dto.getOriginEmail());
			pstat.setString(5, dto.getZip_code());
			pstat.setString(6, dto.getAddress1());
			pstat.setString(7, dto.getAddress2());
			pstat.setString(8, dto.getHint());
			pstat.setString(9, dto.getHint_answer());
			pstat.setString(10, dto.getUser_id());


			int result = pstat.executeUpdate();

			return result;
		}
	}

	public int deleteUser(String id) throws Exception{
		String sql = "delete from member where user_id =? ";

		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql)){

			pstat.setString(1, id);


			int result = pstat.executeUpdate();

			return result;
		}
	}

	public List<MemberDTO> selectAll() throws Exception{

		String sql = "select * from member";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery()){

			List<MemberDTO> list = new ArrayList<>();


			while(rs.next()) {
				String user_id = rs.getString("user_id");  
				String pw = rs.getString("password"); 
				String name = rs.getString("name"); 
				String phone  = rs.getString("phone");   
				String email = rs.getString("email");
				String originEmail = rs.getString("originEmail");
				String zipcode = rs.getString("zip_code");
				String address1 = rs.getString("address1");
				String address2 = rs.getString("address2");
				String hint = rs.getString("hint");
				String hint_answer = rs.getString("hint_answer");
				Date date = rs.getDate( "signup_date");
				int seq = rs.getInt( "seq");
				MemberDTO dto = new MemberDTO(user_id,pw,name,phone,email,originEmail,zipcode,address1,address2,hint,hint_answer,date,seq);
				list.add(dto);

			}
			return list;     
		}

	}
	public List<MemberDTO> selectByBound(int start, int end) throws Exception{
		String sql = "select * from (select member.*, row_number() over(order by seq desc) rn from member) where rn between ? and ?";

		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, start);
			pstat.setInt(2, end);

			try(ResultSet rs = pstat.executeQuery()){
				List<MemberDTO> list = new ArrayList<>();

				while(rs.next()) {
					String user_id = rs.getString("user_id");  
					String pw = rs.getString("password"); 
					String name = rs.getString("name"); 
					String phone  = rs.getString("phone");   
					String email = rs.getString("email");
					String originEmail = rs.getString("originEmail");
					String zipcode = rs.getString("zip_code");
					String address1 = rs.getString("address1");
					String address2 = rs.getString("address2");
					String hint = rs.getString("hint");
					String hint_answer = rs.getString("hint_answer");
					Date date = rs.getDate( "signup_date");
					int seq = rs.getInt( "seq");
					MemberDTO dto = new MemberDTO(user_id,pw,name,phone,email,originEmail,zipcode,address1,address2,hint,hint_answer,date,seq);
					list.add(dto);
				}
				return list;
			}
		}
	}
	public String getPageNavi(int currentPage) throws Exception {
		int recordTotalCount = this.getRecordCount();
		int recordCountPerPage = Statics.RECORD_COUNT_PER_PAGE;
		int naviCountPerPage = Statics.NAVI_COUNT_PER_PAGE;
		int pageTotalCount;

		if(recordTotalCount % Statics.RECORD_COUNT_PER_PAGE == 0) {
			pageTotalCount = recordTotalCount / Statics.RECORD_COUNT_PER_PAGE;	
		}else {
			pageTotalCount = recordTotalCount / recordCountPerPage +1;
		}

		int startNavi = (currentPage-1) / naviCountPerPage * naviCountPerPage +1;
		int endNavi = startNavi + naviCountPerPage -1;

		if(currentPage < 1) {
			currentPage = 1;
		}else if(currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}

		if(endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}

		boolean needPrev = true;
		boolean needNext = true;

		if(startNavi == 1) {
			needPrev = false;
		}

		if(endNavi == pageTotalCount) {
			needNext = false;
		}

		String pageNavi = "";

		if(needPrev) {
			pageNavi += "<a href='/manageMember.admin?cpage="+(startNavi-1)+"'><</a>";
		}

		for(int i = startNavi ; i<=endNavi; i++) {
			pageNavi+= "<a href='/manageMember.admin?cpage=" +i+ "'>"+ i+"</a> ";
		}
		if(needNext) {
			pageNavi += "<a href='/manageMember.admin?cpage="+(endNavi+1)+"'>></a>";
		}
		return pageNavi;
	}
	public int getRecordCount() throws Exception {
		String sql = "select count(*) from member";
		try(
				Connection con =this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();){
			rs.next();
			return rs.getInt(1);
		}
	}
	
	public List<MemberDTO> searchId(String id) throws Exception{
		String sql = "select * from member where user_id = ?";
		
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql)){
			
				pstat.setString(1, id);
				
				List<MemberDTO> list = new ArrayList<>();
				try(ResultSet rs =  pstat.executeQuery();){
					while (rs.next()) {
					
						String user_id = rs.getString("user_id");  
						String pw = rs.getString("password"); 
						String name = rs.getString("name"); 
						String phone  = rs.getString("phone");   
						String email = rs.getString("email");
						String originEmail = rs.getString("originEmail");
						String zipcode = rs.getString("zip_code");
						String address1 = rs.getString("address1");
						String address2 = rs.getString("address2");
						String hint = rs.getString("hint");
						String hint_answer = rs.getString("hint_answer");
						Date date = rs.getDate( "signup_date");
						int seq = rs.getInt( "seq");
						MemberDTO dto = new MemberDTO(user_id,pw,name,phone,email,originEmail,zipcode,address1,address2,hint,hint_answer,date,seq);
						list.add(dto);
						
					}
					return list;
				}
		}
		
		
	}
	public List<MemberDTO> searchName(String name) throws Exception{
		String sql = "select * from member where name = ?";
		
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql)){
			
				pstat.setString(1, name);
				
				List<MemberDTO> list = new ArrayList<>();
				try(ResultSet rs =  pstat.executeQuery();){
					while (rs.next()) {
					
						String user_id = rs.getString("user_id");  
						String pw = rs.getString("password"); 
						String name1 = rs.getString("name"); 
						String phone  = rs.getString("phone");   
						String email = rs.getString("email");
						String originEmail = rs.getString("originEmail");
						String zipcode = rs.getString("zip_code");
						String address1 = rs.getString("address1");
						String address2 = rs.getString("address2");
						String hint = rs.getString("hint");
						String hint_answer = rs.getString("hint_answer");
						Date date = rs.getDate( "signup_date");
						int seq = rs.getInt( "seq");
						MemberDTO dto = new MemberDTO(user_id,pw,name1,phone,email,originEmail,zipcode,address1,address2,hint,hint_answer,date,seq);
						list.add(dto);
						
					}
					return list;
				}
		}
		
		
	}
	public int adminDeleteMem(String id) throws Exception{
		String sql = "delete from member where user_id =? ";

		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql)){

			pstat.setString(1, id);


			int result = pstat.executeUpdate();

			return result;
		}
	}
	
	
}