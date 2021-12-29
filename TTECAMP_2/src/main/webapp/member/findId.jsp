<%@page import="java.io.PrintWriter"%>
<%@page import="camp.web.utils.EncrpytionIUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'
	name='viewport'>
<meta content='IE=edge' http-equiv='X-UA-Compatible'>
<meta content='telephone=no' name='format-detection'>
<!-- 외부 라이브러리  -->
<link rel="stylesheet" media="all"
	href="https://forcamper.co.kr/assets/application-28cb6ba1f7597c029b42f54e32f7c21d9ebd4352047ba0c90428928c5d4d8d64.css"
	data-turbolinks-track="reload" />
<!-- 제이쿼리  -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
* {
	font-size: 15px;
	font-family: 'Open Sans', sans-serif;
}

.navbar {
	background-color: #fff0df;
}

.navbar ul li a {
	font-size: 15px;
	font-family: 'Open Sans', sans-serif;
}

.navbar ul li a:hover {
	font-weight: 700;
	color: black;
}

.navbar-brand img {
	width: 190px;
	height: 37px;
}

body {
	min-height: 100vh;
	background: #fff;
}

.container {
	width: 100%;
	max-width: 100%;
}

.container-1 {
	border-radius: 10px;
	text-align: center;
	border: 1px solid black;
	margin: 15%;
	background-color: #fff;
	height: 400px;
	box-shadow: 1px 2px 5px grey;
}

.container-2 {
	margin: 10%;
}

.container-2>div:nth-child(3) {
	padding: 10px;
}

p {
	font-size: 20px;
}

.container-2 div:nth-child(3) {
	font-size: 20px;
	color: black;
}

#certifyEmail {
	border: none;
	background: #475f3e;
	cursor: pointer;
	border-radius: 10px;
	border-color: white;
	color: #fff;
	outline: none;
	padding: 5px;
}

.container-2 div:nth-child(4) {
	font-size: 20px;
	color: black;
}

#certifyNumber {
	border: none;
	background: #475f3e;
	cursor: pointer;
	border-radius: 10px;
	border-color: white;
	color: #fff;
	outline: none;
	padding: 5px;
}
</style>
</head>
<body>
	<!-- 나중에 지울 것 -->
	<%-- 식별자값 :${AuthenticationKey}
