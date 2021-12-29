package camp.web.dto;

import java.util.Date;

public class ReservationDTO {
	String reservation_id;
	String user_id;
	String contentId;
	String facltNm;
	String client_name;
	String people_num;
	String contact;
	String refund_bank_code;
	String account_num;
	String car_num;
	
	String check_in;
	String check_out;
	String days_total;
	String price_total;
	Date reservation_made_date;
	String is_paid;
	String is_booked;
	public ReservationDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ReservationDTO(String reservation_id, String user_id, String contentId, String facltNm, String client_name,
			String people_num, String contact, String refund_bank_code, String account_num, String car_num,
			String check_in, String check_out, String days_total, String price_total, Date reservation_made_date,
			String is_paid, String is_booked) {
		super();
		this.reservation_id = reservation_id;
		this.user_id = user_id;
		this.contentId = contentId;
		this.facltNm = facltNm;
		this.client_name = client_name;
		this.people_num = people_num;
		this.contact = contact;
		this.refund_bank_code = refund_bank_code;
		this.account_num = account_num;
		this.car_num = car_num;
		this.check_in = check_in;
		this.check_out = check_out;
		this.days_total = days_total;
		this.price_total = price_total;
		this.reservation_made_date = reservation_made_date;
		this.is_paid = is_paid;
		this.is_booked = is_booked;
	}
	public String getReservation_id() {
		return reservation_id;
	}
	public void setReservation_id(String reservation_id) {
		this.reservation_id = reservation_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getContentId() {
		return contentId;
	}
	public void setContentId(String contentId) {
		this.contentId = contentId;
	}
	public String getFacltNm() {
		return facltNm;
	}
	public void setFacltNm(String facltNm) {
		this.facltNm = facltNm;
	}
	public String getClient_name() {
		return client_name;
	}
	public void setClient_name(String client_name) {
		this.client_name = client_name;
	}
	public String getPeople_num() {
		return people_num;
	}
	public void setPeople_num(String people_num) {
		this.people_num = people_num;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public String getRefund_bank_code() {
		return refund_bank_code;
	}
	public void setRefund_bank_code(String refund_bank_code) {
		this.refund_bank_code = refund_bank_code;
	}
	public String getAccount_num() {
		return account_num;
	}
	public void setAccount_num(String account_num) {
		this.account_num = account_num;
	}
	public String getCar_num() {
		return car_num;
	}
	public void setCar_num(String car_num) {
		this.car_num = car_num;
	}
	public String getCheck_in() {
		return check_in;
	}
	public void setCheck_in(String check_in) {
		this.check_in = check_in;
	}
	public String getCheck_out() {
		return check_out;
	}
	public void setCheck_out(String check_out) {
		this.check_out = check_out;
	}
	public String getDays_total() {
		return days_total;
	}
	public void setDays_total(String days_total) {
		this.days_total = days_total;
	}
	public String getPrice_total() {
		return price_total;
	}
	public void setPrice_total(String price_total) {
		this.price_total = price_total;
	}
	public Date getReservation_made_date() {
		return reservation_made_date;
	}
	public void setReservation_made_date(Date reservation_made_date) {
		this.reservation_made_date = reservation_made_date;
	}
	public String getIs_paid() {
		return is_paid;
	}
	public void setIs_paid(String is_paid) {
		this.is_paid = is_paid;
	}
	public String getIs_booked() {
		return is_booked;
	}
	public void setIs_booked(String is_booked) {
		this.is_booked = is_booked;
	}
	
	
	
	

	
	
	
}
