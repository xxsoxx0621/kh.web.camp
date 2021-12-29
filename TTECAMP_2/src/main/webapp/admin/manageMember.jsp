<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의 관리</title>
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
	height: 500px;
	text-align: center;
}

#table {
	text-align: center;
	margin: auto;
	width: 80%;
}

#table input {
	border: 0px;
	background-color: white;
	text-align: center;
}
</style>
</head>

<body>

<c:choose>
				<c:when test="${loginID != null}">
					<!----- 로그인 후  header ----->
					<nav class='navbar'>
						<div class='container clearfix text-center'>
							<a class='navbar-brand pull-left' href='/'><img src="/resources/img/mainlogo.png" /></a>
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
							<a class='navbar-mobile' href='#' id='spot'> <span class='menu-item'></span> <span
									class='menu-item'></span> <span class='menu-item'></span>
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
							<a class='navbar-mobile' href='#' id='spot'> <span class='menu-item'></span> <span
									class='menu-item'></span> <span class='menu-item'></span>
							</a>
							
						</div>
					</nav>
				</c:otherwise>
			</c:choose>
			
			<!------ Body  ------>

	<div class="container1">
		<h1>회원관리</h1>
		<table border=1 id="table">
			<tr id="tr">
				<th><input type="checkbox" id="selectAll">
				<th>아이디
				<th>이름
				<th>이메일
				<th>전화번호
				<th>우편번호
				<th>주소
				<th>상세주소
				<th>가입일자
			</tr>

			<c:forEach var="dto" items="${list }">
				<tr class="tr">
					<td class="td1"><input type="checkbox" name="checkbox"
						value="${dto.user_id}">
					<td class="td2"><input type="text" value="${dto.user_id}"
						id="id" disabled>
					<td class="td3"><input type="text" value="${dto.name }"
						id="name" disabled>
					<td class="td4"><input type="text" value="${dto.originEmail}"
						disabled>
					<td class="td5"><input type="text" value="${dto.phone}"
						disabled>
					<td class="td6"><input type="text" value="${dto.zip_code}"
						disabled>
					<td class="td7"><input type="text" value="${dto.address1}"
						disabled>
					<td class="td8"><input type="text" value="${dto.address2} "
						disabled>
					<td class="td9"><input type="text" value="${dto.signup_date}"
						disabled>
				</tr>

			</c:forEach>
			<!-- 1. 페이징 구현하기  -->
			<tr>
				<td colspan=9>${navi }
			</tr>
			<tr>
				<td colspan=9><select name="search" id="search">
						<option value="id">아이디
						<option value="name">이름
				</select> <input type="text" value="" id="searchInput"> <input
					type="button" value="검색" id="searchBtn">
			</tr>
			<tr>
				<td colspan=9><input type="button" value="회원탈퇴" id="deleteMem">
					<input type="button" value="회원수정" id="updateMem">
			</tr>
		</table>
	</div>






