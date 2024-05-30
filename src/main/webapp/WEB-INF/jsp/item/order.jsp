<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
    <%@ page import="java.time.LocalDate" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>구매완료 </title>
</head>
<style>
@font-face {
    font-family: 'Pretendard-Regular';
    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
    font-weight: 400;
    font-style: normal;
}
.d2 {
    background-color: black;
    padding: 5px;
}
h1 {
 font-family: 'Pretendard-Regular';
 text-align: center;
 text-size:30px;

}
a {
font-family: 'Pretendard-Regular';
text-decoration:none;
font-size: 20px;
color:black;
text-align:center;

}
p {
font-family: 'Pretendard-Regular';
text-align: center;
margin:10px;

}]
</style>
<body>
<div class="d2">
    <% 
    LocalDate currentDate = LocalDate.now();
    int year = currentDate.getYear();
    int month = currentDate.getMonthValue();
    int day = currentDate.getDayOfMonth();
    %>
    <p style="text-align:left; color:white; font-size:20px;"><b><%= year %>년 <%= month %>월 <%= day %>일</b></p>
</div>
<br><h1> 결제가 완료 되었습니다. </h1><br>
<p><a href="/main" > [메인으로]</a>
<a href="/item"> [상품판매]</a> </p>
</body>
</html>