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
	content="LlqIZfXSyTdN8fTIhouM1fBhm0f4jf2hId433kSScUwKDdJg+9BUNmCNj+IdOmR4f0hTgXxDpkchWV3tun2vkQ==" />
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
					<a class='navbar-brand pull-left' href='/'><img
						src="/resources/img/mainlogo.png" /></a>
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
					<a class='navbar-mobile' href='#' id='spot'> <span
						class='menu-item'></span> <span class='menu-item'></span> <span
						class='menu-item'></span>
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

				</div>
			</nav>
		</c:otherwise>
	</c:choose>

	<!------ Body  ------>

	<main id='main'>
		<section class="section-thumb">

			<div class="container text-center">

				<h1>${dto.facltNm }</h1>

				<h4>힐링 A존</h4>

			</div>

		</section>


		<section class="section-list reservation-new">

			<div class="container">

				<div class="back">
					<a href="javascript:history.back()"> <img
						src="https://forcamper.co.kr/assets/icon-back-e0929573c7f49a7b622b7efc95941ff374833ffb40b50020f6ddeeb74004e871.png" />
						예약하기
					</a>
				</div>

				<div class="row">

					<form role="form" class="new_reservation" id="new_reservation"
						action="/confirmRev.rev" accept-charset="UTF-8" method="post">
						<input name="utf8" type="hidden" value="&#x2713;" /><input
							type="hidden" name="authenticity_token"
							value="N17lBQmyImjaxWzXJePmUCSThqhRt0d4Ks+8ChbuZMMTCb8AB7C/afe5F/2+Ug79q7pObtV5HJ4qSNY56AG6Hg==" />

						<div class="col-xs-8 info-wrapper">
							<img
								src="https://www.forcamper.co.kr/rails/active_storage/blobs/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBYkE9IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--40a93ae3832c967b1fed26718b89e27e5ad4b3af/1.jpg" />
							<h2>${dto.facltNm } 힐링 A존</h2>

							<hr>

							<h4>예약 고객 정보 입력</h4>
							<input type="text" name="loginID" value="${loginID}" hidden>

							<div class="form-group">
								<label for="client_name">예약자</label> <input class="form-control"
									type="text" name="client_name" id="client_name" />
							</div>

							<div class="form-group">
								<label for="people_num">투숙인원</label><input
									onkeydown="return showKeyCode(event)" class="form-control"
									type="number" name="people_num" id="people_num" />
							</div>

							<div class="form-group">
								<label for="contact">연락처</label><input value=""
									class="form-control" type="text" name="contact" id="contact" />
							</div>


							<div class="form-group">

								<label for="refund_bank_code">환불받을 은행</label> <select
									id="refund_bank_code" name="refund_bank_code"
									class="form-control" style="width: 30%; display: inline">
									<option value="">--- 선택하세요 ---</option>
									<option value="기업은행">기업은행</option>
									<option value="국민은행">국민은행</option>
									<option value="농협중앙회">농협중앙회</option>
									<option value="우리은행">우리은행</option>
									<option value="제일은행">SC제일은행</option>
									<option value="하나은행">하나은행</option>
									<option value="신한은행">신한은행</option>
									<option value="우체국">우체국</option>
									<option value="카카오뱅크">카카오뱅크</option>
								</select>

							</div>

							<div class="form-group">

								<label for="reservation_refund_bank_code">환불받을 계좌</label> <input
									class="form-control" type="text" name="account_num"
									id="account_num">

							</div>



							<div class="form-group">


								<label for="car_num">차량번호</label> <input class="form-control"
									type="text" name="car_num" id="car_num">

							</div>

							<input value="40000" type="hidden" name="reservation[price]"
								id="reservation_price" />

							<h4 class="pay-title">결제정보</h4>



							<div class="wrapper clearfix">



								<div class="pull-left">
									<div class="form-check">
										<input class="form-check-input" type="radio" value="무통장"
											checked="checked"
											name="reservation[payments_attributes][0][pay_type]"
											id="reservation_payments_attributes_0_pay_type_무통장" /><label
											class="form-check-label"
											for="reservation_payments_attributes_0_pay_type_무통장">무통장</label>
									</div>
								</div>


								<input value="wait_pay" type="hidden"
									name="reservation[payments_attributes][0][status]"
									id="reservation_payments_attributes_0_status" />

							</div>



							<h4 class="cancel-title">취소 규정</h4>


							<table class="table cancel-rule">
								<tbody>
									<tr>
										<td class="bg-gray">입실일 기준 7일전까지 통보시</td>
										<td>입실일 2020-11-01 기준, &nbsp; <span class="f-point">2021-12-24일까지
												통보시</span>
										</td>
										<td>100%환불</td>
									</tr>

									<tr>
										<td class="bg-gray">입실일 기준 6일전~5일전까지 통보시</td>
										<td>입실일 2021-12-31 기준, &nbsp; <span class="f-point">2021-12-26일까지
												통보시</span>

										</td>
										<td>70%환불</td>
									</tr>

									<tr>
										<td class="bg-gray">입실일 기준 4일전까지 통보시</td>
										<td>입실일 2021-12-31 기준, &nbsp; <span class="f-point">2021-12-27일까지
												통보시</span>
										</td>
										<td>50%환불</td>
									</tr>

									<tr>
										<td class="bg-gray">입실일 기준 3일전까지 통보시</td>
										<td>입실일 2021-12-31 기준, &nbsp; <span class="f-point">2021-12-28일까지
												통보시</span>
										</td>
										<td>20%환불</td>
									</tr>

									<tr>
										<td class="bg-gray">입실일 기준 2일전~당일까지 통보시</td>
										<td>입실일 2021-12-31 기준, &nbsp; <span class="f-point">2021-12-31일까지
												통보시</span>
										</td>
										<td>0%환불</td>
									</tr>
								</tbody>
							</table>

							<div class="short-checkbox-wrapper">
								<input type="checkbox" name="agree" id="agree" /> <label>

									<a href='javascript:void(0); '>이용약관</a> 및 <a
									href="javascript:void(0);">개인정보처리방침</a> 안내를 확인하였으며 이에 동의합니다.
								</label>
							</div>

						</div>

						<div class="col-xs-4">

							<div class="submit-box clearfix">

								<div class="date-range">

									<img
										src="https://forcamper.co.kr/assets/icon-calendar-cf15b181e8ce876dfb64a53b687b4d2de0c69fdea95ed73e26a9aedf68d43e9f.png" />


									<span class="form-group"><label for="check_in">${check_in}</label><input
										value="${check_in}" class="form-control" type="hidden"
										name="check_in" id="check_in" /></span>

									<%-- <span id=check_in name="check_in">${check_in}</span> --%>


									~ <span class="form-group"><label for="check_out">${check_out}</label><input
										value="${check_out}" class="form-control" type="hidden"
										name="check_out" id="check_out" /></span>

								</div>

								<hr>

								<ul>

									<li>
										<div class="desc">

											<span class="form-group"><label for="days1">${days}박</label><input
												value="${days}" class="form-control" type="hidden"
												name="days1" id="days1" /></span>
											<!-- <div id="days1" class="form-group"  name="days1" style="text-align:center;"> -->



											<span class="form-group"><label for="days2">${days+1}일</label><input
												value="${days+1}" class="form-control" type="hidden"
												name="days2" id="days2" /></span>


										</div>



										<div class="date-price" class="form-group" name="total_price">
											${days*40000}원</div>
									</li>





								</ul>



								<!--       <script>
                document.getElementById("check_in").onload = function() 

                	
{
    var sdd = document.getElementById("check_in").text;
    var edd = document.getElementById("check_out").text;
    console.log(edd);
    console.log(edd);
    var ar1 = sdd.split('/');
    var ar2 = edd.split('/');
    /* 잘라서 년 / 월 /일 담는다. */
    var da1 = new Date(ar1[0], ar1[1], ar1[2]);
    var da2 = new Date(ar2[0], ar2[1], ar2[2]);
    
    var dif = da2 - da1;
    var cDay = 24 * 60 * 60 * 1000;// 시 * 분 * 초 * 밀리세컨
 /*    var cMonth = cDay * 30;// 월 만듬
    var cYear = cMonth * 12; // 년 만듬 */
 if(sdd && edd){
    document.getElementById('days1').text = parseInt(dif/cDay)
    document.getElementById('days2').text = parseInt(dif/cDay)
 }
}    
                </script> -->

								<hr>

								<div class="clearfix">
									<h5>최종 결제금액</h5>

									<div class="price">${days*40000}원</div>


									<!-- <h5>최종 결제금액</h5> <br> -->
									<div class="form-group date-price">
										<label hidden for="price_total">${days*40000}원</label><input
											type=hidden value="${days*40000}" class="form-control"
											type="text" name="price_total" id="price_total" />
									</div>

									<%-- <div class="price" name="price_total">${days*40000}원
                                        </div> --%>

								</div>

								<!--  <input value="2021/12/31" readonly="readonly" type="hidden" name="reservation[check_in]" id="reservation_check_in" /> 
                    <input value="2022/01/01" readonly="readonly" type="hidden" name="reservation[check_out]" id="reservation_check_out" />
                    
                    <input value="17696" type="hidden" name="reservation[user_id]" id="reservation_user_id" />    
                    <input value="1758" type="hidden" name="reservation[campground_id]" id="reservation_campground_id" />
                    <input value="172" type="hidden" name="reservation[site_id]" id="reservation_site_id" /> -->
								<input type="hidden" value="${dto.facltNm}" name="camp_name" />

								<%-- <input type="hidden" value="${dto.check_in}" name="check_in" id="" />
                                    <input type="hidden" value="${dto.check_out}" name="check_out" id="" />
                                    <input type="hidden" value="${dto.days1}" name="days1" />
                                    <input type="hidden" value="${dto.days2}" name="days2" id="" /> --%>
								<input type="submit" name="commit" value="예약하기"
									class="btn btn-default btn-block" data-disable-with="예약하기" />

							</div>

						</div>

					</form>
				</div>

			</div>

		</section>



		<script>

                    // 숫자만 입력
                    function showKeyCode(event) {
                        event = event || window.event;
                        var keyID = (event.which) ? event.which : event.keyCode;
                        if ((keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 || keyID == 9) {
                            return;
                        } else {
                            return false;
                        }
                    }

                    $('form').on('submit', function (e) {

                        if ($('#client_name').val().trim() == '') {
                            alert('예약자를 입력해주세요.');
                            return false;
                        }

                        if ($('#people_num').val().trim() == '') {
                            alert('투숙인원을 입력해주세요.');
                            return false;
                        }

                        if (parseInt($('#people_num').val().trim()) > parseInt("4")) {
                            alert("최대 숙박인원 4을 초과했습니다.");
                            return false;
                        }

                        if ($('#contact').val().trim() == '') {
                            alert('연락처를 입력해주세요.');
                            return false;
                        }


                        if ($('[name="reservation[payments_attributes][0][pay_type]"]:checked').val() == '무통장' && $('#refund_bank_code').val().trim() == '') {
                            alert('환불받을 은행을 선택해주세요.');
                            return false;
                        }


                        if ($('[name="reservation[payments_attributes][0][pay_type]"]:checked').val() == '무통장' && $('#account_num').val().trim() == '') {
                            alert('환불받을 계좌를 입력해주세요.');
                            return false;
                        }

                        if (!$("#agree")[0].checked) {
                            alert('이용약관 및 개인정보처리방침에 동의해주세요.');
                            return false;
                        }

                        var available_camp_Nm = "${available_camp_Nm}";
                        console.log("${available_camp_Nm}");
                        if (available_camp_Nm <= 0) {
                            console.log(available_camp_Nm);
                            alert("예약이 마감되었습니다. 다른 캠핑장을 선택해주세요.");
                            location.href = "/campList.camp";
                        }


                    });

                </script>

		<!--  뒤로가기-->
		<!-- <script>
        history.pushState(null, null, "http://localhost/confirmRev.rev");
        window.onpopstate = function () {
            history.go(1);
    };
        </script> -->

	</main>
	<!-- footer 시작 구간 -->

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