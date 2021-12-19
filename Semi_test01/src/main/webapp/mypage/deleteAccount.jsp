<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴 페이지</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
	.container {margin:auto; width:700px; height:700px;text-align:center; border:1px solid black}
</style>
</head>
<body>
	<div class="container">
	<form action="/deleteUserProc.mypage" method="post" id="deleteUserForm">
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
	</div>
	
	<script>
		$("#deleteBtn").on("click",function(){
			confirm("정말 탈퇴하시겠습니까?");
			$("#deleteUserForm").submit();
		})
	</script>
</body>

</html>