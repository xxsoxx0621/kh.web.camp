<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>


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
<title>마이페이지</title>
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

#btnContainer {
	border: 1px solid black;
	width: 100%;
	height: 300px;
}
.nav-tabs{
	border-bottom: 1px solid black;
	padding-top:4%;
	padding-left:4%;
	padding-right:4%;
}
.nav-tabs>li.active>a ,.nav-tabs>li.active>a:hover, .nav-tabs>li.active>a:focus {
	color:black;
}
.tab-content {

	overflow:scorll-y;
}
/* 3. 후기목록 */
#review{
	padding:3%;
}
.reviewContainer {
border:1px solid black; width:50%; height:132px; margin-top:30px!important; margin:auto;text-align:left
}
.reviewContainer > div { border-bottom:}
.reviewContainer  div > input {border:none; background:none}

/*  4. 1:1 문의 목록 */
#qna_container {
	margin: auto;
	width: 900px;
	height: 650px;
	text-align: center;
}

#qna_content {
	display: flex;
	height: 8%;
}

#qna_top, #qna_info, #qna_page, #qna_bottom, #qna_content {
	height: 7.5%;
	line-height: 300%;
}

#qna_info {
	display: flex;
	height:;
}

.qna_num {
	width: 15%;
}

.qna_title {
	width: 70%;
}

.qna_date {
	width: 15%;
}


/*  5. 회원정보 수정  */
.txtb {
	text-align:left;
	border-bottom: 2px solid #adadad;
 	border-bottom: 50%;
	position: relative;
	margin: auto;
	width: 50%;
	margin-bottom: 20px;
	padding-left:5%;
	height:40px;

}

.txtb input {
	font-size: 15px;
	color: #333;
	width: 50%;
	border: none;
	padding: 0 5px;
	padding-left:5%;
	height:30px;
}

.txtb select[name="phone1"] {
	width:20%;
	margin-left:5%;
}
.txtb input[name="phone2"] {
	width:25%;
	padding-left:0px;
}
.txtb input[name="phone3"] {
	width:25%;
	padding-left:0px;
	
}

.txtb #id {
	width: 50%;
}
.txtb input[type="button"] {
	width:20%;
	background-color:#475f3e;
	outline:none;
	border-radius:10px;
	color:#fff;
	padding-left:0px;
	padding-right:0px;
}
#updateBox{
	padding:5%;
}

