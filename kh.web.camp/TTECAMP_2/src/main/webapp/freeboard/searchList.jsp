<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>검색 결과</title>

<meta charset="utf-8">
<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'
	name='viewport'>
<meta content='IE=edge' http-equiv='X-UA-Compatible'>
<meta content='telephone=no' name='format-detection'>
<!— 제이쿼리 —>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!—  외부 라이브러리  —>

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

#contents {
	height: 70%;
}

#content {
	display: flex;
	height: 10%;
	line-height: 60px;
}

#search_var {
	position: relatevie;
	padding: 0px 250px;
}

#bottom {
	margin-bottom: 15px;
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
	position: relative;
	bottom: 126px;
	right: 48px;
	width: 100px;
	height: 59px;
	border: none;
	paading-bottom: 100px;
	background-color: #4CAF50;
	border-radius: 6px;
	cursor: pointer;
	box-shadow: 0 4px 4px 0 rgba(0, 0, 0, 0.2), 0 3px 6px 0
		rgba(0, 0, 0, 0.19);
	color: white;
	font-size: 17px;
}

#searchBtn {
	width: 100px;
	height: 59px;
	margin-top: 5px;
}

#noResult {
	line-height: 300px;
	height: 300px;
}
</style>
</head>
<body>
	<c:choose>
		<c:when test="${loginID != null}">
			<!—— 로그인 후  header ——>
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
						<li><a href="/myPage.mypage">마이페이지</a></li>
					</ul>
					<a class='navbar-mobile' href='#' id='spot'> <span
						class='menu-item'></span> <span class='menu-item'></span> <span
						class='menu-item'></span>
					</a>
					<div class='mobile-menu'>
						<ul class='mobile-menu__link'>
							<li><a href='/campList.camp'>캠핑장 예약</a></li>
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



			<!—— 로그인 전 header ——>
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
					<div class='mobile-menu'>
						<ul class='mobile-menu__link'>
							<li><a href='/campList.camp'>캠핑장 예약</a></li>
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
		<div id="top">자유게시판</div>
		<div id="info">
			<div class="num"></div>
			<div class="title">제목</div>
			<div class="writer">작성자</div>
			<div class="date">날짜</div>
			<div class="view">조회수</div>
		</div>

		<div id="contents">
			<c:choose>
				<c:when test="${count == 0 }">
					<div id="noResult">검색 결과 X</div>
				</c:when>
				<c:otherwise>
					<c:forEach var="sList" items="${searchList }">
						<div id="content">
							<div class="num">${sList.board_seq }</div>
							<div class="title">
								<a href="/detail.board?seq=${sList.board_seq }">
									${sList.title } </a>

							</div>
							<div class="writer">${sList.user_id }</div>
							<div class="date">${sList.detailDate }</div>
							<div class="view">${sList.view_count }</div>
						</div>
					</c:forEach>
		</div>

		</c:otherwise>
		</c:choose>

		<div id="search_var">

			<div id="bottom">
				<span id="navi">${navi }</span>
			</div>
			<form method="post" name="search" action="/search.board?cpage=1">
				<select class="form-control" name="searchField">
					<option value="0">선택</option>
					<option value="TITLE">제목</option>
					<option value="USER_ID">작성자</option>
				</select> <input type="text" class="form-control" placeholder="검색어 입력"
					name="searchText" maxlength="100" id="inputSearch">
				<button type="submit" class="btn btn-success" id="searchBtn">검색</button>
			</form>
		</div>
		<c:choose>
			<c:when test="${loginID != null || admin != null}">
				<form action="/boardWrite.board">
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
	<script>
	$('#noMemWriteBtn').on('click', () => {
		alert("로그인이 필요한 페이지입니다.");
		location.href="/login.mem";
	})
	
		$('#searchBtn').on('click', () => {
		if($('#inputSearch').val() == ""){
			alert("1자 이상 입력해주세요");
		}
	})
	
	</script>
</body>
</html>