<script>
				
			   // < !--날짜 변경-- >
				   function getDate() {
					   var date = new Date();
					   return date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate();
				   }
				   // < !--2. 검색 구현하기-- >
					   $("#searchBtn").on("click", function () {
						   let search = $("#search").val();
						   let searchInput = $("#searchInput").val();
						   if (search == 'id') {
							   $.ajax({
								   url: "/searchIdProc.admin",
								   data: {
									   searchInput: $("#searchInput").val()
								   },
								   dataType: "json"

							   }).done(function (resp) {

								   if (resp.length > 0) {
									   $(".tr").empty();
									   for (let i = 0; i < resp.length; i++) {
										   let tr = $("<tr>");
										   let td0 = $("<td>");
										   let input = $("<input type=checkbox>");
										   td0.append(input);
										   let td1 = $("<td>");
										   td1.append(resp[i].user_id);
										   let td2 = $("<td>");
										   td2.append(resp[i].name);
										   let td3 = $("<td>");
										   td3.append(resp[i].originEmail);
										   let td4 = $("<td>");
										   td4.append(resp[i].phone);
										   let td5 = $("<td>");
										   td5.append(resp[i].zip_code);
										   let td6 = $("<td>");
										   td6.append(resp[i].address1);
										   let td7 = $("<td>");
										   td7.append(resp[i].address2);
										   let td8 = $("<td>");
										   td8.append(getDate(resp[i].signup_date));



										   tr.append(td0);
										   tr.append(td1);
										   tr.append(td2);
										   tr.append(td3);
										   tr.append(td4);
										   tr.append(td5);
										   tr.append(td6);
										   tr.append(td7);
										   tr.append(td8);
										   $("#tr").after(tr);
									   }
								   } else {

									   alert("검색결과가 없습니다.");
									   $("#searchInput").val('');
									   $("#searchInput").focus();
								   }



							   });

						   } else if (search == "name") {
							   $.ajax({
								   url: "/searchNameProc.admin",
								   data: { searchInput: $("#searchInput").val() },
								   dataType: "json"
							   }).done(function (resp) {

								   if (resp.length > 0) {
									   $(".tr").empty();

									   for (let i = 0; i < resp.length; i++) {
										   let tr = $("<tr>");
										   let td0 = $("<td>");
										   let input = $("<input type=checkbox>");
										   td0.append(input);
										   let td1 = $("<td>");
										   td1.append(resp[i].user_id);
										   let td2 = $("<td>");
										   td2.append(resp[i].name);
										   let td3 = $("<td>");
										   td3.append(resp[i].originEmail);
										   let td4 = $("<td>");
										   td4.append(resp[i].phone);
										   let td5 = $("<td>");
										   td5.append(resp[i].zip_code);
										   let td6 = $("<td>");
										   td6.append(resp[i].address1);
										   let td7 = $("<td>");
										   td7.append(resp[i].address2);
										   let td8 = $("<td>");
										   td8.append(getDate(resp[i].signup_date));



										   tr.append(td0);
										   tr.append(td1);
										   tr.append(td2);
										   tr.append(td3);
										   tr.append(td4);
										   tr.append(td5);
										   tr.append(td6);
										   tr.append(td7);
										   tr.append(td8);
										   $("#tr").after(tr);
									   }
								   } else {

									   alert("검색결과가 없습니다.");
									   $("#searchInput").val('');
									   $("#searchInput").focus();

								   }
							   })

						   }

					   });
			   // 전체 선택
			   $("#selectAll").on("click", function () {
				   if ($(this).is(":checked")) {
					   $("input:checkbox").prop("checked", true);
				   } else {
					   $("input:checkbox").prop("checked", false);
				   }

			   });

			   // 회원 탈퇴 

			   $("#deleteMem").on("click", function () {
				   if ($("input:checkbox").is(":checked")) {
					   let idArr = [];
					   $('input:checkbox:checked').each(function () {
						   idArr.push($(this).val());
					   });

					   if (confirm("삭제하시겠습니까?")) {
						   $.ajax({
							   url: "/deleteMember.admin",
							   data: { "idArr": idArr },
							   dataType: "json",
							   traditional: true
						   }).done(function (resp) {
							   if (resp == "1") {
								   location.href = "/manageMember.admin?cpage=1";

							   
							} else {
								   alert("삭제에 실패했습니다.");
								   location.href = "/manageMember.admin?cpage=1";
							   }
						   });
					   } else {
						   alert("체크된 회원이 없습니다.");
					   }
					}else {

					}
				   
			   });

					   // 회원 수정

					   $("#updateMem").on("click", function () {
						   if ($('input:checkbox:checked').length > 1) {
							   alert("한 번에 한 회원만 수정 가능합니다.");
							   $("input:checkbox").prop("checked", false);
						   } else {
							   let checkVal = $('input:checkbox:checked').val();

							   //1. 아이디랑 동일한 정보의 회원정보들 뿌려주기
							   $.ajax({
								   url: "/findMember.admin",
								   data: { checkVal },
								   dataType: "json"
							   }).done(function (resp) {
								   console.log(resp);
								   if (resp.length > 0) {
									   location.href = "updateMember.admin";
								   } else {
									   alert("해당하는 아이디의 정보를 찾을 수 없습니다.");
								   }

							   });


						   }


					   });


		   </script>
		   
		   
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
		   
		   
		   </body>

</html>