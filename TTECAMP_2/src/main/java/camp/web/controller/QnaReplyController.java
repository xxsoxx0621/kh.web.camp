package camp.web.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import camp.web.dao.QnaReplyDAO;
import camp.web.dto.QnaReplyDTO;


@WebServlet("*.qrc")
public class QnaReplyController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf8");

		String requestURI = request.getRequestURI();
		String ctxPath = request.getContextPath();
		String cmd = requestURI.substring(ctxPath.length());

		QnaReplyDAO dao = QnaReplyDAO.getInstance();
		try {
			if(cmd.equals("/commentAdd.qrc")) {

				int intSeq = Integer.parseInt(request.getParameter("seq"));
				
				
				String id;
				if(request.getParameter("id") != null) {
					id = "관리자";
				}else {
					id = request.getParameter("user_id");
				}

				String content = request.getParameter("comment");
				int result = dao.addComment(intSeq,id,content);


				String seq = Integer.toString(intSeq); 
				response.sendRedirect("/qnaDetail.qna?seq="+seq);

			}else if(cmd.equals("/deleteRpl.qrc")) {

				int replyNo = Integer.parseInt(request.getParameter("replyNo"));
				int seq = Integer.parseInt(request.getParameter("seq"));
				dao.deleteReply(replyNo, seq);

				response.sendRedirect("/qnaDetail.qna?seq="+seq+"&cpage=1");
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