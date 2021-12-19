<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<meta charset="UTF-8">
<meta charset="utf-8">
<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'name='viewport'>
<meta content='IE=edge' http-equiv='X-UA-Compatible'>
<meta content='telephone=no' name='format-detection'>
<!-- 제이쿼리 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- 외부라이브러리 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" media="all"
	href="https://forcamper.co.kr/assets/application-28cb6ba1f7597c029b42f54e32f7c21d9ebd4352047ba0c90428928c5d4d8d64.css"
	data-turbolinks-track="reload" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Open+Sans&display=swap" rel="stylesheet">
<!-- 부트스트랩 -->
<!-- 합쳐지고 최소화된 최신 CSS -->
<!-- <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"> -->

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style>
* {
	font-size: 15px;
	font-family: 'Open Sans', sans-serif;
}

body, html {
	font-family: "NanumBarunGothic", AppleSDGothic, "맑은 고딕", Dotum,
		sans-serif !important;
	font-weight: 300;
	line-height: 23px;
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
#main {
	height: 1280px;
	text-align:center;
	overflow: scroll;
}


</style>

</head>
<body>
	<nav class='navbar'>
		<div class='container clearfix text-center'>
			<a class='navbar-brand pull-left' href='/'><img
				src="/img/떼캠 로고 베이지.png" /></a>
				<ul class='navbar-menu list-inline'>
				<li><a href='/campgrounds/map'>캠핑장 위치</a></li>
				<li><a href='/campgrounds'>캠핑장 예약</a></li>
				<li><a href='/casts'>공지사항</a></li>
				<li><a href='/boards'>커뮤니티</a></li>
				<li><a href='/boards'>1:1문의</a></li>
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
					<li><a href='/casts'>공지사항</a></li>
					<li><a href='/boards'>커뮤니티</a></li>
					<li><a href='/boards'>1:1문의</a></li>
					<li class='menu-user'><a href="/logout.mem">로그아웃</a> | <a
						href="/myPage.mypage">마이페이지</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<div id="main">
	
						<a href="/reservationControl.admin"><button>예약관리</button></a> 
						<a href="/manageMember.admin?cpage=1"><button>회원검색</button></a> 
						<!-- <a href="/boardControl.admin"><button>게시판관리</button></a>  -->
						<a href="/questionControl.admin"><button>1:1 문의</button></a> 
						<a href="/campControl.admin"><button id=update>캠핑장DB업데이트</button></a> 
						   <script>
			                    $("#update").on("click", function(){
			                       location.href = "/update.camp";
			                       
			                    })
                    </script>
							
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
</body>
</html>