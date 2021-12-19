package camp.web.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import camp.web.dao.CampDAO;
import camp.web.dao.ReservationDAO;
import camp.web.dto.CampDTO;
import camp.web.dto.ReservationDTO;



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
//				String available_camp_Nm = request.getParameter("available_camp_Nm");
//				String contentId = request.getParameter("");
				
				System.out.println(contentId);
				CampDTO dto = dao.selectByContentId(contentId);
				System.out.println("dto : " + dto);
				
				int total_camp_Nm = dto.getTotal_camp_Nm();
				int occupied_camp_Nm = revDao.getOccupiedCampNm(contentId);
				int available_camp_Nm = total_camp_Nm - occupied_camp_Nm;

				request.setAttribute("dto", dto);
				request.setAttribute("available_camp_Nm", available_camp_Nm);
				request.getRequestDispatcher("/reservation/area.jsp").forward(request, response);

			} else if (cmd.equals("/reservation.rev")) {
				String contentId = request.getParameter("contentId");

				System.out.println(contentId);
				CampDTO dto = dao.selectByContentId(contentId);
				System.out.println("dto : " + dto);

				request.setAttribute("dto", dto);
				request.getRequestDispatcher("/reservation/reservation.jsp").forward(request, response);

			} else if (cmd.equals("/confirmRev.rev")) {
				String facltNm = request.getParameter("camp_name");
				System.out.println(facltNm);
				CampDTO campDto = dao.selectByFacltnm(facltNm);
				System.out.println(campDto);
				String contentId = campDto.getContentId();
				
//				String reservation_id = contentId
				// 세션 로그인아이디 담아야함
				String reservation_id = "111111";
				String user_id = request.getParameter("loginID");
				
				
				
				
				String client_name = request.getParameter("client_name");
				String people_num = request.getParameter("people_num");
				String contact = request.getParameter("contact");
				String refund_bank_code = request.getParameter("refund_bank_code");
				String account_num = request.getParameter("account_num");
				String car_num = request.getParameter("car_num");
				
				
				

				ReservationDTO dto = new ReservationDTO(reservation_id, user_id, contentId, client_name, people_num, contact, refund_bank_code, account_num, car_num, null, "DEFAULT",
						"DEFAULT");
//				
				int result = revDao.insertReservation(dto);

				if(result > 0) {
					System.out.println("입력 성공");
				} else {
					System.out.println("입력 실패");
				}
				
				request.setAttribute("facltNm", facltNm);
				request.setAttribute("dto", dto);
				request.getRequestDispatcher("/reservation/reservationResult.jsp").forward(request, response);

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
