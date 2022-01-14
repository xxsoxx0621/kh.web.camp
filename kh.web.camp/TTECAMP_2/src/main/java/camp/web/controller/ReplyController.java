package camp.web.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import camp.web.dao.ReplyDAO;


@WebServlet("*.rpl")
public class ReplyController extends HttpServlet {


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf8");

		String requestURI = request.getRequestURI();
		String ctxPath = request.getContextPath();
		String cmd = requestURI.substring(ctxPath.length());

		ReplyDAO dao = ReplyDAO.getInstance();
		try {
			if(cmd.equals("/commentAdd.rpl")) {

				int intSeq = Integer.parseInt(request.getParameter("seq"));
				
				
				
				
//				int cpage = Integer.parseInt(request.getParameter("cpage"));
//				
//				String stringCpage = Integer.toString(cpage);
//				
				
				
				String id;
				if(request.getParameter("id") != null) {
					id = "관리자";
				}else {
					id = request.getParameter("user_id");
				}

				String content = request.getParameter("comment");
				int result = dao.addComment(intSeq,id,content);

				String seq = Integer.toString(intSeq); 
				response.sendRedirect("/detail.board?seq="+seq);

			}else if(cmd.equals("/deleteRpl.rpl")) {

				int replyNo = Integer.parseInt(request.getParameter("replyNo"));
				int seq = Integer.parseInt(request.getParameter("seq"));
				dao.deleteReply(replyNo, seq);

				response.sendRedirect("/detail.board?seq="+seq+"&cpage=1");
			}

		}catch(Exception e) {
			e.printStackTrace();
			response.sendRedirect("error.html");
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
