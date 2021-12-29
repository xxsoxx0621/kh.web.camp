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

import camp.web.dto.NoticeReplyDTO;

public class NoticeReplyDAO {

	private NoticeReplyDAO() {		

	}
	private static  NoticeReplyDAO instance = null;

	public static  NoticeReplyDAO getInstance() {
		if(instance == null) {
			instance = new NoticeReplyDAO();
		}
		return instance;
	}

	private Connection getConnection() throws Exception{
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	
	
	//관리자가 댓글을 작성했을 때 
	public int addComment(int seq, String id, String content) throws Exception{
		String sql = "insert into NOTICEREPLY values(REPLY_NO_SEQ.NEXTVAL, ?, ?, ?,SYSDATE,0)";
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
		
	public List<NoticeReplyDTO> selectAll(int seq) throws Exception{
		String sql = "select * from NOTICEREPLY WHERE BOARD_SEQ = ?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, seq);
			try(ResultSet rs = pstat.executeQuery();){
				List<NoticeReplyDTO> list = new ArrayList();
				while(rs.next()) {
					int notice_reply_no = rs.getInt("NOTICE_REPLY_NO");
					int board_seq = rs.getInt("BOARD_SEQ");
					String user_id = rs.getString("USER_ID");
					String contents = rs.getString("CONTENTS");
					Date write_date = rs.getDate("WRITE_DATE");
					int liked = rs.getInt("LIKED");
					NoticeReplyDTO dto = new NoticeReplyDTO(notice_reply_no, board_seq, user_id, contents, write_date, liked);
					list.add(dto);	
				}
				return list;
			}
		}
	}
	
	// 사용자가 직접 댓글 삭제 버튼 클릭하여 삭제할 때  
	public int deleteReply(int replyNo, int seq) throws Exception{
		String sql = "delete from noticereply where NOTICE_REPLY_NO = ? and BOARD_SEQ = ?";
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
		String sql = "delete from noticereply where BOARD_SEQ = ? ";
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
