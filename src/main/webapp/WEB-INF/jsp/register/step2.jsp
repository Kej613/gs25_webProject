<%@ page contentType="text/html; charset=utf-8" %>
 <%@ page import="java.time.LocalDate" %>
<!DOCTYPE html>
<html>
<head> <title>직원등록</title> 
<link href="${pageContext.request.contextPath}/resources/css/register.css" rel="stylesheet" type="text/css">
</head>
<style>
     .d2{
   background-color:black;
   padding:5px;
    } 
</style>
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
<body>
		<h1>직원 정보 입력</h1> <br>
				<form action="step3" method="post">
				<div class="form-group" >
				<p> <label>이름:<br>
					<input type="text" name="name" id="name" value="${registerRequest.name}">
						</label> </p></div>
						<div class="form-group" >
				<p> <label>비밀번호:<br>
					<input type="password" name="password" id="password">
						</label> </p></div>
						<div class="form-group" >
				<p> <label>비밀번호 확인:<br>
					<input type="password" name="confirmPassword" id="confirmPassword">
						</label> </p></div>
						<div class="form-group" >
						<p> <label>이메일:<br>
					<input type="text" name="email" id="email" value="${registerRequest.email}">
						</label> </p> <br></div>
						<div class="form-group" >
					<input type="submit" id="btn"  value="가입 완료">
					</div>
				</form>
</body>
</html>