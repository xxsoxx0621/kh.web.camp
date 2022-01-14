<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
			<title>예약 관리 페이지</title>
			<style>
				.container {
					width: 100%;
					height: 500px;
					text-align: center;
				}

				#table {
					text-align: center;
					margin: auto;
					width: 80%;
				}

				#table input {
					background-color: white;
					text-align: center;
				}
			</style>
		</head>

		<body>
			<div class="container">
				<h1>예약관리</h1>
				<table border=1 id="table">
					<tr id="tr">
						<th><input type="checkbox" id="selectAll">
						<th>예약번호
						<th>캠핑장
						<th>아이디
						<th>이름
						<th>전화번호
						<th>체크인
						<th>체크아웃
						<th>박
						<th>금액
						<th>결제여부
						<th>예약완료여부
						<th>예약확정
						<th>예약취소


					</tr>

					<c:forEach var="dto" items="${list}">
						<tr class="tr">
							<td class="td1"><input type="checkbox" name="checkbox" value="${dto.user_id}">
							<td class="td2"><input type="text" value="${dto.reservation_id}" disabled
									class="reservation_id">
							<td class="td3"><input type="text" value="${dto.facltNm}" disabled>
							<td class="td4"><input type="text" value="${dto.user_id}" disabled>
							<td class="td5"><input type="text" value="${dto.client_name}" disabled>
							<td class="td6"><input type="text" value="${dto.contact}" disabled>
							<td class="td7"><input type="text" value="${dto.check_in}" disabled>
							<td class="td8"><input type="text" value="${dto.check_out}" disabled>
							<td class="td9"><input type="text" value="${dto.days_total} " disabled>
							<td class="td10"><input type="text" value="${dto.price_total}" disabled>
							<td class="td11"><input type="text" value="${dto.is_paid}" disabled>
							<td class="td12"><input type="text" value="${dto.is_booked}" disabled>
							<td class="td13"><input type="button" value="예약확정" class="confirmRev"
								onclick="confirmRev_click('${dto.reservation_id}');">
							<td class="td14"><input type="button" value="예약취소" class="cancelRev"
									onclick="cancelRev_click('${dto.reservation_id}');">
						</tr>
					</c:forEach>
					<!-- 1. 페이징 구현하기  -->
					<tr>
						<td colspan=14>${navi }
					</tr>
					<tr>
						<td colspan=14>
							<select name="search" id="search">
								<option value="id">아이디
								<option value="name">이름
							</select>
							<input type="text" value="" id="searchInput">
							<input type="button" value="검색" id="searchBtn">
					</tr>
					<tr>
						<td colspan=12>
							<input type="button" value="돌아가기" id="back" onclick="javascript:history.back()">
							
					</tr>
				</table>
			</div>

			<script>
				function cancelRev_click(reservation_id) {
					console.log(reservation_id);
					if (confirm("정말 취소하시겠습니까?")) {
						location.href = "/cancelRev.admin?reservation_id=" + reservation_id;
					}
				}

				function confirmRev_click(reservation_id) {
					console.log(reservation_id);
					if (confirm("정말 확정하시겠습니까?")) {
						location.href = "/confirmRev.admin?reservation_id=" + reservation_id;
					}
				}
				
				
				
			</script>
		</body>

		</html>