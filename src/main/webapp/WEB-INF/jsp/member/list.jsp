<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ page import="java.time.LocalDate" %>
<!DOCTYPE html>
<html>
<head> 
<meta charset="utf-8"> 
<link href="${pageContext.request.contextPath}/resources/css/main.css" rel="stylesheet" type="text/css">
</head>
<style>
     .d2{
   background-color:black;
   padding:5px;
    } 
    th {
    background-color: skyblue; /* 하늘색 배경을 설정 */
}
td {
    padding: 10px 20px; /* 열 간격을 조정하는 부분 */
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
<h1> 직원 리스트 </h1>
<hr style="color:gray;"> <br><br> 
<p style="text-align:right; color: blue;"><a style="text-align:right;color:blue;"href="/members">직원 조회</a></p>
<div>
	<table>
    <thead>
        <tr style="background-color:skyblue">
            <th >번호</th>
            <th>이름</th>
            <th>이메일</th>
            <th>등록일</th>
              <th>직원삭제</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="member" items="${members}" varStatus="status">
            <tr>
                <td>${status.index + 1}</td>
                <td> ${member.name}</td>
                <td>${member.email}</td>
                <td>${member.registerDateTime}</td>
              	<td><a style="color:white; background-color:black;" href="/member/delete/${member.email}">삭제</a></td>
            </tr>
        </c:forEach>
    </tbody>
</table>
</div>
</body>
</html>