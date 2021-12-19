
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	height: 1000px;
	text-align: center;
}

#content {
	width: 100%;
	height: 80%;
}

#top, #input_title, #writer {
	line-height: 200%;
}

#writer {
	height: 5%;
}

#input_title {
	width: 100%
}

#title {
	width: 97%;
}

#bottms {
	height: 10%;
}

textarea {
	margin: 5px;
	height: 50%;
	width: 98%;
	border: 1px solid violet;
}

/* 댓글 CSS */
#comment_container {
	overflow-y: auto;
	margin: auto;
	width: 100%;
	height: 30%;
}

#chatBox {
	display: flex;
	margin: auto;
	margin-bottom: 5px;
	height: 10%;
	width: 95%;
}

#comment_info {
	width: 95%;
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
	margin-top: 50px;
	height: 30%;
	width: 95%;
	border: 2px solid blue;
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
		<div id="top">1:1 문의</div>

		<form action="/modifyQna.qna" id="modifyForm" method=post>
			<c:forEach var="detail" items="${qnaDetail }">

				<input type="hidden" value="${detail.qna_no }" name=seq>

				<div id="input_title">
					<input type="text" name="input_title" id="title"
						value="${detail.qna_title }" readonly>
				</div>
				<div id="writer">${detail.qna_id }</div>
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

			<a href="/qnaList.qna?cpage=1"><button type="button">목록으로</button></a>

		</div>

	</div>

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
