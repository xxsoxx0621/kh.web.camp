<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

      <!DOCTYPE html>
      <html>

      <head>
         <title>떼캠</title>
         <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport'>
         <link rel="stylesheet" media="all"
            href="https://forcamper.co.kr/assets/application-28cb6ba1f7597c029b42f54e32f7c21d9ebd4352047ba0c90428928c5d4d8d64.css"
            data-turbolinks-track="reload" />

         <script
            src="https://forcamper.co.kr/assets/application-29406dc9afbae6ee15078615178a129129a90f8fae05bcb57acb43d36967fc9c.js"
            data-turbolinks-track="reload"></script>
         <script src='https://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.js'></script>
         <link href='https://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.css' rel='stylesheet'>

         <script src='https://cdn.pannellum.org/2.4/pannellum.js'></script>
         <link href='https://cdn.pannellum.org/2.4/pannellum.css' rel='stylesheet'>

         <script src='https://cdn.jsdelivr.net/momentjs/latest/moment.min.js'></script>
         <link href="/resources/css/campDetail.css" rel="stylesheet">





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
            <section class="section-list campground-show">

               <div class="container">

                  <ol class='breadcrumb'>
                     <li><a href='/'>홈</a></li>
                     <li><a href='/campList.camp'>캠핑장 예약</a></li>
                  </ol>


                  <div class="thumb" style="background-image: url(${dto.firstImageUrl})"></div>

                  <div class="image-wrapper">
                     <!-- @@ -->
                     <!-- <iframe allowfullscreen="" frameborder="0" src="https://www.youtube.com/embed/EhxKe-9UBvo?rel=0&amp;autoplay=0" style="width: 315px; height: 200px; float: right;"></iframe>        
            
            <div class="map-thumb" id="btn-map" style="background-image: url(/rails/active_storage/representations/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBGQT09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--e6d8b8f63cb0540d1576d8dadbaa327e5529529b/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaDdCam9VY21WemFYcGxYM1J2WDJ4cGJXbDBXd2RwQXBJRWFRTFFCdz09IiwiZXhwIjpudWxsLCJwdXIiOiJ2YXJpYXRpb24ifX0=--3dca9d2db46a9778f1ca04ac37b13f43169f43d5/%E1%84%87%E1%85%A2%E1%84%8E%E1%85%B5%E1%84%83%E1%85%A9.png )">
                <div class="map-thumb-inner">
                    <a class="btn btn-default btn-md btn-transparent" href="#">사진보기</a>
                </div>
            </div> -->
                  </div>

                  <div class="info-wrapper">
                     <h1>
                        <img src="/resources/img/mapicon.png" style="width: 50px; height: 50px;" /> ${dto.facltNm}
                        

                     </h1>

                     <h4>${dto.induty}</h4>

                     <h6>
                        <img
                           src="https://forcamper.co.kr/assets/icon-home-1a944cc39a021a7dd860f6d784998fb4ffeab769cc9cce5bf10e270b8df3552d.png" />
                        <a target="_blank" href="https://munsugolcamping.com/"><a href="${dto.homepage}"
                              id="homepage">${dto.homepage}</a></a>
                     </h6>

                     <h6>
                        <img
                           src="https://forcamper.co.kr/assets/icon-phone-3b93eed84fa38d0d502215cb4a59b648d3e32a1a26a6014b69a9343c111fb4be.png" />
                        ${dto.tel}
                     </h6>

                     <h6>
                        <img
                           src="https://forcamper.co.kr/assets/icon-pin-48e0584e118c18fe70a46d8f44a2da5af704b025655ad01dc14ec6787032256a.png" />
                        ${dto.addr1}
                     </h6>

                     <h6>
                        <img
                           src="https://forcamper.co.kr/assets/icon-clock-39172a55e4d66f1a4b84ba506b5014af3baf966e40006ff66f35249940726c49.png" />
                        입실 13:00 / 퇴실 11:00
                     </h6>


                     <h6>
                        <img
                           src="https://forcamper.co.kr/assets/icon-24-a4648cb520668f136ee4f47a2c9f9ca5fde5372e44af8e6933b6bb6248404672.png" />
                        당일 09:00부터 무통장 예약 불가
                     </h6>




                     <div class="tags-wrapper">


                        <div class="btn btn-tag">${dto.posblFcltyCl}</div>

                        
                        
                        <div class="btn btn-tag">${dto.lctCl}</div>

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
                     <%-- <div>
                        <c:if test="${dto.siteBottomCl1 ne '0'}">
                           <div>잔디</div>
                        </c:if>
                        <c:if test="${dto.siteBottomCl2 ne '0'}">
                           <div>파쇄석</div>
                        </c:if>
                        <c:if test="${dto.siteBottomCl3 ne '0'}">
                           <div>데크</div>
                        </c:if>
                        <c:if test="${dto.siteBottomCl4 ne '0'}">
                           <div>자갈</div>
                        </c:if>
                        <c:if test="${dto.siteBottomCl5 ne '0'}">
                           <div>노지</div>
                        </c:if>
                        <c:if test="${dto.animalCmgCl ne '불가능'}">
                           <div>애견동반</div>
                        </c:if>
                        <c:if test="${dto.brazierCl eq '개별'}">
                           <div>화로대</div>
                        </c:if>
                  </div> --%>
                  <!-- @@ -->







               </div>
               </div>
            </section>


            <section class="section-tab">

               <div class="container">

                  <div class="tab-wrapper">

                     <ul class="nav nav-tabs camp-tabs" id="camp-tab" role="tablist">
                        <li class="active li-3" role="presentation"><a aria-controls="info" data-toggle="tab"
                              href="#info" role="tab">캠핑장
                              소개</a></li>

                        <li class="li-3" role="presentation"><a aria-controls="select-area" data-toggle="tab"
                              href="#select-area" role="tab">예약하기</a></li>

                        <li class="li-3" role="presentation"><a aria-controls="review" data-toggle="tab" href="#review"
                              role="tab">이용후기</a></li>
                     </ul>

                  </div>

                  <div class="content-wrapper">

                     <div class="container">

                        <div class="tab-content">

                           <div class="tab-pane active" id="info" role="tabpanel">
                              <div class="text-area">
                                 <p style="text-align: center; line-height: 1;">
                                    <b><span style="font-size: 24px;"><b>캠핑장 이용수칙을
                                             <font color="#ff0000">반드시 확인</font>하시어 <font color="#ff0000">불이익을 받지 않으시도록
                                                꼭 확인</font> 부탁드립니다.<br>
                                             <span style="font-size: 18px;">
                                                <font color="#3984c6">환불
                                                   시 계좌이체 수수료 1,000원을 차감 후 환불</font>됨을 다시 한번 알려드립니다.
                                             </span><br>
                                          </b></span></b>
                                 </p>
                                 <p style="text-align: center; line-height: 1;">
                                    <b><span style="font-size: 24px;"><b><br></b></span></b>
                                 </p>
                                 <p style="text-align: center; line-height: 1;">
                                    <span style="font-size: 24px;"><b style="">
                                          <font color="#ff0000">긴급공지</font><br>
                                          <br>
                                          <font color="#424242">현재 </font>
                                          <font color="#ff0000">호숫가존
                                             앞에 있는 저수지</font>
                                          <font color="#424242">가 </font>
                                          <font color="#ff0000" style="background-color: rgb(255, 255, 255);">공사중이라
                                             물이 빠진 상황</font>
                                          <font color="#424242">입니다.<br>이점
                                          </font>
                                          <font color="#ff0000" style="background-color: rgb(255, 255, 255);">반드시
                                             확인하시고 캠핑장 이용에 참고</font>
                                          <font color="#424242">하시길 부탁드립니다.</font>
                                       </b></span>
                                 </p>
                                 <p style="text-align: center; line-height: 1;">
                                    <br>
                                 </p>
                                 <p style="text-align: center; line-height: 1;">
                                    <b style="font-size: 24px;"><span
                                          style="font-size: 20px; background-color: rgb(255, 255, 255);">${dto.facltNm}
                                          은 <font color="#ff0000">체크아웃 기준 +31일까지만 예약이 가능</font>합니다.
                                       </span></b>
                                 </p>
                                 <p style="text-align: center; line-height: 1;">
                                    <b style="font-size: 24px;"><span style="font-size: 20px;">
                                          <font color="#ff0000">불공정한 방법</font>을 통해<font color="#ff0000">
                                             예약(31일 이전 예약)</font>을 하신 경우<font color="#ff0000"> 미통보 자동취소
                                          </font>됩니다.<br>
                                          <font color="#ff0000">&nbsp; &nbsp; &nbsp; &nbsp;
                                             &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</font>
                                       </span></b>
                                 </p>
                                 
                                 	<!-- 애견 동반 가능할시 -->
								<c:if test="${dto.animalCmgCl ne '불가능'}">
									<p style="text-align: center; line-height: 1;">
										<b style="font-size: 24px;">애견 동반<font color="#ff0000">&nbsp;공지<br>
											<br></font></b><b style="font-size: 24px;"><span
											style="font-size: 20px;">${dto.facltNm} 힐링캠핑장이 2021년 9월 01일부로 전
												구역 애견 동반(10kg 미만)이 가능합니다.<br>또한 애견 동반시 반드시 캠핑장 내에서 <span
												style="background-color: rgb(255, 255, 0);">항상 목줄을 착용</span>하고
												있어야 합니다.
										</span></b>
									</p>
									</c:if>
									
									<c:if test="${dto.animalCmgCl eq '불가능'}">
									<p style="text-align: center; line-height: 1;">
										<b style="font-size: 24px;">애견 동반<font color="#ff0000">&nbsp;불가능<br>
											<br></font></b><b style="font-size: 24px;"><span
											style="font-size: 20px;">${dto.facltNm} 은 
												구역 애견 동반이 불가능합니다.</b>
									</p>
									</c:if>
									
									<!--애견 동반 가능할시 끝  -->
									
                                 <p style="text-align: center; line-height: 1;">
                                    <img
                                       src="http://forcamper.co.kr/rails/active_storage/blobs/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBZ1FCIiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--cc6fa336ac2ee0846a993ee0338e6e977feddfe7/%EB%8C%80%EC%A7%80%201-10.jpg"
                                       style="width: 1065px;"><br>
                                 </p>
                                 <p style="text-align: center;">
                                    <br>
                                 </p>
                                 <p style="text-align: center;">
                                    <b style="color: rgb(255, 0, 0); font-size: 24px;">코로나
                                       바이러스의 사회적 거리두기 2.5단계 강화된 조치에 따라</b>
                                 </p>
                                 <p style="text-align: center;">
                                    <b style="color: rgb(255, 0, 0); font-size: 24px;">1 사이트당
                                       4인 이하의 인원만 캠핑이 가능하며 되도록이면 직계 가족끼리만 캠핑을 즐기시길 요청드립니다.</b>
                                 </p>
                                 <p style="text-align: center;">
                                    <br>
                                 </p>
                                 <p>
                                    <b>
                                       <font face="Arial"><span lang="EN-US"
                                             style="letter-spacing: 0pt; font-size: 16px;">&lt;</span><span
                                             style="font-size: 16px;">${dto.facltNm}</span><span lang="EN-US"
                                             style="letter-spacing: 0pt; font-size: 16px;">&gt;</span></font>
                                    </b>
                                 </p>
                                 <p>
                                    <font face="Arial"><span lang="EN-US" style="font-size: 16px;"></span><span
                                          style="font-size: 16px;">${dto.facltNm}은 산과 저수지에 둘러 쌓인 천혜의
                                          자연 환경을 가지고 있는 보기 드문 자연친화형 캠핑장입니다</span><span lang="EN-US"
                                          style="letter-spacing: 0pt; font-size: 16px;">.</span></font>
                                 </p>
                                 <p>
                                    <font face="Arial"><span style="font-size: 16px;">${dto.facltNm}
                                         은 수십 그루의 고목들이 제공하는 그늘과 아름다운 풍경 속에서 도심 속의 삶에 지친 여러분들에게
                                          최고의 힐링을 선물해 드릴 것입니다</span><span lang="EN-US"
                                          style="letter-spacing: 0pt; font-size: 16px;">.</span></font>
                                 </p>
                                 <p>
                                    <br>
                                 </p>
                                 <p>
                                    <b>
                                       <font face="Arial"><span lang="EN-US"
                                             style="letter-spacing: 0pt; font-size: 16px;">&lt;</span><span
                                             style="font-size: 16px;">캠핑장 특징</span><span lang="EN-US"
                                             style="letter-spacing: 0pt; font-size: 16px;">&gt;</span></font>
                                    </b>
                                 </p>
                                 <p>
                                    <font face="Arial"><span lang="EN-US"
                                          style="letter-spacing: 0pt; font-size: 16px;">1.&nbsp;</span><span
                                          style="font-size: 16px;">캠핑장 전면에 저수지가 있고 캠핑장이 산으로 둘러
                                          쌓여 있으며 캠핑장 내에 고목들이 즐비한 자연친 캠핑장입니다</span><span lang="EN-US"
                                          style="letter-spacing: 0pt; font-size: 16px;">.</span></font>
                                 </p>
                                 <p>
                                    <font face="Arial"><span lang="EN-US"
                                          style="letter-spacing: 0pt; font-size: 16px;">2.&nbsp;</span><span
                                          style="font-size: 16px;">맛집으로 유명한 산장부지에 캠핑장을 오픈하여 캠핑을
                                          즐김과 동시에 맛있는 음식도 즐길 수 있는 캠핑장입니다</span><span lang="EN-US"
                                          style="letter-spacing: 0pt; font-size: 16px;">.</span></font>
                                 </p>
                                 <p>
                                    <font face="Arial"><span lang="EN-US"
                                          style="letter-spacing: 0pt; font-size: 16px;">3.&nbsp;</span><span
                                          style="font-size: 16px;">사장님이 항상 상주해 있어 고객분들의 편의를 위해
                                          최선을 다하고 있는 캠핑장입니다</span><span lang="EN-US"
                                          style="letter-spacing: 0pt; font-size: 16px;">.&nbsp;</span><span
                                          style="font-size: 16px;">현장에서 유동적으로 사이트 변경을 상의 하실 수
                                          있습니다</span><span lang="EN-US"
                                          style="letter-spacing: 0pt; font-size: 16px;">.</span></font>
                                 </p>
                                 <p>
                                    <font face="Arial"><span lang="EN-US"
                                          style="letter-spacing: 0pt; font-size: 16px;">4.&nbsp;</span><span
                                          style="font-size: 16px;">근교에 문수산 자연휴양림</span><span lang="EN-US"
                                          style="letter-spacing: 0pt; font-size: 16px;">,&nbsp;</span><span
                                          style="font-size: 16px;">강화도</span><span lang="EN-US"
                                          style="letter-spacing: 0pt; font-size: 16px;">,&nbsp;</span><span
                                          style="font-size: 16px;">대명항 등이 있어 관광을 즐기기에도 적합합니다</span><span lang="EN-US"
                                          style="letter-spacing: 0pt; font-size: 16px;">.</span></font>
                                 </p>
                                 <p>
                                    <span lang="EN-US"
                                       style="letter-spacing: 0pt; font-family: Arial; font-size: 16px;">5.&nbsp;</span><span
                                       style="font-family: Arial; font-size: 16px;">지속적으로 고객
                                       분들을 위한 물품과 장비를 도입하고 있습니다</span><span lang="EN-US"
                                       style="letter-spacing: 0pt; font-family: Arial; font-size: 16px;">.</span>
                                 </p>
                                 <p>
                                    <span lang="EN-US"
                                       style="letter-spacing: 0pt; font-family: Arial; font-size: 16px;"><br></span>
                                 </p>
                                 <p>
                                    <span lang="EN-US"
                                       style="letter-spacing: 0pt; font-family: Arial; font-size: 16px;"><b>&lt;예약안내&gt;</b></span>
                                 </p>
                                 <p>
                                    <span lang="EN-US"
                                       style="letter-spacing: 0pt; font-family: Arial; font-size: 16px;">1.
                                       체크아웃 기준 3개월 후 까지 예약이 가능합니다.&nbsp;</span>
                                 </p>
                                 <p>
                                    <span lang="EN-US"
                                       style="letter-spacing: 0pt; font-family: Arial; font-size: 16px;">2.&nbsp;예약취소시
                                       이체수수료로 1,000원을 제외하고 환불해드립니다.&nbsp; 신중한 예약 부탁드립니다. (단, 환불 수수료
                                       발생 시 이체수수료 없음)</span>
                                 </p>
                                 <p>
                                    <span lang="EN-US"
                                       style="letter-spacing: 0pt; font-family: Arial; font-size: 16px;"><b><br></b>&nbsp;<b><br></b></span>
                                 </p>
                                 <p>
                                    <b>
                                       <font face="Arial"><span lang="EN-US"
                                             style="letter-spacing: 0pt; font-size: 16px;">&lt;</span><span
                                             style="font-size: 16px;">판매물품</span><span lang="EN-US"
                                             style="letter-spacing: 0pt; font-size: 16px;">&gt;</span></font>
                                    </b>
                                 </p>
                                 <p>
                                    <font face="Arial"><span lang="EN-US"
                                          style="letter-spacing: 0pt; font-size: 16px;">1.&nbsp;</span><span
                                          style="font-size: 16px;">식료품 및 장작&nbsp;</span><span lang="EN-US"
                                          style="letter-spacing: 0pt; font-size: 16px;">(</span><span
                                          style="font-size: 16px;">매점오픈</span><span lang="EN-US"
                                          style="letter-spacing: 0pt; font-size: 16px;">)</span></font>
                                 </p>
                                 <p>
                                    <font face="Arial"><span lang="EN-US"
                                          style="letter-spacing: 0pt; font-size: 16px;">2.&nbsp;</span><span
                                          style="font-size: 16px;">산장 식사 메뉴&nbsp;</span><span lang="EN-US"
                                          style="letter-spacing: 0pt; font-size: 16px;">(</span><span
                                          style="font-size: 16px;">조리</span><span lang="EN-US"
                                          style="letter-spacing: 0pt; font-size: 16px;">,&nbsp;</span><span
                                          style="font-size: 16px;">비조리 선택 가능</span><span lang="EN-US"
                                          style="letter-spacing: 0pt; font-size: 16px;">)</span></font>
                                 </p>
                                 <p>
                                    <font face="Arial"><span style="font-size: 16px;"></span><span
                                          style="font-size: 16px;">&nbsp;</span><span style="font-size: 16px;"></span>
                                       <o:p></o:p>
                                    </font>
                                 </p>
                                 <p>
                                    <b>
                                       <font face="Arial"><span lang="EN-US"
                                             style="letter-spacing: 0pt; font-size: 16px;">&lt;힐링
                                             A존</span><span lang="EN-US"
                                             style="letter-spacing: 0pt; font-size: 16px;">&gt;</span></font>
                                    </b>
                                 </p>
                                 <p>
                                    <font face="Arial"><span style="font-size: 16px;">본관구역이
                                          힐링 A존으로 이름이 변경 되었습니다.</span></font>
                                 </p>
                                 <p>
                                    <font face="Arial"><span style="font-size: 16px;">또한
                                          전화 예약으로 받던 사이트를 정식으로 오픈하였습니다.</span></font>
                                 </p>
                                 <p>
                                    <font face="Arial"><span style="font-size: 16px;"></span><span
                                          style="font-size: 16px;">&nbsp;</span><span style="font-size: 16px;"></span>
                                       <o:p></o:p>
                                    </font>
                                 </p>
                                 <p>
                                    <b>
                                       <font face="Arial"><span lang="EN-US"
                                             style="letter-spacing: 0pt; font-size: 16px;">&lt;힐링
                                             B존</span><span lang="EN-US"
                                             style="letter-spacing: 0pt; font-size: 16px;">&gt;</span></font>
                                    </b>
                                 </p>
                                 <p>
                                    <font face="Arial"><span style="font-size: 16px;">별관구역이
                                          힐링 B존으로 이름이 변경 되었습니다.</span></font>
                                 </p>
                                 <p>
                                    <font face="Arial"><span style="font-size: 16px;">힐링
                                          B존은 전체 구역이 <b>차박이 가능</b>합니다.
                                       </span></font>
                                 </p>
                                 <p>
                                    <font face="Arial"><span style="font-size: 16px;">힐링
                                          B존에는 몽골텐트&nbsp;</span><span lang="EN-US"
                                          style="letter-spacing: 0pt; font-size: 16px;">4</span><span
                                          style="font-size: 16px;">동(1~4번 사이트)이 설치 되어있고</span><span lang="EN-US"
                                          style="letter-spacing: 0pt; font-size: 16px;">,&nbsp;</span><span
                                          style="font-size: 16px;">잔디가 깔려 있어 자연 속의 캠핑의 느낌을 더욱 더
                                          만끽 하실 수 있습니다</span><span lang="EN-US"
                                          style="letter-spacing: 0pt; font-size: 16px;">.</span></font>
                                 </p>
                                 <p>
                                    <span lang="EN-US" style="letter-spacing: 0pt; font-size: 16px;">
                                       <font face="Arial">힐링 B존의 3, 4번 사이트는 진입로가 협소하여 되도록이면 대단위
                                          고객분들이 동시 예약으로 사용해주시면 감사하겠습니다. (3번 4번 동시 예약으로 총 12m * 8m 동시
                                          사용)</font>
                                    </span>
                                 </p>
                                 <p>
                                    <font face="Arial"><span style="font-size: 16px;"></span><span
                                          style="font-size: 16px;">&nbsp;</span><span style="font-size: 16px;"></span>
                                       <o:p></o:p>
                                    </font>
                                 </p>
                                 <p>
                                    <b>
                                       <font face="Arial"><span lang="EN-US"
                                             style="letter-spacing: 0pt; font-size: 16px;">&lt;</span><span
                                             style="font-size: 16px;">시냇가 C존</span><span lang="EN-US"
                                             style="letter-spacing: 0pt; font-size: 16px;">&gt;</span></font>
                                    </b>
                                 </p>
                                 <p>
                                    <b>
                                       <font face="Arial"><span lang="EN-US"
                                             style="letter-spacing: 0pt; font-size: 16px;">시냇가 C존은
                                             전체 사이트가 차박이 가능합니다.</span></font>
                                    </b>
                                 </p>
                                 <p>
                                    <font face="Arial"><span style="font-size: 16px;">시냇가
                                          C존의&nbsp;</span><span lang="EN-US"
                                          style="letter-spacing: 0pt; font-size: 16px;">5,6,7</span><span
                                          style="font-size: 16px;">번 사이트는 캠핑트레일러가 주차 및 사용이 가능합니다</span><span
                                          lang="EN-US" style="letter-spacing: 0pt; font-size: 16px;">.&nbsp;</span><span
                                          style="font-size: 16px;">예약 하신 뒤 현장에서 전기사용료가 포함된&nbsp;</span><span
                                          lang="EN-US" style="letter-spacing: 0pt; font-size: 16px;">1</span><span
                                          style="font-size: 16px;">만원을 추가 결제해주시면 됩니다</span><span lang="EN-US"
                                          style="letter-spacing: 0pt; font-size: 16px;">.</span></font>
                                 </p>
                                 <p>
                                    <br>
                                 </p>
                                 <p>
                                    <span lang="EN-US" style="letter-spacing: 0pt; font-size: 16px;"><b>
                                          <font face="Arial">&lt;호숫가 D-1, D-2존&gt;</font>
                                       </b></span>
                                 </p>
                                 <p>
                                    <span lang="EN-US" style="letter-spacing: 0pt; font-size: 16px;"><b>
                                          <font face="Arial">호숫가 D존은 2, 4, 6, 9, 10, 11, 12, 13, 15,
                                             16, 17, 18, 19, 20번 사이트가 차박이 가능합니다.<br>또한 2, 4, 17,
                                             18, 19, 20번 사이트에는 카라반 주차가 가능합니다.
                                          </font>
                                       </b></span>
                                 </p>
                                 <p>
                                    <span lang="EN-US" style="letter-spacing: 0pt; font-size: 16px;">
                                       <font face="Arial">호숫가 D존은 아름다운 저수지 옆에 파쇄석으로 이루어진 사이트입니다. <b>(전
                                             사이트 파쇄석으로 교체 완료)&nbsp;</b></font>
                                    </span>
                                 </p>
                                 <p>
                                    <span lang="EN-US" style="letter-spacing: 0pt; font-size: 16px;">
                                       <font face="Arial">호숫가 구역의 1, 2번 사이트에는 몽골텐트가 설치 되어 있습니다.</font>
                                    </span>
                                 </p>
                                 <p>
                                    <font face="Arial"><span style="font-size: 16px;"></span><span
                                          style="font-size: 16px;">&nbsp;</span><span style="font-size: 16px;"></span>
                                       <o:p></o:p>
                                    </font>
                                 </p>
                                 <p>
                                    <b>
                                       <font face="Arial"><span lang="EN-US"
                                             style="letter-spacing: 0pt; font-size: 16px;">&lt;</span><span
                                             style="font-size: 16px;">유의사항</span><span lang="EN-US"
                                             style="letter-spacing: 0pt; font-size: 16px;">&gt;</span></font>
                                    </b>
                                 </p>
                                 <p>
                                    <font face="Arial"><span lang="EN-US"
                                          style="letter-spacing: 0pt; font-size: 16px;"><b>1.
                                             ${dto.facltNm}의 구역명이 모두 변경되었습니다. 확인 후 이용 부탁드리겠습니다.</b></span></font>
                                 </p>
                                 <p>
                                    <font face="Arial"><span lang="EN-US"
                                          style="letter-spacing: 0pt; font-size: 16px;"><b>2.
                                             오후 11시 부터 오전 6시까지는 매너타임 입니다. 이 시간 동안은 캠핑장 출구를 폐쇄합니다.</b></span></font>
                                 </p>
                                 <p>
                                    <font face="Arial"><b><span lang="EN-US"
                                             style="letter-spacing: 0pt; font-size: 16px;">3.&nbsp;</span><span
                                             style="font-size: 16px;">애완견 출입 시 10kg의 크기만 가능하며 목줄은
                                             항상 착용하고 있어야 합니다. (애견 동반 구역은 A, B, C, D-1존입니다.)</span></b></font>
                                 </p>
                                 <p>
                                    <span lang="EN-US"
                                       style="font-family: Arial; letter-spacing: 0pt; font-size: 16px;">4.&nbsp;</span><span
                                       style="font-family: Arial; font-size: 16px;">시냇가
                                       사이트&nbsp;</span><span lang="EN-US"
                                       style="font-family: Arial; letter-spacing: 0pt; font-size: 16px;">5,6,7</span><span
                                       style="font-family: Arial; font-size: 16px;">번 캠핑트레일러
                                       사용가능 및 예약 시 현장&nbsp;</span><span lang="EN-US"
                                       style="font-family: Arial; letter-spacing: 0pt; font-size: 16px;">1</span><span
                                       style="font-family: Arial; font-size: 16px;">만원 추가 결제</span><br>
                                 </p>
                                 <p>
                                    <font face="Arial"><span style="font-size: 16px;">5.
                                          캠핑장 내부에는 고목들이 많이 있습니다. (벚꽃나무, 버찌나무 등등) <b>나무 열매, 꽃 등의
                                             낙하로 인해 장비(텐트, 타프 등)가 오염 및 파손 될 수 있습니다.</b><br>&nbsp;
                                          &nbsp; 반드시 이점 유의하시기 바라며&nbsp;<b>${dto.facltNm}에 서는 열매, 꽃등으로 인한
                                             장비 파손 및 오염에 대해 어떠한 법적 책임도 지지 않습니다.</b>
                                       </span></font>
                                 </p>
                                 <p>
                                    <br>
                                 </p>
                                 <p>
                                    <font face="Arial"></font>
                                 </p>
                                 <p>
                                    <span style="font-family: Arial; font-size: 16px;">&nbsp;</span><br>
                                 </p>
                                 <p>
                                    <b>
                                       <font face="Arial"><span lang="EN-US"
                                             style="letter-spacing: 0pt; font-size: 16px;">&lt;</span><span
                                             style="font-size: 16px;">예약자 혜택</span><span lang="EN-US"
                                             style="letter-spacing: 0pt; font-size: 16px;">&gt;</span></font>
                                    </b>
                                 </p>
                                 <p>
                                    <font face="Arial"><span lang="EN-US"
                                          style="letter-spacing: 0pt; font-size: 16px;">1.&nbsp;</span><span
                                          style="font-size: 16px;">종량제 쓰래기봉투 제공</span></font>
                                 </p>
                                 <p>
                                    <span lang="EN-US" style="letter-spacing: 0pt; font-size: 16px;"><b>
                                          <font face="Arial"></font>
                                       </b></span>
                                 </p>
                                 <p>
                                    <font face="Arial"><span lang="EN-US"
                                          style="letter-spacing: 0pt; font-size: 16px;">2.&nbsp;</span><span
                                          style="font-size: 16px;">의자</span><span lang="EN-US"
                                          style="letter-spacing: 0pt; font-size: 16px;">,&nbsp;</span><span
                                          style="font-size: 16px;">버너 등 산장에서 구비하고 있는 물품을 대여해드립니다</span><span
                                          lang="EN-US" style="letter-spacing: 0pt; font-size: 16px;">.</span></font>
                                 </p>
                              </div>
                           </div>

                           <div class="tab-pane" id="select-area" role="tabpanel">

                              <ul class="camping-list">



                                 <li>
                                    <div class="thumb"
                                       style="background-image: url(/rails/active_storage/representations/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBWms9IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--9e28af0fb1af6eb0fd13ebd56bed8a8a2532209f/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaDdCam9VY21WemFYcGxYM1J2WDJ4cGJXbDBXd2RwQXBJRWFRTFFCdz09IiwiZXhwIjpudWxsLCJwdXIiOiJ2YXJpYXRpb24ifX0=--3dca9d2db46a9778f1ca04ac37b13f43169f43d5/%E1%84%92%E1%85%B5%E1%86%AF%E1%84%85%E1%85%B5%E1%86%BC_A%E1%84%8C%E1%85%A9%E1%86%AB.jpg)">
                                    </div>
                                    <div class="site-count">
                                       <span class="count">잔여: ${available_camp_Nm}</span>
                                    </div>
                                    <div class="body body-long ">
                                       <a
                                          href="/area.rev?contentId=${dto.contentId}">
                                          <h4 class="normal">힐링 A존</h4>
                                          <p class="address">풍성한 나무그늘과 아늑한 몽골텐트가 있고 각종 편의시설이 가까운
                                             힐링 A존</p>
                                          <div class="price h4">
                                             <span class="f-primary">40,000원</span>


                                          </div>

                                          <div class="labels" style="position: relative">


                                             <span class='label-orange gray'>연박할인</span>
                                          </div>

                                       </a>

                                    </div>

                                 </li>


                                 <li>
                                    <div class="thumb"
                                       style="background-image: url(/rails/active_storage/representations/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBWHc9IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--290fbe79b56ce2af27d1d34c3e6beb3c0fba8270/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaDdCam9VY21WemFYcGxYM1J2WDJ4cGJXbDBXd2RwQXBJRWFRTFFCdz09IiwiZXhwIjpudWxsLCJwdXIiOiJ2YXJpYXRpb24ifX0=--3dca9d2db46a9778f1ca04ac37b13f43169f43d5/%E1%84%92%E1%85%B5%E1%86%AF%E1%84%85%E1%85%B5%E1%86%BC_B%E1%84%8C%E1%85%A9%E1%86%AB.jpg)">
                                    </div>
                                    <div class="site-count">
                                       <span class="count">잔여: 0 </span>
                                    </div>


                                    <div class="body body-long ">

                                      

                                          <h4 class="normal">힐링 B존</h4>

                                          <p class="address">시냇가와 잔디가 있는 힐링 B존 (전 사이트 차박 가능)</p>

                                          <div class="price h4">

                                             <span class="f-primary">40,000원 ~ 45,000원</span>


                                          </div>

                                          <div class="labels" style="position: relative">


                                             <span class='label-orange gray'>연박할인</span>
                                          </div>


                                    </div>

                                 </li>


                                 <li>
                                    <div class="thumb"
                                       style="background-image: url(/rails/active_storage/representations/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBhZz09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--6475394118a8ee4e97fda705d5d239f3043c789b/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaDdCam9VY21WemFYcGxYM1J2WDJ4cGJXbDBXd2RwQXBJRWFRTFFCdz09IiwiZXhwIjpudWxsLCJwdXIiOiJ2YXJpYXRpb24ifX0=--3dca9d2db46a9778f1ca04ac37b13f43169f43d5/%E1%84%89%E1%85%B5%E1%84%82%E1%85%A2%E1%86%BA%E1%84%80%E1%85%A1_C%E1%84%8C%E1%85%A9%E1%86%AB.jpg)">
                                    </div>
                                    <div class="site-count">
                                       <span class="count">잔여: 0 </span>
                                    </div>


                                    <div class="body body-long ">

                                       

                                          <h4 class="normal">시냇가 C존</h4>

                                          <p class="address">시원하게 흐르는 시냇가 옆에 캠핑이 가능한 존 (전 사이트 차박
                                             가능, 4~7 카라반 주차 가능)</p>

                                          <div class="price h4">

                                             <span class="f-primary">40,000원 ~ 45,000원</span>


                                          </div>

                                          <div class="labels" style="position: relative">


                                             <span class='label-orange gray'>연박할인</span>
                                          </div>


                                    </div>

                                 </li>


                                 <li>
                                    <div class="thumb"
                                       style="background-image: url(/rails/active_storage/representations/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBWZz09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--79d1a50cb52704d67e4f15e8430a37b1435cb111/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaDdCam9VY21WemFYcGxYM1J2WDJ4cGJXbDBXd2RwQXBJRWFRTFFCdz09IiwiZXhwIjpudWxsLCJwdXIiOiJ2YXJpYXRpb24ifX0=--3dca9d2db46a9778f1ca04ac37b13f43169f43d5/26.jpg)">
                                    </div>
                                    <div class="site-count">
                                       <span class="count">잔여: 0 </span>
                                    </div>


                                    <div class="body body-long ">

                                    

                                          <h4 class="normal">호숫가 D-1 존</h4>

                                          <p class="address">시냇가와 호수가 보이는 호숫가 D-1존 (2, 4, 6번 사이트
                                             차박 가능 2, 4번 사이트 카라반 주차 가능)</p>

                                          <div class="price h4">

                                             <span class="f-primary">40,000원 ~ 45,000원</span>


                                          </div>

                                          <div class="labels" style="position: relative">


                                             <span class='label-orange gray'>연박할인</span>
                                          </div>

                                    

                                    </div>

                                 </li>


                                 <li>
                                    <div class="thumb"
                                       style="background-image: url(/rails/active_storage/representations/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBNUT09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--8dcccc35b5b761356c41de31b443edbeb799b2b4/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaDdCam9VY21WemFYcGxYM1J2WDJ4cGJXbDBXd2RwQXBJRWFRTFFCdz09IiwiZXhwIjpudWxsLCJwdXIiOiJ2YXJpYXRpb24ifX0=--3dca9d2db46a9778f1ca04ac37b13f43169f43d5/%E1%84%92%E1%85%A9%E1%84%89%E1%85%AE%E1%86%BA%E1%84%80%E1%85%A1%E1%84%8A%E1%85%A5%E1%86%B7%E1%84%82%E1%85%A6%E1%84%8B%E1%85%B5%E1%86%AF.jpg)">
                                    </div>
                                    <div class="site-count">
                                       <span class="count">잔여: 0 </span>
                                    </div>


                                    <div class="body body-long ">              
                                          <h4 class="normal">호숫가 D-2 존</h4>
                                          <p class="address">아름다운 저수지가 눈 앞에 펼쳐져 있는 구역(9~13, 15~20
                                             차박가능 17~20 카라반 주차 가능)</p>
                                          <div class="price h4">
                                             <span class="f-primary">45,000원 ~ 50,000원</span>
                                          </div>
                                          <div class="labels" style="position: relative">
                                             <span class='label-orange gray'>연박할인</span>
                                          </div>
                                    </div>
                                 </li>
                              </ul>
                           </div>

                           <div class="comments-wrapper tab-pane" id="review" role="tabpanel">
                              <h3>이용 후기</h3>
                              <div class='comment-form'>
                                 <div class="form-group">
                                    <label class="sr-only" for="comment_body">내용</label>
                                    <textarea placeholder="의견을 작성해주세요" id="contents"></textarea>
                                 </div>
                                 <c:choose>
                                    <c:when test="${loginID != null }">
                                       <input type="button" class="btn btn-primary" id="add-review" value="등록하기">
                                    </c:when>
                                    <c:otherwise>
                                       <input type="button" class="btn btn-primary" id="noMemReviewBtn" value="등록하기">
                                    </c:otherwise>
                                 </c:choose>
                              </div>
                              <ul class='comments'>
                                 <li class='comment' id='comment_63'>
                                    <div class='clearfix' id="review_container">
                                       <c:forEach var="item" items="${reviewList}">
                                          <div class='comment-info'>
                                             <div class='name'>${item.user_id}</div>
                                             <div class='date'>${item.write_date}</div>
                                          </div>
                                          <div class='comment-body'>
                                             <div class='body'>${item.contents}</div>
                                          </div>
                                       </c:forEach>
                                    </div>
                                 </li>

                                 <script>
                                    $("#add-review").on("click", function () {
                                       if($("#contents").val() == ""){
                                          alert("내용을 입력해주세요.")
                                       } else{
                                          $.ajax({
                                          url: "/addReview.review",
                                          data: {
                                             contents: $("#contents").val(),
                                             contentId: "${dto.contentId}",
                                             loginID: "${loginID}"
                                          },
                                          dataType: "json"
                                       }).done(function (ResponseResult) {

                                          console.log(ResponseResult);
                                          console.log(ResponseResult.length);

                                          $("#review_container > div").remove();

                                          let chatBox = $("<div>");

                                          for (let i = 0; i < ResponseResult.length; i++) {


                                             let review_id = $("<div id='review_id' class='name'>");
                                             review_id.append(ResponseResult[i].user_id);

                                             let review_date = $("<div id='review_date' class='date'>");
                                             review_date.append(ResponseResult[i].write_date);

                                             let review_content = $("<div id='review_content' class='body'>");
                                             review_content.append(ResponseResult[i].contents);

                                             let comment_info = $("<div class='comment-info'>");
                                             comment_info.append(review_id);
                                             comment_info.append(review_date);

                                             let comment_body = $("<div class='comment-body'>");
                                             comment_body.append(review_content);

                                             $("#review_container").append(comment_info);
                                             $("#review_container").append(comment_body);
                                          }
                                          $("#contents").val("");
                                       })
                                       }
                                       
                                    })
                                 </script>
                                 <script>
                                 $("#noMemReviewBtn").on("click", function(){
                                	 alert("로그인이 필요한 페이지입니다.");
                                     location.href = "/login.mem";                                	 
                                 })
                                 </script>
                                 <script>
                                    $(function () {
                                       $('.comment-edit-form').hide();
                                       $('.sub-comment-new-form').hide();
                                       $('.comment-edit-btn').on('click', function (e) {
                                          e.preventDefault();
                                          var comment_id = $(this).data('comment-id');
                                          $('#comment_' + comment_id).find('.comment-edit-form').first().toggle('show');
                                       });

                                       $('.sub-comment-new-btn').on('click', function (e) {
                                          e.preventDefault();
                                          var comment_id = $(this).data('comment-id');
                                          $('#comment_' + comment_id).find('.sub-comment-new-form').toggle('show');
                                       });

                                       $('.submit-comment-btn').on('click', function (e) {
                                          if (!$(this).closest('form').find('#comment_body').val().trim()) {
                                             alert('댓글 내용을 입력해주세요');
                                             return false;
                                          }
                                       });

                                       $('.comment-filter a').on('click', function () {
                                          $('a[data-target="' + $(this).attr('aria-controls') + '"]').tab('show');
                                       });
                                    });
                                 </script>

                           </div>

                        </div>

                     </div>

                  </div>

               </div>

            </section>




            <div aria-hidden="true" aria-labelledby="myModalLabel" class="modal fade" id="SliderModal" role="dialog"
               tabindex="-1">

               <div class="modal-dialog">

                  <div class="modal-content">

                     <div class="modal-header">

                        <button aria-label="Close" class="close" data-dismiss="modal" type="button">
                           <span aria-hidden="true">×</span>
                        </button>

                     </div>

                     <div class="modal-body">

                        <div class="tab-wrapper">

                           <ul role="tablist">


                           </ul>

                        </div>

                        <div class="tab-content">

                           <h2 class="modal-title" id="myModalLabel">${dto.facltNm}</h2>


                           <div class="tab-pane active" id="img" role="tabpanel">
                              <div class="fotorama" data-maxheight="100%" data-maxwidth="1000" data-minheight="300"
                                 data-minwidth="300" data-nav="thumbs" data-ratio="700/467" data-width="100%">
                                 <img
                                    src="/rails/active_storage/representations/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBGZz09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--beb75dcd0e9f9f1cd6330f89312e3a93dc400459/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaDdCam9VY21WemFYcGxYM1J2WDJ4cGJXbDBXd2RwQXBJRWFRTFFCdz09IiwiZXhwIjpudWxsLCJwdXIiOiJ2YXJpYXRpb24ifX0=--3dca9d2db46a9778f1ca04ac37b13f43169f43d5/1.JPG">
                                 <img
                                    src="/rails/active_storage/representations/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBGdz09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--406b9b6178d238380a69d4efaba0f4eaf7e88e28/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaDdCam9VY21WemFYcGxYM1J2WDJ4cGJXbDBXd2RwQXBJRWFRTFFCdz09IiwiZXhwIjpudWxsLCJwdXIiOiJ2YXJpYXRpb24ifX0=--3dca9d2db46a9778f1ca04ac37b13f43169f43d5/2.jpg">
                                 <img
                                    src="/rails/active_storage/representations/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBHQT09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--4cdc2ae9fd1bbebef582c175accb455bd40f526e/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaDdCam9VY21WemFYcGxYM1J2WDJ4cGJXbDBXd2RwQXBJRWFRTFFCdz09IiwiZXhwIjpudWxsLCJwdXIiOiJ2YXJpYXRpb24ifX0=--3dca9d2db46a9778f1ca04ac37b13f43169f43d5/3.jpg">
                                 <img
                                    src="/rails/active_storage/representations/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBHUT09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--20796cebef29e0e8af9e3aca80e250915926574f/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaDdCam9VY21WemFYcGxYM1J2WDJ4cGJXbDBXd2RwQXBJRWFRTFFCdz09IiwiZXhwIjpudWxsLCJwdXIiOiJ2YXJpYXRpb24ifX0=--3dca9d2db46a9778f1ca04ac37b13f43169f43d5/4.jpg">
                                 <img
                                    src="/rails/active_storage/representations/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBHZz09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--d849761e2414b40a215ef46047437b4db0859ba4/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaDdCam9VY21WemFYcGxYM1J2WDJ4cGJXbDBXd2RwQXBJRWFRTFFCdz09IiwiZXhwIjpudWxsLCJwdXIiOiJ2YXJpYXRpb24ifX0=--3dca9d2db46a9778f1ca04ac37b13f43169f43d5/5.jpg">
                                 <img
                                    src="/rails/active_storage/representations/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBHdz09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--279c42e490eddb7f2d3e751d12cc5dd17e2737dd/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaDdCam9VY21WemFYcGxYM1J2WDJ4cGJXbDBXd2RwQXBJRWFRTFFCdz09IiwiZXhwIjpudWxsLCJwdXIiOiJ2YXJpYXRpb24ifX0=--3dca9d2db46a9778f1ca04ac37b13f43169f43d5/6.jpg">
                                 <img
                                    src="/rails/active_storage/representations/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBIQT09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--3276856f9b7e9535f8c2a42a09120c0ea0039b1f/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaDdCam9VY21WemFYcGxYM1J2WDJ4cGJXbDBXd2RwQXBJRWFRTFFCdz09IiwiZXhwIjpudWxsLCJwdXIiOiJ2YXJpYXRpb24ifX0=--3dca9d2db46a9778f1ca04ac37b13f43169f43d5/12.jpg">
                                 <img
                                    src="/rails/active_storage/representations/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBIUT09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--3f55257c41e8f23f18e83c79942e8812413222fe/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaDdCam9VY21WemFYcGxYM1J2WDJ4cGJXbDBXd2RwQXBJRWFRTFFCdz09IiwiZXhwIjpudWxsLCJwdXIiOiJ2YXJpYXRpb24ifX0=--3dca9d2db46a9778f1ca04ac37b13f43169f43d5/13.jpg">
                                 <img
                                    src="/rails/active_storage/representations/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBIZz09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--b1f9c8fbacbd9052caf82f77d032261606e32a1a/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaDdCam9VY21WemFYcGxYM1J2WDJ4cGJXbDBXd2RwQXBJRWFRTFFCdz09IiwiZXhwIjpudWxsLCJwdXIiOiJ2YXJpYXRpb24ifX0=--3dca9d2db46a9778f1ca04ac37b13f43169f43d5/16.jpg">
                                 <img
                                    src="/rails/active_storage/representations/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBIdz09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--3c7873ce716ec104a58b57089faceecb9e92c8d9/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaDdCam9VY21WemFYcGxYM1J2WDJ4cGJXbDBXd2RwQXBJRWFRTFFCdz09IiwiZXhwIjpudWxsLCJwdXIiOiJ2YXJpYXRpb24ifX0=--3dca9d2db46a9778f1ca04ac37b13f43169f43d5/15.JPG">
                                 <img
                                    src="/rails/active_storage/representations/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBJQT09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--87a3ac9ee1ac46c69fc6646eaa7e3f357cdccff7/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaDdCam9VY21WemFYcGxYM1J2WDJ4cGJXbDBXd2RwQXBJRWFRTFFCdz09IiwiZXhwIjpudWxsLCJwdXIiOiJ2YXJpYXRpb24ifX0=--3dca9d2db46a9778f1ca04ac37b13f43169f43d5/14.jpg">
                                 <img
                                    src="/rails/active_storage/representations/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBJUT09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--dc183a29606f6533dfcca7f390c4877c08988664/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaDdCam9VY21WemFYcGxYM1J2WDJ4cGJXbDBXd2RwQXBJRWFRTFFCdz09IiwiZXhwIjpudWxsLCJwdXIiOiJ2YXJpYXRpb24ifX0=--3dca9d2db46a9778f1ca04ac37b13f43169f43d5/17.jpg">
                                 <img
                                    src="/rails/active_storage/representations/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBJZz09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--b6f44b62fd8a632ef0a32698658da2f4e5696c72/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaDdCam9VY21WemFYcGxYM1J2WDJ4cGJXbDBXd2RwQXBJRWFRTFFCdz09IiwiZXhwIjpudWxsLCJwdXIiOiJ2YXJpYXRpb24ifX0=--3dca9d2db46a9778f1ca04ac37b13f43169f43d5/18.jpg">
                                 <img
                                    src="/rails/active_storage/representations/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBJdz09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--0edcd7d59ae6eb894707d2ebe47e5da0c28da1ba/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaDdCam9VY21WemFYcGxYM1J2WDJ4cGJXbDBXd2RwQXBJRWFRTFFCdz09IiwiZXhwIjpudWxsLCJwdXIiOiJ2YXJpYXRpb24ifX0=--3dca9d2db46a9778f1ca04ac37b13f43169f43d5/19.jpg">
                                 <img
                                    src="/rails/active_storage/representations/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBKQT09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--2dd9f98829cb7fb46ce88fea899cbb8abd4f2763/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaDdCam9VY21WemFYcGxYM1J2WDJ4cGJXbDBXd2RwQXBJRWFRTFFCdz09IiwiZXhwIjpudWxsLCJwdXIiOiJ2YXJpYXRpb24ifX0=--3dca9d2db46a9778f1ca04ac37b13f43169f43d5/20.jpg">
                                 <img
                                    src="/rails/active_storage/representations/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBKUT09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--0b5a71c39489ed0bc3c0d4583a10ed3fe070800f/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaDdCam9VY21WemFYcGxYM1J2WDJ4cGJXbDBXd2RwQXBJRWFRTFFCdz09IiwiZXhwIjpudWxsLCJwdXIiOiJ2YXJpYXRpb24ifX0=--3dca9d2db46a9778f1ca04ac37b13f43169f43d5/21.jpg">
                                 <img
                                    src="/rails/active_storage/representations/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBKZz09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--10bb319e14c64de828b3089f75582a3d6fa6543a/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaDdCam9VY21WemFYcGxYM1J2WDJ4cGJXbDBXd2RwQXBJRWFRTFFCdz09IiwiZXhwIjpudWxsLCJwdXIiOiJ2YXJpYXRpb24ifX0=--3dca9d2db46a9778f1ca04ac37b13f43169f43d5/22.jpg">
                                 <img
                                    src="/rails/active_storage/representations/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBKdz09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--831fc130cb9eafe5e259b6ef6af1980aab27760c/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaDdCam9VY21WemFYcGxYM1J2WDJ4cGJXbDBXd2RwQXBJRWFRTFFCdz09IiwiZXhwIjpudWxsLCJwdXIiOiJ2YXJpYXRpb24ifX0=--3dca9d2db46a9778f1ca04ac37b13f43169f43d5/23.jpg">
                                 <img
                                    src="/rails/active_storage/representations/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBLQT09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--689ecc1981e8d2e4ca8dd969a530bd01ac11bbcb/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaDdCam9VY21WemFYcGxYM1J2WDJ4cGJXbDBXd2RwQXBJRWFRTFFCdz09IiwiZXhwIjpudWxsLCJwdXIiOiJ2YXJpYXRpb24ifX0=--3dca9d2db46a9778f1ca04ac37b13f43169f43d5/24.jpg">
                                 <img
                                    src="/rails/active_storage/representations/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBLUT09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--790e17b3f8ebfffa5e55ebf0dc23b3fc492e80c3/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaDdCam9VY21WemFYcGxYM1J2WDJ4cGJXbDBXd2RwQXBJRWFRTFFCdz09IiwiZXhwIjpudWxsLCJwdXIiOiJ2YXJpYXRpb24ifX0=--3dca9d2db46a9778f1ca04ac37b13f43169f43d5/25.jpg">
                                 <img
                                    src="/rails/active_storage/representations/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBLZz09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--7efe8b34cdd4697ae53a0bac56f422153c44d7bf/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaDdCam9VY21WemFYcGxYM1J2WDJ4cGJXbDBXd2RwQXBJRWFRTFFCdz09IiwiZXhwIjpudWxsLCJwdXIiOiJ2YXJpYXRpb24ifX0=--3dca9d2db46a9778f1ca04ac37b13f43169f43d5/26.jpg">
                                 <img
                                    src="/rails/active_storage/representations/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBLdz09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--994110dd095a4976adf73ad00d49db3d9666cde5/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaDdCam9VY21WemFYcGxYM1J2WDJ4cGJXbDBXd2RwQXBJRWFRTFFCdz09IiwiZXhwIjpudWxsLCJwdXIiOiJ2YXJpYXRpb24ifX0=--3dca9d2db46a9778f1ca04ac37b13f43169f43d5/27.jpg">
                                 <img
                                    src="/rails/active_storage/representations/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBMQT09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--b261c20b9d36d156f65c762c6b8920eabff82656/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaDdCam9VY21WemFYcGxYM1J2WDJ4cGJXbDBXd2RwQXBJRWFRTFFCdz09IiwiZXhwIjpudWxsLCJwdXIiOiJ2YXJpYXRpb24ifX0=--3dca9d2db46a9778f1ca04ac37b13f43169f43d5/28.jpg">
                                 <img
                                    src="/rails/active_storage/representations/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBMUT09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--5753843b6c5c179aa1318079f476b47c4800f652/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaDdCam9VY21WemFYcGxYM1J2WDJ4cGJXbDBXd2RwQXBJRWFRTFFCdz09IiwiZXhwIjpudWxsLCJwdXIiOiJ2YXJpYXRpb24ifX0=--3dca9d2db46a9778f1ca04ac37b13f43169f43d5/7.jpg">
                                 <img
                                    src="/rails/active_storage/representations/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBMZz09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--d8e9635beaaf7edf13b2f7d4f191c3915767b34b/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaDdCam9VY21WemFYcGxYM1J2WDJ4cGJXbDBXd2RwQXBJRWFRTFFCdz09IiwiZXhwIjpudWxsLCJwdXIiOiJ2YXJpYXRpb24ifX0=--3dca9d2db46a9778f1ca04ac37b13f43169f43d5/8.jpg">
                                 <img
                                    src="/rails/active_storage/representations/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBMdz09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--59dc45f83eb8b5e74a1b80ae15baa50aea1034b2/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaDdCam9VY21WemFYcGxYM1J2WDJ4cGJXbDBXd2RwQXBJRWFRTFFCdz09IiwiZXhwIjpudWxsLCJwdXIiOiJ2YXJpYXRpb24ifX0=--3dca9d2db46a9778f1ca04ac37b13f43169f43d5/9.jpg">
                                 <img
                                    src="/rails/active_storage/representations/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBNQT09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--1b31b90f49f14da8493a135d9d61fae6aa867afa/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaDdCam9VY21WemFYcGxYM1J2WDJ4cGJXbDBXd2RwQXBJRWFRTFFCdz09IiwiZXhwIjpudWxsLCJwdXIiOiJ2YXJpYXRpb24ifX0=--3dca9d2db46a9778f1ca04ac37b13f43169f43d5/10.jpg">
                              </div>
                           </div>


                        </div>

                     </div>

                  </div>

               </div>

            </div>


            <div aria-hidden="true" aria-labelledby="myModalLabel" class="modal fade" id="MapModal" role="dialog"
               tabindex="-1">

               <div class="modal-dialog">

                  <div class="modal-content">

                     <div class="modal-header">

                        <button aria-label="Close" class="close" data-dismiss="modal" type="button">
                           <span aria-hidden="true">×</span>
                        </button>

                     </div>

                     <div class="modal-body">

                        <div class="tab-content">

                           <h2 class="modal-title" id="myModalLabel">${dto.facltNm}</h2>


                           <div class="camp-map">
                              <img
                                 src="https://www.forcamper.co.kr/rails/active_storage/representations/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBGQT09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--e6d8b8f63cb0540d1576d8dadbaa327e5529529b/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaDdCam9VY21WemFYcGxYM1J2WDJ4cGJXbDBXd2RwQXBJRWFRTFFCdz09IiwiZXhwIjpudWxsLCJwdXIiOiJ2YXJpYXRpb24ifX0=--3dca9d2db46a9778f1ca04ac37b13f43169f43d5/%E1%84%87%E1%85%A2%E1%84%8E%E1%85%B5%E1%84%83%E1%85%A9.png" />
                           </div>


                        </div>

                     </div>

                  </div>

               </div>

            </div>


            <div aria-hidden="true" class="modal fade" id="NotiModal" role="dialog" tabindex="-1">

               <div class="modal-dialog">

                  <div class="modal-content">

                     <!-- <div class="modal-header">

                <h2>알림</h2>

                <button aria-label="Close" class="close" data-dismiss="modal" type="button">
                    <span aria-hidden="true">×</span>
                </button>

            </div> -->

                     <div class="modal-body">

                        <div class="tab-content"></div>

                     </div>

                  </div>

               </div>

            </div>



            <script>

               $(document).ready(function () {


               });

               function noti() {
                  $('#NotiModal').modal('show');
               }

               $('#btn-slider').on('click', function (e) {
                  e.preventDefault();
                  $('#SliderModal').modal('show');
               });

               $('#btn-map').on('click', function (e) {
                  e.preventDefault();
                  $('#MapModal').modal('show');
               });

               $('#SliderModal').on('shown.bs.modal', function (e) {
                  if (false) {
                     viewer = pannellum.viewer('panorama', {
                        "type": "equirectangular",
                        "panorama": "",
                        "autoLoad": true
                     });
                  }
               })

               var_tab = "";

               if (var_tab) {
                  $('.camp-tabs a[href="#' + var_tab + '"]').tab('show');
               }

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