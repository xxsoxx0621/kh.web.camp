<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기 페이지</title>
<meta
   content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'
   name='viewport'>
<meta content='IE=edge' http-equiv='X-UA-Compatible'>
<meta content='telephone=no' name='format-detection'>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" media="all"
   href="https://forcamper.co.kr/assets/application-28cb6ba1f7597c029b42f54e32f7c21d9ebd4352047ba0c90428928c5d4d8d64.css"
   data-turbolinks-track="reload" />
   <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans&display=swap"
	rel="stylesheet">
<style>
   
   * {
    box-sizing: border-box;
	margin: 0;
	padding: 0;
   
   font-family: 'Open Sans', sans-serif;
   font-size: 15px;
}

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

.body {
   
  min-height: 100%;
  background: #fff;

}


.mybox{
    border-radius: 10px;
	text-align: center;
	border: 1px solid black;
	margin: 15%;
	background-color: #fff;
	height: 400px;
    box-shadow: 1px 2px 5px grey;
    
}


.box{
    margin: 15%;
    margin-top: 40px;
    padding: 20px 20px 0;
    
}
.box table {
	width:100%;
}
.box table th {
	text-align:center;
	height:50px;
	font-size:40px;
	padding-bottom: 30px;
}
.box table tr:nth-child(2) {
	height:50px;
}
.box table tr:nth-child(2) td:nth-child(1){
	font-size:20px;
	font-weight:600;
	text-align:left;
}
.box table tr:nth-child(2) td:nth-child(2) input{
	width:80%;
	text-align:left;
	height:40px;
}
.box table tr:nth-child(3) {
	height:50px;
}
.box table tr:nth-child(3) td:nth-child(1){
	font-size:20px;
	font-weight:600;
	text-align:left;
}
.box table tr:nth-child(3) td:nth-child(2) select{
	width:80%;
	text-align:left;
	height:40px;
}
.box table tr:nth-child(4) {
	height:50px;
}
.box table tr:nth-child(4) td:nth-child(1){
	font-size:20px;
	font-weight:600;
	text-align:left;
}
.box table tr:nth-child(4) td:nth-child(2) input{
	width:80%;
	height:50px;
	text-align:left;
}
.box table tr:nth-child(5) td{
	padding:5%;
}

.loginbt {
width: 23%;
height: 50px;
border: none;
background: #475f3e;
cursor: pointer;
border-radius: 10px;
background-size: 200%;
border-color: white;
color: #fff;
outline: none;
transition: .5s;
 box-shadow: 1px 2px 5px grey;

}

.findbt{
width: 23%;
height: 50px;
border: none;
background: #475f3e;
cursor: pointer;
border-radius: 10px;
background-size: 200%;
border-color: white;
color: #fff;
outline: none;
transition: .5s;
 box-shadow: 1px 2px 5px grey;
} 

.find{
    margin: 20px;
}


</style>
  <link href="/resources/css/index.css" rel="stylesheet">
            
           <!--  <script>
                window.dataLayer = window.dataLayer || [];
                function gtag() { dataLayer.push(arguments); }
                gtag('js', new Date());
                gtag('config', 'UA-118022362-1');
            </script> -->


            
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
						
						<li><a href='/campgrounds'>캠핑장 예약</a></li>
						<li><a href='/noticeList.notice?cpage=1'>공지사항</a></li>
						<li><a href='/boards'>커뮤니티</a></li>
						<li><a href='/boards'>1:1문의</a></li>
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
   <form action="/findPwProc.mem" method="post" id="findPwForm">
      <div class="mybox">
       <div class="box">
      		<table>
      			<tr>
      				<th colspan=2> 비밀번호 찾기
      			</tr>
      			<tr>
      				<td>아이디
      				<td> <input type="text" placeholder="아이디를 입력하세요." name="id" id="id">
      			</tr>
      			<tr>
      				<td> 비밀번호 찾기 질문 선택
      				<td>    
      				<select name="question" id="question" >
	                  <option value="q1" selected >1. 가장 좋아하는 음식은?</option>
	                  <option value="q2">2. 자신의 인생 좌우명은?</option>
	                  <option value="q3">3. 가장 기억에 남는 추억의 장소는?</option>
	                  <option value="q4">4. 가장 무서웠던 선생님 성함은?</option>
               		</select>
      			</tr>
      			<tr>
      				<td>답변 입력
      				<td> <input type="text" placeholder="답변을 입력하세요." name="answer" id="answer">
      			</tr>
      			<tr>
      				<td colspan=2>  <input type="button" class="findbt" value="제출하기" id="submitBtn">
      				 <a href="/login.mem"><button type="button" class="loginbt">로그인하기</button></a>
      			</tr>
      		</table>
      		</div>
    </div>
   </form>
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
            <script>
	$("#submitBtn").on("click",function(){
 		$.ajax({
 			url : "/findPwProc.mem",
 			data : {
 				id:$("#id").val(),
 				question:$("#question").val(),
 				answer:$("#answer").val()
 			}
 		}).done(function(resp){
 			if(resp =="true"){
 				$("#findPwForm").submit();
 				location.href="/resetPw.mem";
 				
 			}else{
 				alert("아이디 또는 답변을 확인해주세요.");
 				location.href="/findPw.mem";
 			}
 			
 		})
 	})
	
 
	</script>
        </body>

        </html>
   
</body>
</html>