package camp.web.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import camp.web.dao.MemberDAO;
import camp.web.dao.QnaDAO;
import camp.web.dao.ReservationDAO;
import camp.web.dao.ReviewDAO;
import camp.web.dto.CampDTO;
import camp.web.dto.MemberDTO;
import camp.web.dto.QnaDTO;
import camp.web.dto.ReservationDTO;
import camp.web.dto.ReviewDTO;
import camp.web.utils.EncrpytionIUtils;

@WebServlet("*.mypage")
public class MyPageController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf8");

		String requestURI = request.getRequestURI();
		String ctxPath = request.getContextPath();

		String cmd = requestURI.substring(ctxPath.length());

		Gson g = new Gson();
		MemberDAO dao = MemberDAO.getInstance();
		ReviewDAO Rdao = ReviewDAO.getInstance();
		ReservationDAO revDao = ReservationDAO.getInstance();
		QnaDAO qdao = QnaDAO.getInstance();

		try {

			if (cmd.equals("/myPage.mypage")) {

				String id = (String) request.getSession().getAttribute("loginID");

				List<MemberDTO> list = dao.getAllInfo(id);
				request.setAttribute("list", list);

				List<ReservationDTO> rList = revDao.selectMyBookingList(id);
				request.setAttribute("rList", rList);
				// 후기
				List<ReviewDTO> reviewList = Rdao.selectByUserId(id);
				List<CampDTO> campList = Rdao.selectAll();
				// 1:1 문의
				List<QnaDTO> myQnaList = qdao.selectMyQnaList(id);
				request.setAttribute("myQnaList", myQnaList);
				request.setAttribute("campList", campList);
				request.setAttribute("reviewList", reviewList);

				request.getRequestDispatcher("/mypage/myPage.jsp").forward(request, response);

			} else if (cmd.equals("/updateInfo.mypage")) {

				String id = (String) request.getSession().getAttribute("loginID");

				List<MemberDTO> list = dao.getAllInfo(id);
				request.setAttribute("list", list);
				request.getRequestDispatcher("/mypage/updateInfo.jsp").forward(request, response);

			} else if (cmd.equals("/findPwProc.mypage")) {
				String id = (String) request.getSession().getAttribute("loginID");
				String pw = EncrpytionIUtils.getSHA512(request.getParameter("presentPw"));

				boolean result = dao.isMatchPw(id, pw);
				if (result) {
					response.getWriter().append(String.valueOf(result));
				}

			} else if (cmd.equals("/updateInfoProc.mypage")) {
				int seq = 0;

				String id = request.getParameter("id");
				String name = request.getParameter("name");

				String presentPw = EncrpytionIUtils.getSHA512(request.getParameter("presentPw"));
				String changePw = EncrpytionIUtils.getSHA512(request.getParameter("changePw"));

				String presentPw1 = request.getParameter("presentPw");
				String changePw1 = request.getParameter("changePw");

				String phone1 = request.getParameter("phone1");
				String phone2 = request.getParameter("phone2");
				String phone3 = request.getParameter("phone3");
				String phone = phone1 + "-" + phone2 + "-" + phone3;
				String email = EncrpytionIUtils.getEncrypt(request.getParameter("email"), "cos");
				String originEmail = request.getParameter("email");
				String zipcode = request.getParameter("zipcode");
				String address1 = request.getParameter("address1");
				String address2 = request.getParameter("address2");
				String hint = request.getParameter("hint");
				String hintAnswer = request.getParameter("hintAnswer");

				if (changePw1 == "") {

					// 변경 될 비밀번호가 없을 경우
					int result = dao.updateInfo(new MemberDTO(id, presentPw, name, phone, email, originEmail, zipcode,
							address1, address2, hint, hintAnswer, null, seq));
					System.out.println(result);
					if (result > 0) {

						response.getWriter().append(String.valueOf(result));
					}
				} else {
					// 변경될 비밀번호가 있을 경우
					int result = dao.updateInfo1(new MemberDTO(id, changePw, name, phone, email, originEmail, zipcode,
							address1, address2, hint, hintAnswer, null, seq));
					System.out.println(result);
					if (result > 0) {

						response.getWriter().append(String.valueOf(result));
					}
				}

			} else if (cmd.equals("/deleteAccount.mypage")) {
				response.sendRedirect("mypage/deleteAccount.jsp");

			} else if (cmd.equals("/deleteUserProc.mypage")) {

				String id = (String) request.getSession().getAttribute("loginID");
				
				int result = dao.deleteUser(id);
				int result2 = revDao.deleteReservation(id);
				
				if (result > 0 && result2 > 0  ) {
					request.getSession().removeAttribute("loginID");
					response.sendRedirect("/index.jsp");

				}
			} else if (cmd.equals("/reviewList.mypage")) {

				// 1. 세션에서 로그인 아이디 값 받아오기
				String id = (String) request.getSession().getAttribute("loginID");
				List<ReviewDTO> reviewList = Rdao.selectByUserId(id);
				List<CampDTO> campList = Rdao.selectAll();

				for (int i = 0; i < reviewList.size(); i++) {
					String reviewId = reviewList.get(i).getContentId();
					for (int j = 0; j < campList.size(); j++) {
						String campId = campList.get(j).getContentId();
						if (reviewId.equals(campId)) {
							String campName = campList.get(j).getFacltNm();
							System.out.println(campName);
						}
					}
				}

				request.setAttribute("campList", campList);
				request.setAttribute("reviewList", reviewList);

				request.getRequestDispatcher("/mypage/reviewList.jsp").forward(request, response);

			} else if (cmd.equals("/findCampName.mypage")) {

				String campNum = request.getParameter("campNum");
				List<CampDTO> campList = Rdao.selectAll();
				request.setAttribute("campList", campList);
				String result = g.toJson(campList);
				response.setContentType("text/html;charset=utf8;");
				response.getWriter().append(String.valueOf(result));

			} else if (cmd.equals("/deleteReview.mypage")) {

				String reviewNo = request.getParameter("reviewNo");
				System.out.println(reviewNo);
				int result = Rdao.deleteReview(reviewNo);

				response.getWriter().append(String.valueOf(result));

			} else if (cmd.equals("/cancelRev.mypage")) {
				String reservation_id = request.getParameter("reservation_id");
				System.out.println("reservation_id : " + reservation_id);
				int result = revDao.deleteReservation(reservation_id);

				if (result > 0) {
					System.out.println("삭제 성공");
				} else {
					System.out.println("삭제 실패");
				}

				request.getRequestDispatcher("/myPage.mypage").forward(request, response);

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