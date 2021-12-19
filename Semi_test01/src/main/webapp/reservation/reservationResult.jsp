<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
        <style>
            div {
                border: 1px solid black;
            }
        </style>
    </head>

    <body>
        <div class="container-fluid">
            <div class="row navi">
                <div class="col">Navi</div>
            </div>
            <div class="row main">
                <form action="/confirmRev.rev" id="frm">
                    <div class="col">

                        <h2>${dto.facltNm}</h2>
                        <h4>예약 고객 정보 입력</h4>
                        <input type="text" name="loginID" value="${loginID}" style="display: none;">
                        <div>
                            <label>캠핑장명</label>
                            <input type="text" name="camp_name" value="${dto.facltNm}" readonly>
                        </div>
                        <div>
                            <label for="reservation_name">예약자</label>
                            <input type="text" name="client_name" id="client_name">
                        </div>
                        <div>
                            <label for="reservation_personnel">투숙인원</label>
                            <select name="people_num" id="people_num">
                                <option value="">---선택하세요---</option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                            </select>
                        </div>
                        <div>
                            <label for="reservation_phone">연락처</label>
                            <input type="text" name="contact" id="contact">
                        </div>
                        <div>
                            <label for="reservation_refund_bank_code">환불받을 은행</label>
                            <select name="refund_bank_code" id="refund_bank_code">
                                <option value="">---선택하세요---</option>
                                <option value="신한은행">신한은행</option>
                                <option value="국민은행">국민은행</option>
                                <option value="농협은행">농협은행</option>
                                <option value="기업은행">기업은행</option>
                            </select>
                        </div>
                        <div>
                            <label for="reservation_refund_bank_account">환불받을 계좌</label>
                            <input type="text" name="account_num" id="account_num">
                        </div>
                        <div>
                            <label for="reservation_car_num">차량번호</label>
                            <input type="text" name="car_num" id="car_num">
                        </div>
                        <h4>취소규정</h4>
                        <table border="1px" align="center">
                            <tr>
                                <th>입실일 기준 7일전까지 통보시</th>
                                <td>하우머치</td>
                            </tr>
                            <tr>
                                <th>입실일 기준 6~5일전까지 통보시</th>
                                <td>하우머치</td>
                            </tr>
                            <tr>
                                <th>입실일 기준 4일전까지 통보시</th>
                                <td>하우머치</td>
                            </tr>
                            <tr>
                                <th>입실일 기준 3일전까지 통보시</th>
                                <td>하우머치</td>
                            </tr>
                            <tr>
                                <th>입실일 기준 2일~당일전까지 통보시</th>
                                <td>하우머치</td>
                            </tr>
                        </table>

                    </div>
                    <div class="col">
                        최종결제금액 및 예약하기
                        <input type="submit" value="예약하기">
                    </div>
                </form>
            </div>
            <div class="row footer">
                <div class="col">Footer</div>
            </div>
        </div>

        <script>
            // 입력 확인

            $("#frm").on("submit", function () {
                if ($("#client_name").val() == "") {
                    alert("예약자를 입력하세요.");
                    return false;
                }
                if ($("#people_num").val() == "") {
                    alert("투숙인원을 선택하세요.");
                    return false;
                }
                if ($("#contact").val() == "") {
                    alert("연락처를 입력하세요.");
                    return false;
                }
                if ($("#refund_bank_code").val() == "") {
                    alert("환불 은행을 선택해주세요.");
                    return false;
                }
                if ($("#account_num").val() == "") {
                    alert("계좌번호를 입력해주세요.");
                    return false;
                }
            })
        </script>
        <script>
        history.pushState(null, null, "http://localhost/confirmRev.rev");
        window.onpopstate = function () {
            history.go(1);
    };
        </script>
    </body>

    </html>