<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'
	name='viewport'>
<meta content='IE=edge' http-equiv='X-UA-Compatible'>
<meta content='telephone=no' name='format-detection'>
<!-- 외부 라이브러리  -->
<link rel="stylesheet" media="all"
	href="https://forcamper.co.kr/assets/application-28cb6ba1f7597c029b42f54e32f7c21d9ebd4352047ba0c90428928c5d4d8d64.css"
	data-turbolinks-track="reload" />

<link href=/resources/css/index.css rel=stylesheet>
<!-- 제이쿼리  -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


<style>
/* * { 기존 로그인 스타일코드  
   font-size: 15px;
   font-family: 'Open Sans', sans-serif;
}

.navbar {
   
   background: #755139;
   padding:0px;
}

.navbar ul {
   
   background: #755139;
   padding-top:70px;
}


.navbar ul li a {
   font-size: 15px;
   font-family: 'Open Sans', sans-serif;
   color: white;
   
}

.navbar ul li a:hover {
   font-weight: 700;
   color: white;
}

/* .navbar-brand img {
   width: 190px;
   height: 37px;
}
 */
body {
	min-height: 100vh;
	background: #fff;
}

#main {
	height: 800px;
}

.Login_Form {
	border: 1px solid black;
	width: 400px;
	padding: 80px 40px;
	border-radius: 10px;
	position: relative;
	margin: auto;
	margin-top: 8%;
	box-shadow: 1px 2px 5px grey;
}

.Login_Form h1 {
	text-align: center;
	margin-bottom: 60px;
}

.txtb {
	border-bottom: 2px solid #fff;
	position: relative;
	margin: 30px 0;
	border-bottom: 1px solid black;
}

.txtb input {
	font-size: 15px;
	color: #333;
	width: 100%;
	border: none;
	padding: 0 5px;
	height: 40px;
	outline: none;
}

.chkbox {
	position: relative;
	margin: 30px 0;
}

input[type=checkbox] {
	opacity: inherit !important;
	width: 30px;
	height: 15px;
	position: relative;
	cursor: pointer;
}

.loginbt {
	display: block;
	width: 100%;
	height: 50px;
	border: none;
	cursor: pointer;
	border-radius: 10px;
	background-size: 200%;
	border-color: white;
	color: #fff;
	outline: none;
	transition: .5s;
	background-color: #475f32;
}

.loginbt:hover {
	background-position: right;
}

.bottom-text {
	margin-top: 30px;
	text-align: center;
}

