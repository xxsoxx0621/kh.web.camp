package camp.web.dto;

import java.util.Date;

public class QnaDTO {
	private int qna_no;
	private String qna_id;
	private String qna_title;
	private String qna_contents;
	private Date qna_date;
	private int qna_view_count;
	public QnaDTO(int qna_no, String qna_id, String qna_title, String qna_contents, Date qna_date, int qna_view_count) {
		super();
		this.qna_no = qna_no;
		this.qna_id = qna_id;
		this.qna_title = qna_title;
		this.qna_contents = qna_contents;
		this.qna_date = qna_date;
		this.qna_view_count = qna_view_count;
	}

	public QnaDTO() {

	}

	public int getQna_no() {
		return qna_no;
	}

	public void setQna_no(int qna_no) {
		this.qna_no = qna_no;
	}

	public String getQna_id() {
		return qna_id;
	}

	public void setQna_id(String qna_id) {
		this.qna_id = qna_id;
	}

	public String getQna_title() {
		return qna_title;
	}

	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}

	public String getQna_contents() {
		return qna_contents;
	}

	public void setQna_contents(String qna_contents) {
		this.qna_contents = qna_contents;
	}

	public Date getQna_date() {
		return qna_date;
	}

	public void setQna_date(Date qna_date) {
		this.qna_date = qna_date;
	}

	public int getQna_view_count() {
		return qna_view_count;
	}

	public void setQna_view_count(int qna_view_count) {
		this.qna_view_count = qna_view_count;
	}
}
