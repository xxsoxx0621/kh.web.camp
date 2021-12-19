<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

.mybox{
  
   border-radius: 10px;
   text-align: center;
   border: 1px solid black;
   background-color: #fff;
    box-shadow: 1px 2px 5px grey;
    height: 580px;
    width: 430px;
    margin: 33%;
    
}

.box{
    margin: 15%;
    margin-top: 55px;
    padding: 20px 20px 0;
    border: 1px solid black;
    position:absolute;
    
}
.box1{
    position: absolute;
    border: 1px solid black;
    width: 430px;
   height: 50px;
   background-color: #fff0df;

}

.cansle{
    display: block;
   width: 25%;
   height: 30px;
   border: none;
   background: #475f3e;
   cursor: pointer;
   border-radius: 10px;
   background-size: 200%;
   border-color: white;
   color: #fff;
   outline: none;
   transition: .5s;
    text-align: center;
    margin-top:20px;
    float: right;
}

.identify{
    display: block;
   width: 25%;
   height: 30px;
   border: none;
   background: #475f3e;
   cursor: pointer;
   border-radius: 10px;
   background-size: 200%;
   border-color: white;
   color: #fff;
   outline: none;
   transition: .5s;
    margin: auto;
    position:relative;
    top: 80;
    margin-top: 80px;
    
    
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
                  <li><a href="/login.mem">로그인</a></li>
                  <li><a href="/signUp.mem">회원가입</a></li>
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
                     <li class='menu-user'><a href="/login.mem">로그인</a> | <a
                        href="/signUp.mem">회원가입</a></li>
                  </ul>
               </div>
            </div>
         </nav>
         <div class= 'mybox'>
             <div id='box'>
                 <h2 class="wating"><br>완료(입금대기)</h2><br>
                 <a class='navbar-brand pull-left' href='/'><img
                    src="/img/떼캠 로고 베이지.png" /></a> 문수골 힐링캠핑장<br>힐링A존:04번 사이트
                    <div id='information' style="text-align:left;">
                       <br> 결제정보 <br>무통장 입금 하나은행:447-910392-02007(예금주: 강병수)
                       <div class="box1" style="text-align: center;">
                           2021-11-29 10:00까지 40,000원 입금해주세요.<br>
                           입금기한까지 입금이 되지 않는 경우 예약은 자동취소됩니다.
                       <div class="bookinginformation" style="text-align: left;">
                       <br>캠핑장 예약 정보<br>
                        체크인/체크아웃 : 2021-11-29~2021-11-30 1박 2일
                        <br>예약자명 : 서승희
                        <br>투숙인원 : 4명
                        <br>연락처 : 01066489710
                        <br>차량번호 : 123456
                        <br>환불받을 계좌 : 국민은행 , 123456789410
                        <br>금액 : 40,000원
                        <div class="button">
                        <a href="#"><button class="cansle">예약취소</button></a>
                         </div>
                         <div class="okay" style="text-align: center;">
                        <a href="#"><button class="identify">확인</button></a>
                         </div>
                       </div>
                       </div>
                    </div>
             </div>
             </div>
             
             

         </div>
         <footer class='footer'>
            <div class='footer-menu'>
            <div class='container cleafix'>
            <ul class='list-inline pull-left'>
            <li>
            <a href='#'>회사소개</a>
            </li>
            <li>
            <a href='/boards?active=cate-2'>인재채용</a>
            </li>
            <li>
            <a href='/faqs'>FAQ</a>
            </li>
            <li>
            <a href='/contacts/new'>문의하기</a>
            </li>
            <li>
            <a href='/term'>이용약관</a>
            </li>
            <li>
            <a href='/privacy'>개인정보처리방침</a>
            </li>
            <li>
            <a href='/refund_rule'>환불정책</a>
            </li>
            </ul>
            <div class='footer-sns pull-right'>
            <a target="_blank" href="https://www.facebook.com/forcamper"><img src="https://forcamper.co.kr/assets/icon-fb-b184da37942f87decdb2466d04afaf7dabc8d046c3fcd4d8d6af210cd0c1aa93.png" />
            </a><a target="_blank" href="https://instagram.com/forcamper"><img src="https://forcamper.co.kr/assets/icon-insta-f26412eaf93830d50a018ad63b1dae7cabcf0f94c70854b2375683df20c0c1fe.png" />
            </a><a target="_blank" href="#"><img src="https://forcamper.co.kr/assets/icon-tw-82ad933c3ed4d722c43aa65e9c29bb80a0313f089d6a4bdfcf151ef78a045f87.png" />
            </a></div>
            </div>
            </div>
            <div class='footer-copy'>
            <div class='container'>
            <div class='row'>
            <div class='col-xs-2'>
            <img class="web" src="https://forcamper.co.kr/assets/footer-logo-3eb1f9f31148401dacf098709fd94bc18955387a9a618069162cdd24ce57f793.png" />
            <img class="mobile" src="https://forcamper.co.kr/assets/m-footer-logo-f35940935b51fe7a4cb2f2f1a4584a3e74868fe1f1fd05492f82fc9f864fb50a.png" />
            </div>
            <div class='col-xs-10'>
            <p>설립일 : 2021 년 12월 22일,  대표자 : 뗴코  이메일 : TteCamp@iei.or.kr</p>
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