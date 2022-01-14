package camp.web.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import camp.web.dao.ReservationDAO;
import camp.web.dao.ReviewDAO;
import camp.web.dto.ReviewDTO;



/**
 * Servlet implementation class ReviewController
 */
@WebServlet("*.review")
public class ReviewController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uri = request.getRequestURI();
		System.out.println("사용자가 요청한 주소 : " + uri);

		String ctxPath = request.getContextPath();
		System.out.println("프로젝트명 : " + ctxPath);

		String cmd = uri.substring(ctxPath.length());
		System.out.println("사용자가 요청한 기능 : " + cmd);

		ReviewDAO dao = ReviewDAO.getInstance();
		ReservationDAO revDao = ReservationDAO.getInstance();

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		try {
			if (cmd.equals("/addReview.review")) {
				String contentId = request.getParameter("contentId");
				String user_id = request.getParameter("loginID");
				System.out.println("user_id : " + user_id);
				String contents = request.getParameter("contents");
				System.out.println("contentId : " + contentId);
				System.out.println("contents : " + contents);

				ReviewDTO dto = new ReviewDTO(0, contentId, user_id, contents, null, 0);
				int result = dao.insertReview(dto);
				
		         
		         
		         List<ReviewDTO> list = dao.selectByContentId(contentId);
		         
		         Gson g = new Gson();
		         String ResponseResult = g.toJson(list);
		         System.out.println("list : " + list);
		         
		         response.getWriter().append(ResponseResult);

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
