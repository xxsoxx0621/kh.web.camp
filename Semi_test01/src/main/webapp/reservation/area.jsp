<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>area</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
                crossorigin="anonymous">
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
                crossorigin="anonymous"></script>
            <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
            <style>
                div {
                    border: 1px solid black;
                }

                a {
                    text-decoration: none;
                    color: black;
                }
            </style>
        </head>

        <body>
            <div class="container-fluid">
                <section>
                    <div class="row navi">
                        <div class="col">
                            Navi
                        </div>
                    </div>
                </section>
                <section>
                    <div class="row main">
                        <a href="javascript:history.back()">
                            <b>
                                < 예약하기</b>
                        </a>
                    </div>
                    <div class="row main">
                        <div class="col-6">
                            <img src="${dto.firstImageUrl}" alt="" width="70%">
                        </div>
                        <div class="col-6">
                            <h1>힐링 A존</h1>
                            <span>잔여 : ${available_camp_Nm}</span>
                            <h4>${dto.facltNm}</h4>
                            <p>${dto.lineIntro}</p>
                            <h5>최대인원 4명</h5>
                            <div>
                                <c:if test="${dto.siteBottomCl1 ne '0'}">
                                    <div>잔디</div>
                                </c:if>
                                <c:if test="${dto.siteBottomCl2 ne '0'}">
                                    <div>파쇄석</div>
                                </c:if>
                                <c:if test="${dto.siteBottomCl3 ne '0'}">
                                    <div>데크</div>
                                </c:if>
                                <c:if test="${dto.siteBottomCl4 ne '0'}">
                                    <div>자갈</div>
                                </c:if>
                                <c:if test="${dto.siteBottomCl5 ne '0'}">
                                    <div>노지</div>
                                </c:if>
                                <c:if test="${dto.animalCmgCl ne '불가능'}">
                                    <div>애견동반</div>
                                </c:if>
                                <c:if test="${dto.brazierCl eq '개별'}">
                                    <div>화로대</div>
                                </c:if>
                            </div>
                            <c:choose>
                                <c:when test="${loginID != null }">
                                    <!-- <a href="/reservation.rev?contentId=${dto.contentId}"> -->
                                        <input type="button" id="MemReserveBtn" value="예약하기">
                                    <!-- </a> -->
                                </c:when>
                                <c:otherwise>
                                    <input type="button" id="noMemReserveBtn" value="예약하기">
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                    <div class="row footer">
                        <div class="col">
                            Footer
                        </div>
                    </div>
                </section>
            </div>

            <script>
                $('#noMemReserveBtn').on('click', () => {
                    alert("로그인이 필요한 페이지입니다.");
                    location.href = "/login.mem";
                })

            </script>
            <script>
                $('#MemReserveBtn').on('click', () => {
                    var available_camp_Nm = "${available_camp_Nm}";
                    console.log("${available_camp_Nm}");
                    if (available_camp_Nm == 0) {
                        console.log("if");
                        console.log(available_camp_Nm);
                        alert("예약이 마감되었습니다. 다른 캠핑장을 선택해주세요.");
                    } else {
                        console.log("else");
                        console.log(available_camp_Nm);
                        location.href = "/reservation.rev?contentId=${dto.contentId}";
                    }
                })
            </script>

        </body>

        </html>