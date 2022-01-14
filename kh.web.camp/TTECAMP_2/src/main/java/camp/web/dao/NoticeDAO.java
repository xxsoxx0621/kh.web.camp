package camp.web.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import camp.web.dto.NoticeDTO;
import camp.web.statics.Statics;

public class NoticeDAO {

	private NoticeDAO() {		

	}
	private static NoticeDAO instance = null;

	public static NoticeDAO getInstance() {
		if(instance == null) {
			instance = new NoticeDAO();
		}
		return instance;
	}

	private Connection getConnection() throws Exception{
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}

	public int getRecordCount() throws Exception {
		String sql = "select count(*) from notice";

		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();){
			rs.next();
			return rs.getInt(1);
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
			pageNavi += "<a href='/boardlist.board?cpage="+(startNavi-1)+"'><</a>";
		}

		for(int i = startNavi ; i<=endNavi; i++) {
			pageNavi+= "<a href='/boardlist.board?cpage=" +i+ "'>"+ i+"</a> ";
		}
		if(needNext) {
			pageNavi += "<a href='/boardlist.board?cpage="+(endNavi+1)+"'>></a>";
		}
		return pageNavi;
	}



	public List<NoticeDTO> selectByBound(int start, int end) throws Exception{
		String sql = "select * from (select NOTICE.*, row_number() over(order by NOTICE_NO_SEQ desc) rn from NOTICE) where rn between ? and ?";

		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, start);
			pstat.setInt(2, end);

			try(ResultSet rs = pstat.executeQuery()){
				List<NoticeDTO> list = new ArrayList<>();

				while(rs.next()) {
					NoticeDTO dto = new NoticeDTO();
					dto.setNotice_no_seq(rs.getInt("NOTICE_NO_SEQ"));
					dto.setAdmin_id(rs.getString("ADMIN_ID"));
					dto.setTitle(rs.getString("title"));
					dto.setContents(rs.getString("CONTENTS"));
					dto.setDate(rs.getDate("WRITE_DATE"));;
					dto.setView_count(rs.getInt("view_count"));
					list.add(dto);
				}
				return list;
			}
		}
	}



	public int insertNoticeList(String title, String content) throws Exception {
		String sql = "insert into NOTICE values(NOTICE_NO_SEQ_SEQ.nextval,default,?,?,sysdate,0)";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, title);
			pstat.setString(2, content);

			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}



	public List<NoticeDTO> selectAll() throws Exception{
		String sql = "select * from NOTICE order by NOTICE_NO_SEQ DESC";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();){
			List<NoticeDTO> list = new ArrayList<>();
			while(rs.next()) {
				int notice_no_seq = rs.getInt("NOTICE_NO_SEQ");
				String admin_id = rs.getString("ADMIN_ID");
				String title = rs.getString("TITLE");
				String contents = rs.getString("CONTENTS");
				Date date = rs.getDate("WRITE_DATE");
				int view_count = rs.getInt("VIEW_COUNT");
				NoticeDTO dto = new NoticeDTO(notice_no_seq, admin_id, title, contents, date, view_count );
				list.add(dto);
			}
			return list;
		}
	}

	public List<NoticeDTO> selectDetail(int seq) throws Exception {
		String sql = "select * from NOTICE WHERE NOTICE_NO_SEQ = ?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, seq);
			try(
					ResultSet rs = pstat.executeQuery();){
				List<NoticeDTO> list = new ArrayList<>();
				if(rs.next()) {
					int notice_no_seq = rs.getInt("NOTICE_NO_SEQ");
					String admin_id = rs.getString("ADMIN_ID");
					String title = rs.getString("TITLE");
					String contents = rs.getString("CONTENTS");
					Date date = rs.getDate("WRITE_DATE");
					int view_count = rs.getInt("VIEW_COUNT");
					NoticeDTO dto = new NoticeDTO(notice_no_seq, admin_id, title, contents, date, view_count );
					list.add(dto);
				}
				return list;
			}
		}
	}

	public int deleteNotice(int seq) throws Exception {
		String sql = "DELETE FROM NOTICE WHERE NOTICE_NO_SEQ = ?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, seq);

			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}

	public int modifyNotice(String title, String contents, int seq) throws Exception {
		String sql = "UPDATE NOTICE SET TITLE = ? , CONTENTS = ? WHERE NOTICE_NO_SEQ =?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, title);
			pstat.setString(2, contents);
			pstat.setInt(3, seq);

			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}


	public int upViewCount(int seq) throws Exception {
		String sql = "UPDATE NOTICE SET VIEW_COUNT = VIEW_COUNT+1 WHERE NOTICE_NO_SEQ = ?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, seq);

			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}

	public int viewSeq() throws Exception {
		String sql = "select * from notice order by NOTICE_NO_SEQ desc";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();){

			int seq = 0;
			if(rs.next()) {
				seq = rs.getInt("NOTICE_NO_SEQ");	
			}return seq;
		}
	}

	//	public boolean isItAdmin(String id, String pw) throws Exception{
	//		String sql = "select * from member where user_id=? and password=?";
	//		try(
	//				Connection con = this.getConnection();
	//				PreparedStatement pstat = con.prepareStatement(sql);){
	//			pstat.setString(0, sql)
	//		}
	//	}

	//	public int insertNotice(String title, String content) throws Exception{
	//		String sql = "insert into values(NOTICE_NO_SEQ_SEQ.NEXTVAL,'test',?,?,sysdate,0";
	//
	//	}
}
