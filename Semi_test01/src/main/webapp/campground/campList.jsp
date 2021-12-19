<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

<head>
<title>떼캠</title>

<meta charset="UTF-8">
<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'
	name='viewport'>
<meta content='IE=edge' http-equiv='X-UA-Compatible'>
<meta content='telephone=no' name='format-detection'>
<meta name="csrf-param" content="authenticity_token" />
<meta name="csrf-token"
	content="NdCrBB3UVkpBLwE3f8f4QpoLpCUR8rpOqsaNUZmlj3nBrZmaF06xQf8jWAS+309DkEIwukoTD+pD1VNlwVeh5A==" />
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

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="/resources/js/paginga.jquery.js"></script>
<script type="text/javascript"
	src="https://pagead2.googlesyndication.com/pagead/show_ads.js">
	
</script>



<script
	src='https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js'></script>
<link
	href='https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css'
	rel='stylesheet'>

 	


<meta content='포캠퍼' property='og:site_name'>
<meta content='캠퍼들의 휴식처, 캠핑장' name='Subject'>
<meta
	content='포캠퍼, 캠핑장 예약, 전국 캠핑지도, 캠핑장 추천, 캠핑장 정보, 캠핑지도, 캠핑정보, 캠핑 장비, 오토캠핑, 감성캠핑, 백패킹, 글램핑, 글램핑장, 감성캠핑장'
	name='Keywords'>
<meta content='포캠퍼' name='Author'>
<meta content='forcamper.info@gmail.com' name='Reply-To(Email)'>
<meta content='대한민국 대표 캠핑 종합 플랫폼' name='Title'>
<meta
	content='전국에 있는 모든 캠핑장에 대한 정보와 예약을 한 눈에 그리고 한 번에! 캠핑에 대한 모든 정보가 있는 포캠퍼와 함께 캠핑을 떠나보세요!'
	name='Description'>
<meta content='포캠퍼' name='Publisher'>
<meta content='포캠퍼' name='Distribution'>
<meta content='Copyright 2018 포캠퍼 Co. Ltd. All rights reserved.'
	name='Copyright'>
<meta content='ALL' name='Robots'>
<script async=''
	src='https://www.googletagmanager.com/gtag/js?id=UA-118022362-1'></script>

<!-- 카카오app 키 추가 -->
<script type="text/javascript"
                src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a4cc768061f3ec51ce32cf2090f6c546"></script>
                 <link href="/resources/css/campList.css" rel="stylesheet" >
<script>
	window.dataLayer = window.dataLayer || [];
	function gtag() {
		dataLayer.push(arguments);
	}
	gtag('js', new Date());
	gtag('config', 'UA-118022362-1');
</script>

<style>
.text-center>h1{
	color: black;
}
.text-center>h2{
	color: black;
}
.section-thumb * {
    color: black;
}
 
   
</style>
 


</head>

 	<body>
			<c:choose>
				<c:when test="${loginID != null}">
					<!----- 로그인 후  header ----->
					<nav class='navbar'>
						<div class='container clearfix text-center'>
							<a class='navbar-brand pull-left' href='/'><img src="/img/logo_transparent.png" /></a>
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
			<!-- navbar 끝 -->
	
			<!------ Body  ------>
	<main id='main'>
		<section class="section-thumb section-campgrounds"
			style="background-image: url(https://www.teahub.io/photos/full/38-389205_wiki-camping-backgrounds-desktop-pic-wpc008079-data-tent.jpg)">

			<div class="container text-center">

				<h1>캠핑장 예약</h1>

				<h2>안전하고 빠르게 캠핑장을 예약하세요</h2>

			</div>

		</section>


		<section class="section-search">

			<div class="container">

				<div class='search-wrapper'>
					<div class='list-search-wrapper'>
						<form class="form-inline" action="/searchFromList.camp"
							accept-charset="UTF-8" method="get">
							<input name="utf8" type="hidden" value="&#x2713;" /> <input
								type="text" name="facltNm" id="campground-name"
								placeholder="캠핑장명을 입력해주세요" />
							<div class='wrapper'>
								<b>입/퇴소일</b>
								<div class='input-check-in-out input-check-in-out__two_days'>
									<div class='datepicker-check_in'>
										<input type="text" name="check_in" id="check_in"
											value="2021/12/13" class="" readonly="readonly" />
									</div>
									<span>~</span>
									<div class='datepicker-check_out'>
										<input type="text" name="check_out" id="check_out"
											value="2021/12/15" class="" readonly="readonly" />
									</div>
								</div>
								<b>캠핑유형</b> <select name="induty" id="" class="selectpicker">
									<option value="">전체</option>
									<option value="일반야영장">캠핑</option>
									<option value="자동차야영장">오토캠핑</option>
									<option value="카라반">카라반</option>
									<option value="글램핑">글램핑</option>
								</select>
							</div>
							<div class='wrapper'>
								<div class='wrapper-mobile-group clearfix'>
									<b>지역</b>
									<div class='select-region'>
										<select name="doNm" id="region" class="selectpicker">
											<option value="">전체</option>
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
									</div>

								</div>
								<div class='wrapper-mobile-group'>
									<b>부대시설</b>
									<div class='select-facility'>
										<select name="sbrsCl" id="facility_list" 
											class="selectpicker" title="부대시설">
											<option value="">전체</option>
											<option value="전기">전기</option>
											<option value="놀이터">놀이시설</option>
											<option value="온수">샤워시설</option>
											<option value="물놀이장">물놀이장</option>
											<option value="무선인터넷">와이파이</option>
											<option value="마트.편의점">매점</option>
											<option value="운동장">운동장</option>
										</select>
									</div>

