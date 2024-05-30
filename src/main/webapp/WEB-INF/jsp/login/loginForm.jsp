<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.time.LocalDate" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>login</title>
<link href="${pageContext.request.contextPath}/resources/css/login.css" rel="stylesheet" type="text/css">
</head>
<style>
@font-face {
		    font-family: 'Pretendard-Regular';
		    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
		    font-weight: 400 ;
		    font-style: normal;
   }
     .d2{
   background-color:black;
   padding:5px;
    }
     p {
   	font-family: 'Pretendard-Regular' ;
   	font-size:20px;
   }
   
    .error_font {
   	   font-family: 'Pretendard-Regular' ;
		   font-size:20px;
		   color:red;
		   text-align:center;
   }
        .bg1{
 background-image:url("https://hpimg.gsretail.com/_ui/desktop/common/images/gscvs/about/business_gs25_img01.jpg");
    background-repeat:no-repeat;
    background-size:cover;
    height:600px;
    margin:0;   
    background-color: rgba(0, 0, 0, 0.8); /* 어두운 색상과 투명도 조절 */
  background-blend-mode: overlay;
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
<div class="bg1">
<br><h1 style="color:white;">Login</h1><br>
<p class="error_font">${errorMessage} </p> <br>

	<form action="login" method="post">
	<div class="form-group" >
		<p>
			<label>이메일: <br></label>
			<input type="text" name="email"  />
		</p></div>
		<div class="form-group" >
		<p>
			<label>비밀번호: <br></label>
			<input type="password" name="password" />
		</p></div>
		<div class="form-group" >
		<input type="submit"  id="btn" value="로그인"></div>
	</form>
	</div>
	</div>
</body>
</html>
