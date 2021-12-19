package camp.web.dto;

import java.util.Date;

public class MemberDTO {
	String user_id;
	String password;
	String name;
	String phone;
	String email;
	String originEmail;
	String zip_code;
	String address1;
	String address2;
	String hint;
	String hint_answer;
	


	Date signup_date;
	int seq;
	
	
	public MemberDTO() {
	}


	public MemberDTO( String user_id, String password, String name, String phone, String email,  String originEmail,
			String zip_code, String address1, String address2, String hint, String hint_answer, Date signup_date,int seq) {
		
		super();
	
		this.user_id = user_id;
		this.password = password;
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.originEmail  = originEmail;
		this.zip_code =zip_code;
		this.address1 = address1;
		this.address2 = address2;
		this.hint = hint;
		this.hint_answer = hint_answer;
		this.signup_date = signup_date;
		this.seq = seq;
	}




	public String getUser_id() {
		return user_id;
	}


	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getOriginEmail() {
		return originEmail;
	}


	public void setOrginEmail(String originEmail) {
		this.originEmail = originEmail;
	}


	public String getZip_code() {
		return zip_code;
	}


	public void setZip_code(String zip_code) {
		this.zip_code = zip_code;
	}
	
	public String getAddress1() {
		return address1;
	}


	public void setAddress1(String address1) {
		this.address1 = address1;
	}


	public String getAddress2() {
		return address2;
	}


	public void setAddress2(String address2) {
		this.address2 = address2;
	}


	public String getHint() {
		return hint;
	}


	public void setHint(String hint) {
		this.hint = hint;
	}


	public String getHint_answer() {
		return hint_answer;
	}


	public void setHint_answer(String hint_answer) {
		this.hint_answer = hint_answer;
	}


	public Date getSignup_date() {
		return signup_date;
	}


	public void setSignup_date(Date signup_date) {
		this.signup_date = signup_date;
	}
	
	public int getSeq() {
		return seq;
	}


	public void setSeq(int seq) {
		this.seq = seq;
	}

	
}