<!-- disabled로 막아 놓은 기능 -->
									<b>이용환경</b>
									<div class='select-option'>
										<select name="option_list[]" id="option_list"
											 class="selectpicker s-option_list"
											title="이용환경" disabled>
											<option value="">전체</option>
											<option value="">화로사용</option>
											<option value="장비대여">장비대여</option>
											<option value="">반려동물</option>
										</select>
									</div>

									<b>주변환경</b>
									<div class='select-leisure'>
										<select name="posblFcltyCl" id="leisure_list"
											 class="selectpicker s-leisure_list"
											title="주변환경">
											<option value="">전체</option>
											<option value="낚시">낚시</option>
											<option value="해수욕">해수욕</option>
											<option value="계곡">계곡</option>
											<option value="호수">호수</option>
											<option value="등산로">등산로</option>
											<option value="산책로">산책로</option>
										</select>
									</div>
								</div>
								<input type="submit"  value="검색"
									class="btn btn-sm btn-search-map">
							</div>
							<div class='reset-filter reset-filter-campground'>
								<a href=""><img
									src="https://forcamper.co.kr/assets/icon-reset-c79706bea49bfce702f3c47bff38fdec72167d338985e94d8c4ccdd6880411e4.svg" />
									필터 초기화 </a>
							</div>
						</form>

					</div>
				</div>
				<script>
					$(function() {
						$('.input-check-in-out__two_days').daterangepicker(
								{
									"minDate" : moment(),
									"startDate" : "2021/12/23",
									"endDate" : "2021/12/25",
									"locale" : {
										"format" : 'YYYY/MM/DD',
										"applyLabel" : "적용",
										"cancelLabel" : "취소",
										"daysOfWeek" : [ "일", "월", "화", "수",
												"목", "금", "토" ],
										"monthNames" : [ "1월", "2월", "3월",
												"4월", "5월", "6월", "7월", "8월",
												"9월", "10월", "11월", "12월" ],
									},
								},
								function(start, end, label) {
									$('#check_in').val(
											start.format('YYYY/MM/DD'));
									$('#check_out').val(
											end.format('YYYY/MM/DD'));
								});

						$('.input-check-in-out__no_days').daterangepicker(
								{
									"minDate" : moment(),
									"locale" : {
										"format" : 'YYYY/MM/DD',
										"applyLabel" : "적용",
										"cancelLabel" : "취소",
										"daysOfWeek" : [ "일", "월", "화", "수",
												"목", "금", "토" ],
										"monthNames" : [ "1월", "2월", "3월",
												"4월", "5월", "6월", "7월", "8월",
												"9월", "10월", "11월", "12월" ],
									},
								},
								function(start, end, label) {
									$('#check_in').val(
											start.format('YYYY/MM/DD'));
									$('#check_out').val(
											end.format('YYYY/MM/DD'));
								});
					});
				</script>
				<style>
.daterangepicker td.active, .daterangepicker td.active:hover {
	background-color: #6cc0c1;
}
</style>


			</div>

		</section>



		<section class="section-list campground-index">

			<div class="container">

				<div class="row">

					<div class="col-xs-8">


						<div class="paginate">
							<div class="items">
								<c:forEach var="dto" items="${list}">
									<div>
										<ul class="camping-list">
											<li data-lat=${dto.mapY } data-lng=${dto.mapX }>

												<div class="thumb"
													style="background-image: url(${dto.firstImageUrl})"></div>

												<div class="site-count"></div>

												<div class="body">

