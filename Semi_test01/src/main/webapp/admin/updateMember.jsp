<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'name='viewport'>
<meta content='IE=edge' http-equiv='X-UA-Compatible'>
<meta content='telephone=no' name='format-detection'>
<!-- 제이쿼리 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- 외부라이브러리 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<title>관리자 페이지 - 회원정보수정</title>
</head>
<body>
		<div class="container">
							<c:forEach var ="dto"  items="${list }">
							<form action ="/updateInfoProc.mypage" method="post" id="updateInfoForm">
							
							<div class='txtb'>
									아이디 
									<input type="text"  value="${dto.user_id}" id="id" name="id">
							</div>
							<div class='txtb'>
									이름 
									<input type="text"  value="${dto.name}" id="name" name="name">
							</div>
						
							<div class='txtb'>
								변경할 비밀번호
								<input type="text" id="changePw" name="changePw"  >
								<input type="text" id="presentPw" name="presentPw"  value="${dto.password}" hidden>
							
							</div>
							<div class='txtb'>
									변경할 비밀번호 재입력
								<input type="password"  id="changeRePw" name="changeRePw" >
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
									url: "/findPwProc.admin",
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
								
								 if($("#phone1").val() == ""){
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
											location.href="/manageMember.admin?cpage=1";
										}else{
											alert("정보 수정이 불가합니다.");
											location.href="/updateMember.admin";
										}
									
										
									});
									
								}
							});
						
						</script>  				
			
	  			
</body>
</html>