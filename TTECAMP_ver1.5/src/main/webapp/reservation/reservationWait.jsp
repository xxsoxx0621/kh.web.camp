<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <!DOCTYPE html>
    <html>

    <head>
      <title>떼캠</title>
      <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport'>
      <meta content='IE=edge' http-equiv='X-UA-Compatible'>
      <meta content='telephone=no' name='format-detection'>
      <meta name="csrf-param" content="authenticity_token" />
      <meta name="csrf-token"
        content="kVFwEURSAlZpTdHKEPzwBy5re2QZ1ehy5dYR4ZdeE0q1BioUSlCfV0QxquCLTRiqoUKzop0bs5TlUXvSabHNlw==" />
      <link rel="stylesheet" media="all"
        href="https://forcamper.co.kr/assets/application-28cb6ba1f7597c029b42f54e32f7c21d9ebd4352047ba0c90428928c5d4d8d64.css"
        data-turbolinks-track="reload" />
      <script src='//dapi.kakao.com/v2/maps/sdk.js?appkey=a62178519b79bb5dca01b8072dae1c7a&amp;libraries=services'
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

      
     <link href= "resources/css/index.css" rel="stylesheet">

    </head>

   </head>

       	<body>
			<c:choose>
				<c:when test="${loginID != null}">
					<!----- 로그인 후  header ----->
					<nav class='navbar'>
						<div class='container clearfix text-center'>
							<a class='navbar-brand pull-left' href='/'><img src="/resources/img/mainlogo.png" /></a>
							<!-- <button id=update >DB 업데이트!</button> -->
                  
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
							<a class='navbar-mobile' href='#' id='spot'> <span class='menu-item'></span> <span
									class='menu-item'></span> <span class='menu-item'></span>
							</a>
							
						</div>
					</nav>
				</c:otherwise>
			</c:choose>
			
			<!------ Body  ------>

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
                <h1>완료(입금대기)</h1>
                <div class='bar-sm'></div>
              </div>
              <div class='site-info row'>
                <div class='col-xs-5'>
                  <img
                    src="/resources/img/mainlogo.png" />
                </div>
                <div class='col-xs-7'>
                  <h3>
                    ${dto.facltNm}
                    <br>
                    힐링 A존
                  </h3>
                </div>
              </div>
              <hr>
              <div class='payment-info'>
                <h4>결제 정보</h4>
                <dl>
                  <dt>무통장입금</dt>
                  <dd>국민은행 : 513902-01-243825 (예금주 : 김동휘) </dd>
                  <div class='well'>
                    <img
                      src="https://forcamper.co.kr/assets/icon-ep-6d2da78ecba982acf49ade9d908e7e2fdeb6f231f1aa282c6a8ae80be15466ea.png" />
                    <h5>
                      <span class='f-primary'>2021/12/24일</span>
                      <span>까지</span>
                      <span class='f-primary'>${dto.price_total}원</span>
                      <span>입금해주세요</span>
                    </h5>
                    <h5>입금기한까지 입금이 되지 않는 경우 예약은 자동으로 취소됩니다.</h5>
                  </div>
                </dl>
              </div>
              <div class='user-info'>
                <h4>캠핑장 예약 정보</h4>
                <dl>
                  <dt>체크인/체크아웃</dt>
                  <dd>
                    ${dto.check_in} ~ ${dto.check_out} (${dto.days_total})

                  </dd>
                  <dt>예약자명</dt>
                  <dd>${dto.client_name}</dd>
                  <dt>투숙인원</dt>
                  <dd>${dto.people_num}</dd>
                  <dt>연락처</dt>
                  <dd>${dto.contact}</dd>
                  <dt>차량번호</dt>
                  <dd>${dto.car_num}</dd>
                  <dt>환불받을 은행</dt>
                  <dd>${dto.refund_bank_code}</dd>
                  <dt>환불받을 계좌</dt>
                  <dd>${dto.account_num}</dd>
                  <dt>금액</dt>
                  <dd>${dto.price_total}원</dd>
                </dl>
              </div>
              <div class='cancel-area'>
                <a data-confirm="정말 취소하시겠습니까?" class="btn btn-sm btn-default" rel="nofollow" data-method="post"
                  href="/cancelRev.rev?reservation_id=${dto.reservation_id}">예약취소</a>
              </div>
            </div>
            <div class='text-center'>
              <a class="btn btn-default" href="/myPage.mypage">확인</a>
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
        var result = "${result}";
        if (result == 0) {
          alert("예약이 마감되었습니다. 다른 캠핑장을 선택해주세요.");
          location.href = "/campList.camp";
        }
      </script>
    </body>

    </html>