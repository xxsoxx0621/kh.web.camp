<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>로그인 페이지</title>
<meta charset="utf-8">
<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport'>
<meta content='IE=edge' http-equiv='X-UA-Compatible'>
<meta content='telephone=no' name='format-detection'>
<!-- 외부 라이브러리  -->
<link rel="stylesheet" media="all"
   href="https://forcamper.co.kr/assets/application-28cb6ba1f7597c029b42f54e32f7c21d9ebd4352047ba0c90428928c5d4d8d64.css"
   data-turbolinks-track="reload" />
   
   <link href= /resources/css/index.css rel = stylesheet>
<!-- 제이쿼리  -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<style>
	body {min-height: 100vh;background: #fff;}
	#main{height: 1024px;padding-top: 20%;}
	.resultPw{ margin:auto; width:500px; height:300px;border:1px solid black; border-radius: 10px; box-shadow: 1px 2px 5px grey;}
	.resultPw table {text-align:center;width:100%;height:300px;}
	.resultPw table tr:nth-child(2){height:50px;font-size:20px;}
	.resultPw table tr:nth-child(2) td {height:50px;font-weight:500}
	.resultPw table tr:nth-child(3){height:50px;font-size:20px;}
	.resultPw table tr:nth-child(3) td {height:50px;font-weight:500}
	.resultPw table th{text-align:center;font-size:20px;} 
	.resultPw table tr td input[type=button]{text-align:center;font-size:20px;border-radius: 10px; box-shadow: 1px 2px 5px grey;
	 background-color: #475f32;color:#fff;width:40%;height:40px;} 
</style>
</head>
<body>
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
	<c:choose>
		<c:when test="${id != null}">
		<div id="main"> 
		<form action="/resetPwProc.mem" method="post" id="resetForm">
		<div class="resultPw">
			<table border=1>
			<tr>
				<th colspan="2"> 비밀번호 재설정
			</tr>
			<tr>
				<td> 새 비밀번호 입력 
				<td><input type="password" name="newPw" id="newPw">
			</tr>
			<tr>
				<td> 새 비밀번호 다시 입력 
				<td><input type="password" name="newPwAgain" id="newPwAgain">
			</tr>
			<tr>
				<td colspan="2" align="center"> <input type="button" value="변경하기" id="changeBtn">
			</tr>
			</table>
		</div>
		</form>
		</div>
		<script>
		
			
			$("#changeBtn").on("click",function(){
				let newPw = $("#newPw").val();
				let newPwAgain = $("#newPwAgain").val();
				// 비밀번호 정규식 검사
				let reg = /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{6,20}$/;
				let pw = document.getElementById("newPw");

				if(!reg.test(pw.value)){
			   			alert("숫자와 영문자 1개의 특수문자를 포함한 6-20자리를 사용해야 합니다.");
			   			$("#pw").val('');
			   			$("#pwCheck").val('');
			   			$("#pw").focus();
			   			return false;
				}else if(newPw != newPwAgain){
					alert("비밀번호가 다릅니다.");
					return false;
				}else{
					$("#resetForm").submit();
				}
			});
			
		
		</script>
		</c:when>
		<c:otherwise>
		<div id="main"> 
			<p>접근할 수 없는 페이지 입니다.</p>
		</div>
		</c:otherwise>
	</c:choose>
<!-- footer 시작 구간 -->
            
            <footer class='footer'>
                <div class='footer-menu'>
                    <div class='container cleafix'>
                        <ul class='list-inline pull-left'>
                            <li>
                                <a href='#'>회사소개</a>
                            </li>
                            <li>
                                <a href='#' >인재채용</a>
                            </li>
                            <li>
                                <a href='#'>FAQ</a>
                            </li>
                            <li>
                                <a href='#'>문의하기</a>
                            </li>
                            <li>
                                <a href='#'>이용약관</a>
                            </li>
                            <li>
                                <a href='#'>개인정보처리방침</a>
                            </li>
                            <li>
                                <a href='#'>환불정책</a>
                            </li>
                        </ul>
                        <div class='footer-sns pull-right'>
                            <a  href='#'><img
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
                                <img class="web"
                                    src="/img/logo_transparent.png" />
                                <img class="mobile"
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