package camp.web.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import camp.web.dto.ReservationDTO;

public class ReservationDAO {
	private static ReservationDAO instance = null;

	public static ReservationDAO getInstance() {
		if (instance == null) {
			instance = new ReservationDAO();
		}
		return instance;
	}

	private ReservationDAO() {
	}

	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}

	public int insertReservation(ReservationDTO dto) throws Exception {
		String sql = "INSERT INTO RESERVATION VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,DEFAULT,DEFAULT,DEFAULT)";

		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {

			pstat.setString(1, dto.getReservation_id());
			pstat.setString(2, dto.getUser_id());
			pstat.setString(3, dto.getContentId());
			pstat.setString(4, dto.getFacltNm());
			pstat.setString(5, dto.getClient_name());
			pstat.setString(6, dto.getPeople_num());
			pstat.setString(7, dto.getContact());
			pstat.setString(8, dto.getRefund_bank_code());
			pstat.setString(9, dto.getAccount_num());
			pstat.setString(10, dto.getCar_num());
			pstat.setString(11, dto.getCheck_in());
			pstat.setString(12, dto.getCheck_out());
			pstat.setString(13, dto.getDays_total());
			pstat.setString(14, dto.getPrice_total());

			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}

	public List<ReservationDTO> selectAll() throws Exception {
		String sql = "SELECT * FROM RESERVATION ORDER BY RESERVATION_MADE_DATE DESC";
		try (Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();) {

			List<ReservationDTO> list = new ArrayList<ReservationDTO>();

			while (rs.next()) {
				ReservationDTO dto = new ReservationDTO();

				dto.setReservation_id(rs.getString("reservation_id"));
				dto.setUser_id(rs.getString("user_id"));
				dto.setContentId(rs.getString("contentId"));
				dto.setFacltNm(rs.getString("facltNm"));
				dto.setClient_name(rs.getString("client_name"));
				dto.setPeople_num(rs.getString("people_num"));
				dto.setContact(rs.getString("contact"));
				dto.setRefund_bank_code(rs.getString("refund_bank_code"));
				dto.setAccount_num(rs.getString("account_num"));
				dto.setCar_num(rs.getString("car_num"));
				dto.setCheck_in(rs.getString("check_in"));
				dto.setCheck_out(rs.getString("check_out"));
				dto.setDays_total(rs.getString("days_total"));
				dto.setPrice_total(rs.getString("price_total"));
				dto.setReservation_made_date(rs.getDate("reservation_made_date"));
				dto.setIs_paid(rs.getString("is_paid"));
				dto.setIs_booked(rs.getString("is_booked"));

				list.add(dto);

			}
			return list;
		}
	}

	public List<ReservationDTO> selectMyBookingList(String id) throws Exception {
		String sql = "SELECT * FROM RESERVATION WHERE USER_ID = ?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, id);
			try (ResultSet rs = pstat.executeQuery();) {

				List<ReservationDTO> list = new ArrayList<ReservationDTO>();

				while (rs.next()) {
					ReservationDTO dto = new ReservationDTO();

					dto.setReservation_id(rs.getString("reservation_id"));
					dto.setUser_id(rs.getString("user_id"));
					dto.setContentId(rs.getString("contentId"));
					dto.setFacltNm(rs.getString("facltNm"));
					dto.setClient_name(rs.getString("client_name"));
					dto.setPeople_num(rs.getString("people_num"));
					dto.setContact(rs.getString("contact"));
					dto.setRefund_bank_code(rs.getString("refund_bank_code"));
					dto.setAccount_num(rs.getString("account_num"));
					dto.setCar_num(rs.getString("car_num"));
					dto.setCheck_in(rs.getString("check_in"));
					dto.setCheck_out(rs.getString("check_out"));
					dto.setDays_total(rs.getString("days_total"));
					dto.setPrice_total(rs.getString("price_total"));
					dto.setReservation_made_date(rs.getDate("reservation_made_date"));
					dto.setIs_paid(rs.getString("is_paid"));
					dto.setIs_booked(rs.getString("is_booked"));

					list.add(dto);

				}
				return list;
			}
		}
	}

	public int getOccupiedCampNm(String contentId) throws Exception {
		String sql = "SELECT COUNT(*) FROM RESERVATION WHERE CONTENTID = ?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, contentId);

			try (ResultSet rs = pstat.executeQuery();) {
				if (rs.next()) {
					int occupied_camp_Nm = rs.getInt("COUNT(*)");
					con.commit();
					return occupied_camp_Nm;
				}
				return 0;
			}
		}
	}
	
	public int deleteReservation(String reservation_id) throws Exception {
		String sql = "DELETE FROM RESERVATION WHERE reservation_id = ?";

		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, reservation_id);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}

	public int confirmReservation(String reservation_id) throws Exception {
		String sql = "UPDATE RESERVATION SET IS_PAID = 'Y', IS_BOOKED = 'Y' WHERE reservation_id = ?";
		
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, reservation_id);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
}