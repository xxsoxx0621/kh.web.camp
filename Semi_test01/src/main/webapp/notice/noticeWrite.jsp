<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>자유게시판</title>

<meta charset="utf-8">
<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'
	name='viewport'>
<meta content='IE=edge' http-equiv='X-UA-Compatible'>
<meta content='telephone=no' name='format-detection'>
<!-- 제이쿼리 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!--  외부 라이브러리  -->

<link rel="stylesheet" media="all"
	href="https://forcamper.co.kr/assets/application-28cb6ba1f7597c029b42f54e32f7c21d9ebd4352047ba0c90428928c5d4d8d64.css"
	data-turbolinks-track="reload" />

<script
	src="https://forcamper.co.kr/assets/application-29406dc9afbae6ee15078615178a129129a90f8fae05bcb57acb43d36967fc9c.js"
	data-turbolinks-track="reload"></script>

<script
	src='https://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.js'></script>
<link
	href='https://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.css'
	rel='stylesheet'>
<script src='https://cdn.pannellum.org/2.4/pannellum.js'></script>
<link href='https://cdn.pannellum.org/2.4/pannellum.css'
	rel='stylesheet'>
<script src='https://cdn.jsdelivr.net/momentjs/latest/moment.min.js'></script>

<script
	src='https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js'></script>
<link
	href='https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css'
	rel='stylesheet'>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans&display=swap"
	rel="stylesheet">
<style>
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

body, html {
	font-family: "NanumBarunGothic", AppleSDGothic, "맑은 고딕", Dotum,
		sans-serif !important;
	font-weight: 300;
	line-height: 23px;
}

.main {
	height: 1000px;
	margin-top: 5%;
	overflow: scroll;
}
div {
	box-sizing: border-box;
	border: 1px solid black;
}

#container {
	margin: auto;
	width: 900px;
	height: 650px;
	text-align: center;
}

#content {
	width: 100%;
	height: 85%;
}

#top, #input_title {
	line-height: 200%;
}

#input_title {
	height: 20%;
	width: 100%
}

#title {
	width: 97%;
}

textarea {
	margin: 5px;
	height: 500px;
	width: 98%;
	border: 1px solid violet;
}
</style>
</head>
<body>


	<c:choose>
		<c:when test="${loginID != null}">
			<!----- 로그인 후  header ----->
			<nav class='navbar'>
				<div class='container clearfix text-center'>
					<a class='navbar-brand pull-left' href='/'><img
						src="/img/logo_transparent.png" /></a>
					<ul class='navbar-menu list-inline'>
						<li><a href='/campgrounds/map'>캠핑장 위치</a></li>
						<li><a href='/campgrounds'>캠핑장 예약</a></li>
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
					<div class='mobile-menu'>
						<ul class='mobile-menu__link'>
							<li><a href='/campgrounds/map'>캠핑장 위치</a></li>
							<li><a href='/campgrounds'>캠핑장 예약</a></li>
							<li><a href='/noticeList.notice?cpage=1'>공지사항</a></li>
							<li><a href='/boardlist.board?cpage=1'>커뮤니티</a></li>
							<li><a href='/qnaList.qna?cpage=1'>1:1문의</a></li>
							<li class='menu-user'><a href="/logout.mem">로그아웃</a> | <a
								href="/myPage.mypage">마이페이지</a></li>
						</ul>
					</div>
				</div>
			</nav>
		</c:when>
		<c:otherwise>

			<!----- 로그인 전 header ----->
			<nav class='navbar'>
				<div class='container clearfix text-center'>
					<a class='navbar-brand pull-left' href='/'><img
						src="/img/linkedin_banner_image_1.png" /></a>
					<ul class='navbar-menu list-inline'>
						<li><a href='/campgrounds/map'>캠핑장 위치</a></li>
						<li><a href='/campgrounds'>캠핑장 예약</a></li>
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
					<div class='mobile-menu'>
						<ul class='mobile-menu__link'>
							<li><a href='/campgrounds/map'>캠핑장 위치</a></li>
							<li><a href='/campgrounds'>캠핑장 예약</a></li>
							<li><a href='/noticeList.notice?cpage=1'>공지사항</a></li>
							<li><a href='/boardlist.board?cpage=1'>커뮤니티</a></li>
							<li><a href='/qnaList.qna?cpage=1'>1:1문의</a></li>
							<li class='menu-user'><a href="/login.mem">로그인</a> | <a
								href="/signUp.mem">회원가입</a></li>
						</ul>
					</div>
				</div>
			</nav>
		</c:otherwise>
	</c:choose>


	<div id="container">
		<div id="top">공지사항 작성하기</div>

		<form action="/completeNoticeWriting.notice">
			<div id="input_title">
				<input type="text" name="notice_title" id="title"
					value="글 제목을 입력하세요.">
			</div>
			<div id="content">
				<textarea name="content" id="content_text" cols="30" rows="10">글 내용을 입력하세요.</textarea>
			</div>
			<div id="bottoms">
				<input type="submit" value="작성하기">
		</form>
		<a href="javascript:history.back()"><button type="button">목록으로</button></a>
	</div>
	</div>

	<script>

	let title = document.querySelector('#title');
	title.addEventListener('click', () => {
   	title.value=" ";
	})
	
   let content = document.querySelector('#content');
   let textarea = document.querySelector('#content_text');
   content.addEventListener('click', () =>{
	textarea.innerHTML=" ";
   })

</script>
</body>

</html>