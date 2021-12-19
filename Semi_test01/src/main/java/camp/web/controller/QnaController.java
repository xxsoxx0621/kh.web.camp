package camp.web.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import camp.web.dao.QnaDAO;
import camp.web.dao.QnaReplyDAO;
import camp.web.dto.QnaDTO;
import camp.web.dto.QnaReplyDTO;
import camp.web.statics.Statics;

@WebServlet("*.qna")
public class QnaController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf8");

		String requestURI = request.getRequestURI();
		String ctxPath = request.getContextPath();
		String cmd = requestURI.substring(ctxPath.length());

		QnaDAO dao = QnaDAO.getInstance();
		QnaReplyDAO qdao = QnaReplyDAO.getInstance(); 

		try {
			if(cmd.equals("/qnaList.qna")) {

				int currentPage = Integer.parseInt(request.getParameter("cpage"));
				String navi = dao.getPageNavi(currentPage);
				int start = Statics.NAVI_COUNT_PER_PAGE - (Statics.NAVI_COUNT_PER_PAGE-1);
				int end = currentPage * Statics.NAVI_COUNT_PER_PAGE - 1;
				List<QnaDTO> list = dao.selectByBound(start, end);


				String userID = (String)request.getSession().getAttribute("loginID");
				request.setAttribute("userID", userID);
				//				List<QnaDTO> list = dao.selectAll();
				request.setAttribute("navi", navi);
				request.setAttribute("list", list);
				request.getRequestDispatcher("/qna/qnaList.jsp").forward(request, response);



			}if(cmd.equals("/qnaWrite.qna")) {
				response.sendRedirect("/qna/qnaWrite.jsp");

			}else if(cmd.equals("/completeQnaWrite.qna")) {
				String id = (String)request.getSession().getAttribute("loginID");
				String title = request.getParameter("input_title");
				String content = request.getParameter("content");
				dao.insertQna(id, title, content);

				//

				int seq = dao.viewSeq(id);
				response.sendRedirect("/qnaDetail.qna?writeSeq="+seq+"&cpage=1");

			}else if(cmd.equals("/qnaDetail.qna")) {
				int seq ;
				if(request.getParameter("writeSeq") == null) {
					seq = Integer.parseInt(request.getParameter("seq"));
				}else {
					seq = Integer.parseInt(request.getParameter("writeSeq"));
				}

				dao.upViewCount(seq);

				List<QnaDTO> list = dao.selectDetail(seq);

				List<QnaReplyDTO> rList = qdao.selectAll(seq);

				request.setAttribute("replyList", rList);
				request.setAttribute("qnaDetail", list);
				request.getRequestDispatcher("/qna/qnaDetail.jsp").forward(request, response);

			}else if(cmd.equals("/modifyQna.qna")) {
				String title = request.getParameter("input_title");
				String contents=  request.getParameter("content");
				int seq = Integer.parseInt(request.getParameter("seq"));

				dao.modifyQna(title, contents, seq);
				response.sendRedirect("/qnaDetail.qna?seq="+seq);

			}else if(cmd.equals("/deleteQna.qna")) {
				int seq = Integer.parseInt(request.getParameter("seq"));
				dao.deleteQna(seq);

				response.sendRedirect("/qnaList.qna?cpage=1");
			}



		}catch(Exception e) {
			e.printStackTrace();
			response.sendRedirect("/error.jsp");
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
