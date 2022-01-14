package camp.web.dto;

import java.sql.Date;

public class NoticeDTO {

	private int notice_no_seq;
	private String admin_id;
	private String title;
	private String contents;
	private Date date;
	private int view_count;
	public int getNotice_no_seq() {
		return notice_no_seq;
	}
	public void setNotice_no_seq(int notice_no_seq) {
		this.notice_no_seq = notice_no_seq;
	}
	public String getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
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
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public int getView_count() {
		return view_count;
	}
	public void setView_count(int view_count) {
		this.view_count = view_count;
	}

	public NoticeDTO() {

	}

	public NoticeDTO(int notice_no_seq, String admin_id, String title, String contents, Date date, int view_count) {
		super();
		this.notice_no_seq = notice_no_seq;
		this.admin_id = admin_id;
		this.title = title;
		this.contents = contents;
		this.date = date;
		this.view_count = view_count;
	}
}