이메일값 : ${email2} --%>

	<c:choose>
		<c:when test="${AuthenticationKey!=null}">
			<!----- 로그인 후  header ----->
			<nav class='navbar'>
				<div class='container clearfix text-center'>
					<a class='navbar-brand pull-left' href='/'><img
						src="/resources/img/mainlogo.png" /></a>
					<!-- <button id=update >DB 업데이트!</button> -->

					<ul class='navbar-menu list-inline'>


						<li><a href='/campList.camp'>캠핑장 예약</a></li>
						<li><a href='/noticeList.notice?cpage=1'>공지사항</a></li>
						<li><a href='/boardlist.board?cpage=1'>커뮤니티</a></li>
						<li><a href='/qnaList.qna?cpage=1'>1:1문의</a></li>
					</ul>
					<ul class='navbar-user list-inline'>
						<li><a href="/logout.mem">로그아웃</a></li>
						<li><a href="/myPage.mypage">마이페이지</a></li>
					</ul>
					<a class='navbar-mobile' href='#' id='spot'> <span
						class='menu-item'></span> <span class='menu-item'></span> <span
						class='menu-item'></span>
					</a>

				</div>
			</nav>


			<div class="container">
				<div class="tableContainer">
					<div class="container-1">
						<div class="container-2">
							<div>
								<h1>아이디 찾기</h1>
							</div>

							<div>
								<p>이메일 전송 완료. 인증번호를 입력해 주세요.</p>
							</div>
							<div>
								이메일주소 : <input type="email" value="${email2}"> <input
									type="button" disabled='disabled' value="인증완료"
									id="certifyEmaill" disabled>
							</div>
							<div>
								인증번호 : <input type="text" id="number">
								<!--  인증번호 값 받아오는 input -->
								<input type="hidden" value="${AuthenticationKey}" id="Auth">
								<input type="button" value="인증하기" id="certifyNumber">
							</div>
						</div>
					</div>
				</div>
			</div>

			<script>
				// 인증하기 버튼 눌렀을 때
				$("#certifyNumber").on("click",function(){
					
					let key = $("#Auth").val(); // 암호화된 키값 받아오기
					if(key == $("#number").val()){ // 암호화된 키값과 입력한 값이 같을 때,
						location.href="/resultId.mem";
						<%session.removeAttribute("AuthenticationKey");%> // 암호화된 키값 삭제
						<%-- <% session.removeAttribute("email2");%> --%>
					}else{
						alert("인증번호를 다시 확인해주세요.");
						
					}
				});
				
	</script>
		</c:when>
		<c:otherwise>
			<!----- header ----->
			<nav class='navbar'>
				<div class='container clearfix text-center'>
					<a class='navbar-brand pull-left' href='/'><img
						src="/resources/img/mainlogo.png" /></a>
					<ul class='navbar-menu list-inline'>

						<li><a href='/campList.camp'>캠핑장 예약</a></li>
						<li><a href='/noticeList.notice?cpage=1'>공지사항</a></li>
						<li><a href='/boardlist.board?cpage=1'>커뮤니티</a></li>
						<li><a href='/qnaList.qna?cpage=1'>1:1문의</a></li>
					</ul>
					<ul class='navbar-user list-inline'>
						<li><a href="/login.mem">로그인</a></li>
						<li><a href="/signUp.mem">회원가입</a></li>
					</ul>
					<a class='navbar-mobile' href='#' id='spot'> <span
						class='menu-item'></span> <span class='menu-item'></span> <span
						class='menu-item'></span>
					</a>
					
				</div>
			</nav>
			<div class="container">
				<form action="/isEmailExist.mem" method="post" id="existEmailForm">
					<div class="container-1">
						<div class="container-2">
							<div>
								<h1>아이디 찾기</h1>
							</div>

							<div>
								<p>가입시 입력했던 이메일주소를 입력하세요.</p>
							</div>
							<div>
								이메일주소 : <input type="email" id="email"> <input
									type="button" value="이메일확인" id="certifyEmail">
							</div>
							<div>
								인증번호 : <input type="text" id="number">
								<!--  인증번호 값 받아오는 input -->
								<input type="hidden" value="${AuthenticationKey}" id="Auth">
								<input type="button" value="인증하기" id="certifyNumber">
							</div>
						</div>
					</div>
				</form>
			</div>
			<script>
	 	$("#certifyEmail").on("click",function(){
	 		$.ajax({
	 			url : "/isEmailExist.mem",
	 			data : {email:$("#email").val()}
	 		}).done(function(resp){
	 			if(resp =="true"){
	 				$("#existEmailForm").submit();
	 				alert("메일이 발송되었습니다.");
	 				location.href="/findId.mem";
	 				
	 			}else{
	 				alert("해당 이메일이 존재하지 않습니다.");
	 				location.href="/findId.mem";
	 			}
	 			
	 		})
	 	})
	 
	 </script>
		</c:otherwise>
	</c:choose>
	<script>


//    let replySpan = $('#replySpan');
//    $(window).on('load', () => {
//       $.ajax({
//          url : "/loadReplyCount.board"
//       })
//       .done(function(resp){
//          let result = JSON.parse(resp);
//          replySpan.text(result);
//       })
//    })
   
   
   $('#noMemWriteBtn').on('click', () => {
      alert("로그인이 필요한 페이지입니다.");
      location.href="/login.mem";
   })
   </script>


	<script>
      // ajax 로그인 성공/실패 검사

      $("#login").on("click", function() {

         if ($("#id").val() == "") {
            alert("아이디를 입력하세요.");
            return false;
         } else if ($("#pw").val() == "") {
            alert("비밀번호를 입력하세요.");
            return false;
         }

         $.ajax({
            url : "/loginProc.mem",
            data : {
               id : $("#id").val(),
               pw : $("#pw").val()
            }
         }).done(function(resp) {

            if (resp == "true") {
               $("#loginForm").submit();
               location.href = "/index.jsp";
            } else {

               alert("로그인에 실패했습니다.");
               location.href = "/login.mem";

            }

         })
      });
   </script>