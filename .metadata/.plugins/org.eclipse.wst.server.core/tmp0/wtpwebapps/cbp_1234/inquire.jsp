<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
	<%@ include file="top.jsp" %>
	<section>
		<div class="title">접종예약조회</div>
		<form action="select"> <!-- action:自己指定的网页网址的后面的名字。 -->
		<div class="wrapper">
			<table style="width: 900px">
				<tr>
					<th>예약번호를 입력 하시오</th>
					<td><input type="text" name="resvno"></td>
				</tr>
				<tr>
					<td colspan="2">
						<button class="btn" type="submit" onclick=" ">예약조회</button>
						<button class="btn" type="reset" onclick="location.href='home'">홈으로</button>
						
					</td>
				</tr>
			</table>
		</div>
		</form>
	</section>
	<%@ include file="footer.jsp" %>
</body>
</html>