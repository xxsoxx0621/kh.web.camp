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

import camp.web.dto.QnaDTO;
import camp.web.statics.Statics;

public class QnaDAO {

	private QnaDAO() {		

	}
	private static QnaDAO instance = null;

	public static QnaDAO getInstance() {
		if(instance == null) {
			instance = new QnaDAO();
		}
		return instance;
	}

	public int getRecordCount() throws Exception {
		String sql = "select count(*) from QNA";
		try(
				Connection con =this.getConnection();
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
			pageNavi += "<a href='/qnaList.qna?cpage="+(startNavi-1)+"'><</a>";
		}

		for(int i = startNavi ; i<=endNavi; i++) {
			pageNavi+= "<a href='/qnaList.qna?cpage=" +i+ "'>"+ i+"</a> ";
		}
		if(needNext) {
			pageNavi += "<a href='/qnaList.qna?cpage="+(endNavi+1)+"'>></a>";
		}
		return pageNavi;
	}

	private Connection getConnection() throws Exception{
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}

	public int insertQna(String id, String title, String content) throws Exception {
		String sql = "insert into qna values (QNA_NO_SEQ.NEXTVAL, ?, ?, ?, sysdate, 0)";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, id);
			pstat.setString(2, title);
			pstat.setString(3, content);

			int result = pstat.executeUpdate();
	
			return result;
		}
	}
	
	public int deleteQna(int seq) throws Exception{
		String sql = "delete from QNA where QNA_NO = ?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, seq);
			int result = pstat.executeUpdate();
			
			return result;
		}
	}
	
	public int modifyQna(String title, String contents, int seq) throws Exception {
		String sql = "UPDATE QNA SET QNA_TITLE = ?, QNA_CONTENTS = ? WHERE QNA_NO = ?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, title);
			pstat.setString(2, contents);
			pstat.setInt(3, seq);
			int result = pstat.executeUpdate();
			
			return result;
		}
	}

	public int viewSeq(String id) throws Exception {
		String sql = "select * from qna where QNA_ID = ? order by QNA_NO desc";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, id);
			try(
					ResultSet rs = pstat.executeQuery();){
				int seq;
				if(rs.next()) {
					seq = rs.getInt("QNA_NO");
				}else {
					seq = 0;
				}return seq;

			}
		}
	}

	public int upViewCount(int seq) throws Exception{
		String sql = "UPDATE QNA SET QNA_VIEW_COUNT = QNA_VIEW_COUNT+1 WHERE QNA_NO = ?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, seq);
			int result = pstat.executeUpdate();
		
			return result;
		}
	}

	public List<QnaDTO> selectByBound(int start, int end) throws Exception{
		String sql = "select * from (select QNA.*, row_number() over(order by QNA_NO desc) rn from QNA) where rn between ? and ?";

		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, start);
			pstat.setInt(2, end);

			try(ResultSet rs = pstat.executeQuery()){
				List<QnaDTO> list = new ArrayList<>();

				while(rs.next()) {
					QnaDTO dto = new QnaDTO();
					dto.setQna_no(rs.getInt("QNA_NO"));
					dto.setQna_id(rs.getString("QNA_ID"));
					dto.setQna_title(rs.getString("QNA_TITLE"));
					dto.setQna_contents(rs.getString("QNA_CONTENTS"));
					dto.setQna_date(rs.getDate("QNA_DATE"));
					dto.setQna_view_count(rs.getInt("QNA_VIEW_COUNT"));
					list.add(dto);
				}
				return list;
			}
		}
	}

	public List<QnaDTO> selectAll() throws Exception{
		String sql = "select * from QNA order by QNA_NO desc";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();){
			List list = new ArrayList();
			while(rs.next()) {
				int qna_no = rs.getInt("QNA_NO");
				String qna_id = rs.getString("QNA_ID");
				String qna_title = rs.getString("QNA_TITLE");
				String qna_contents = rs.getString("QNA_CONTENTS");
				Date qna_date = rs.getDate("QNA_DATE");
				int qna_view_count = rs.getInt("QNA_VIEW_COUNT");
				QnaDTO dto = new QnaDTO(qna_no, qna_id, qna_title, qna_contents, qna_date, qna_view_count);
				list.add(dto);	
			}
			return list;
		}
	}

	public List<QnaDTO> selectDetail(int seq) throws Exception{
		String sql = "select * from QNA where QNA_NO = ?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, seq);
			try(ResultSet rs = pstat.executeQuery()){
				List<QnaDTO> list = new ArrayList<>();

				while(rs.next()) {
					QnaDTO dto = new QnaDTO();
					dto.setQna_no(rs.getInt("QNA_NO"));
					dto.setQna_id(rs.getString("QNA_ID"));
					dto.setQna_title(rs.getString("QNA_TITLE"));
					dto.setQna_contents(rs.getString("QNA_CONTENTS"));
					dto.setQna_date(rs.getDate("QNA_DATE"));
					dto.setQna_view_count(rs.getInt("QNA_VIEW_COUNT"));
					list.add(dto);
				}
				return list;
			}
		}
	}
	
	
	
	
	
	
	public List<QnaDTO> selectMyQnaList(String id) throws Exception{
		String sql = "SELECT * FROM QNA WHERE QNA_ID = ? ";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, id);
			try(ResultSet rs = pstat.executeQuery()){
				List<QnaDTO> list = new ArrayList<>();

				while(rs.next()) {
					QnaDTO dto = new QnaDTO();
					dto.setQna_no(rs.getInt("QNA_NO"));
					dto.setQna_id(rs.getString("QNA_ID"));
					dto.setQna_title(rs.getString("QNA_TITLE"));
					dto.setQna_contents(rs.getString("QNA_CONTENTS"));
					dto.setQna_date(rs.getDate("QNA_DATE"));
					dto.setQna_view_count(rs.getInt("QNA_VIEW_COUNT"));
					list.add(dto);
				}
				return list;
			}
		}
	}
	
	
	
	
}