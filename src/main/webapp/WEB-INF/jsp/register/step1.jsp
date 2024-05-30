<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.time.LocalDate" %>
<!DOCTYPE html>
<html>
<head>
			<title>직원등록</title>
</head>
<style> 
@font-face {
    font-family: 'Pretendard-Regular';
    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
    font-weight: 400;
    font-style: normal;
   }
   h2{
   font-family: 'Pretendard-Regular';
   text-align: center;
   text-size: 20px;
   }
   p{
    font-family: 'Pretendard-Regular';
   text-size: 18px;
   }
        .d2{
   background-color:black;
   padding:5px;
    } 
    input{
        font-family: 'Pretendard-Regular';
        text-align:center;
        margin:0 auto;
    
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
			<h2 >약관</h2>
			<p><b>약관 내용</b> <br>
			제1조(목적) 이 약관은 업체 회사(전자상거래 사업자)가 운영하는 업체 사이버 몰(이하 “몰”이라 한다)에서 제공하는 인터넷 관련 서비스(이하 “서비스”라 한다)를 이용함에 있어 사이버 몰과 이용자의 권리․의무 및 책임사항을 규정함을 목적으로 합니다.<br>
			 
  ※「PC통신, 무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준용합니다.」
			</p>
			<p><b>개인정보 활용 및 이용 동의</b> <br> 
[차례] <br>
1. 총칙 <br>
2. 개인정보 수집에 대한 동의<br>
3. 개인정보의 수집 및 이용목적<br>
4. 수집하는 개인정보 항목<br>
5. 개인정보 자동수집 장치의 설치, 운영 및 그 거부에 관한 사항<br>
6. 목적 외 사용 및 제3자에 대한 제공<br>
7. 개인정보의 열람 및 정정<br>
8. 개인정보 수집, 이용, 제공에 대한 동의철회<br>
9. 개인정보의 보유 및 이용기간<br>
10. 개인정보의 파기절차 및 방법<br>
11. 아동의 개인정보 보호<br>
12. 개인정보 보호를 위한 기술적 대책<br>
13. 개인정보의 위탁처리<br>
14. 의겸수렴 및 불만처리<br>
15. 부 칙(시행일) <br></p><br>
			
			<form action="step2" method="post">
			<div class="form-group">		
					<label>
						<input style="text-align:center; "type="checkbox" name="agree" value="true">모두 동의 <br>
					</label></div>
					<div class="form-group">				
							<input type="submit" value="다음 단계" /></div>
			</form>
</body>
</html>