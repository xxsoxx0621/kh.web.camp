<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'name='viewport'>
<meta content='IE=edge' http-equiv='X-UA-Compatible'>
<meta content='telephone=no' name='format-detection'>

<!-- 내부 css  -->
<link rel="stylesheet" href="/css/signUp.css?ver=4" />
<!-- 제이쿼리  -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- 주소 api  -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- 외부 라이브러리  -->
<link rel="stylesheet" media="all" href="https://forcamper.co.kr/assets/application-28cb6ba1f7597c029b42f54e32f7c21d9ebd4352047ba0c90428928c5d4d8d64.css"
data-turbolinks-track="reload" />
<link href="/resources/css/signUp.css" rel="stylesheet">

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
	<div id="main">
		<form action="/signUpProc.mem" method="post" id="signUpForm">
			<div class="signup_form">
				<h1>SIGN UP</h1>
				<div class='txtb' id="divId">
					<input type="text" name="id" id="id" placeholder='아이디를 입력해주세요.'>
					<input type="button" id="checkId" value="중복확인">
					</button>

				</div>
				<script>
					// ID값을 입력했을 때, 
					$("#checkId").on("click", function() {

						let idReg = /^[a-zA-Z0-9]*$/; // 아이디는 영어와 숫자로만 가능 
						let id = $("#id").val();

						$.ajax({
							url : "/idCheck.mem",
							data : {
								id : $("#id").val()
							}
						}).done(function(resp) {

							if ($("#id").val() !== "") {
								if (resp == "true" || !idReg.test(id)) {
									alert("이미 사용중인 ID 입니다");
									$("#id").val('');

								} else {
									alert("사용 가능한 ID 입니다.");

								}
							} else {
								alert("아이디를 입력하세요.");
							}

						});

					});
				</script>
				<div class='txtb'>
					<input type="text" name="name" id="name" placeholder='이름을 입력해주세요.'>

				</div>
				<div class="txtb">
					<input type="text" name="pw" id="pw"
						placeholder="비밀번호는 최소 1개의 숫자 혹은 특수문자를 포함하여 6-20자리 영문자">
				</div>
				<script>
				$("#pw").on("change",function(){
					// 비밀번호 정규식 검사
					let reg = /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{6,20}$/;
					let pw = document.getElementById("pw");

					if (!reg.test(pw.value)) {
						alert("비밀번호는 최소 1개의 숫자 혹은 특수문자를 포함하여 6-20자리를 사용해야 합니다.");
						$("#pw").val('');
						$("#pwCheck").val('');
						$("#pw").focus();
						return false;
					}
				})
				

				</script>

				<div class="txtb">
					<input type="password" id="pwCheck" placeholder='비밀번호 확인'>
					<span id="checkPw"></span>

				</div>
				<script>
					// 비밀번호 확인 스크립트
					$("#pwCheck").on("input", function() {
						let pw = $("#pw").val();
						let pwCheck = $("#pwCheck").val();

						if (pw == pwCheck) {
							$("#checkPw").css("color", "green");
							$("#checkPw").text("비밀번호가 일치합니다.");
						} else {
							$("#checkPw").css("color", "red");
							$("#checkPw").text("비밀번호가 일치하지 않습니다.");
						}
					})
				</script>
				<div class="txtb">
					<input type="email" name="email" id="email"
						placeholder='이메일을 입력해주세요.'>
				</div>
				<script>
				$("#email").on("change",function(){
					// 이메일 주소 정규식
					let reg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
				
					if (!reg.test($("#email").val())) {
						alert("이메일 형식에 맞지 않습니다.");
						$("#email").val('');
						$("#pw").focus();
						return false;
					}
				})
				</script>
				<div class="txtb">

					<select name="phone1" id="phone1">
						<option value="02">02
						<option value="031">031
						<option value="032">032
						<option value="051">051
						<option value="053">053
						<option value="062">062
						<option value="042">042
						<option value="052">052
						<option value="044">044
						<option value="033">033
						<option value="043">043
						<option value="041">041
						<option value="063">063
						<option value="061">061
						<option value="054">054
						<option value="055">055
						<option value="064">064
						<option value="010">010
					</select> - <input type="text" name="phone2" id="phone2"> - 
					<input type="text" name="phone3" id="phone3">
				</div>
				<script>
					$("#phone2").on("change",function(){
						let reg =  /\d{4}/;
						if (!reg.test($("#phone2").val())) {
							alert("전화번호 형식에 맞지 않습니다.");
							$("#phone2").val('');
							$("#phone2").focus();
							return false;
						}
					})
					
					$("#phone3").on("change",function(){
						let reg =  /\d{4}/;
						if (!reg.test($("#phone3").val())) {
							alert("전화번호 형식에 맞지 않습니다.");
							$("#phone3").val('');
							$("#phone3").focus();
							return false;
						}
					})
					
				</script>
				<div class="txtb">
					<input type="text" name="zipcode" id="sample6_postcode" value="우편번호" disabled>
					<input type="button" value="주소검색" id="searchAdd"
						onclick="sample6_execDaumPostcode()">

				</div>

				<div class="txtb">
					<input type="text" name="address1" id="sample6_address"
						placeholder="주소" disabled>

				</div>

				<div class="txtb">
					<input type="text" name="address2" id="sample6_detailAddress"
						placeholder="상세주소">

				</div>
				<div class="txtb">
					<select name="hint" id="hint">
						<option value="q1" selected>1. 가장 좋아하는 음식은?</option>
						<option value="q2">2. 자신의 인생 좌우명은?</option>
						<option value="q3">3. 가장 기억에 남는 추억의 장소는?</option>
						<option value="q4">4. 가장 무서웠던 선생님 성함은?</option>
					</select>
				</div>
				<div class="txtb">
					<input type="text" name="hint_answer" placeholder="답변을 입력하세요."
						id="hint_answer">

				</div>

				<input type='button' class='signup_btn' value='SIGN UP' id="joinMem">
			</div>
		</form>
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
	<script>
		// 주소 api 스크립트
		function sample6_execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
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
							if (data.userSelectedType === 'R') {
								// 법정동명이 있을 경우 추가한다. (법정리는 제외)
								// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
								if (data.bname !== ''
										&& /[동|로|가]$/g.test(data.bname)) {
									extraAddr += data.bname;
								}
								// 건물명이 있고, 공동주택일 경우 추가한다.
								if (data.buildingName !== ''
										&& data.apartment === 'Y') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
								if (extraAddr !== '') {
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
							document.getElementById("sample6_detailAddress")
									.focus();
						}
					}).open();
		}
	</script>
	<script>
		// 입력 확인

		$("#joinMem").on("click", function() {

			if ($("#id").val() == "") {
				alert("아이디를 입력하세요.");
				return false;

			}
			if ($("#name").val() == "") {
				alert("이름을 입력하세요.");
				return false;

			}
			
			if ($("#pw").val() == "") {
				alert("비밀번호를 입력하세요.");
				return false;

			}
			if ($("#pwCheck").val() == "") {
				alert("비밀번호 확인을 입력하세요.");
				return false;

			}

			if ($("#email").val() == "") {
				alert("이메일을 입력하세요.");
				return false;

			}

		
			
			if ($("#phone1").val() == "") {
				alert("전화번호를 정확히 입력하세요.");
				return false;

			}
			if ($("#phone2").val() == "") {
				alert("전화번호를 정확히 입력하세요.");
				return false;

			}
			if ($("#sample6_postcode").val() == "") {
				alert("주소를 입력하세요.");
				return false;

			}
			if ($("#hint_answer").val() == "") {
				alert("힌트를 입력하세요.");
				return false;

			}

			$.ajax({
				url : "/signUpProc.mem",
				data : {
					id : $("#id").val(),
					pw : $("#pw").val(),
					name : $("#name").val(),
					email : $("#email").val(),
					phone1 : $("#phone1").val(),
					phone2 : $("#phone2").val(),
					phone3 : $("#phone3").val(),
					zipcode : $("#sample6_postcode").val(),
					address1 : $("#sample6_address").val(),
					address2 : $("#sample6_detailAddress").val(),
					hint : $("#hint").val(),
					hint_answer : $("#hint_answer").val()
				}
			}).done(function(resp) {
				if (resp == "1") {
					$("#signUpForm").submit();
					alert("회원가입 성공!");
					location.href = "/login.mem";

				} else {
					alert("회원가입에 실패했습니다!");
					location.href = "/signUp.mem";
				}
			});

		});
	</script>
</body>
</html>