#updateIitle{
	font-weight:500;
	

}
.btnContainer input[type=button]{
	width:20%;
	height:40px;
	background-color:#475f3e;
	outline:none;
	border-radius:10px;
	color:#fff;
	padding-left:0px;
	padding-right:0px;
}
/* 6.회원 탈퇴 */
.deleteContainer{
	width:50%;
	border:1px solid black;
	margin:auto;
	padding: 10px;
	margin-top:3%;
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

	<c:choose>
		<c:when test="${loginID != null}">
			<div id="main">
				<h1>마이페이지</h1>
				<h1>-</h1>
				<h3>회원님의 정보를 확인하세요.</h3>
				<ul class="nav nav-tabs nav-fill nav-justified">
					<li class="active"><a href="#reservation" data-toggle="tab">예약 내역</a></li>
					<li><a href="#like" data-toggle="tab">좋아요 목록</a></li>
					<li><a href="#review" data-toggle="tab">후기 목록</a></li>
					<li><a href="#question" data-toggle="tab">1:1 문의 목록</a></li>
					<li><a href="#updateInfo" data-toggle="tab">회원정보 수정</a></li>
					<li><a href="#deleteAccount" data-toggle="tab">회원 탈퇴</a></li>
				</ul>
				
				<div class="tab-content">
	 				<!-- 예약내역  -->
	 				<div class="tab-pane active" id="reservation">
	 					
					
						<c:forEach var="rList" items="${rList}">
							<div id="tempBookingList">

								<!-- 예약번호  -->
								<div>${rList.reservation_id }</div>
								<!-- 유저 아이디  -->
								<div>${rList.user_id }</div>
								<!-- contentID -->
								<div>${rList.contentId }</div>
								<!-- 클라이언트 이름 -->
								<div>${rList.client_name }</div>
								<!-- 인원수  -->
								<div>${rList.people_num }</div>
								<!-- 연락처 -->
								<div>${rList.contact }</div>
								<!--환불 은행 코드/ -->
								<div>${rList.refund_bank_code }</div>
								<!-- 계좌 번호  -->
								<div>${rList.account_num }</div>
								<!-- 차 번호   -->
								<div>${rList.car_num }</div>
								<!-- 예약 신청 날짜   -->
								<div>${rList.reservation_made_date }</div>
								<!-- 지불 여부   -->
								<div>${rList.is_paid }</div>
								<!-- 확정 여부 confirm ?   -->
								<div>${rList.is_booked }</div>
							</div>
						</c:forEach>
	 					
	 				</div>
	 				<!-- 좋아요 목록  -->
	  				<div class="tab-pane" id="like">2</div>
	  				<!-- 후기 목록  -->
	  				<div class="tab-pane" id="review">
	  					<!-- 
							1.User_id가 같을 때, 해당 값 review 테이블에서 불러오기 
							2. 그 값을 뿌려주고
							3. 캠핑장 contentid랑 같은 이름을 찾아서 이름 값으로 불러주고
							4. 삭제 / 수정하기 
						 -->
	 
	
			
						<c:forEach var="review" items="${reviewList}" varStatus="theCount"> 
								<div class="reviewContainer" id="divIdNo${theCount.count}">
										<div><input type="button" value="삭제" id="deleteNo${theCount.count}"></div>
										<div> 댓글번호 <input type="text" name="reviewNo" id="reviewNo${theCount.count}" value="${review.review_no}" ></div>
										<div> 캠핑장번호 <input type="text" name="campNum" id="campNo${theCount.count}" value="${review.contentId }" ></div>
										<div> 캠핑장이름 <input type="text" name="campName"  id="reviewNo${theCount.count}" disabled></div>
										<div> 사용자이름 <input type="text"  value="${review.user_id}" disabled></div>
										<div> 댓글내용 <input type="text" value="${review.contents}" disabled></div>	
								</div>
									<script>
									$(document).ready(function() {
										$.ajax({
											url : "/findCampName.mypage",
											dataType: "json"
										}).done(function(resp){
											if(resp.length > 0){
												for(let i=0; i <resp.length; i++){
													console.log(resp[i].contentId)
													if(resp[i].contentId == $("#campNo${theCount.count}").val()){
														console.log(resp[i].contentId);
														console.log($("#campNo${theCount.count}"));
														$("#reviewNo${theCount.count}").val(resp[i].facltNm);
													}else{
														console.log("실패");
													}
												}
												
												
											}else{
												alert("정보가 없습니다");
											}
										})
									});
										$("#deleteNo${theCount.count}").on("click",function(){
											
											$.ajax({
												url : "/deleteReview.mypage",
												data : {reviewNo: $("#reviewNo${theCount.count}").val()}
											}).done(function(resp){
												if(resp > 0 ){
													confirm("정말 댓글을 삭제하시겠습니까?");
													location.href="/myPage.mypage";
													alert("삭제되었습니다.");
												}else{
													location.href="/myPage.mypage";
												}
											});
											
										});
									</script>
						</c:forEach>
					
	  			
	  					
	  				</div>
	  				<!-- 1:1문의 목록  -->
	  				<div class="tab-pane" id="question">
												<div id="qna_container">
							<div id="qna_top">내 1:1 문의 목록</div>
							<div id="qna_info">
								<div class="qna_num">문의 번호</div>
								<div class="qna_title">문의 내용</div>
								<div class="qna_date">문의 일자</div>
							</div>

							<c:forEach var="qnaList" items="${myQnaList }">
								<div id="qna_content">
									<div class="qna_num">${qnaList.qna_no}</div>
									<div class="qna_title">
										<a href="qnaDetail.qna?seq=${qnaList.qna_no }">${qnaList.qna_title }</a>
									</div>
									<div class="qna_date">${qnaList.qna_date }</div>
								</div>
							</c:forEach>
						</div>	  				
	  				</div>
	  				<!-- 회원정보 수정  -->
	  				<div class="tab-pane" id="updateInfo">
	  	
	  				<div class="container">
							<c:forEach var ="dto"  items="${list }">
							<form action ="/updateInfoProc.mypage" method="post" id="updateInfoForm">
							<div id="updateBox">
							<div class='txtb'>
									아이디 
									<input type="text" disabled value="${dto.user_id}" id="id" name="id">
							</div>
							<div class='txtb'>
									이름 
									<input type="text" disabled value="${dto.user_id}" id="id" name="id">
							</div>
							
							<div class='txtb'>
									현재 비밀번호
								<input type="password" id="presentPw" name ="presentPw">
								<!-- 현재 비밀번호 가져오기 -->
								<input type="text" value="${dto.password}" hidden id="hiddenPw">
							</div>
							<div class='txtb'>
								변경할 비밀번호
								<input type="text" id="changePw" name="changePw"  disabled>
								<span id="checkReg"></span>
								<script>
									 $("#changePw").on("input",function(){
											// 비밀번호 정규식 검사
											let reg = /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{6,20}$/;
											let changePw = document.getElementById("changePw");
											
											if(!reg.test(changePw.value)){
												$("#checkReg").css("color","red");
												$("#checkReg").text("최소 1개의 숫자 혹은 특수문자를 포함하여 6-20자리를 사용해야 합니다.");
													   
											}else{
												$("#checkReg").css("color","green");
												$("#checkReg").text("");
											}
										});
								</script>
							</div>
							<div class='txtb'>
									변경할 비밀번호 재입력
								<input type="text"  id="changeRePw" name="changeRePw" disabled>
									<span id="checkPw"></span>
									<script>
									$("#changeRePw").on("input",function(){
									
									let changePw = $("#changePw").val();
									let changeRePw = $("#changeRePw").val();
									
						
									if(changePw == changeRePw){
										$("#checkPw").css("color","green");
										$("#checkPw").text("비밀번호가 일치합니다.");
									}else{
										$("#checkPw").css("color","red");
										$("#checkPw").text("비밀번호가 일치하지 않습니다.");
									}
									
								});
								</script>
							</div>	
							<div class='txtb'>
									이메일
							<input type="email"  id="email" name="email" value="${dto.originEmail }">
							</div>	
							<div class='txtb'>
									전화번호
							<input type="text" value="${dto.phone}" id="hiddenPhone" hidden name="phone1" >
							<select name="phone1" id="phone1">
										<option value= "02" >02
										<option value= "031">031
										<option value= "032">032
										<option value= "051">051
										<option value= "053">053
										<option value= "062">062
										<option value= "042">042
										<option value= "052">052
										<option value= "044">044
										<option value= "033">033
										<option value= "043">043
										<option value= "041">041
										<option value= "063">063
										<option value= "061">061
										<option value= "054">054
										<option value= "055">055
										<option value= "064">064
										<option value= "010">010
										</select>
										- <input type="text" name="phone2" id="phone2">
										- <input type="text" name="phone3" id="phone3">
							</div>	
							<div class='txtb'>
									우편번호
									<input type="text"  value="${dto.zip_code}" id="sample6_postcode"  name="zipcode" >
									<input type="button" value="주소검색" id="searchAdd"onclick="sample6_execDaumPostcode()">
							</div>			
							<div class='txtb'>
									주소
									<input type="text" value="${dto.address1}"  name="address1" id="sample6_address" disabled>
							</div>		
							<div class='txtb'>
									상세주소
									<input type="text" value="${dto.address2}"   name="address2" id="sample6_detailAddress" >
							</div>		
						<div class='txtb'>
									비밀번호찾기질문
									<input type="text" value="${dto.hint}" id="getHint" hidden>
									<select name="hint" id="hint">
											<option value="q1">1. 가장 좋아하는 음식은?</option>
											<option value="q2">2. 자신의 인생 좌우명은?</option>
											<option value="q3">3. 가장 기억에 남는 추억의 장소는?</option>
											<option value="q4">4. 가장 무서웠던 선생님 성함은?</option>
									</select>
						</div>		
						<div class='txtb'>
									비밀번호찾기답변
									<input type="text" value="${dto.hint_answer}" name="hintAnswer" id="hintAnswer">
						</div>							
						
						<div class="btnContainer">
							
										<input type="button" onclick="history.back()" value="뒤로가기">
										<input type="button" value="변경하기" id="updateBtn">
						
						</div>
							</form>
							</c:forEach>
							</div>
							<script>
								// 주소 api 스크립트
							    function sample6_execDaumPostcode() {
							        new daum.Postcode({
							            oncomplete: function(data) {
							                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
							
							                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
							                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							                var addr = ''; // 주소 변수
							                var extraAddr = ''; // 참고항목 변수
							
							                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							                    addr = data.roadAddress;
							                } else { // 사용자가 지번 주소를 선택했을 경우(J)
							                    addr = data.jibunAddress;
							                }
							
							                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
							                if(data.userSelectedType === 'R'){
							                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
							                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
							                        extraAddr += data.bname;
							                    }
							                    // 건물명이 있고, 공동주택일 경우 추가한다.
							                    if(data.buildingName !== '' && data.apartment === 'Y'){
							                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
							                    }
							                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							                    if(extraAddr !== ''){
							                        extraAddr = ' (' + extraAddr + ')';
							                    }
							                    // 조합된 참고항목을 해당 필드에 넣는다.
							                    //document.getElementById("sample6_extraAddress").value = extraAddr;
							                
							                } else {
							                    document.getElementById("sample6_extraAddress").value = '';
							                }
							
							                // 우편번호와 주소 정보를 해당 필드에 넣는다.
							                document.getElementById('sample6_postcode').value = data.zonecode;
							                document.getElementById("sample6_address").value = addr;
							                // 커서를 상세주소 필드로 이동한다.
							                document.getElementById("sample6_detailAddress").focus();
							            }
							        }).open();
							    }
					 		
							// 회원정보 수정 스크립트
							let hint = $("#getHint").val();
							let backHint= $("#hint").val();
							let hiddenPhone = $("#hiddenPhone").val();
						
							// 전화번호 넣기
							let arr = hiddenPhone.split("-");
							$("#phone1").val(arr[0]).prop("selected",true);
							$("#phone2").val(arr[1]);
							$("#phone3").val(arr[2]);
							
							if(hint == backHint){
								$("#hint").val(backHint).prop("selected",true);
							}
							$("#presentPw").on("change",function(){
								$.ajax({
									url: "/findPwProc.mypage",
									data:{
										presentPw:$("#presentPw").val()}
								}).done(function(resp){
									if(resp =="true"){
										alert("비밀번호가 일치합니다.");
										$("#changePw").prop("disabled", false);
										$("#changeRePw").prop("disabled", false);
									}else{
										alert("비밀번호가 일치하지 않습니다.");
										$("#presentPw").val('');
									}
								})
							})
						    
							
							
							$("#updateBtn").on("click",function(){
								
								let hiddenPw = $("#hiddenPw").val();
								let presentPw = $("presentPw").val();
								
								if($("#presentPw").val() == ""){
									alert("비밀번호를 입력하세요.");
								}else if($("#phone1").val() == ""){
									alert("전화번호를 입력하세요.");
								}else if($("#phone2").val() == ""){
									alert("전화번호를 입력하세요.");
								}else if($("#sample6_postcode").val() == ""){
									alert("주소를 입력하세요.");
								}else if($("#sample6_address").val() == ""){
									alert("주소를 입력하세요.");
								}else if($("#hintAnswer").val() == ""){
									alert("비밀번호 찾기 답변을 입력하세요.");
								}else{
									$.ajax({
										url:"/updateInfoProc.mypage",
										data:{
											id: $("#id").val(), 
											name: $("#name").val(), 
					 						presentPw: $("#presentPw").val(),
					 						changePw: $("#changePw").val(),
					 						email: $("#email").val(),
					 						phone1: $("#phone1").val(),
					 						phone2: $("#phone2").val(),
					 						phone3: $("#phone3").val(),
					 						zipcode: $("#sample6_postcode").val(),
					 					 	address1: $("#sample6_address").val(),
					 						address2: $("#sample6_detailAddress").val(),
					 						hint: $("#hint").val(),
					 						hintAnswer: $("#hintAnswer").val()
											}
									}).done(function(resp){
										if(resp =="1"){
											confirm("정보를 수정하시겠습니까?");	
											$("#updateInfoForm").submit();
											location.href="/myPage.mypage";
										}else{
											alert("정보 수정이 불가합니다.");
											location.href="/updateInfo.mypage";
										}
									
										
									});
									
								}
							});
						
						</script>  				
			
	  				</div>
	  			</div>
	  				<!-- 회원탈퇴  -->
	  				<div class="tab-pane" id="deleteAccount">
	  				<form action="/deleteUserProc.mypage" method="post" id="deleteUserForm">
	  				<div class="deleteContainer">
					<h1>탈퇴하기</h1>
					<h3>탈퇴 정책을 확인해주세요.</h3>
					<p> 
					  
					 개인회원<br>
					 이용항목 : 아이디(이메일), 비밀번호, 닉네임, 디바이스 ID, 휴대폰번호<br>
			
					 파기 정책<br>
					 1. 아이디인 이메일은 부정이용 이슈 방지를 위해 탈퇴 DB에서 7일 후 삭제<br>
					 2. 캠핑장 예약을 1번이라도 한 '구매회원'일 경우 5년간 보관 (전자상거래 등에서 소비자 보호에 관한 법률)<br>
					 3. ip의 경우 3개월 보관 (통신비밀보호법)<br>
					 선택정보 1번을 제외한 모든 정보 : 회원 탈퇴 시 즉시 삭제<br>
					 추가정보 이름, 생년월일, 본인에 대한 고유 인증 키값 : 회원 탈퇴 시 즉시 삭제<br>
					 예약 취소 및 환불 : 은행명, 계좌번호, 예금주명 5년 보관 (무통장일 경우 수기 환불 처리됨으로 포캠퍼에서 엑셀로 수기 저장)<br>
					 카드 결제일 경우 PG사 문의<br>
			
					 캠핑장 업주 회원<br>
					이용 항목 : 회사명, 대표자명, 사업자 번호, 기업 아이디, 비밀번호, 대표 전화번호, 대표 이메일 주소<br>
			
					 파기 정책<br>
					1. 아이디인 이메일은 부정이용 이슈 방지를 위해 탈퇴 DB에서 7일 후 삭제v
					2. 캠핑장 판매를 포캠퍼를 통해 1번이라도 한 '가맹회원'일 경우 5년간 보관 (전자상거래 등에서 소비자 보호에 관한 법률)<br>
					3. 캠핑지도에 등록을 한 제휴 회원일 경우도 5년간 보관<br>
					4. ip의 경우 3개월 보관 (통신비밀보호법)</p>
					<input type="button" value="탈퇴하기" id="deleteBtn">
				</form>
			
				<script>
					$("#deleteBtn").on("click",function(){
						confirm("정말 탈퇴하시겠습니까?");
						$("#deleteUserForm").submit();
					})
				</script>
				</div>
	  		</div>
	  				
				</div>
			</div>
				<script>
				  $(function () {
				    $('#myTab a:last').tab('show');
				  })
			   </script>
			<!-- 	<div id="btnContainer">
					세션에 로그인 세션 활성화 되었을 경우에만 진입 가능
					<a href="/updateInfo.mypage"><button>회원정보 수정</button></a> <a
						href="/deleteAccount.mypage"><button>회원 탈퇴</button></a> <a
						href="/reservationList.mypage"><button>예약 내역</button></a> <a
						href="/likeList.mypage"><button>좋아요 목록</button></a> <a
						href="/reviewList.mypage"><button>후기 목록</button></a> <a
						href="/questionList.mypage"><button>1:1 문의 목록</button></a>
				</div> -->
		
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
		</c:when>
		<c:otherwise>
		비정상적인 접근입니다.
		<button onclick="history.back()">뒤로가기</button>
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
		</c:otherwise>
	</c:choose>


</body>
</html>