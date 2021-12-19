<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기 페이지</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
	.container{ margin: auto; width:500px; height:500px;}
</style>
</head>
<body>
	<form action="/findPwProc.mem" method="post" id="findPwForm">
		<div class="container">
		<table border=1>
			<tr >
			<th colspan="2"> 비밀번호 찾기
			</tr>
			<tr>
				<td> 아이디 
				<td> <input type="text" placeholder="아이디를 입력하세요." name="id" id="id"> 
			</tr>
			<tr>
				<td> 비밀번호 찾기 질문 선택
				<td>
				 <select name="question" id="question">
						<option value="q1" selected >1. 가장 좋아하는 음식은?</option>
						<option value="q2">2. 자신의 인생 좌우명은?</option>
						<option value="q3">3. 가장 기억에 남는 추억의 장소는?</option>
						<option value="q4">4. 가장 무서웠던 선생님 성함은?</option>
					</select>
			</tr>
			<tr>
				<td> 답변 입력
				<td><input type="text" placeholder="답변을 입력하세요." name="answer" id="answer">
			</tr>
			<tr >
				<td colspan= "2" align="center"> 
				<input type="button" value="제출하기" id="submitBtn">
				<a href="/login.mem"><button type="button">로그인하기</button></a>
			</tr>
		</table>
		</div>
	</form>
	<script>
	$("#submitBtn").on("click",function(){
 		$.ajax({
 			url : "/findPwProc.mem",
 			data : {
 				id:$("#id").val(),
 				question:$("#question").val(),
 				answer:$("#answer").val()
 			}
 		}).done(function(resp){
 			if(resp =="true"){
 				$("#findPwForm").submit();
 				location.href="/resetPw.mem";
 				
 			}else{
 				alert("id 또는 비밀번호 답변이 다릅니다.");
 				location.href="/findPw.mem";
 			}
 			
 		})
 	})
	
	</script>
</body>
</html>