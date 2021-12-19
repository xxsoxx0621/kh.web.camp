<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html>

        <head>
            <title>떼캠</title>
            <meta charset="utf-8">
            <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport'>
            <meta content='IE=edge' http-equiv='X-UA-Compatible'>
            <meta content='telephone=no' name='format-detection'>
            <meta name="csrf-param" content="authenticity_token" />
            <!-- 제이쿼리 -->
			<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
			
            <meta name="csrf-token"
                content="xTVSaz3VuRmKVJSJY0Mid4xh8Hyx7r4ZuYbLpGsusdIxSGD1N09eEjRYzbqiW5V2hihk4+oPC71QlRWQM9yfTw==" />
            <link rel="stylesheet" media="all"
                href="https://forcamper.co.kr/assets/application-28cb6ba1f7597c029b42f54e32f7c21d9ebd4352047ba0c90428928c5d4d8d64.css"
                data-turbolinks-track="reload" />

            <script src='//dapi.kakao.com/v2/maps/sdk.js?appkey=2178519b79bb5dca01b8072dae1c7a&amp;libraries=services'
                type='text/javascript'></script>
            <script src='//developers.kakao.com/sdk/js/kakao.min.js'></script>
            <script
                src="https://forcamper.co.kr/assets/application-29406dc9afbae6ee15078615178a129129a90f8fae05bcb57acb43d36967fc9c.js"
                data-turbolinks-track="reload"></script>

            <script src='https://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.js'></script>
            <link href='https://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.css' rel='stylesheet'>
            <script src='https://cdn.pannellum.org/2.4/pannellum.js'></script>
            <link href='https://cdn.pannellum.org/2.4/pannellum.css' rel='stylesheet'>
            <script src='https://cdn.jsdelivr.net/momentjs/latest/moment.min.js'></script>

            <script src='https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js'></script>
            <link href='https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css' rel='stylesheet'>

            <link rel="preconnect" href="https://fonts.googleapis.com">
            <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

            <link href="https://fonts.googleapis.com/css2?family=Open+Sans&display=swap" rel="stylesheet">

            <meta content='떼캠' property='og:site_name'>
            <meta content='캠퍼들의 휴식처, 캠핑장' name='Subject'>
            <meta content='떼캠, 캠핑장 예약, 전국 캠핑지도, 캠핑장 추천, 캠핑장 정보, 캠핑지도, 캠핑정보, 캠핑 장비, 오토캠핑, 감성캠핑, 백패킹, 글램핑, 글램핑장, 감성캠핑장'
                name='Keywords'>
            <meta content='떼캠' name='Author'>
            <meta content='forcamper.info@gmail.com' name='Reply-To(Email)'>
            <meta content='대한민국 대표 캠핑 종합 플랫폼' name='Title'>
            <meta content='전국에 있는 모든 캠핑장에 대한 정보와 예약을 한 눈에 그리고 한 번에! 캠핑에 대한 모든 정보가 있는 떼캠와 함께 캠핑을 떠나보세요!'
                name='Description'>
            <meta content='떼캠' name='Publisher'>
            <meta content='떼캠' name='Distribution'>
            <meta content='Copyright 2018 떼캠 Co. Ltd. All rights reserved.' name='Copyright'>
            <meta content='ALL' name='Robots'>
            <script async='' src='https://www.googletagmanager.com/gtag/js?id=UA-118022362-1'></script>
            <link href="/resources/css/index.css" rel="stylesheet">
            
            <script>
                window.dataLayer = window.dataLayer || [];
                function gtag() { dataLayer.push(arguments); }
                gtag('js', new Date());
                gtag('config', 'UA-118022362-1');
            </script>

            
        </head>

       	<body>
			<c:choose>
				<c:when test="${loginID != null}">
					<!----- 로그인 후  header ----->
					<nav class='navbar'>
						<div class='container clearfix text-center'>
							<a class='navbar-brand pull-left' href='/'><img src="/resources/img/logoTitle.png" /></a>
							<button id=update>DB 업데이트!</button>
                    <script>
                    $("#update").on("click", function(){
                       location.href = "/update.camp";
                       
                    })
                    </script>
							<ul class='navbar-menu list-inline'>
							
								<li><a href='/campgrounds/map'>캠핑장 위치</a></li>
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
							<div class='mobile-menu'>
								<ul class='mobile-menu__link'>
									<li><a href='/campgrounds/map'>캠핑장 위치</a></li>
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
						src="/img/logo_transparent.png" /></a>
					<ul class='navbar-menu list-inline'>
						<li><a href='/campgrounds/map'>캠핑장 위치</a></li>
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
					<div class='mobile-menu'>
						<ul class='mobile-menu__link'>
							<li><a href='/campgrounds/map'>캠핑장 위치</a></li>
							<li><a href='/campgrounds'>캠핑장 예약</a></li>
							<li><a href='/casts'>공지사항</a></li>
							<li><a href='/boards'>커뮤니티</a></li>
							<li><a href='/boards'>1:1문의</a></li>
							<li class='menu-user'>
							<a href="/logout.mem">로그아웃</a>  
							<a href="/myPage.mypage">마이페이지</a></li>
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
							<div class='mobile-menu'>
								<ul class='mobile-menu__link'>
									<li><a href='/campgrounds/map'>캠핑장 위치</a></li>
									<li><a href='/campList.camp'>캠핑장 예약</a></li>
									<li><a href='/noticeList.notice?cpage=1'>공지사항</a></li>
									<li><a href='/boardlist.board?cpage=1'>커뮤니티</a></li>
									<li><a href='/qnaList.qna?cpage=1'>1:1문의</a></li>
									<li class='menu-user'><a href="/login.mem">로그인</a> | <a href="/signUp.mem">회원가입</a>
									</li>
								</ul>
							</div>
						</div>
					</nav>
				</c:otherwise>
			</c:choose>
			<script>
				var touchScroll = function (event) {
					event.preventDefault();
				};

				$('.navbar-mobile').click(function (e) {
					e.preventDefault();
					$('.mobile-menu-bg').toggleClass('open');
					$(document).bind('touchmove', touchScroll);
					$(this).toggleClass('open');
					$(".mobile-menu").animate({
						height: 'toggle'
					});
					$(document).bind('touchmove', touchScroll);
					if ($('.mobile-menu-bg').is(':hidden')) {
						$(document).unbind('touchmove', touchScroll);
					}
				});
			</script>
			<!------ Body  ------>
			
         

            <main id='main'>
                <section class='main-slider-wrapper'>
                    <div class='main-slider slide carousel' data-ride='carousel' id='carousel'>
                        <div class='carousel-inner' role='listbox'>
                            <div class='container'>
                                <ol class='carousel-indicators'>
                                    <li class='active' data-slide-to='0' data-target='#carousel'></li>
                                    <li data-slide-to='1' data-target='#carousel'></li>
                                </ol>
                            </div>
                            <div class='active item'>
                                <a target="_blank" href="#">
                                    <div class='thumb'
                                        style='background-image: url("https://www.trago.co.uk/wp-content/uploads/2020/03/Camping-Hero-Image.jpg")'>
                                    </div>
                                    <div class='container'>
                                        <div class='meta'>
                                            <div class='sub-title'>캠핑을 좋아하는 사람들의 공간</div>
                                            <div class='title'>떼캠으로 오세요!</div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <div class='item'>
                                <a target="_blank" href="#">
                                    <div class='thumb'
                                        style='background-image:url("https://sc04.alicdn.com/kf/Ha31d2be203264047bb291a5ad2e985bc7/220501994/Ha31d2be203264047bb291a5ad2e985bc7.jpg")'>
                                    </div>
                                    <div class='container'>
                                        <div class='meta'>
                                            <div class='sub-title'>캠핑을 좋아하는 사람들의 공간</div>
                                            <div class='title'>떼캠으로 오세요</div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>
                        <a class='left carousel-control' data-slide='prev' href='#carousel' role='button'>
                            <img
                                src="https://forcamper.co.kr/assets/icon-arrow-prev-2e3363ef93b154f1ad0b986283885167bc240509ec4a4743c3440ee1d5e2ca9e.png" />
                        </a>
                        <a class='right carousel-control' data-slide='next' href='#carousel' role='button'>
                            <img
                                src="https://forcamper.co.kr/assets/icon-arrow-next-54390d5f2fc49bb0031ae74371fca4a8cd5b5557f2c7cc2256372f4741244b06.png" />
                        </a>
                        <div class='search-container'>
                            <div class='main-search'>
                                <div class='search-wrapper'>
                                    <div class='main-search-wrapper'>
                                        <form class="form-inline" action="/searchFromMain.camp" accept-charset="UTF-8"
                                            method="get"><input name="utf8" type="hidden" value="&#x2713;" />

                                            <select name="induty" id="category_list"
                                                class="form-control search-select-camp selectpicker">

                                                <option value="">캠핑유형</option>
                                                <option value="일반야영장">캠핑</option>
                                                <option value="자동차야영장">오토캠핑</option>
                                                <option value="카라반">카라반</option>
                                                <option value="글램핑">글램핑</option>

                                            </select>
                                            <select name="doNm" id="region"
                                                class="form-control search-select-region selectpicker">
                                                <option value="">지역</option>
                                                <option value="경기도">경기도</option>
                                                <option value="인천시">인천시</option>
                                                <option value="강원도">강원도</option>
                                                <option value="충청북도">충청북도</option>
                                                <option value="충청남도">충청남도</option>
                                                <option value="전라북도">전라북도</option>
                                                <option value="전라남도">전라남도</option>
                                                <option value="경상북도">경상북도</option>
                                                <option value="경상남도">경상남도</option>
                                                <option value="제주도">제주도</option>
                                            </select>
                                            <div class='input-check-in-out input-check-in-out__two_days'>
                                                <div class='datepicker-check_in'>
                                                    <input type="text" name="check_in" id="check_in" value="2021/12/12"
                                                        class="dateinput" readonly="readonly" />
                                                </div>
                                                <div class='datepicker-check_out'>
                                                    <input type="text" name="check_out" id="check_out"
                                                        value="2021/12/14" class="dateinput" readonly="readonly" />
                                                </div>
                                            </div>
                                            <input type="submit" name="commit" value="캠핑장검색"
                                                class="btn btn-default search-name-btn" data-disable-with="캠핑장검색" />
                                        </form>

                                    </div>
                                </div>
                                <script>
                                    $(function () {
                                        $('.input-check-in-out__two_days').daterangepicker({
                                            "minDate": moment(),
                                            "startDate": "2021/12/12",
                                            "endDate": "2021/12/14",
                                            "locale": {
                                                "format": 'YYYY/MM/DD',
                                                "applyLabel": "적용",
                                                "cancelLabel": "취소",
                                                "daysOfWeek": ["일", "월", "화", "수", "목", "금", "토"],
                                                "monthNames": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
                                            },
                                        }, function (start, end, label) {
                                            $('#check_in').val(start.format('YYYY/MM/DD'));
                                            $('#check_out').val(end.format('YYYY/MM/DD'));
                                        });

                                        $('.input-check-in-out__no_days').daterangepicker({
                                            "minDate": moment(),
                                            "locale": {
                                                "format": 'YYYY/MM/DD',
                                                "applyLabel": "적용",
                                                "cancelLabel": "취소",
                                                "daysOfWeek": ["일", "월", "화", "수", "목", "금", "토"],
                                                "monthNames": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
                                            },
                                        }, function (start, end, label) {
                                            $('#check_in').val(start.format('YYYY/MM/DD'));
                                            $('#check_out').val(end.format('YYYY/MM/DD'));
                                        });
                                    });
                                </script>
                                <style>
                                    .daterangepicker td.active,
                                    .daterangepicker td.active:hover {
                                        background-color: rgba(247, 6, 6, 0.781);
                                    }
                                </style>

                            </div>
                        </div>
                    </div>
                </section>
                <section class='section-intro'>
                    <div class='container'>
                        <h1 class='f-primary'>떼캠 소개</h1>

                        <h5 class='section-subtitle'>
                            뗴캠은 캠퍼들을 위한 정보의 요람이 되기 위해 시작된 스타트업입니다.
                            <br class='hidden-xs'>
                            캠팡장의 정보를 캠핑지도와 VR이미지를 통해 생생하게 전달함과 동시에 예약까지 가능한 서비스를 제공하고 있습니다.
                            <br class='hidden-xs'>
                            성숙한 캠핑 문화와 캠핑 산업 발전을 위해 항상 최선을 다하겠습니다.
                        </h5>
                        <div class='intro-box-wrapper row'>
                            <div class='intro-box col-xs-4'>
                                <img
                                    src="https://forcamper.co.kr/assets/obj-intro1-f4ea9e4d14471283bc53642a8eefd7be1c6a80cd5ed0d4607034a456a066fe7f.png" />
                                <h4>전국 캠핑지도</h4>
                                <hr>
                                <h5>
                                    5000여개 전국 캠핑장을 한눈에!
                                    <br>
                                    전국의 모든 캠핑장을 캠핑지도에서
                                    <br>
                                    찾아보세요
                                </h5>
                            </div>
                            <div class='intro-box col-xs-4'>
                                <img
                                    src="https://forcamper.co.kr/assets/obj-intro2-be64429775e6341560f16348ae5402adb0397a26a478b343d56b53b7bc30a901.png" />
                                <h4>다양한 후기확인</h4>
                                <hr>
                                <h5>
                                    고민을 멈추세요!
                                    <br>
                                    생동감 있는 후기를 확인해보시고
                                    <br>
                                    이번 주말 여행지를 정해보세요!
                                </h5>
                            </div>
                            <div class='intro-box col-xs-4'>
                                <img
                                    src="https://forcamper.co.kr/assets/obj-intro3-da37beef3a977a6983274ddc8da946f7a31bf8718e6ac8339a6985c0e79b4ec1.png" />
                                <h4>환경 시설 검색</h4>
                                <hr>
                                <h5>
                                    애완동물 출입가능한 캠핑장, 물놀이 가능한
                                    <br>
                                    캠핑장 찾기 힘드셨죠? 수십여가지
                                    <br>
                                    환경/시설별로 캠핑장을 검색해보세요!
                                </h5>
                            </div>
                        </div>
                    </div>
                </section>
                <section class='section-notice'>
                    <div class='container'>

                        <h1 class='f-primary'>떼캠 소식</h1>

                        <h5 class='section-subtitle'>떼캠 소식에서 캠핑과 관련된 다양한 캐스트와 공지사항을 확인하세요.</h5>
                        <div class='row'>
                            <div class='col-xs-8'>
                                <ul class='thumb-list row main-cast--swiper swiper-container'>
                                    <div class='swiper-wrapper'>
                                        <li class='swiper-slide'>
                                            <a href="/casts/86">
                                                <div class='thumb'
                                                    style='background-image: url(/rails/active_storage/blobs/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBDUT09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--643f72b131668e3ab5e6d47428adcaee8a5a7aa9/lg_51.%E1%84%8F%E1%85%A2%E1%86%B7%E1%84%91%E1%85%B5%E1%86%BC%E1%84%8C%E1%85%A1%E1%86%BC%E1%84%8F%E1%85%A5%E1%84%91%E1%85%B51.jpg)'>
                                                </div>
                                                <div class='body'>
                                                    <h6 class='f-primary'>CAST</h6>
                                                    <h4>캠핑장에서 커피 내려마시기</h4>
                                                    <p class='date'>19.01.18</p>
                                                </div>
                                            </a>
                                        </li>
                                        <li class='swiper-slide'>
                                            <a href="/casts/85">
                                                <div class='thumb'
                                                    style='background-image: url(/rails/active_storage/blobs/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBDZz09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--bd4ea152c046a38cf7179414ddb0955ab99bca64/lg_1.jpg)'>
                                                </div>
                                                <div class='body'>
                                                    <h6 class='f-primary'>CAST</h6>
                                                    <h4>캠핑장에서 전기 잘쓰기 </h4>
                                                    <p class='date'>19.01.11</p>
                                                </div>
                                            </a>
                                        </li>
                                        <li class='swiper-slide'>
                                            <a href="/casts/84">
                                                <div class='thumb'
                                                    style='background-image: url(/rails/active_storage/blobs/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBEQT09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--c4166a7864c6c1780556edfa373fb7872fab65be/lg_11.jpg)'>
                                                </div>
                                                <div class='body'>
                                                    <h6 class='f-primary'>CAST</h6>
                                                    <h4>텐트설치의 기본! 바닥공사</h4>
                                                    <p class='date'>19.01.04</p>
                                                </div>
                                            </a>
                                        </li>
                                        <li class='swiper-slide'>
                                            <a href="/casts/83">
                                                <div class='thumb'
                                                    style='background-image: url(/rails/active_storage/blobs/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBEUT09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--50e113a78ebbe780ea81cd887d4e0949d283ca42/lg_1.jpg)'>
                                                </div>
                                                <div class='body'>
                                                    <h6 class='f-primary'>CAST</h6>
                                                    <h4>겨울 캠핑 안전수칙</h4>
                                                    <p class='date'>18.12.21</p>
                                                </div>
                                            </a>
                                        </li>
                                    </div>
                                </ul>
                            </div>
                            <div class='col-xs-4'>
                                <div class='main-notice'>
                                    <h5 class='f-primary'>공지사항</h5>
                                    <!--공지사항 JSTL  -->
                                    <ul class='notice-list'>
                                        <li>
                                            <a href="/boards/106">
                                                <h4>신규 파트너존 캠핑장 등록 안내</h4>
                                                <p class='date'>21.02.01 23:29</p>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="/boards/105">
                                                <h4>코로나바이러스 관련 고객센터 응대 중단 안내</h4>
                                                <p class='date'>20.12.22 08:45</p>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="/boards/104">
                                                <h4>[완료] 회원가입 SMS 인증 오류</h4>
                                                <p class='date'>20.12.14 10:49</p>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="/boards/102">
                                                <h4>[완료] 떼캠 업데이트 작업 완료</h4>
                                                <p class='date'>20.12.05 01:48</p>
                                            </a>
                                        </li>
                                    </ul>
                                    <a class='add-link' href='/boards'>더 보기</a>
                                </div>
                                <div class='main-banner'>
                                    <a href='javascript:void(0);' style="cursor: auto;"><img
                                            src="https://forcamper.co.kr/rails/active_storage/blobs/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBFQT09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--36899569c4380c4a4494f2372810b420f122aa46/KakaoTalk_20180416_164504152.jpg" />
                                    </a>
                                    <!-- 제휴 및 정보문의 -->
                                    <a    href='javascript:void(0);' style="cursor: auto;"><img
                                            src="https://forcamper.co.kr/rails/active_storage/blobs/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBEdz09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--2205481ece79b0589035a79f999abc3a98822752/180418%E1%84%8B%E1%85%B5%E1%84%87%E1%85%A6%E1%86%AB%E1%84%90%E1%85%B3%E1%84%87%E1%85%A6%E1%84%82%E1%85%A5.jpg" />
                                    </a>
                                </div>
                            </div>
                        </div>

                        <!-- 위쪽 위동버튼 a href=# 설정시 맨위로 이동 -->
                        <div class='top-btn'>
                            <a href="#"><img
                                    src="https://forcamper.co.kr/assets/btn-top-a146b918532f50d8675bc3a3cc2cff79899022a5c8ca651ec8be7feb9ffcca29.png" />
                            </a>
                        </div>
                    </div>
                </section>

            </main>
            
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