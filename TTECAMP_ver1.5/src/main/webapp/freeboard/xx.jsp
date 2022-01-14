<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<script
  src="https://code.jquery.com/jquery-3.6.0.js"></script>
     <style>
      button{
         width: 100%;
      }
   </style>
</head>
<body>
   <table border="1" align="center">
      <tr>
         <th colspan="2"> login</th>
      </tr>

      <form action="/login.mem" method="post">
      <tr>
         <td>ID : <input type="text" name="id" id=""></td>
      </tr>
      <tr>
         <td>PW : <input type="text" name="pw" id=""></td>
      </tr>
      <tr>
         <td><button type="submit">login</button></td>
          </form>
          <td><a href="/noMemGetTo.mem"><button type="button">비회원 입장</button></a></td>
      </tr>
      <tr>
      <td colspan="2"><a href="/logout.mem"><button type="button">로그아웃</button></a></td>
      </tr>
  
   </table>
</body>
</html>