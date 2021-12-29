package camp.web.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import camp.web.dto.ReplyDTO;

public class ReplyDAO {
	private ReplyDAO() {		

	}
	private static  ReplyDAO instance = null;

	public static  ReplyDAO getInstance() {
		if(instance == null) {			instance = new ReplyDAO();
		}
		return instance;
	}

	private Connection getConnection() throws Exception{
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}


	public int getRecordCount(int seq) throws Exception {
		String sql = "select count(*) from reply where BOARD_SEQ = ?";
		try(
				Connection con =this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, seq);	

			try(ResultSet rs = pstat.executeQuery();){
				rs.next();
				return rs.getInt(1);
			}
		}
	}

	public int countReply(int seq) throws Exception {
		String sql = "select count(*)COUNT from reply where BAORD_SEQ = ?";
		try(
				Connection con =this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, seq);	
			try(ResultSet rs = pstat.executeQuery();){
				int result;

				if(rs.next()) {
					result = rs.getInt("COUNT");
					return result;
				}else {
					result = 0;
					return result;
				}
			}
		}
	}

	//	public String getPageNavi(int currentPage, int seq) throws Exception {
	//		int recordTotalCount = this.getRecordCount(seq);
	//		int recordCountPerPage = Statics.RECORD_COUNT_PER_PAGE;
	//		int naviCountPerPage = Statics.NAVI_COUNT_PER_PAGE;
	//		int pageTotalCount;
	//
	//		if(recordTotalCount % Statics.RECORD_COUNT_PER_PAGE == 0) {
	//			pageTotalCount = recordTotalCount / Statics.RECORD_COUNT_PER_PAGE;	
	//		}else {
	//			pageTotalCount = recordTotalCount / recordCountPerPage +1;
	//		}
	//
	//		int startNavi = (currentPage-1) / naviCountPerPage * naviCountPerPage +1;
	//		int endNavi = startNavi + naviCountPerPage -1;
	//
	//		if(currentPage < 1) {
	//			currentPage = 1;
	//		}else if(currentPage > pageTotalCount) {
	//			currentPage = pageTotalCount;
	//		}
	//
	//		if(endNavi > pageTotalCount) {
	//			endNavi = pageTotalCount;
	//		}
	//
	//		boolean needPrev = true;
	//		boolean needNext = true;
	//
	//		if(startNavi == 1) {
	//			needPrev = false;
	//		}
	//
	//		if(endNavi == pageTotalCount) {
	//			needNext = false;
	//		}
	//
	//		String pageNavi = "";
	//
	//		if(needPrev) {
	//			pageNavi += "<a href='/detail.board?cpage="+(startNavi-1)+"'><</a>";
	//		}
	//
	//		for(int i = startNavi ; i<=endNavi; i++) {
	//			pageNavi+= "<a href='/detail.board?cpage=" +i+ "'>"+ i+"</a> ";
	//		}
	//		if(needNext) {
	//			pageNavi += "<a href='/detail.board?cpage="+(endNavi+1)+"'>></a>";
	//		}
	//		return pageNavi;
	//	}
	//
	//	public List<ReplyDTO> selectByBound(int start, int end) throws Exception{
	//		String sql = "select * from (select reply.*, row_number() over(order by REPLY_NO ) rn from REPLY) where rn between ? and ?";
	//
	//		try(
	//				Connection con = this.getConnection();
	//				PreparedStatement pstat = con.prepareStatement(sql);){
	//			pstat.setInt(1, start);
	//			pstat.setInt(2, end);
	//
	//			try(ResultSet rs = pstat.executeQuery()){
	//				List<ReplyDTO> list = new ArrayList<>();
	//
	//				while(rs.next()) {
	//					ReplyDTO dto = new ReplyDTO();
	//					dto.setReply_no(rs.getInt("REPLY_NO"));
	//					dto.setBoard_seq(rs.getInt("BOARD_SEQ"));
	//					dto.setUser_id(rs.getString("USER_ID"));
	//					dto.setContents(rs.getString("CONTENTS"));
	//					dto.setDate(rs.getDate("WRITE_DATE"));
	//					dto.setLiked(rs.getInt("LIKED"));
	//					list.add(dto);
	//				}
	//				return list;
	//			}
	//		}
	//	}

	public int addComment(int seq, String id, String content) throws Exception{
		String sql = "insert into reply values(REPLY_NO_SEQ.NEXTVAL, ?, ?, ?,SYSDATE,0)";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, seq);
			pstat.setString(2, id);
			pstat.setString(3, content);

			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}


	public List<ReplyDTO> selectAll(int seq) throws Exception{
		String sql = "select * from reply WHERE BOARD_SEQ = ?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, seq);
			try(ResultSet rs = pstat.executeQuery();){
				List<ReplyDTO> list = new ArrayList();
				while(rs.next()) {
					int reply_no = rs.getInt("REPLY_NO");
					int board_seq = rs.getInt("BOARD_SEQ");
					String user_id = rs.getString("USER_ID");
					String contents = rs.getString("CONTENTS");
					Date write_date = rs.getDate("WRITE_DATE");
					int liked = rs.getInt("LIKED");
					ReplyDTO dto = new ReplyDTO(reply_no, board_seq, user_id, contents, write_date, liked);
					list.add(dto);	
				}
				return list;
			}
		}
	}
	// 사용자가 직접 댓글 삭제 버튼 클릭하여 삭제할 때  
	public int deleteReply(int replyNo, int seq) throws Exception{
		String sql = "delete from reply where REPLY_NO = ? and BOARD_SEQ = ?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, replyNo);
			pstat.setInt(2, seq);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	// 페이지 자체를 삭제할 때 댓글도 같이 삭제 됨. 
	public int delPageReply(int seq) throws Exception {
		String sql = "delete from reply where board_seq = ? ";
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
}

