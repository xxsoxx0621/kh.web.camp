package camp.web.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import camp.web.dao.NoticeDAO;
import camp.web.dao.NoticeReplyDAO;
import camp.web.dto.NoticeDTO;
import camp.web.dto.NoticeReplyDTO;
import camp.web.statics.Statics;


@WebServlet("*.notice")
public class NoticeController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf8");
		
		NoticeDAO dao = NoticeDAO.getInstance();
		NoticeReplyDAO nrdao = NoticeReplyDAO.getInstance();

		String requestURI = request.getRequestURI();
		String ctxPath = request.getContextPath();
		String cmd = requestURI.substring(ctxPath.length());

		try {		
			if(cmd.equals("/noticeList.notice")) {

				int currentPage = Integer.parseInt(request.getParameter("cpage"));
				String navi = dao.getPageNavi(currentPage);
				int start = Statics.NAVI_COUNT_PER_PAGE - (Statics.NAVI_COUNT_PER_PAGE-1);
				int end = currentPage * Statics.NAVI_COUNT_PER_PAGE - 1;
				List<NoticeDTO> list = dao.selectByBound(start, end);

				//				List<NoticeDTO> list = dao.selectAll();
				request.setAttribute("navi", navi);
				request.setAttribute("list", list);
				request.getRequestDispatcher("/notice/noticeList.jsp").forward(request, response);


			}else if(cmd.equals("/writeNotice.notice")) {
				response.sendRedirect("/notice/noticeWrite.jsp");

			}else if(cmd.equals("/completeNoticeWriting.notice")) {
				String title = request.getParameter("notice_title");
				String content = request.getParameter("content");

				String id = (String)request.getSession().getAttribute("loginID");
				
				dao.insertNoticeList(title,content);
				
				int seq = dao.viewSeq();
				
				response.sendRedirect("/noticeDetail.notice?seq="+seq);

			}else if(cmd.equals("/noticeDetail.notice")) {
				int seq = Integer.parseInt(request.getParameter("seq"));
				dao.upViewCount(seq);

				//????????? ?????????
				//				String id = (String)request.getSession().getAttribute("admin");

				//?????? ????????? -> ????????? ?????? ?????? ?????? ????????? ID??? ????????? ????????? ????????? ?????????.
				//?????? ???????????? ????????????????????? ??????????????? "?????????"?????? ????????? => DB??? ????????? ?????? ?????? ?????? 
				//				String user_id = (String)request.getSession().getAttribute("loginID");



				List<NoticeReplyDTO> replyList = nrdao.selectAll(seq);
				List<NoticeDTO> list = dao.selectDetail(seq);


				request.setAttribute("replyList", replyList);
				request.setAttribute("noticeDetail", list);
				request.getRequestDispatcher("/notice/noticeDetail.jsp").forward(request, response);

			}else if(cmd.equals("/deleteNotice.notice")) {
				int seq = Integer.parseInt(request.getParameter("seq"));
				int result = dao.deleteNotice(seq);


				nrdao.delPageReply(seq);
				response.sendRedirect("/noticeList.notice?cpage=1");

			}else if(cmd.equals("/modifyNotice.notice")) {
				String title = request.getParameter("input_title");
				String contents = request.getParameter("content");
				int seq = Integer.parseInt(request.getParameter("seq"));

				int result = dao.modifyNotice(title, contents, seq);
				response.sendRedirect("/noticeDetail.notice?seq="+seq);
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
