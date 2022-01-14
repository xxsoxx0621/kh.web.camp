<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>포캠퍼</title>
<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'
	name='viewport'>
<meta content='IE=edge' http-equiv='X-UA-Compatible'>
<meta content='telephone=no' name='format-detection'>
<meta name="csrf-param" content="authenticity_token" />
<meta name="csrf-token"
	content="7zgGFa9Qp80/WQCCO6fyl2v85hKPeIqGjAJ6QGVTEf/Lb1wQoVI6zBIle6igFho65NUu1Au20WCMhRBzm7zPIg==" />
<link rel="stylesheet" media="all"
	href="https://forcamper.co.kr/assets/application-28cb6ba1f7597c029b42f54e32f7c21d9ebd4352047ba0c90428928c5d4d8d64.css"
	data-turbolinks-track="reload" />
<script
	src='//dapi.kakao.com/v2/maps/sdk.js?appkey=a62178519b79bb5dca01b8072dae1c7a&amp;libraries=services'
	type='text/javascript'></script>
<script src='//developers.kakao.com/sdk/js/kakao.min.js'></script>
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


<script>
	window.dataLayer = window.dataLayer || [];
	function gtag() {
		dataLayer.push(arguments);
	}
	gtag('js', new Date());
	gtag('config', 'UA-118022362-1');
</script>

</head>
<body>
	<nav class='navbar'>
		<div class='container clearfix text-center'>
			<a class='navbar-brand pull-left' href='/'><img
				src="https://forcamper.co.kr/assets/logo-8b3cb831a66e75191113b817dbcf55843002aa57a14a32a4db8fec9ad3719910.png" /></a>
			<ul class='navbar-menu list-inline'>
				<li><a href='/campgrounds/map'>캠핑장 위치</a></li>
				<li class='active'><a href='/campgrounds'>캠핑장 예약</a></li>
				<li><a href='/casts'>캐스트</a></li>
				<li><a href='/boards'>소식</a></li>
			</ul>
			<ul class='navbar-user list-inline'>
				<li><a href="/reservations/my">마이페이지</a></li>
				<li><a rel="nofollow" data-method="delete"
					href="/users/sign_out">로그아웃</a></li>
			</ul>
			<a class='navbar-mobile' href='#' id='spot'> <span
				class='menu-item'></span> <span class='menu-item'></span> <span
				class='menu-item'></span>
			</a>
			<div class='mobile-menu'>
				<ul class='mobile-menu__link'>
					<li><a href='/campgrounds/map'>캠핑장 위치</a></li>
					<li class='active'><a href='/campgrounds'>캠핑장 예약</a></li>
					<li><a href='/casts'>캐스트</a></li>
					<li><a href='/boards'>소식</a></li>
					<li class='menu-user'><a href="/reservations/my">마이페이지</a> | <a
						rel="nofollow" data-method="delete" href="/users/sign_out">로그아웃</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	<script>
		var touchScroll = function(event) {
			event.preventDefault();
		};

		$('.navbar-mobile').click(function(e) {
			e.preventDefault();
			$('.mobile-menu-bg').toggleClass('open');
			$(document).bind('touchmove', touchScroll);
			$(this).toggleClass('open');
			$(".mobile-menu").animate({
				height : 'toggle'
			});
			$(document).bind('touchmove', touchScroll);
			if ($('.mobile-menu-bg').is(':hidden')) {
				$(document).unbind('touchmove', touchScroll);
			}
		});
	</script>

	<main id='main'>
		<section class='section-thumb'>
			<div class='container text-center'>
				<h1>캠핑장 예약</h1>
				<h4>안전하고 빠르게 캠핑장을 예약하세요</h4>
			</div>
		</section>
		<section class='reservation-complete'>
			<div class='container'>
				<div class='reservation-box'>
					<div class='reservation-box-text'>
						<h1>취소(환불완료)</h1>
						<div class='bar-sm'></div>
					</div>
					<div class='site-info row'>
						<div class='col-xs-5'>
							<img
								src="https://forcamper.co.kr/assets/logo-8b3cb831a66e75191113b817dbcf55843002aa57a14a32a4db8fec9ad3719910.png" />
						</div>
						<div class='col-xs-7'>
							<h3>
								문수골 힐링캠핑장 <br> 힐링 A존 : 08번 사이트
							</h3>
						</div>
					</div>
					<hr>
					<div class='payment-info'>
						<h4>예약(결제) 정보</h4>
						<dl>
							<dt>결제 수단</dt>
							<dd>무통장</dd>
							<dt>결제 금액</dt>
							<dd>0원</dd>
							<dt>예약날짜</dt>
							<dd>21.12.19 01:44</dd>
							<dt>예약취소 날짜</dt>
							<dd>21.12.19 01:45</dd>
							<dt>환불 금액</dt>
							<dd>0원</dd>
						</dl>
					</div>
					<div class='user-info'>
						<h4>캠핑장 예약 정보</h4>
						<dl>
							<dt>체크인/체크아웃</dt>
							<dd>2021-12-31 ~ 2022-01-01 1박 2일</dd>
							<dt>예약자명</dt>
							<dd>김동휘</dd>
							<dt>투숙인원</dt>
							<dd>2</dd>
							<dt>연락처</dt>
							<dd>01047840161</dd>
							<dt>차량번호</dt>
							<dd>ㅁ</dd>
							<dt>환불받을 계좌</dt>
							<dd>기업은행 - ㅁ</dd>
							<dt>금액</dt>
							<dd>40,000원</dd>
						</dl>
					</div>
					<div class='cancel-area'></div>
				</div>
				<div class='text-center'>
					<a class="btn btn-default" href="/reservations/my">확인</a>
				</div>
			</div>
		</section>

	</main>
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
