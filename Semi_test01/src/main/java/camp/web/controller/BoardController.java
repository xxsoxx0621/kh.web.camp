package camp.web.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import camp.web.dao.BoardDAO;
import camp.web.dao.ReplyDAO;
import camp.web.dto.BoardDTO;
import camp.web.dto.ReplyDTO;
import camp.web.statics.Statics;


@WebServlet("*.board")
public class BoardController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf8");

		String requestURI = request.getRequestURI();
		String ctxPath = request.getContextPath();
		String cmd = requestURI.substring(ctxPath.length());

		BoardDAO dao = BoardDAO.getInstance();
		ReplyDAO replyDao = ReplyDAO.getInstance(); 

		try {
			if(cmd.equals("/boardlist.board")) {

				int currentPage = Integer.parseInt(request.getParameter("cpage"));

				int start = currentPage * Statics.RECORD_COUNT_PER_PAGE - 9; 
				int end = currentPage * Statics.RECORD_COUNT_PER_PAGE;
				String navi = dao.getPageNavi(currentPage);

				List<BoardDTO> list = dao.selectByBound(start, end);


				// 게시판 글 목록 중에 관리자가 쓴 글은 관리자라고 표시 하기 위함.
				String adminID = "SHadmin";

				request.setAttribute("adminID", adminID);

				request.setAttribute("navi", navi);		
				request.setAttribute("list", list);
				request.getRequestDispatcher("/freeboard/boardlist.jsp").forward(request, response);

				// 게시글 제목 옆에 댓글 개수 표시
				// forward 두 번 하는 이유는 첫 forward 로 boardList 정보를 뿌려주고 다시 seq를 불러와서 select 처리 
				//				int boardSeq = Integer.parseInt(request.getParameter("boardSeq"));
				//				int replyCount = replyDao.countReply(boardSeq);
				//				System.out.println(replyCount);
				//				request.setAttribute("replyCount", replyCount);
				//				request.getRequestDispatcher("/freeboard/boardlist.jsp").forward(request, response);

				//			}else if(cmd.equals("/loadReplyCount.board")) {
				//				int boardSeq = Integer.parseInt(request.getParameter("boardSeq"));
				//				int replyCount = replyDao.countReply(boardSeq);
				//				String replyCountString = Integer.toString(replyCount);
				//				request.setAttribute("replyCount", replyCount);
				//				request.getRequestDispatcher("/freeboard/boardlist.jsp").forward(request, response);
				//				response.getWriter().append(replyCountString);

			}else if(cmd.equals("/boardWrite.board")) {

				response.sendRedirect("/freeboard/boardWrite.jsp");	

			}else if(cmd.equals("/completeWrite.board")) {
				String title = request.getParameter("input_title");
				String contents = request.getParameter("content");

				String id = (String)request.getSession().getAttribute("loginID");

				dao.writeBoard(title, contents, id);
				int seq = dao.viewSeq(id);
				response.sendRedirect("/detail.board?writeSeq="+seq+"&cpage=1");
				//				response.sendRedirect("/boardlist.board?cpage=1");

			}else if(cmd.equals("/detail.board")) {
				int seq ;
				if(request.getParameter("writeSeq") == null) {
					seq = Integer.parseInt(request.getParameter("seq"));
				}else {
					seq = Integer.parseInt(request.getParameter("writeSeq"));
				}

				//				int seq = Integer.parseInt(request.getParameter("seq")); 

				dao.upViewCount(seq);

				// 댓글 불러오기
				List<ReplyDTO> replyList = replyDao.selectAll(seq);

				List<BoardDTO> list = dao.selectDetail(seq);


				//페이징 
				//				int currentPage = Integer.parseInt(request.getParameter("cpage"));
				//		
				//				int start = currentPage * Statics.RECORD_COUNT_PER_PAGE - 9;
				//				int end = currentPage * Statics.RECORD_COUNT_PER_PAGE;
				//				
				//				List<ReplyDTO> replyList = replyDao.selectByBound(start, end);
				//				String navi = replyDao.getPageNavi(currentPage, seq);
				//				
				//				replyDao.getPageNavi(currentPage, seq);

				request.setAttribute("replyList", replyList);
				//				request.setAttribute("navi", navi);
				request.setAttribute("list", list);

				request.getRequestDispatcher("/freeboard/detailBoard.jsp?cpage=1").forward(request, response);

			}else if(cmd.equals("/delete.board")) {
				int seq = Integer.parseInt(request.getParameter("seq"));
				replyDao.delPageReply(seq);
				dao.delete(seq);

				response.sendRedirect("/boardlist.board?cpage=1");

			}else if(cmd.equals("/modify.board")) {
				// detail.jsp 의 title name
				String title = request.getParameter("input_title");
				// detail.jsp 의 Contents name
				String contents = request.getParameter("content");
				int seq = Integer.parseInt(request.getParameter("seq"));

				dao.modify(title,contents,seq);
				response.sendRedirect("/detail.board?seq="+seq);


			}else if(cmd.equals("/search.board")) {
				//검색 기능 //
				//검색 기능 //
				//검색 기능 //
				//검색 기능 //
				//검색 기능 //
				//검색 기능 //
				//검색 기능 //
				String searchText = request.getParameter("searchText");
				String searchField = request.getParameter("searchField");

				if(searchText.equals("")) {
					response.sendRedirect("/boardlist.board?cpage=1");
				}else {
					List<BoardDTO> searchList = dao.searchBoard(searchField, searchText);	

					int count = 0;
					if(searchList.size() == 0) {
						request.setAttribute("count", count);
					}else {
						request.setAttribute("searchList", searchList);
					}

					int currentPage = Integer.parseInt(request.getParameter("cpage"));

					int start = currentPage * Statics.RECORD_COUNT_PER_PAGE - 9; 
					int end = currentPage * Statics.RECORD_COUNT_PER_PAGE;
					String navi = dao.getPageNavi(currentPage);
					List<BoardDTO> list = dao.selectByBound(start, end);


					// 게시판 글 목록 중에 관리자가 쓴 글은 관리자라고 표시 하기 위함.

					String adminID = (String)request.getSession().getAttribute("adminID");

					request.setAttribute("adminID", adminID);
					request.setAttribute("navi", navi);		
					request.setAttribute("list", list);
					request.getRequestDispatcher("/freeboard/searchList.jsp?cpage=1").forward(request, response);
				}
			}
		}
		catch(Exception e){
			e.printStackTrace();
			response.sendRedirect("error.html");
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}