<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>공지사항 게시판</title>

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

#container div {
	box-sizing: border-box;
}

#container {
	margin: auto;
	width: 900px;
	height: 650px;
	text-align: center;
}

#top, #info, #page, #bottom {
	height: 7.5%;
	line-height: 300%;
}

#top {
	font-size: 30px;
	font-weight: 500;
	height: 15%;
}

#info {
	display: flex;
	background: antiquewhite;
	border-bottom: 1px solid gray;
	font-size: 15px;
	font-weight: 600;
}

#contents {
	height: 70%;
	overflow-y: auto;
}

#content {
	display: flex;
	height: 10%;
	line-height: 50px;
}

.write {
	margin-left: 90%;
}

.num {
	width: 5%;
}

.title {
	width: 55%;
}

.writer {
	width: 15%;
}

.date {
	width: 15%;
	color: black;
}

.view {
	width: 10%;
	color: black;
}

.write {
	width: 100px;
	height: 59px;
	border: none;
	background-color: #4CAF50;
	border-radius: 6px;
	cursor: pointer;
	box-shadow: 0 4px 4px 0 rgba(0, 0, 0, 0.2), 0 3px 6px 0
		rgba(0, 0, 0, 0.19);
	color: white;
	font-size: 17px;
}
</style>
<link href="/resources/css/index.css" rel="stylesheet">

</head>

<body>
	<c:choose>
		<c:when test="${loginID != null}">
			<!----- 로그인 후  header ----->
			<nav class='navbar'>
				<div class='container clearfix text-center'>
		<a class='navbar-brand pull-left' href='/'><img src="/resources/img/mainlogo.png" /></a>
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
	<a class='navbar-brand pull-left' href='/'><img src="/resources/img/mainlogo.png" /></a>
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
		<a class='navbar-brand pull-left' href='/'><img src="/resources/img/mainlogo.png" /></a>
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


	<div class="main">
		<div id="container">
			<div id="top">공지사항</div>
			<div id="info">
				<div class="num">번호</div>
				<div class="title">제목</div>
				<div class="writer">작성자</div>
				<div class="date">날짜</div>
				<div class="view">조회수</div>
			</div>
			<div id="contents">

				<c:forEach var="list" items="${list }">
					<div id="content">
						<div class="num">${list.notice_no_seq }</div>
						<div class="title">
							<a href="/noticeDetail.notice?seq=${list.notice_no_seq }">${list.title }
							</a>
						</div>
						<div class="writer">관리자</div>
						<div class="date">${list.date }</div>
						<div class="view">${list.view_count }</div>
					</div>
				</c:forEach>
			</div>
			<div id="bottom">
				<span id="navi">${navi }</span>
			</div>

			<c:if test="${admin != null}">
				<button id="noticeWrite" class="write">작성하기</button>
			</c:if>


		</div>
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
				$('#noticeWrite').on('click', () => {
					location.href="/writeNotice.notice";
				})
			</script>
</body>

</html>