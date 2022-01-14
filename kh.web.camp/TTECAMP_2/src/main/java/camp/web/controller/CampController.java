package camp.web.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import camp.web.dao.APIDAO;
import camp.web.dao.CampDAO;
import camp.web.dao.ReservationDAO;
import camp.web.dao.ReviewDAO;
import camp.web.dto.CampDTO;
import camp.web.dto.ReviewDTO;

/**
 * Servlet implementation class CampController
 */
@WebServlet("*.camp")
public class CampController extends HttpServlet {
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
			if (cmd.equals("/searchFromList.camp")) {

				List<CampDTO> list = dao.selectAll();
				List<CampDTO> dummyList = new ArrayList<CampDTO>();
				List<CampDTO> emptyList = new ArrayList<CampDTO>();

				String facltNm = request.getParameter("facltNm");
				String induty = request.getParameter("induty"); // 캠핑유형 (2순위)
				String doNm = request.getParameter("doNm"); // 지역 (1순위)
				String sbrsCl = request.getParameter("sbrsCl"); // 부대시설 (3순위)
				// 이용환경 추가
				String posblFcltyCl = request.getParameter("posblFcltyCl"); // 주변환경 (4순위)

				System.out.println("facltNm : " + facltNm);
				System.out.println("induty : " + induty);
				System.out.println("doNm : " + doNm);
				System.out.println("sbrsCl : " + sbrsCl);
				System.out.println("posblFcltyCl : " + posblFcltyCl);

				if (!facltNm.isEmpty()) {
					for (int i = 0; i < list.size(); i++) {
						if (list.get(i).getFacltNm() == null) {
							continue;
						}

						if (list.get(i).getFacltNm().contains(facltNm)) {
							dummyList.add(list.get(i));
						}
					}
					list = dummyList;
					dummyList = emptyList;
				}

				if (!doNm.isEmpty()) {
					for (int i = 0; i < list.size(); i++) {
						if (list.get(i).getDoNm().equals(doNm)) {
							dummyList.add(list.get(i));
						}
					}
					list = dummyList;
					dummyList = emptyList;
				}

				if (!induty.isEmpty()) {
					for (int i = 0; i < list.size(); i++) {
						if (list.get(i).getInduty() == null) {
							continue;
						}

						if (list.get(i).getInduty().contains(induty)) {
							dummyList.add(list.get(i));
						}
					}
					list = dummyList;
					dummyList = emptyList;
				}

				if (!sbrsCl.isEmpty()) {
					for (int i = 0; i < list.size(); i++) {
						if (list.get(i).getSbrsCl() == null) {
							continue;
						}

						if (list.get(i).getSbrsCl().contains(sbrsCl)) {
							dummyList.add(list.get(i));
						}
					}
					list = dummyList;
					dummyList = emptyList;
				}

				if (!posblFcltyCl.isEmpty()) {
					for (int i = 0; i < list.size(); i++) {
						if (list.get(i).getPosblFcltyCl() == null) {
							continue;
						}

						if (list.get(i).getPosblFcltyCl().contains(posblFcltyCl)) {
							dummyList.add(list.get(i));
						}
					}
					list = dummyList;
					dummyList = emptyList;
				}

				// currentPage
				// start, end
				// Navi
				// list 에 최종적으로 10개 담아서 날린다

				request.setAttribute("list", list);
				request.getRequestDispatcher("/campground/campList.jsp").forward(request, response);

			} else if (cmd.equals("/searchFromMain.camp")) {
				List<CampDTO> list = dao.selectAll();
				List<CampDTO> dummyList = new ArrayList<CampDTO>();
				List<CampDTO> emptyList = new ArrayList<CampDTO>();

				List<CampDTO> dummyList2 = new ArrayList<CampDTO>();

				String induty = request.getParameter("induty"); // 캠핑유형 (2순위)
				String doNm = request.getParameter("doNm"); // 지역 (1순위)

				System.out.println("induty : " + induty);
				System.out.println("doNm : " + doNm);

				if (!doNm.isEmpty()) {
					for (int i = 0; i < list.size(); i++) {
						if (list.get(i).getDoNm().equals(doNm)) {
							dummyList.add(list.get(i));
						}
					}
					list = dummyList;
					dummyList = emptyList;
				}

				if (!induty.isEmpty()) {
					for (int i = 0; i < list.size(); i++) {
						if (list.get(i).getInduty().contains(induty)) {
							dummyList.add(list.get(i));
						}
					}
					list = dummyList;
					dummyList = emptyList;
				}

				request.setAttribute("list", list);
				request.getRequestDispatcher("/campground/campList.jsp").forward(request, response);

			} else if (cmd.equals("/campList.camp")) {
				List<CampDTO> list = dao.selectAll();
				
				request.setAttribute("list", list);
				request.getRequestDispatcher("/campground/campList.jsp").forward(request, response);
				
			} else if (cmd.equals("/campDetail.camp")) {
				String facltNm = request.getParameter("facltNm");

				System.out.println(facltNm);
				CampDTO dto = dao.selectByFacltnm(facltNm);

				String contentId = dto.getContentId();
				int total_camp_Nm = dto.getTotal_camp_Nm();
				int occupied_camp_Nm = revDao.getOccupiedCampNm(contentId);
				int available_camp_Nm = total_camp_Nm - occupied_camp_Nm;
				
				ReviewDAO rDao = ReviewDAO.getInstance();
				List<ReviewDTO> reviewList = rDao.selectByContentId(contentId);
				
				
				if(reviewList.size() != 0) {
					request.setAttribute("reviewList", reviewList);
				}
				request.setAttribute("dto", dto);
				request.setAttribute("available_camp_Nm", available_camp_Nm);
				request.getRequestDispatcher("/campground/campDetail.jsp").forward(request, response);

			} else if (cmd.equals("/update.camp")) {
				List<JSONObject> list = APIDAO.getAPIData();

				APIDAO apiDao = new APIDAO();
				int result;

				for (int i = 0; i < list.size(); i++) {
					try {
						result = apiDao.insertAPIData(list.get(i));
						if (result > 0) {
							System.out.println("업데이트 성공!");
							
						}
						if (result == 0) {
							System.out.println("업데이트 오류");
							break;
						}
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				response.sendRedirect("/adminPage.admin");
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