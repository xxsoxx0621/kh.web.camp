<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<style>
table {
	margin: auto;
	width: 300px;
	height: 300px;
}

button {
	width: 100%;
	height: 100%;
}
</style>
</head>
<body>

	<c:choose>


		<c:when test="${admin != null }">

			<table border="1">
				<tr>
					<th colspan="3">관리자로 로그인</th>
				</tr>
				<tr>
					<td><button id="freeBoard">자유게시판 관리</button></td>
					<td><button id="notice">공지사항 관리</button></td>
					<td><button id="qna">1:1QnA 관리</button></td>
				</tr>
			</table>
		</c:when>

		<c:when test="${loginID != null }">
			<table border="1">
				<tr>
					<th colspan="3">${loginID }으로로그인완료</th>
				</tr>
				<tr>
					<td><button id="freeBoard">자유게시판</button></td>
					<td><button id="notice">공지사항</button></td>
					<td><button id="qna">1:1QnA</button></td>
				</tr>
			</table>
		</c:when>


		<c:otherwise>
			<table border="1">
				<tr>
					<th colspan="3">비회원 로그인</th>
				</tr>
				<tr>
					<td><button id="freeBoard">자유게시판</button></td>
					<td><button id="notice">공지사항</button></td>
					<td><button id="qna">1:1QnA</button></td>
				</tr>
			</table>
		</c:otherwise>
	</c:choose>

	<script>
	

      $('#freeBoard').on('click', () => {
         location.href="/boardlist.board?cpage=1";
      })
      
	
      $('#notice').on('click', () => {
    	  location.href="/noticeList.notice?cpage=1";
      })
      
      $('#qna').on('click', () => {
    	  location.href="/qnaList.qna?cpage=1";
      })
   </script>
</body>
</html>