<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<!-- 제이쿼리 -->
			<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

			<title>회원 관리</title>
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
					border: 0px;
					background-color: white;
					text-align: center;
				}
			</style>
		</head>

		<body>

			<div class="container">
				<h1>회원관리</h1>
				<table border=1 id="table">
					<tr id="tr">
						<th><input type="checkbox" id="selectAll">
						<th>아이디
						<th>이름
						<th>이메일
						<th>전화번호
						<th>우편번호
						<th>주소
						<th>상세주소
						<th>가입일자
					</tr>

					<c:forEach var="dto" items="${list }">
						<tr class="tr">
							<td class="td1"><input type="checkbox" name="checkbox" value="${dto.user_id}">
							<td class="td2"><input type="text" value="${dto.user_id}" id="id" disabled>
							<td class="td3"><input type="text" value="${dto.name }" id="name" disabled>
							<td class="td4"><input type="text" value="${dto.originEmail}" disabled>
							<td class="td5"><input type="text" value="${dto.phone}" disabled>
							<td class="td6"><input type="text" value="${dto.zip_code}" disabled>
							<td class="td7"><input type="text" value="${dto.address1}" disabled>
							<td class="td8"><input type="text" value="${dto.address2} " disabled>
							<td class="td9"><input type="text" value="${dto.signup_date}" disabled>
						</tr>

					</c:forEach>
					<!-- 1. 페이징 구현하기  -->
					<tr>
						<td colspan=9>${navi }
					</tr>
					<tr>
						<td colspan=9>
							<select name="search" id="search">
								<option value="id">아이디
								<option value="name">이름
							</select>
							<input type="text" value="" id="searchInput">
							<input type="button" value="검색" id="searchBtn">
					</tr>
					<tr>
						<td colspan=9>
							<input type="button" value="회원탈퇴" id="deleteMem">
							<input type="button" value="회원수정" id="updateMem">
					</tr>
				</table>
			</div>
			<script>
				 /* 	let id = $("#id").val();
					if(id.indexOf("admin") > 0){
						$("#admin").text("관리자");
					}else{
						$("#admin").text("");
					}  */
				< !--날짜 변경-- >
					function getDate() {
						var date = new Date();
						return date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate();
					}
					< !--2. 검색 구현하기-- >
						$("#searchBtn").on("click", function () {
							let search = $("#search").val();
							let searchInput = $("#searchInput").val();
							if (search == 'id') {
								$.ajax({
									url: "/searchIdProc.admin",
									data: {
										searchInput: $("#searchInput").val()
									},
									dataType: "json"

								}).done(function (resp) {

									if (resp.length > 0) {
										$(".tr").empty();
										for (let i = 0; i < resp.length; i++) {
											let tr = $("<tr>");
											let td0 = $("<td>");
											let input = $("<input type=checkbox>");
											td0.append(input);
											let td1 = $("<td>");
											td1.append(resp[i].user_id);
											let td2 = $("<td>");
											td2.append(resp[i].name);
											let td3 = $("<td>");
											td3.append(resp[i].originEmail);
											let td4 = $("<td>");
											td4.append(resp[i].phone);
											let td5 = $("<td>");
											td5.append(resp[i].zip_code);
											let td6 = $("<td>");
											td6.append(resp[i].address1);
											let td7 = $("<td>");
											td7.append(resp[i].address2);
											let td8 = $("<td>");
											td8.append(getDate(resp[i].signup_date));



											tr.append(td0);
											tr.append(td1);
											tr.append(td2);
											tr.append(td3);
											tr.append(td4);
											tr.append(td5);
											tr.append(td6);
											tr.append(td7);
											tr.append(td8);
											$("#tr").after(tr);
										}
									} else {

										alert("검색결과가 없습니다.");
										$("#searchInput").val('');
										$("#searchInput").focus();
									}



								})

							} else if (search == "name") {
								$.ajax({
									url: "/searchNameProc.admin",
									data: { searchInput: $("#searchInput").val() },
									dataType: "json"
								}).done(function (resp) {

									if (resp.length > 0) {
										$(".tr").empty();

										for (let i = 0; i < resp.length; i++) {
											let tr = $("<tr>");
											let td0 = $("<td>");
											let input = $("<input type=checkbox>");
											td0.append(input);
											let td1 = $("<td>");
											td1.append(resp[i].user_id);
											let td2 = $("<td>");
											td2.append(resp[i].name);
											let td3 = $("<td>");
											td3.append(resp[i].originEmail);
											let td4 = $("<td>");
											td4.append(resp[i].phone);
											let td5 = $("<td>");
											td5.append(resp[i].zip_code);
											let td6 = $("<td>");
											td6.append(resp[i].address1);
											let td7 = $("<td>");
											td7.append(resp[i].address2);
											let td8 = $("<td>");
											td8.append(getDate(resp[i].signup_date));



											tr.append(td0);
											tr.append(td1);
											tr.append(td2);
											tr.append(td3);
											tr.append(td4);
											tr.append(td5);
											tr.append(td6);
											tr.append(td7);
											tr.append(td8);
											$("#tr").after(tr);
										}
									} else {

										alert("검색결과가 없습니다.");
										$("#searchInput").val('');
										$("#searchInput").focus();

									}
								})

							}

						});
				// 전체 선택
				$("#selectAll").on("click", function () {
					if ($(this).is(":checked")) {
						$("input:checkbox").prop("checked", true);
					} else {
						$("input:checkbox").prop("checked", false);
					}

				});

				// 회원 탈퇴 

				$("#deleteMem").on("click", function () {
					if ($("input:checkbox").is(":checked")) {
						let idArr = [];
						$('input:checkbox:checked').each(function () {
							idArr.push($(this).val());
						});

						if (confirm("삭제하시겠습니까?")) {
							$.ajax({
								url: "/deleteMember.admin",
								data: { "idArr": idArr },
								dataType: "json",
								traditional: true
							}).done(function (resp) {
								if (resp == "1") {
									location.href = "/manageMember.admin?cpage=1";

									/* }else{
										alert("삭제에 실패했습니다.");
									} */


								}
							 } else {
									alert("삭제에 실패했습니다.");
									location.href = "/manageMember.admin?cpage=1";
								}
							})
						} else {
							alert("체크된 회원이 없습니다.");
						}
					}


						// 회원 수정

						$("#updateMem").on("click", function () {
							if ($('input:checkbox:checked').length > 1) {
								alert("한 번에 한 회원만 수정 가능합니다.");
								$("input:checkbox").prop("checked", false);
							} else {
								let checkVal = $('input:checkbox:checked').val();

								//1. 아이디랑 동일한 정보의 회원정보들 뿌려주기
								$.ajax({
									url: "/findMember.admin",
									data: { checkVal },
									dataType: "json"
								}).done(function (resp) {
									console.log(resp);
									if (resp.length > 0) {
										location.href = "updateMember.admin";
									} else {
										alert("해당하는 아이디의 정보를 찾을 수 없습니다.");
									}

								});


							}


						})


			</script>
		</body>

		</html>