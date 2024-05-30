<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.time.LocalDate" %>

<!DOCTYPE html>
<html>
<head>
<title>메인페이지</title>
</head>
<style>
 @font-face {
    font-family: 'Pretendard-Regular';
    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
    font-weight: 400;
    font-style: normal;
   }
   @font-face {
    font-family: 'SBAggroB';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/SBAggroB.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
      .bg1{
 background-image:url("https://hpimg.gsretail.com/_ui/desktop/common/images/gscvs/about/business_gs25_img01.jpg");
    background-repeat:no-repeat;
    background-size:cover;
    height:600px;
    margin:0;   
    background-color: rgba(0, 0, 0, 0.5); /* 어두운 색상과 투명도 조절 */
  background-blend-mode: overlay;
   }
      .d2{
   background-color:black;
   padding:5px;
    }
    .p-font {
    font-family:'SBAggroB';
    font-size:50px;
    color:white;
  	text-align:center;
  	padding-bottom:20px;
  	}
  	   a {
  	   font-family: 'Pretendard-Regular';
    text-decoration: none;
    text-align:center;
    padding:18px;
    background-color:black; 
    border-radius:10px;
    color:white;
    
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
    <a style="text-align:right; color:white; font-size:20px;">by KEJ</a>   </p>
<div class="bg1">
 <br><br><br><br><br><br><p class="p-font"> 환영합니다. </p>
 <c:if test="${empty authInfo }">
    <br><p style="text-align:center; color:white; font-size:25px; "><a href="/login" > Login </a></p>
    </c:if> 
    </div>
</div>
</body>
</html>