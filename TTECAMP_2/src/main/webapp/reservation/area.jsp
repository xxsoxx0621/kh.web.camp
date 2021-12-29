<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	content="COo/IpohtpuzgXh5vCjxKxVaVTnbhVFP0LtqEN8G46E8YTDMYZ08O/BzyaWEKAArhY7JeA+a+PJMx5fCc/I7mQ==" />
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




<style>
.area-show .info-wrapper .date-wrapper .date .datepicker-form {
	width: 200px;
	height: 42px;
	font-size: 18px;
	color: #404040;
	text-indent: 35px;
}

input {
	line-height: normal;
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
                 <!--    <script>
                    $("#update").on("click", function(){
                       location.href = "/update.camp";
                       
                    })
                    </script> -->
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
	<main id='main'>
		<section class="section-thumb">

			<div class="container text-center">

				<h1>${dto.facltNm}</h1>

				<h4>힐링 A존</h4>

			</div>

		</section>


		<section class="section-list area-show">

			<div class="container">

				<div class="back">

					<a href="javascript:history.back()"> <img
						src="https://forcamper.co.kr/assets/icon-back-e0929573c7f49a7b622b7efc95941ff374833ffb40b50020f6ddeeb74004e871.png" />
						예약하기
					</a>

				</div>

				<div class="image-wrapper">

					<div class="thumb" id="btn-slider"
						style="background-image: url(${dto.firstImageUrl})">

						<!--   <div class="thumb-inner">
                    
                        <a class="btn btn-default btn-md btn-transparent" href="#">360º 사진</a>
                </div> -->

					</div>

					<!-- <div class="thumb" id="btn-slider"
						style="background-image: url(/resources/img/withcorona2.png)">


					</div> -->















				</div>

				<div class="info-wrapper">

					<h1>
						힐링 A존
						<div class="site-count-label">잔여: ${available_camp_Nm}</div>
					</h1>

					<h4>${dto.facltNm}</h4>

					<p>${dto.lineIntro}</p>

					<div class="price">

						<h2>
							<span class="f-primary">40,000원</span>
						</h2>

						<div class="area-price-label">


							<span class='label-orange gray'>연박할인</span>
						</div>
					</div>

					<div class="area-users">
						<img
							src="https://forcamper.co.kr/assets/icon-users-e9f7da2095cecefd2cc96fd3fc9eaa6c3450ef89a24e29e7601abc9a7021c33d.png" />
						<h5>최대 인원 4명</h5>
					</div>

					<div class="tags-wrapper">


						<c:if test="${dto.posblFcltyCl ne '0'}">
							<div class="btn btn-tag">${dto.posblFcltyCl}</div>
						</c:if>
						<c:if test="${dto.lctCl ne '0'}">
							<div class="btn btn-tag">${dto.lctCl}</div>
						</c:if>



						<c:if test="${dto.siteBottomCl1 ne '0'}">
							<div class="btn btn-tag">잔디</div>
						</c:if>
						<c:if test="${dto.siteBottomCl1 ne '0'}">
							<div class="btn btn-tag">파쇄석</div>
						</c:if>
						<c:if test="${dto.siteBottomCl1 ne '0'}">
							<div class="btn btn-tag">데크</div>
						</c:if>
						<c:if test="${dto.siteBottomCl4 ne '0'}">
							<div class="btn btn-tag">자갈</div>
						</c:if>
						<c:if test="${dto.siteBottomCl5 ne '0'}">
							<div class="btn btn-tag">노지</div>
						</c:if>

						<c:if test="${dto.animalCmgCl ne '불가능'}">
							<div class="btn btn-tag">애견동반</div>
						</c:if>



						<c:if test="${dto.brazierCl eq '개별'}">
							<div class="btn btn-tag">화로대</div>
						</c:if>



					</div>



					<div class="ground-img-wrapper">
						<div class="ground-info">
							<img
								src="https://forcamper.co.kr/assets/icon-noji-0b579667eb5129969b026ea5fc7fab80835e86b01122916d6df738404305c377.png" />
							<p>노지</p>
						</div>
					</div>


					<hr>
					<!-- <form id="area_search_form" action="/reservation.rev" accept-charset="UTF-8" method="get"><input name="utf8" type="hidden" value="&#x2713;" /> -->

					<!-- /campgrounds/1758/areas/21 -->
					<div class="date-wrapper">
						<h4>날짜</h4>
						<div class='input-check-in-out input-check-in-out__two_days'>
							<div class='datepicker-check_in'>
								<input type="text" name="check_in" class="datepicker-form"
									id="check_in" value="2021/12/23" class="dateinput"
									readonly="readonly" />
							</div>
							<span>~</span>
							<div class='datepicker-check_out'>
								<input type="text" name="check_out" class="datepicker-form"
									id="check_out" value="2021/12/24" class="dateinput"
									readonly="readonly" />
							</div>
						</div>


					</div>

					<c:choose>
						<c:when test="${loginID != null || admin != null}">
							<!-- <a href="/reservation.rev?contentId=${dto.contentId}"> -->
							<input type="submit" id="MemReserveBtn"
								class="btn btn-default btn-block" data-disable-with="예약하기"
								value="예약하기">
							<!-- </a> -->
						</c:when>
						<c:otherwise>
							<input type="button" id="noMemReserveBtn"
								class="btn btn-default btn-block" data-disable-with="예약하기"
								value="예약하기">
						</c:otherwise>
					</c:choose>

					<!-- </form>     -->

					<!--   <form id="select-site-form" action="/reservations/new" accept-charset="UTF-8" method="get"><input name="utf8" type="hidden" value="&#x2713;" />
            
            
            
           
            
            <input type="submit" name="commit" value="예약하기" class="btn btn-default btn-block" data-disable-with="예약하기" />
            <input type="hidden" name="days" id="days" value="2" />
            <input type="hidden" name="wday" id="wday" value="0" />
                
</form>         -->
				</div>

			</div>

			<script>
                $('#noMemReserveBtn').on('click', () => {
                    alert("로그인이 필요한 페이지입니다.");
                    location.href = "/login.mem";
                })

            </script>
			<script>
                $('#MemReserveBtn').on('click', () => {
                    var available_camp_Nm = "${available_camp_Nm}";
                    console.log("${available_camp_Nm}");
                    if (available_camp_Nm <= 0) {
                        console.log(available_camp_Nm);
                        alert("예약이 마감되었습니다. 다른 캠핑장을 선택해주세요.");
                    } else {
                        console.log(available_camp_Nm);
                        let check_in_param =$("#check_in").val();
                        let check_out_param =$("#check_out").val();
                        /* @@ */
                     
                        
                    var start_String = $("#check_in").val();
                    
var end_String = $("#check_out").val();


var start_Array = start_String.split("/");          
var end_Array = end_String.split("/");

// 월에서 1을 뺀 이유는 자바스크립트에서 Date 객체의 월은 우리가 사용하는 월보다 1이 작기때문​
var start_date = new Date(start_Array[0], Number(start_Array[1])-1, start_Array[2]);   
var end_date = new Date(end_Array[0], Number(end_Array[1])-1, end_Array[2]);

// getTime()은 밀리세컨드 단위로 변환하는 함수이기 때문에 이 차이에다가
// 1000을 나누면 초, 60을 또 나누면 분, 60을 또 나누면 시간, 24를 또 나누면 일 단위의 차이가 됨
var days = (end_date.getTime() - start_date.getTime())/1000/60/60/24;    


              
 
    location.href = "/reservation.rev?contentId=${dto.contentId}&check_in="+check_in_param+"&check_out="+check_out_param+"&days="+days+"";

                        
                        
                        
    

 
                        
                    
                }
            })
        
            </script>

		</section>


		<div aria-hidden="true" aria-labelledby="myModalLabel"
			class="area-modal modal fade" id="SliderModal" role="dialog"
			tabindex="-1">

			<div class="modal-dialog">

				<div class="modal-content">

					<div class="modal-header">

						<button aria-label="Close" class="close" data-dismiss="modal"
							type="button">
							<span aria-hidden="true">×</span>
						</button>

					</div>

					<div class="modal-body">

						<div class="tab-wrapper">

							<ul role="tablist">

								<li role="presentation"><a aria-controls="vr" class="hide"
									data-toggle="tab" href="#vr" role="tab"></a> <select
									class="select-vr" id="vr_images" name="vr_images"
									onchange="show_vr();">
										<option
											value="/rails/active_storage/blobs/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBWnc9IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--688bfc1ccefb2d4fb2ff57d8ba57e38c0c1efc55/%E1%84%87%E1%85%A9%E1%86%AB%E1%84%80%E1%85%AA%E1%86%AB1.png">01번
											사이트 VR 사진</option>
										<option
											value="/rails/active_storage/blobs/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBWjg9IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--86e606fe652fef62499144daf0e94d4cc7e3af3d/%E1%84%87%E1%85%A9%E1%86%AB%E1%84%80%E1%85%AA%E1%86%AB2.png">02번
											사이트 VR 사진</option>
										<option
											value="/rails/active_storage/blobs/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBYUk9IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--41002708107cdb14da6b6e3e7338481d4975be4d/%E1%84%87%E1%85%A9%E1%86%AB%E1%84%80%E1%85%AA%E1%86%AB3.png">03번
											사이트 VR 사진</option>
										<option
											value="/rails/active_storage/blobs/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBYVk9IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--9517afff4e5f49268ccd660e87925190ee384cc0/%E1%84%87%E1%85%A9%E1%86%AB%E1%84%80%E1%85%AA%E1%86%AB4.png">04번
											사이트 VR 사진</option>
										<option
											value="/rails/active_storage/blobs/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBYWs9IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--3c5bb0124dec959acad4f0499080a7ff2b9fa948/%E1%84%87%E1%85%A9%E1%86%AB%E1%84%80%E1%85%AA%E1%86%AB5.png">05번
											사이트 VR 사진</option>
										<option
											value="/rails/active_storage/blobs/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBYXc9IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--a7f98719cef0fb93986fe975d10f48f898ddb578/%E1%84%87%E1%85%A9%E1%86%AB%E1%84%80%E1%85%AA%E1%86%AB6.png">06번
											사이트 VR 사진</option>
										<option
											value="/rails/active_storage/blobs/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBYTg9IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--8cd30b08b58e94531e0f546e5618fa8f0b2b31d7/%E1%84%87%E1%85%A9%E1%86%AB%E1%84%80%E1%85%AA%E1%86%AB7.png">07번
											사이트 VR 사진</option>
										<option
											value="/rails/active_storage/blobs/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBYkU9IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--326c549490121db27417c6a6772087d18118bd3c/%E1%84%87%E1%85%A9%E1%86%AB%E1%84%80%E1%85%AA%E1%86%AB8.png">08번
											사이트 VR 사진</option>
								</select></li>

								<li role="presentation"><a aria-controls="img"
									class="btn btn-transparent" data-toggle="tab" href="#img"
									role="tab">전경사진</a></li>

							</ul>

						</div>



					</div>

				</div>

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
.daterangepicker td.active, .daterangepicker td.active:hover { 
	
	background-color: rgba(247, 6, 6, 0.781);
}

.daterangepicker td.available {
	
	font-weight: bold;
}
</style>

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
