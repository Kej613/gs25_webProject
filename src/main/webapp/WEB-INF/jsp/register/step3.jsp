<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.time.LocalDate" %>
<!DOCTYPE html>
<html>
<head>
<title>회원가입</title>
<link href="${pageContext.request.contextPath}/resources/css/register.css" rel="stylesheet" type="text/css">
</head>
<style>
  .d2{
   background-color:black;
   padding:5px;
    } 
</style>
<body>
<div class="d2">
<% 
        LocalDate currentDate = LocalDate.now();
        int year = currentDate.getYear();
        int month = currentDate.getMonthValue();
        int day = currentDate.getDayOfMonth();
    %>
    <p style="text-align:left; color:white; font-size:20px;"><b><%= year %>년 <%= month %>월 <%= day %>일</b>
  </p>
   </div>
		<p class="p1"><strong>${registerRequest.name}님</strong>
				 직원 등록이 완료되었습니다. </p>
		<p class="p1"><a href='/main' />[메인 화면]</a></p>
		<p class="p1""><a href='/list' />[직원 리스트 보기]</a></p>
</body>
</html>