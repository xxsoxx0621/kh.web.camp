<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 재설정 페이지</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
.container { margin:auto; width:500px; height:500px;}
</style>
</head>
<body>
	<c:choose>
		<c:when test="${id != null}">
		<form action="/resetPwProc.mem" method="post" id="resetForm">
		<div class="container">
			<table border=1>
			<tr>
				<th colspan="2"> 비밀번호 재설정
			</tr>
			<tr>
				<td> 새 비밀번호 입력 
				<td><input type="password" name="newPw" id="newPw">
			</tr>
			<tr>
				<td> 새 비밀번호 다시 입력 
				<td><input type="password" name="newPwAgain" id="newPwAgain">
			</tr>
			<tr>
				<td colspan="2" align="center"> <input type="button" value="변경하기" id="changeBtn">
			</tr>
			</table>
		</div>
		</form>
		<script>
		
			
			$("#changeBtn").on("click",function(){
				let newPw = $("#newPw").val();
				let newPwAgain = $("#newPwAgain").val();
				// 비밀번호 정규식 검사
				let reg = /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{6,20}$/;
				let pw = document.getElementById("newPw");

				if(!reg.test(pw.value)){
			   			alert("숫자와 영문자 1개의 특수문자를 포함한 6-20자리를 사용해야 합니다.");
			   			$("#pw").val('');
			   			$("#pwCheck").val('');
			   			$("#pw").focus();
			   			return false;
				}else if(newPw != newPwAgain){
					alert("비밀번호가 다릅니다.");
					return false;
				}else{
					$("#resetForm").submit();
				}
			});
			
		
		</script>
		</c:when>
		<c:otherwise>
			<p>접근할 수 없는 페이지 입니다.</p>
		</c:otherwise>
	</c:choose>

		
</body>
</html>