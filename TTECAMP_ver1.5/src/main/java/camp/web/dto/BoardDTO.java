package camp.web.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class BoardDTO {
	private int board_seq;
	private int board_code;
	private String user_id;
	private String title;
	private String contents;
	private Timestamp date;
	private int view_count;

	public BoardDTO() {

	}
	public BoardDTO(int board_seq, int board_code, String user_id, String title, String contents, Timestamp date,
			int view_count) {
		super();
		this.board_seq = board_seq;
		this.board_code = board_code;
		this.user_id = user_id;
		this.title = title;
		this.contents = contents;
		this.date = date;
		this.view_count = view_count;
	}
	public int getBoard_seq() {
		return board_seq;
	}
	public void setBoard_seq(int board_seq) {
		this.board_seq = board_seq;
	}
	public int getBoard_code() {
		return board_code;
	}
	public void setBoard_code(int board_code) {
		this.board_code = board_code;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}
	public int getView_count() {
		return view_count;
	}
	public void setView_count(int view_count) {
		this.view_count = view_count;
	}

	public String getFormDate() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
		return sdf.format(this.date.getTime());
	}

	public String getDetailDate() {
		long current_time = System.currentTimeMillis();
		long write_time = this.date.getTime();
		long time_gap = current_time - write_time;

		if(time_gap <86400000) {
			return "오늘";
		}else {
			return getFormDate();
		}
	}
}