.bottom-text a {
	color: #000000;
}
*
/
</style>
</head>
<body>
	<!-- 쿠키값으로 id정보 받아오기 -->
	<%
		String cookie = "";
		Cookie[] cookies = request.getCookies(); //쿠키생성
		if(cookies !=null&& cookies.length > 0)
		for (int i = 0; i < cookies.length; i++){
			if (cookies[i].getName().equals("id")) { // 내가 원하는 쿠키명 찾아서 값 저장
				cookie = cookies[i].getValue();}}
	%>
	<c:choose>
		<c:when test="${loginID != null}">
			<!----- 로그인 후  header ----->
			<nav class='navbar'>
				<div class='container clearfix text-center'>
					<a class='navbar-brand pull-left' href='/'><img
						src="/resources/img/mainlogo.png" /></a>
					<!-- <button id=update >DB 업데이트!</button> -->
					<script>
                    $("#update").on("click", function(){
                       location.href = "/update.camp";
                       
                    })
                    </script>
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
		</c:when>
		<c:when test="${admin != null}">
			<!----- 로그인 후  header ----->
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
						<li><a href="/logout.mem">로그아웃</a></li>
						<li><a href="/adminPage.admin">관리페이지</a></li>
					</ul>
					<a class='navbar-mobile' href='#' id='spot'> <span
						class='menu-item'></span> <span class='menu-item'></span> <span
						class='menu-item'></span>
					</a>

				</div>
			</nav>
		</c:when>
		<c:otherwise>

			<!----- 로그인 전 header ----->
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
		</c:otherwise>
	</c:choose>

	<!------ Body  ------>
	<div id="main">
		<form action="/loginProc.mem" method="post" id="loginForm">
			<div class="Login_Form">
				<h1>LOGIN</h1>
				<div class='txtb'>
					<input type="text" name="id" id="id" placeholder='아이디를 입력해주세요.'
						value="<%=cookie%>"> <span
						data-placeholder='Username'></span>
				</div>
				<div class="txtb">
					<input type="password" name="pw" id="pw"
						placeholder='비밀번호를 입력해주세요.'> <span
						data-placeholder='Password'></span>
				</div>
				<div class="chkbox" id="saveLogin">
					<span><input type="checkbox" name="checkbox" id="chkbox1"></span><span>
						아이디 기억하기</span>
				</div>
				<input type='submit' class='loginbt btn' value='Login' id="login">
				<div class="bottom-text">
					<a href="/signUp.mem">회원가입</a> <span>|</span> <a href="/findId.mem">아이디찾기</a>
					<span>|</span> <a href="/findPw.mem">비밀번호 찾기</a>
				</div>

			</div>
		</form>
	</div>
	<!-- footer 시작 구간 -->

	<footer class='footer'>
		<div class='footer-menu'>
			<div class='container cleafix'>
				<ul class='list-inline pull-left'>
					<li><a href='#'>회사소개</a></li>
					<li><a href='#'>인재채용</a></li>
					<li><a href='#'>FAQ</a></li>
					<li><a href='#'>문의하기</a></li>
					<li><a href='#'>이용약관</a></li>
					<li><a href='#'>개인정보처리방침</a></li>
					<li><a href='#'>환불정책</a></li>
				</ul>
				<div class='footer-sns pull-right'>
					<a href='#'><img
						src="https://forcamper.co.kr/assets/icon-fb-b184da37942f87decdb2466d04afaf7dabc8d046c3fcd4d8d6af210cd0c1aa93.png" />
					</a><a href='#'><img
						src="https://forcamper.co.kr/assets/icon-insta-f26412eaf93830d50a018ad63b1dae7cabcf0f94c70854b2375683df20c0c1fe.png" />
					</a><a href='#'><img
						src="https://forcamper.co.kr/assets/icon-tw-82ad933c3ed4d722c43aa65e9c29bb80a0313f089d6a4bdfcf151ef78a045f87.png" />
					</a>
				</div>
			</div>
		</div>
		<div class='footer-copy'>
			<div class='container'>
				<div class='row'>
					<div class='col-xs-2'>
						<img class="web" src="/img/logo_transparent.png" /> <img
							class="mobile"
							src="https://forcamper.co.kr/assets/m-footer-logo-f35940935b51fe7a4cb2f2f1a4584a3e74868fe1f1fd05492f82fc9f864fb50a.png" />
					</div>
					<div class='col-xs-10'>
						<p>설립일 : 2021 년 12월 22일, 대표자 : 뗴코 이메일 : TteCamp@iei.or.kr</p>
						<p>상호 : 떼캠, 전화번호 : 1588-1588</p>
						<p>주소 : 서울특별시 중구 남대문로 120</p>
						<p>Copyright 2021 떼캠 Co. Ltd. All rights reserved.</p>
					</div>
				</div>
			</div>
		</div>
	</footer>
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
        
         /* $.ajax({
            url : "/loginProc.mem",
            dataType: "json"
         }).done(function(resp) {
        	
            if (resp == "true") {
            	 $("#loginForm").submit(); 
                location.href = "/index.jsp";
            } else {
               alert("아이디 또는 비밀번호가 잘못되었습니다.");
               location.href = "/login.mem";

            }

         }) */
      });
   </script>
</body>

</html>