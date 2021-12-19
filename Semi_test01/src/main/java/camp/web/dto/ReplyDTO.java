package camp.web.dto;

import java.util.Date;

public class ReplyDTO {
private int reply_no;
private int board_seq;
private String user_id;
private String contents;
private Date date;
private int liked;

public ReplyDTO() {
	
}
public ReplyDTO(int reply_no, int board_seq, String user_id, String contents, Date date, int liked) {
	super();
	this.reply_no = reply_no;
	this.board_seq = board_seq;
	this.user_id = user_id;
	this.contents = contents;
	this.date = date;
	this.liked = liked;
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
public Date getDate() {
	return date;
}
public void setDate(Date date) {
	this.date = date;
}
public int getLiked() {
	return liked;
}
public void setLiked(int liked) {
	this.liked = liked;
}
}
