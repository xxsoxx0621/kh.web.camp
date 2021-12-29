package camp.web.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import camp.web.dao.BoardDAO;
import camp.web.dao.MemberDAO;
import camp.web.dao.QnaDAO;
import camp.web.dao.ReservationDAO;
import camp.web.dto.MemberDTO;
import camp.web.dto.QnaDTO;
import camp.web.dto.ReservationDTO;
import camp.web.statics.Statics;
import camp.web.utils.EncrpytionIUtils;

@WebServlet("*.admin")
public class AdminController extends HttpServlet {
   private static final long serialVersionUID = 1L;

   protected void doGet(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {

      Gson g = new Gson();
      request.setCharacterEncoding("utf8");

      String requestURI = request.getRequestURI();
      String ctxPath = request.getContextPath();
      String cmd = requestURI.substring(ctxPath.length());
      System.out.println("cmd : " + cmd);

      MemberDAO dao = MemberDAO.getInstance();
      BoardDAO boDao = BoardDAO.getInstance();
      ReservationDAO revDao = ReservationDAO.getInstance();
      QnaDAO  qdao= QnaDAO.getInstance();

      try {
         if (cmd.equals("/adminPage.admin")) {

            response.sendRedirect("/admin/adminPage.jsp");

         } else if (cmd.equals("/reservationControl.admin")) {

            response.sendRedirect("/admin/reservationControl.jsp");

         } else if (cmd.equals("/manageMember.admin")) {

            int currentPage = Integer.parseInt(request.getParameter("cpage"));
            String navi = dao.getPageNavi(currentPage);
            int start = Statics.NAVI_COUNT_PER_PAGE - (Statics.NAVI_COUNT_PER_PAGE - 1);
            int end = currentPage * Statics.NAVI_COUNT_PER_PAGE - 1;
            List<MemberDTO> list = dao.selectByBound(start, end);

            request.setAttribute("navi", navi);
            request.setAttribute("list", list);
            request.getRequestDispatcher("/admin/manageMember.jsp").forward(request, response);

         } else if (cmd.equals("/searchIdProc.admin")) {

            String id = request.getParameter("searchInput");

            List<MemberDTO> list = dao.searchId(id);
            String result = g.toJson(list);

            response.setContentType("text/html;charset=utf8;");
            response.getWriter().append(result);

         } else if (cmd.equals("/searchNameProc.admin")) {

            String name = request.getParameter("searchInput");

            List<MemberDTO> list = dao.searchName(name);
            String result = g.toJson(list);

            response.setContentType("text/html;charset=utf8;");
            response.getWriter().append(result);

         } else if (cmd.equals("/deleteMember.admin")) {

            String[] idList = request.getParameterValues("idArr");
            for (String str : idList) {
               int result = dao.adminDeleteMem(str);
               if (result > 0) {
                  response.getWriter().append(String.valueOf(result));
               }
            }

         } else if (cmd.equals("/findMember.admin")) {
            // 아이디랑 동일한 정보의 회원정보 찾아오기
            String id = request.getParameter("checkVal");

            HttpSession session = request.getSession();
            session.setAttribute("checkID", id);

            List<MemberDTO> list = dao.getAllInfo(id);
            String result = g.toJson(list);
            response.getWriter().append(result);

         } else if (cmd.equals("/updateMember.admin")) {

            String id = (String) request.getSession().getAttribute("checkID");
            List<MemberDTO> list = dao.getAllInfo(id);
            request.setAttribute("list", list);
            request.getRequestDispatcher("admin/updateMember.jsp").forward(request, response);

         } else if (cmd.equals("/findPwProc.admin")) {
            String id = (String) request.getSession().getAttribute("checkID");
            String pw = EncrpytionIUtils.getSHA512(request.getParameter("presentPw"));

            boolean result = dao.isMatchPw(id, pw);
            if (result) {
               response.getWriter().append(String.valueOf(result));
            }

         } else if(cmd.equals("/updateInfoProc.mypage")) {
				int seq = 0;
				
				String id =  (String) request.getSession().getAttribute("checkID");
				String name = request.getParameter("name");
		
				String presentPw = request.getParameter("presentPw");
				String changePw = EncrpytionIUtils.getSHA512(request.getParameter("changePw"));
				System.out.println(presentPw);
				System.out.println(changePw);
				
				String presentPw1 = request.getParameter("presentPw");
				String changePw1 = request.getParameter("changePw");
				
				String phone1 = request.getParameter("phone1");
				String phone2 = request.getParameter("phone2");
				String phone3 = request.getParameter("phone3");
				String phone = phone1 + "-" + phone2 + "-" + phone3;
				String email = EncrpytionIUtils.getEncrypt(request.getParameter("email"),"cos");
				String originEmail = request.getParameter("email");
				String zipcode = request.getParameter("zipcode");
				String address1 = request.getParameter("address1");
				String address2 = request.getParameter("address2");
				String hint = request.getParameter("hint");
				String hintAnswer = request.getParameter("hintAnswer");
				

				if(changePw1 == "" ) {
					
					// 변경 될 비밀번호가 없을 경우
					int result = dao.adminUpdateInfo(new MemberDTO(id,presentPw,name,phone,email,originEmail,zipcode,address1,address2,hint,hintAnswer,null,seq));
			
					if(result > 0) {

						response.getWriter().append(String.valueOf(result));
					}
				}else {
					// 변경될 비밀번호가 있을 경우
					int result = dao.adminUpdateInfo1(new MemberDTO(id,changePw,name,phone,email,originEmail,zipcode,address1,address2,hint,hintAnswer,null,seq));

					if(result > 0) {
						
						response.getWriter().append(String.valueOf(result));
					}
				}
				
			} else if (cmd.equals("/likeList.admin")) {

         }else if(cmd.equals("/questionControl.admin")) {

				List<QnaDTO> list = qdao.selectAll();
				request.setAttribute("list", list);
				request.getRequestDispatcher("/admin/adminQna.jsp").forward(request, response);

						
			}else if(cmd.equals("/adminQnaDel.admin")) {
				int seq = Integer.parseInt(request.getParameter("seq"));
				qdao.deleteQna(seq);
				response.sendRedirect("/questionControl.admin"); 

         } else if (cmd.equals("/campControl.admin")) {

         } else if (cmd.equals("/modify.board")) {

         } else if (cmd.equals("/showAllRev.admin")) {
            List<ReservationDTO> list = revDao.selectAll();
            List<ReservationDTO> dummyList = new ArrayList<ReservationDTO>();

            String searchBy = request.getParameter("searchBy");
            String searchInput = request.getParameter("searchInput");
            System.out.println(searchBy);
            System.out.println(searchInput);

            if (searchBy != null) {
               if (searchBy.equals("예약번호")) {
                  for (int i = 0; i < list.size(); i++) {
                     if (list.get(i).getReservation_id() == null) {
                        continue;
                     }
                     if (list.get(i).getReservation_id().contains(searchInput)) {
                        dummyList.add(list.get(i));
                     }
                  }
                  list = dummyList;
               } else if (searchBy.equals("아이디")) {
                  for (int i = 0; i < list.size(); i++) {
                     if (list.get(i).getUser_id() == null) {
                        continue;
                     }
                     if (list.get(i).getUser_id().contains(searchInput)) {
                        dummyList.add(list.get(i));
                     }
                  }
                  list = dummyList;

               } else if (searchBy.equals("이름")) {
                  for (int i = 0; i < list.size(); i++) {
                     if (list.get(i).getClient_name() == null) {
                        continue;
                     }
                     if (list.get(i).getClient_name().contains(searchInput)) {
                        dummyList.add(list.get(i));
                     }
                  }
                  list = dummyList;
               } else if (searchBy.equals("캠핑장")) {
                  for (int i = 0; i < list.size(); i++) {
                     if (list.get(i).getFacltNm() == null) {
                        continue;
                     }
                     if (list.get(i).getFacltNm().contains(searchInput)) {
                        dummyList.add(list.get(i));
                     }
                  }
                  list = dummyList;
               }
            }

            request.setAttribute("list", list);
            request.getRequestDispatcher("/admin/reservationControl.jsp").forward(request, response);

         } else if (cmd.equals("/cancelRev.admin")) {
            String reservation_id = request.getParameter("reservation_id");
            System.out.println("reservation_id : " + reservation_id);
            int result = revDao.deleteReservation(reservation_id);

            if (result > 0) {
               System.out.println("삭제 성공");
            } else {
               System.out.println("삭제 실패");
            }

            request.getRequestDispatcher("/showAllRev.admin").forward(request, response);

         } else if (cmd.equals("/confirmRev.admin")) {
            String reservation_id = request.getParameter("reservation_id");
            System.out.println("reservation_id : " + reservation_id);
            int result = revDao.confirmReservation(reservation_id);

            if (result > 0) {
               System.out.println("수정 성공");
            } else {
               System.out.println("수정 실패");
            }

            request.getRequestDispatcher("/showAllRev.admin").forward(request, response);
         }

      } catch (Exception e) {
         e.printStackTrace();
         response.sendRedirect("error.html");
      }
   }

   protected void doPost(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {

   }

}