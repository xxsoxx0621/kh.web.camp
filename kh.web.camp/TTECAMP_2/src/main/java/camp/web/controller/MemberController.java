package camp.web.controller;

import java.io.IOException;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import camp.web.dao.MemberDAO;
import camp.web.dto.MemberDTO;
import camp.web.utils.EncrpytionIUtils;


@WebServlet("*.mem")
public class MemberController extends HttpServlet {

       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf8");
		Gson g = new Gson();
		String requestURI = request.getRequestURI();
		String ctxPath = request.getContextPath();
		
		String cmd = requestURI.substring(ctxPath.length());
		
		MemberDAO dao = MemberDAO.getInstance();
		
		try {
			
		
			if(cmd.equals("/idCheck.mem")) {
				
				// 중복 ID 확인
				String id = request.getParameter("id");
				boolean result = dao.isIdExist(id);
				response.getWriter().append(String.valueOf(result));
				
				
			}else if(cmd.equals("/main.mem")) {
				
				// 메인 이동
				response.sendRedirect("/index.jsp");
				
			}else if(cmd.equals("/signUp.mem")) {
				
				// 회원가입 바로가기
				response.sendRedirect("member/signUp.jsp");
				
			}else if(cmd.equals("/signUpProc.mem")) {
				
				// 회원가입
				String id = request.getParameter("id");
				String pw = EncrpytionIUtils.getSHA512(request.getParameter("pw"));
				String name = request.getParameter("name");
				
				String phone1 = request.getParameter("phone1") ;
				String phone2 = request.getParameter("phone2") ;
				String phone3 = request.getParameter("phone3");
				String phone = phone1 + "-" + phone2 +"-"+phone3;
				
				String email = EncrpytionIUtils.getEncrypt(request.getParameter("email"),"cos");
				String originEmail = request.getParameter("email");
				
				String zipcode = request.getParameter("zipcode");
				String address1  = request.getParameter("address1");
				String address2  = request.getParameter("address2");
				
				String hint = request.getParameter("hint");
				String hint_answer = request.getParameter("hint_answer");
				
				int seq = 0;
				int result = dao.insert(new MemberDTO(id,pw,name,phone,email,originEmail,zipcode,address1,address2,hint,hint_answer,null,seq ));
				
				
				if(result > 0) {
					response.getWriter().append(String.valueOf(result));
				}
				
			}else if(cmd.equals("/login.mem")) {
				
				// 로그인 바로가기
				response.sendRedirect("member/login.jsp");
				
			}else if(cmd.equals("/loginProc.mem")) {
				
				// 로그인 
				String id = request.getParameter("id");
				String pw = EncrpytionIUtils.getSHA512(request.getParameter("pw"));
				String checkbox = request.getParameter("checkbox");
				
				Cookie cookie = new Cookie("id", id); //쿠키 생성
				System.out.println(checkbox);
	
				boolean result = dao.login(id,pw);
				if(result) {
					
					HttpSession session = request.getSession();
					
					// 관리자 ID 넣어야만 관리자로 인식 할 수 있음.
					if(id.contains("admin")) {
						session.setAttribute("admin", id);
					}else {
						session.setAttribute("loginID", id);
					}
					if(checkbox != null) {
						// 체크박스 체크 된 경우
						response.addCookie(cookie); // 쿠키 저장
					}else {
						// 체크박스 체크 해제 경우
						cookie.setMaxAge(0); // 쿠키 유효시간 0으로 해서 브라우저에서 삭제
						response.addCookie(cookie);
					}
					
					
					response.getWriter().append(String.valueOf(result));
					
				}
				
				
				
			}else if(cmd.equals("/logout.mem")) {
				
				// 로그아웃
				
				// 관리자 / 일반 유저 상관없이 로그아웃시 유저,관리자 세션 제거 
				
				request.getSession().removeAttribute("loginID");
				request.getSession().removeAttribute("admin");
				
				response.sendRedirect("/index.jsp");
				
			}else if(cmd.equals("/findId.mem")) {
				
				// 아이디 찾기
				response.sendRedirect("member/findId.jsp");
				
			}else if(cmd.equals("/isEmailExist.mem")) {
				
				// 이메일 유효성 검사
				
				// 1. 이메일을 parameter값을 받아와서 sha256 변환
				String email = EncrpytionIUtils.getEncrypt(request.getParameter("email"), "cos");
				String email2 = request.getParameter("email");
				// 2. 이메일 유효성 검사
				boolean result = dao.isEmailExist(email);
				// 3. 만약 result 값이 true면
				 
				if(result) {
					
							
							// 4. mail server 설정 
			                String host = "smtp.naver.com";
			                String user = "xxsoxx0621"; //자신의 네이버 계정
			                String password = "somin7248??";//자신의 네이버 패스워드
			                
			                
			                // 5. 메일 받을 주소
			                String to_email = request.getParameter("email");
			                System.out.println(to_email);
			                
			              //SMTP 서버 정보를 설정한다.
			                Properties props = System.getProperties();
			                props.put("mail.smtp.starttls.enable", "true");
			                props.put("mail.smtp.host", host);
			                props.put("mail.smtp.port", 465);
			                props.put("mail.smtp.auth", "true");
			                props.put("mail.smtp.ssl.enable", "true");
			                props.put("mail.smtp.ssl.trust", host);
			                props.put("mail.smtp.ssl.protocols","TLSv1.2");
			                props.put("mail.debug", "true"); // 오류날때 debug로 확인 가능
			                
			              //인증 번호 생성기
			                StringBuffer temp =new StringBuffer();
			                Random rnd = new Random();
			                for(int i=0;i<10;i++)
			                {
			                    int rIndex = rnd.nextInt(3);
			                    switch (rIndex) {
			                    case 0:
			                        // a-z
			                        temp.append((char) ((int) (rnd.nextInt(26)) + 97));
			                        break;
			                    case 1:
			                        // A-Z
			                        temp.append((char) ((int) (rnd.nextInt(26)) + 65));
			                        break;
			                    case 2:
			                        // 0-9
			                        temp.append((rnd.nextInt(10)));
			                        break;
			                    }
			                }
			                
			                String AuthenticationKey = temp.toString();
			               
			                
			                Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			                    protected PasswordAuthentication getPasswordAuthentication() {
			                        return new PasswordAuthentication(user,password);
			                    }
			                });
			                //email 전송
			                try {
			                    MimeMessage msg = new MimeMessage(session);
			                    msg.setFrom(new InternetAddress("xxsoxx0621@naver.com", "ttecamp"));
			                    msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to_email));
			                    
