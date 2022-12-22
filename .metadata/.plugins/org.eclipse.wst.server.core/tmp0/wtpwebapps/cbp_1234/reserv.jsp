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
		<div class="title">백신접종예약</div>
		<form action="">
			<input type="hidden" id="res" value="insert">
			<div class="wrapper">
				<table>
				<tr>
					<th>접종예약번호</th>
					<td><input type="text" name=""><span class="ex">예) 20210001</span></td>
				</tr>
				<tr>
					<th>주민번호</th>
					<td><input type="text" name=""><span class="ex">예) 710101-1000001</span></td>
				</tr>
				<tr>
					<th>백신코드</th>
					<td><input type="text" name=""><span class="ex">예) V001 ~ V003</span></td>
				</tr>
				<tr>
					<th>병원코드</th>
					<td><input type="text" name=""><span class="ex">예) H001</span></td>
				</tr>
				<tr>
					<th>예약일자</th>
					<td><input type="text" name=""><span class="ex">예) 20101231</span></td>
				</tr>
				<tr>
					<th>예약시간</th>
					<td><input type="text" name=""><span class="ex">에) 1230</span></td>
				</tr>
				<tr>
					<td colspan=2>
						<button class="btn">등   록</button>
						<button class="btn">다시쓰기</button>
					</td>
				</tr>
				</table>
			</div>
		</form>
	</section>
	<%@ include file="footer.jsp" %>
</body>
</html>