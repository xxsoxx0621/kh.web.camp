package camp.web.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import camp.web.dao.CampDAO;
import camp.web.dao.ReservationDAO;
import camp.web.dto.CampDTO;
import camp.web.dto.ReservationDTO;
import camp.web.utils.EncrpytionIUtils;

/**
 * Servlet implementation class ReserveController
 */
@WebServlet("*.rev")
public class ReservationController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String uri = request.getRequestURI();
		System.out.println("사용자가 요청한 주소 : " + uri);

		String ctxPath = request.getContextPath();
		System.out.println("프로젝트명 : " + ctxPath);

		String cmd = uri.substring(ctxPath.length());
		System.out.println("사용자가 요청한 기능 : " + cmd);

		CampDAO dao = CampDAO.getInstance();
		ReservationDAO revDao = ReservationDAO.getInstance();

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		try {
			if (cmd.equals("/area.rev")) {

				String contentId = request.getParameter("contentId");
				// String available_camp_Nm = request.getParameter("available_camp_Nm");
				// String contentId = request.getParameter("");

				System.out.println(contentId);
				CampDTO dto = dao.selectByContentId(contentId);
				System.out.println("dto : " + dto);

				int total_camp_Nm = dto.getTotal_camp_Nm();
				int occupied_camp_Nm = revDao.getOccupiedCampNm(contentId);
				int available_camp_Nm = total_camp_Nm - occupied_camp_Nm;
				System.out.println("available_camp_Nm : " + available_camp_Nm);

				request.setAttribute("dto", dto);
				request.setAttribute("available_camp_Nm", available_camp_Nm);
				request.getRequestDispatcher("/reservation/area.jsp").forward(request, response);

			} else if (cmd.equals("/reservation.rev")) {
				String contentId = request.getParameter("contentId");
				String check_in = request.getParameter("check_in");
				String check_out = request.getParameter("check_out");

				/* .days= 몇일묵냐 */
				String days = request.getParameter("days");

				CampDTO dto = dao.selectByContentId(contentId);

				System.out.println("days : " + days);

				int total_camp_Nm = dto.getTotal_camp_Nm();
				int occupied_camp_Nm = revDao.getOccupiedCampNm(contentId);
				int available_camp_Nm = total_camp_Nm - occupied_camp_Nm;
				System.out.println("available_camp_Nm : " + available_camp_Nm);

				request.setAttribute("dto", dto);
				request.setAttribute("check_in", check_in);
				request.setAttribute("check_out", check_out);
				request.setAttribute("days", days);

				request.setAttribute("available_camp_Nm", available_camp_Nm);
				request.getRequestDispatcher("/reservation/reservation.jsp").forward(request, response);

			} else if (cmd.equals("/confirmRev.rev")) {
				String facltNm = request.getParameter("camp_name");
				CampDTO campDto = dao.selectByFacltnm(facltNm);
				String contentId = campDto.getContentId();

				int total_camp_Nm = campDto.getTotal_camp_Nm();
				int occupied_camp_Nm = revDao.getOccupiedCampNm(contentId);
				int available_camp_Nm = total_camp_Nm - occupied_camp_Nm;
				System.out.println("available_camp_Nm : " + available_camp_Nm);

				if (available_camp_Nm > 0) {

					/* 이름/인원/연락처/은행/계좌/차량번호/날짜/ 체크인 아웃 / 숙박기간 */
					String client_name = request.getParameter("client_name");
					String people_num = request.getParameter("people_num");
					String contact = request.getParameter("contact");
					String refund_bank_code = request.getParameter("refund_bank_code");
					String account_num = request.getParameter("account_num");
					String car_num = request.getParameter("car_num");

					/* 여기서 string 이와야 하는데 null 이 */
					String check_in = request.getParameter("check_in");
					String check_out = request.getParameter("check_out");

					/* 숙박기간 */
					String days1 = request.getParameter("days1");
					String days2 = request.getParameter("days2");

					String days_total = days1.toString() + "박" + days2.toString() + "일";

					/* string 값 */
					String price_total = request.getParameter("price_total");

					String reservation_id = contentId + "211220" + (total_camp_Nm - available_camp_Nm + 1);
					String user_id = request.getParameter("loginID");

					ReservationDTO dto = new ReservationDTO(reservation_id, user_id, contentId, facltNm, client_name,
							people_num, contact, refund_bank_code, account_num, car_num, check_in, check_out,
							days_total, price_total, null, "DEFAULT", "DEFAULT");

					int result = revDao.insertReservation(dto);
					request.setAttribute("dto", dto);
					request.setAttribute("result", 1);

				} else {
					request.setAttribute("result", 0);
				}

//				System.out.println("result : " + result);
				request.getRequestDispatcher("/reservation/reservationWait.jsp").forward(request, response);

			} else if (cmd.equals("/cancelRev.rev")) {
				String reservation_id = request.getParameter("reservation_id");
				int result = revDao.deleteReservation(reservation_id);
				
				if(result > 0) {
					System.out.println("삭제 성공");
				} else {
					System.out.println("삭제 실패");
				}
				
				request.getRequestDispatcher("/index.jsp").forward(request, response);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
