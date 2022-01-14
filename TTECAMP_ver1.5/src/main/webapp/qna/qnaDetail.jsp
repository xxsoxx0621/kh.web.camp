
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>1:1 문의</title>

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

#fullbody {
	margin: auto;
	border: 1px solid black;
	width: 55%;
	margin-top: 30px;
	margin-bottom: 30px;
	height: 50%;
	border: 1px solid black;
	height: 60%
}

#container {
	margin: auto;
	width: 100%;
	height: 100%;
	border: 4px solid #FFFAF0;
	border-radius: 12px;
	background-color: #fff0df;
}

#content {
	text-align: center;
	margin-top: 10px;
	width: 100%;
	height: 85%;
}
#content > textarea {
padding: 15px;
} 

#top {
	text-align: center;
	height: 50px;
	/*    padding : 10px; */
	border-radius: 10px;
	font-size: 26px;
	border-radius: 10px;
}

#top_line {
	margin: auto;
	background-color: #ddc5aa;
	width: 20%;
	height: 3px;
}

#top, #input_title {
	line-height: 200%;
}

#input_title {
	margin-top: 13px;
	text-align: center;
	width: 100%;
	text-align: center;
}

#title {
	height: 40px;
	width: 97%;
	font-size: 20px;
}

#user_info {
	margin-top: 8px;
	margin-left: 20px;
	display: flex;
	align-items: center;
	width: 25%;
	background-color: white;
	border: 1px solid black;
	border-radius: 5px;
	display: flex;
}

#writer {
	margin: 0px 8px;
	text-align: center;
	font-size: 14px;
}

#content_text {
	border: 1px solid black;
	margin: 5px;
	margin-top: 10px;
	height: 500px;
	width: 98%;
	resize: none;
	overflow-y: auto;
	height: 500px;
	font-size: 20px;
}

#bottoms {
	text-align: right;
	margin-right: 10px;
}

/* 댓글 CSS */
#comment_line {
	margin: auto;
	background-color: #ddc5aa;
	width: 98.5%;
	height: 3px;
}

#bottoms_line {
	margin: auto;
	margin-top: 10px;
	margin-bottom: 5px;
	background-color: #ddc5aa;
	width: 98.5%;
	height: 3px;
}

#chatBox_line {
	margin: auto;
	margin-top: 10px;
	margin-bottom: 5px;
	background-color: #DCDCDC;
	width: 98.5%;
	height: 3px;
}

#comment_addline {
	margin: auto;
	background-color: #ddc5aa;
	width: 98.5%;
	height: 3px;
}

#comment_container {
	margin: auto;
	width: 100%;
	height: 30%;
}

#chatBox, #comment_info {
	margin: auto;
}

#chatBox {
	font-size: 20px;
	display: flex;
	margin-bottom: 5px;
	height: 10%;
	width: 95%;
	display: flex;
}

#comment_info:first_child {
	margin-left: 20px;
}

#comment_id {
	width: 20%;
}

#comment_content {
	width: 70%;
}

#comment_date {
	width: 20%;
}

#comment_content_btns {
	width: 10%;
}

#comment_content-btns>button {
	width: 100%;
}

#comment {
	display: flex;
	margin: auto;
	height: 10%;
}

#comment_body {
	width: 80%;
}

textarea {
	width: 96%;
	height: 10%;
	border: none;
	resize: none;
}

#comment_add {
	width: 20%;
}

#addComment {
	width: 100%;
	height: 100%;
}

#comment_info {
	margin: 10px 0px;
	display: flex;
	padding-left: 3%;
    font-weight: 500;
    font-size: 20px;
}

#comment_body {
	height: 300px;
}

#chatBoxP {
	width: 100%;
	height: 30%;
}

#addComment {
	height: 100px;
}

#comment_text {
	height: 100px;
}

#comment {
	padding: 10px 30px;
	height: 130px;
}

#modify {
	margin-right: 5px;
	color: white;
	padding: 7px 15px;
	text-decoration: none;
	background-color: #D2B48C;
	border: none;
	border-radius: 10px;
	cursor: pointer;
	box-shadow: 0 4px 4px 0 rgba(0, 0, 0, 0.2), 0 3px 6px 0
		rgba(0, 0, 0, 0.19);
}

#delBtn {
	margin-right: 5px;
	color: white;
	padding: 7px 15px;
	text-decoration: none;
	background-color: #ddc5aa;
	border: none;
	border-radius: 10px;
	cursor: pointer;
	box-shadow: 0 4px 4px 0 rgba(0, 0, 0, 0.2), 0 3px 6px 0
		rgba(0, 0, 0, 0.19);
}

#modOk {
	margin-right: 5px;
	color: white;
	padding: 7px 15px;
	text-decoration: none;
	background-color: #D2B48C;
	border: none;
	border-radius: 10px;
	cursor: pointer;
	box-shadow: 0 4px 4px 0 rgba(0, 0, 0, 0.2), 0 3px 6px 0
		rgba(0, 0, 0, 0.19);
}

#modCancle {
	margin-right: 5px;
	color: white;
	padding: 7px 15px;
	text-decoration: none;
	background-color: #708090;
	border: none;
	border-radius: 10px;
	cursor: pointer;
	box-shadow: 0 4px 4px 0 rgba(0, 0, 0, 0.2), 0 3px 6px 0
		rgba(0, 0, 0, 0.19);
}

