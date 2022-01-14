<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 관리</title>
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
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link href="/resources/css/index.css" rel="stylesheet">

<style>
.container1 {
	width: 100%;
	height: 1024px;
	text-align: center;
	padding-top: 3%;
}

#table {
	text-align: center;
	margin: auto;
	width: 100%;
}

#table th {
	text-align: center;
	height: 50px;
}

#table .tr {
	height: 50px;
}

#table .tr td {
	height: 100%;
}

#table input {
	background-color: white;
	text-align: center;
	width: 150px;
}

#table tr td input[type=checkbox] {
	opacity: initial !important;
	position: relative !important;
	width: 50px;
	height: 20px;
}

#tr th input[type=checkbox] {
	opacity: initial !important;
	position: relative !important;
	width: 50px;
	text-align: center;
	height: 20px;
}
.container1-table{
	 overflow-x: scroll;
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


	<div class="container1">
		<h1>예약관리</h1>
		<div class="container1-table">
			<table border=1 id="table">
				<tr id="tr">
					<th><input type="checkbox" id="selectAll">
					<th>예약번호
					<th>캠핑장
					<th>아이디
					<th>이름
					<th>전화번호
					<th>체크인
					<th>체크아웃
					<th>박
					<th>금액
					<th>결제여부
					<th>예약완료여부
					<th>예약확정
					<th>예약취소
				</tr>

				<c:forEach var="dto" items="${list}">
					<tr class="tr">
						<td class="td1"><input type="checkbox" name="checkbox"
							value="${dto.user_id}">
						<td class="td2"><input type="text"
							value="${dto.reservation_id}" disabled class="reservation_id">
						<td class="td3"><input type="text" value="${dto.facltNm}"
							disabled>
						<td class="td4"><input type="text" value="${dto.user_id}"
							disabled>
						<td class="td5"><input type="text" value="${dto.client_name}"
							disabled>
						<td class="td6"><input type="text" value="${dto.contact}"
							disabled>
						<td class="td7"><input type="text" value="${dto.check_in}"
							disabled>
						<td class="td8"><input type="text" value="${dto.check_out}"
							disabled>
						<td class="td9"><input type="text" value="${dto.days_total} "
							disabled>
						<td class="td10"><input type="text"
							value="${dto.price_total}" disabled>
						<td class="td11"><input type="text" value="${dto.is_paid}"
							disabled>
						<td class="td12"><input type="text" value="${dto.is_booked}"
							disabled>
						<td class="td13"><input type="button" value="예약확정"
							class="confirmRev"
							onclick="confirmRev_click('${dto.reservation_id}');">
						<td class="td14"><input type="button" value="예약취소"
							class="cancelRev"
							onclick="cancelRev_click('${dto.reservation_id}');">
					</tr>
				</c:forEach>
				<!-- 1. 페이징 구현하기  -->
				<tr>
					<td colspan=14>${navi }
				</tr>
				<tr>
					<td colspan=14>
						<form action="/showAllRev.admin" accept-charset="UTF-8"
							method="get">
							<select name="searchBy" id="searchBy">
								<option value="">전체</option>
								<option value="예약번호">예약번호</option>
								<option value="아이디">아이디</option>
								<option value="이름">이름</option>
								<option value="캠핑장">캠핑장</option>
							</select> <input type="text" id="searchInput" name="searchInput">
							<input type="submit" value="검색" id="searchBtn"> <input
								type="button" value="돌아가기" id="confirmRev"
								onclick="javascript:history.back()">
						</form>
				</tr>

			</table>
		</div>
	</div>

	<script>
	  // 전체 선택
	   $("#selectAll").on("click", function () {
		   if ($(this).is(":checked")) {
			   $("input:checkbox").prop("checked", true);
		   } else {
			   $("input:checkbox").prop("checked", false);
		   }

	   });
            function cancelRev_click(reservation_id) {
               console.log(reservation_id);
               if (confirm("정말 취소하시겠습니까?")) {
                  location.href = "/cancelRev.admin?reservation_id=" + reservation_id;
               }
            }

            function confirmRev_click(reservation_id) {
               console.log(reservation_id);
               if (confirm("정말 확정하시겠습니까?")) {
                  location.href = "/confirmRev.admin?reservation_id=" + reservation_id;
               }
            }
         </script>
	<!-- <script>
            $("#searchBtn").on("click", function () {
               var searchBy = $("#searchBy").val();
               var searchInput = $("#searchInput").val();
               location.href = "/showAllRev.admin?searchBy=" + searchBy + "&searchInput" + searchInput;
            })
         </script> -->

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



</body>

</html>