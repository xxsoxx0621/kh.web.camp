package camp.web.dto;

import java.sql.Date;

public class QnaReplyDTO {
	private int reply_no;
	private int board_seq;
	private String user_id;
	private String contents;
	private Date write_date;

	public QnaReplyDTO() {

	}
	public QnaReplyDTO(int reply_no, int board_seq, String user_id, String contents, Date write_date) {
		super();
		this.reply_no = reply_no;
		this.board_seq = board_seq;
		this.user_id = user_id;
		this.contents = contents;
		this.write_date = write_date;
	}
	public int getReply_no() {
		return reply_no;
	}
	public void setReply_no(int reply_no) {
		this.reply_no = reply_no;
	}
	public int getBoard_seq() {
		return board_seq;
	}
	public void setBoard_seq(int board_seq) {
		this.board_seq = board_seq;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Date getWrite_date() {
		return write_date;
	}
	public void setWrite_date(Date write_date) {
		this.write_date = write_date;
	}
}