#addComment {
	margin-right: 5px;
	background-color: #4CAF50;
	text-decoration: none;
	padding: 10px 20px;
	border: none;
	color: white;
	border-radius: 10px;
	cursor: pointer;
	box-shadow: 0 4px 4px 0 rgba(0, 0, 0, 0.2), 0 3px 6px 0
		rgba(0, 0, 0, 0.19);
	font-size: 30px;
}

.goToListBtn {
	margin-right: 5px;
	color: white;
	padding: 7px 15px;
	text-decoration: none;
	background-color: #ddc5aa;
	border: none;
	border-radius: 10px;
	cursor: pointer;
	box-shadow: 0 4px 4px 0 rgba(0, 0, 0, 0.2), 0 3px 6px 0
		rgba(0, 0, 0, 0.19);
}

.writerBox{
	display:flex;
	width:15%;
	background-color:#fff;
	float: right;
	padding-left: 15px;
	margin-top: 5px;
	border:1px solid black;
	margin-right: 15px;
	font-size: 15px;
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



	<section id="fullbody">
		<div id="container">
			<div id="top">1:1 문의</div>

			<form action="/modifyQna.qna" id="modifyForm" method=post>
				<c:forEach var="detail" items="${qnaDetail }">

					<input type="hidden" value="${detail.qna_no }" name=seq>

					<div id="input_title">
						<input type="text" name="input_title" id="title"
							value="${detail.qna_title }" readonly>
					</div>
					<div class="writerBox">
						<b>작성자 : </b><div id="writer">${detail.qna_id }</div>
					</div>
					<div id="content">
						<textarea name="content" id="content_text" cols="30" rows="10"
							readonly>${detail.qna_contents }</textarea>
					</div>
			</form>

			<div id="comment_container">
				<div id="comment_info">
					<div id="comment_id"></div>
					<div id="comment_content">답변</div>
					<div id="comment_date">작성일</div>
					<div id="comment_content_btns"></div>
				</div>
				<c:forEach var="rep" items="${replyList }">
					<div id="chatBox">
						<div id="comment_id">관리자</div>
						<div id="comment_content">${rep.contents }</div>
						<div id="comment_date">${rep.write_date }</div>
						<div id="comment_content_btns">

							<c:if test="${admin != null }">
								<a id="comment_del_btn"
									href="/deleteRpl.qrc?seq=${rep.board_seq }&replyNo=${rep.reply_no }"><button
										id="comment_delete">X</button></a>
							</c:if>
						</div>
					</div>
				</c:forEach>

				<c:choose>
					<c:when test="${admin != null}">
						<div id="comment">
							<div id="comment_body">

								<form action="/commentAdd.qrc" method=post id="commentAddForm">
									<c:choose>
										<c:when test="${admin != null }">
											<input type=hidden value="${rep.user_id }" name="id">
										</c:when>

										<c:otherwise>

											<input type=hidden value="${loginID } " name="user_id">
										</c:otherwise>
									</c:choose>

									<input type=hidden value="${detail.qna_no }" name="seq">

									<textarea name="comment" id="comment_text"
										placeholder="댓글을 입력해주세요." cols="30" rows="10"></textarea>
								</form>
							</div>
							<div id="comment_add">
								<button id="addComment">등록하기</button>
							</div>
					</c:when>
					<c:otherwise>

					</c:otherwise>
				</c:choose>
			</div>

			<div id="bottoms">

				<c:choose>
					<c:when test="${detail.qna_id == loginID || admin != null}">
						<button id="modify">수정하기</button>
						<button id="delBtn">삭제하기</button>
						<button type=button id="modOk" style="display: none">수정완료</button>
						<button type=button id="modCancle" style="display: none">취소</button>
					</c:when>
					<c:when test="${admin != null}">
						<button id="delBtn">삭제하기</button>
					</c:when>
					<c:otherwise>
					</c:otherwise>
				</c:choose>

				<a href="/qnaList.qna?cpage=1"><button type="button"
						class="goToListBtn">목록으로</button></a>

			</div>

		</div>

	</section>
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

	$('#delBtn').on('click', () => {
			if(confirm("정말로 삭제하시겠습니까 ?")){
				location.href="/deleteQna.qna?seq=${detail.qna_no}";
			}
	 	});
	
	PrevTitle = "";
	PrevContents = "";
	
	$('#modify').on('click', () => {
		if(confirm("게시글을 수정하시겠습니까 ?")){
			PrevTitle = $('#title').val();
			PrevContents = $('#content_text').val();
			
			$('#modify').css("display","none");
			$('#delBtn').css("display","none");
			
			$('#modOk').css("display","inline");
			$('#modCancle').css("display","inline");
			
			$('#title').removeAttr("readonly");
			$('#content_text').removeAttr("readonly");
		}});
			
	
	$('#modCancle').on('click', () => {
		if(confirm("수정을 취소하시겠습니까 ?")){
			$('#title').val(PrevTitle);
			$('#content_text').val(PrevContents); 
			$('#modify').css("display","inline");
			$('#delBtn').css("display","inline");
			
			$('#modOk').css("display","none");
			$('#modCancle').css("display","none");
			
			$('#title').Attr("readonly","");
			$('#content_text').Attr("readonly","");
		}
	});
	
	$('#modOk').on('click', () => {
		if(confirm("수정을 완료하시겠습니까 ?")){
			$('#modifyForm').submit();
		}
	})
	
		$('#addComment').on('click', () => {
		let text = $('#comment_text');
		if(text.val() == ""||text.val() == " "){
			alert("공백은 허용되지않습니다.");
		}else{
		$('#commentAddForm').submit();
		}
	})
	
	</script>

	</c:forEach>
</body>
</html>
