<%@ page language="java" contentType="text/html; charset=EUC-KR"  pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.time.LocalDate" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>login success</title>
<link href="${pageContext.request.contextPath}/resources/css/main.css" rel="stylesheet" type="text/css">
</head>
<style>
.d1 {
background-color:#EBFBFF;
backgound-size: auto;
	
}
   .d2{
   background-color: black;
    padding:8px;
    }
     .b1{
    background-color: #dcdcdc; 
	background-size: auto;
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
    <p style="text-align:left; color:white"><b><%= year %>년 <%= month %>월 <%= day %>일</b> </p>
   
    <div  class="b1">
     <c:if test="${empty authInfo }">
     <p class="p3" ><a style="color:blue'"href="/login" > 로그인 </a></p>
    </c:if>
        <c:if test="${! empty authInfo }">
   <br> <p class="p3">${authInfo.name }님 환영합니다.</p>
    <p><a style=" color: black; margin:3px;"  href="/edit/changePassword" > [비밀번호 변경] </a>
       <a style=" color:black; margin:3px;" href="/logout" > [로그아웃] </a></p>
   </c:if> <br>
  <table>
        <tr>
            <td><p class="p1"><a style="color:white" href="/item" > 상품판매</a></p></td>
            <td><p class="p1"><a style="color:white" href="/item_register" > 상품등록</a></p></td>
            <td>	<p class="p1" ><a style="color:white" href="/item_list" > 상품관리</a></p></td>
        </tr>
    </table>
		</div>
		</div>
		</body>
		</html>