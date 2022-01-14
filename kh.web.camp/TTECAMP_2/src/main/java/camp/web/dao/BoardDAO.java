package camp.web.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import camp.web.dto.BoardDTO;
import camp.web.statics.Statics;

public class BoardDAO {

	private BoardDAO() {		

	}
	private static BoardDAO instance = null;

	public static BoardDAO getInstance() {
		if(instance == null) {
			instance = new BoardDAO();
		}
		return instance;
	}

	private Connection getConnection() throws Exception{
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}

	public int getRecordCount() throws Exception {
		String sql = "select count(*) from board";
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

	public List<BoardDTO> selectByBound(int start, int end) throws Exception{
		String sql = "select * from (select board.*, row_number() over(order by BOARD_SEQ desc) rn from board) where rn between ? and ?";

		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, start);
			pstat.setInt(2, end);

			try(ResultSet rs = pstat.executeQuery()){
				List<BoardDTO> list = new ArrayList<>();

				while(rs.next()) {
					BoardDTO dto = new BoardDTO();
					dto.setBoard_seq(rs.getInt("board_seq"));
					dto.setUser_id(rs.getString("user_id"));
					dto.setTitle(rs.getString("title"));
					dto.setContents(rs.getString("write_date"));
					dto.setDate(rs.getTimestamp("WRITE_DATE"));;
					dto.setView_count(rs.getInt("view_count"));
					list.add(dto);
				}
				return list;
			}
		}
	}

	// BOARD_CODE 1 = 자유게시판
	// BOARD_CODE 2 = 공지사항
	// BOARD_CDOE 3 = 1:1 문의 게시판
	public List<BoardDTO> selectAll() throws Exception{
		String sql = "select * from board where BOARD_CODE = 1 order by BOARD_SEQ desc";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();){
			List list = new ArrayList();
			while(rs.next()) {
				int board_seq = rs.getInt("BOARD_SEQ");
				int board_code = rs.getInt("BOARD_CODE");
				String user_id = rs.getString("USER_ID");
				String title = rs.getString("TITLE");
				String contents = rs.getString("CONTENTS");
				Timestamp date = rs.getTimestamp("WRITE_DATE");
				int view_count = rs.getInt("VIEW_COUNT");
				BoardDTO dto = new BoardDTO(board_seq, board_code, user_id, title, contents, date, view_count);
				list.add(dto);	
			}
			return list;
		}
	}

	public int writeBoard(String title, String contents, String id) throws Exception{
		String sql = "insert into board values(BOARD_SEQ_SEQ.NEXTVAL,1,?,?,?,sysdate,0)";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, id);
			pstat.setString(2, title);
			pstat.setString(3, contents);

			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}

	public List<BoardDTO> selectDetail(int seq) throws Exception{
		String sql = "select * from board where BOARD_SEQ = ?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, seq);
			try(ResultSet rs = pstat.executeQuery();){
				List<BoardDTO> list = new ArrayList();
				if(rs.next()) {
					int board_seq = rs.getInt("BOARD_SEQ");
					int board_code = rs.getInt("BOARD_CODE");
					String user_id = rs.getString("USER_ID");
					String title = rs.getString("TITLE");
					String contents = rs.getString("CONTENTS");
					Timestamp date = rs.getTimestamp("WRITE_DATE");
					int view_count = rs.getInt("VIEW_COUNT");
					BoardDTO dto = new BoardDTO(board_seq, board_code, user_id, title, contents, date, view_count);
					list.add(dto);	
				}
				return list;
			}
		}
	}
	public int delete(int seq) throws Exception{
		String sql = "delete from board where BOARD_SEQ = ?";
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

	public int modify(String title, String contents, int seq) throws Exception {
		String sql = "UPDATE BOARD SET TITLE = ?, CONTENTS = ? WHERE BOARD_SEQ = ?";
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

	public int upViewCount(int seq) throws Exception{
		String sql = "UPDATE BOARD SET VIEW_COUNT = VIEW_COUNT+1 WHERE BOARD_SEQ = ?";
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

	public int viewSeq(String id) throws Exception{
		String sql = "select * from board where user_id = ? order by BOARD_SEQ desc";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, id);
			try(
					ResultSet rs = pstat.executeQuery();){
				int seq;
				if(rs.next()) {
					seq = rs.getInt("BOARD_SEQ");
				}else {
					seq = 0;
				}return seq;

			}
		}
	}


	//검색 기능 //
	//검색 기능 //
	//검색 기능 //
	//검색 기능 //
	//검색 기능 //
	//검색 기능 //
	//검색 기능 //

	public List<BoardDTO> searchBoard(String searchField, String searchText) throws Exception {

		String sql = "SELECT * FROM BOARD WHERE "+searchField.trim();


		if(searchText != null && !searchText.equals("")) {
			sql +=" LIKE '%"+searchText.trim()+"%' order by BOARD_SEQ DESC";
		}
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();
				){

			List<BoardDTO> list = new ArrayList<>();
			while(rs.next()) {
				int board_seq = rs.getInt("BOARD_SEQ");
				int board_code = rs.getInt("BOARD_CODE");
				String user_id = rs.getString("USER_ID");
				String title = rs.getString("TITLE");
				String contents = rs.getString("CONTENTS");
				Timestamp date = rs.getTimestamp("WRITE_DATE");
				int view_count = rs.getInt("VIEW_COUNT");
				BoardDTO dto = new BoardDTO(board_seq, board_code, user_id, title, contents, date, view_count);
				list.add(dto);	
			}
			return list;
		}

	}
}