			                    //메일 제목
			                    msg.setSubject("안녕하세요 떼캠 [아이디 찾기 인증번호] 입니다.");
			                    //메일 내용
			                    msg.setText("인증 번호는 : "+temp +"입니다. ");
			                    
			                    Transport.send(msg);
			                    System.out.println("이메일 전송");
			                }catch (Exception e) {
			                    e.printStackTrace();// TODO: handle exception
			                }
			                HttpSession saveKey = request.getSession();
			                saveKey.setAttribute("AuthenticationKey", AuthenticationKey);
			                saveKey.setMaxInactiveInterval(3*60); // 3분까지만 세션 저장
			                System.out.println("이메일 전송 완료");
			                
			                HttpSession session1 = request.getSession();
			                session1.setAttribute("email2", email2);
			           
					        response.getWriter().append(String.valueOf(result));
			           
//		                request.getRequestDispatcher("member/findId.jsp").forward(request, response);
				}else {
					System.out.println("이메일 전송 실패");
				}
				
		
			}else if(cmd.equals("/checkEmail.mem")) {
				String email =  EncrpytionIUtils.getEncrypt(request.getParameter("email"), "cos");
				boolean result = dao.isEmailExist(email);
				response.getWriter().append(String.valueOf(result));
			
			
			
			
			}else if(cmd.equals("/resultId.mem")) {
				
				//아이디 결과 page로 가기
				String email = (String) request.getSession().getAttribute("email2");
				String encrpyEmail = EncrpytionIUtils.getEncrypt(email, "cos");
				System.out.println(encrpyEmail);
				MemberDTO dto = dao.getId(encrpyEmail);
				request.setAttribute("dto", dto);
//				System.out.println(dto);
				request.getRequestDispatcher("member/resultId.jsp").forward(request, response);
				
			}else if(cmd.equals("/findPw.mem")) {
				// 비밀번호 찾기 page로 가기
				response.sendRedirect("member/findPw.jsp");
				
			}else if(cmd.equals("/findPwProc.mem")) {
				String id = request.getParameter("id");
				String question = request.getParameter("question");
				
				String answer = request.getParameter("answer");
				
				boolean result = dao.findPw(id,question,answer);
				System.out.println(result);
				System.out.println(question);
				if(result) {
					HttpSession session = request.getSession();
					session.setAttribute("id", id);
					response.getWriter().append(String.valueOf(result));
				}
				
			}else if(cmd.equals("/resetPw.mem")) {
				
				response.sendRedirect("member/resetPw.jsp");
				
			}
			else if(cmd.equals("/resetPwProc.mem")) {
				String id = (String) request.getSession().getAttribute("id");
				String pw = EncrpytionIUtils.getSHA512(request.getParameter("newPw"));
				
				boolean result = dao.resetPw(id,pw);
				System.out.println("result");
				if(result) {
					System.out.println("변경완료");
					response.sendRedirect("member/login.jsp");
				}else {
					response.sendRedirect("/error.jsp");
				}
				
			}
		}catch(Exception e) {
			e.printStackTrace();
			response.sendRedirect("/error.jsp");
	
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}