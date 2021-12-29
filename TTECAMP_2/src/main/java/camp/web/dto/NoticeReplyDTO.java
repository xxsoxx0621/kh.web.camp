package camp.web.dto;

import java.util.Date;

public class NoticeReplyDTO {
private int notice_reply_no;
private int board_seq;
private String user_id;
private String contents;
private Date write_date;
private int liked;

public NoticeReplyDTO(int notice_reply_no, int board_seq, String user_id, String contents, Date write_date, int liked) {
	super();
	this.notice_reply_no = notice_reply_no;
	this.board_seq = board_seq;
	this.user_id = user_id;
	this.contents = contents;
	this.write_date = write_date;
	this.liked = liked;
}
public int getNotice_reply_no() {
	return notice_reply_no;
}
public void setNotice_reply_no(int notice_reply_no) {
	this.notice_reply_no = notice_reply_no;
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
public int getLiked() {
	return liked;
}
public void setLiked(int liked) {
	this.liked = liked;
}

}
