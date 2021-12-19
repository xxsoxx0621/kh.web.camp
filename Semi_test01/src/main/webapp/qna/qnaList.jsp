<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>1:1 문의 게시판</title>

<meta charset="utf-8">
<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'
	name='viewport'>
<meta content='IE=edge' http-equiv='X-UA-Compatible'>
<meta content='telephone=no' name='format-detection'>
<!-- 제이쿼리 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!--  외부 라이브러리  -->

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
	integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm"
	crossorigin="anonymous">


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

a {
	text-decoration: none;
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

#content {
	display: flex;
	height: 10%;
	line-height: 50px;
}

#contents {
	height: 70%;
	overflow-y: auto;
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
}

.view {
	width: 10%;
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



	<!-- 메인-->
	<div class="main">
		<div id="container">
			<div id="top">1:1 문의</div>
			<div id="info">
				<div class="num"></div>
				<div class="title">제목</div>
				<div class="writer">작성자</div>
				<div class="date">날짜</div>
				<div class="view">조회수</div>
			</div>
			<div id="contents">

				<c:forEach var="list" items="${list }">
					<div id="content">
						<div class="num">${list.qna_no }</div>
						<div class="title">



							<c:if test="${list.qna_id == userID || admin != null }">
								<a href="/qnaDetail.qna?seq=${list.qna_no }" id="identifyID">${list.qna_title }
									<i class="fas fa-lock"></i>
								</a>
							</c:if>

							<c:if test="${admin == null && list.qna_id != userID }">
								<a class="nonID" href="">${list.qna_title } <i
									class="fas fa-lock"></i>
								</a>
							</c:if>

						</div>
						<div class="writer">${list.qna_id }</div>
						<div class="date">${list.qna_date }</div>
						<div class="view">${list.qna_view_count }</div>
					</div>
				</c:forEach>

			</div>
			<div id="bottom">
				<span>${navi }</span>
				<c:choose>
					<c:when test="${loginID != null }">
						<form action="/qnaWrite.qna">
							<!-- form 형태로 전송 ID를 싣고 가는 것과 고민중 -->
							<button type="submit" class="write">작성하기</button>
						</form>
					</c:when>

					<c:otherwise>
						<button type="button" id="noMemWriteBtn" class="write">작성하기</button>
					</c:otherwise>
				</c:choose>
			</div>
		</div>

	</div>
	<footer class='footer'>
		<div class='footer-menu'>
			<div class='container cleafix'>
				<ul class='list-inline pull-left'>
					<li><a href='#'>회사소개</a></li>
					<li><a href='/boards?active=cate-2'>인재채용</a></li>
					<li><a href='/faqs'>FAQ</a></li>
					<li><a href='/contacts/new'>문의하기</a></li>
					<li><a href='/term'>이용약관</a></li>
					<li><a href='/privacy'>개인정보처리방침</a></li>
					<li><a href='/refund_rule'>환불정책</a></li>
				</ul>
				<div class='footer-sns pull-right'>
					<a target="_blank" href="https://www.facebook.com/forcamper"><img
						src="https://forcamper.co.kr/assets/icon-fb-b184da37942f87decdb2466d04afaf7dabc8d046c3fcd4d8d6af210cd0c1aa93.png" />
					</a><a target="_blank" href="https://instagram.com/forcamper"><img
						src="https://forcamper.co.kr/assets/icon-insta-f26412eaf93830d50a018ad63b1dae7cabcf0f94c70854b2375683df20c0c1fe.png" />
					</a><a target="_blank" href="#"><img
						src="https://forcamper.co.kr/assets/icon-tw-82ad933c3ed4d722c43aa65e9c29bb80a0313f089d6a4bdfcf151ef78a045f87.png" />
					</a>
				</div>
			</div>
		</div>
		<div class='footer-copy'>
			<div class='container'>
				<div class='row'>
					<div class='col-xs-2'>
						<img class="web"
							src="https://forcamper.co.kr/assets/footer-logo-3eb1f9f31148401dacf098709fd94bc18955387a9a618069162cdd24ce57f793.png" />
						<img class="mobile"
							src="https://forcamper.co.kr/assets/m-footer-logo-f35940935b51fe7a4cb2f2f1a4584a3e74868fe1f1fd05492f82fc9f864fb50a.png" />
					</div>
					<div class='col-xs-10'>
						<p>설립일 : 2016 년 11월 22일, 대표자 : 우청 이메일 : 4camp@forcamper.com</p>
						<p>상호 : 포캠퍼, 사업자 등록번호 : 511-11-16459, 전화번호 : 1522-1864</p>
						<p>주소 : 서울시 강남구 도곡로 112 서한빌딩 2층</p>
						<p>Copyright 2016 포캠퍼 Co. Ltd. All rights reserved.</p>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<script>
	
	$('#noMemWriteBtn').on('click', () => {
		alert("로그인이 필요한 페이지입니다.");
		location.href="/login.mem";
	})
	
	$('.nonID').on('click', () => {
		alert("1:1 문의 게시판은 관리자만 조회가능합니다.");
	})
	
	</script>
</html>