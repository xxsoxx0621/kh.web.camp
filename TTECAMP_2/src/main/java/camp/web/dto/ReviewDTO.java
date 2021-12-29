package camp.web.dto;

import java.util.Date;

public class ReviewDTO {
	private int review_no;
	String contentId;
	private String user_id;
	private String contents;
	private Date write_date;
	private int liked;

	public ReviewDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ReviewDTO(int review_no, String contentId, String user_id, String contents, Date write_date, int liked) {
		super();
		this.review_no = review_no;
		this.contentId = contentId;
		this.user_id = user_id;
		this.contents = contents;
		this.write_date = write_date;
		this.liked = liked;
	}

	public int getReview_no() {
		return review_no;
	}

	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}

	public String getContentId() {
		return contentId;
	}

	public void setContentId(String contentId) {
		this.contentId = contentId;
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
