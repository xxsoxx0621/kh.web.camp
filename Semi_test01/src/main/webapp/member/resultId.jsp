<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>아이디 결과 페이지 입니다.</title>
<style>
	.container{ margin:auto; width:500px; height:500px;}
</style>
</head>
<!-- 세션 이메일 값 지우기  -->
<% session.removeAttribute("email2");%>
<body>
	<div class="container">
		<table border=1>
			<tr colspan=2><th> 아이디는 ${dto.user_id} 입니다. 
			</tr>
			<tr>
				<td><a href="/index.jsp"><button>메인으로</button></a>
				<a href="/login.mem"><button>로그인</button></a>
			</tr>
		</table>
	</div>
	

</body>
</html>