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
    <p style="text-align:left; color:white"><b><%= year %>�� <%= month %>�� <%= day %>��</b> </p>
   
    <div  class="b1">
     <c:if test="${empty authInfo }">
     <p class="p3" ><a style="color:blue'"href="/login" > �α��� </a></p>
    </c:if>
        <c:if test="${! empty authInfo }">
   <br> <p class="p3">${authInfo.name }�� ȯ���մϴ�.</p>
    <p><a style=" color: black; margin:3px;"  href="/edit/changePassword" > [��й�ȣ ����] </a>
       <a style=" color:black; margin:3px;" href="/logout" > [�α׾ƿ�] </a></p>
   </c:if> <br>
  <table>
        <tr>
            <td><p class="p1"><a style="color:white" href="/item" > ��ǰ�Ǹ�</a></p></td>
            <td><p class="p1"><a style="color:white" href="/item_register" > ��ǰ���</a></p></td>
            <td>	<p class="p1" ><a style="color:white" href="/item_list" > ��ǰ����</a></p></td>
        </tr>
    </table>
		</div>
		</div>
		</body>
		</html>