<!--  캠핑장 하나의 세부사항을 확인하기-->
													<a href="/campDetail.camp?facltNm=${dto.facltNm} ">
														<h4>${dto.facltNm }</h4>
														<p class="address">${dto.addr1}</p>

														<div class="labels"></div>

													</a>

												</div>
												<div class='like-btn need_login'>
													<!-- %h6.like-btn__count 0 -->
												</div>

											</li>
										</ul>
									</div>
								</c:forEach>
							</div>


							<div class="text-center">
								<div class="pager">
									<div class="firstPage clicker">&laquo;</div>
									<div class="previousPage clicker">&lsaquo;</div>
									<div class="pageNumbers "></div>
									<div class="nextPage clicker">&rsaquo;</div>
									<div class="lastPage clicker">&raquo;</div>
								</div>
							</div>

						</div>
						<script>
							$(".paginate").paginga({
								itemsPerPage : 5
							})
						</script>
					</div>


					
				<div class="map-fixed col-xs-4" style="right: 0px; bottom: auto; top: 0px;">

                <ol class='breadcrumb'>
                  <li>
                    <a href='/'>홈</a>
                  </li>
                  <li>
                    <a href='/campgrounds'>캠핑장 예약</a>
                  </li>
                </ol>
						<div id="map-wrapper">
							<!-- 지도가 표시될 div -->
							<div id="map" style="width:100%;height:350px;"></div>
							<!-- 지도 위에 표시될 마커 카테고리 -->
							
						</div>
					</div>

			

			</div>

		</section>

		<!-- 카카오 api 지도 추가 -->
		<script>

			var arr = new Array();
			<c:forEach items="${list}" var="item">
				arr.push(
				{
					facltNm: "${item.facltNm}"
				,mapX: "${item.mapX}"
				, mapY : "${item.mapY}"
				}
				);
			</c:forEach>
		</script>




		<script>
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
				mapOption = {
					center: new kakao.maps.LatLng(37.3306890, 126.5930664), // 지도의 중심좌표
					level: 13 // 지도의 확대 레벨
				};


			//지도확대축소 버튼
			var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
			
			/* var imageSrc = '/resources/img/mapicon.png', // 마커이미지의 주소입니다 */
			
			var imageSrc = '/resources/img/mapicon.png', // 마커이미지의 주소입니다    
		    imageSize = new kakao.maps.Size(30,30), // 마커이미지의 크기입니다
		    imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
		    
		     
		    
			var zoomControl = new kakao.maps.ZoomControl();
			map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
			//지도확대축소 버튼 끝


			// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 

			// for (var i = 0; i < arr.length; i++) {
			//     console.log(i + "번째" + "mapX : " + arr[i].mapX
			//         + " mapY : " + arr[i].mapY
			//         + " facltNm : " + arr[i].facltNm
			//         + "입니다.");
			// }
			// alert(typeof(parseFloat((arr[0].mapX))));

			//   console.log(typeof(arr));





			console.log("arr : " + arr);
			// console.log("positions : " + positions);





			for (var i = 0; i < arr.length; i++) {
				
				    
				
				// 마커를 생성합니다
				var marker = new kakao.maps.Marker({
					map: map, // 마커를 표시할 지도
					image: new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
					position: new kakao.maps.LatLng(arr[i].mapY, arr[i].mapX) // 마커의 위치

				});



				// 마커에 표시할 인포윈도우를 생성합니다 
				var infowindow = new kakao.maps.InfoWindow({
					content:  arr[i].facltNm  // 인포윈도우에 표시할 내용
				});

				// 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
				// 이벤트 리스너로는 클로저를 만들어 등록합니다 
				// for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
				kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
				kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
			}

			// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
			function makeOverListener(map, marker, infowindow) {
				return function () {
					infowindow.open(map, marker);
				};
			}

			// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
			function makeOutListener(infowindow) {
				return function () {
					infowindow.close();
				};
			}

			/* 아래와 같이도 할 수 있습니다 */
			/*
			for (var i = 0; i < positions.length; i ++) {
				// 마커를 생성합니다
				var marker = new kakao.maps.Marker({
					map: map, // 마커를 표시할 지도
					position: positions[i].latlng // 마커의 위치
				});
			
				// 마커에 표시할 인포윈도우를 생성합니다
				var infowindow = new kakao.maps.InfoWindow({
					content: positions[i].content // 인포윈도우에 표시할 내용
				});
			
				// 마커에 이벤트를 등록하는 함수 만들고 즉시 호출하여 클로저를 만듭니다
				// 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
				(function(marker, infowindow) {
					// 마커에 mouseover 이벤트를 등록하고 마우스 오버 시 인포윈도우를 표시합니다
					kakao.maps.event.addListener(marker, 'mouseover', function() {
						infowindow.open(map, marker);
					});
			
					// 마커에 mouseout 이벤트를 등록하고 마우스 아웃 시 인포윈도우를 닫습니다
					kakao.maps.event.addListener(marker, 'mouseout', function() {
						infowindow.close();
					});
				})(marker, infowindow);
			}
			*/
		</script>
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