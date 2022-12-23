<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css">
<script type="text/javascript" src="script.js"></script>
</head>
<body>
	<%@ include file="top.jsp" %>
	<section>
		<div class="title">백신접종예약</div>
		<form name="frm" action="insert">
			<div class="wrapper">
				<table style="width: 900px">
				<tr>
					<th>접종예약번호</th>
					<td><input type="text" name="resvno"><span class="ex">예) 20210001</span></td>
				</tr>
				<tr>
					<th>주민번호</th>
					<td><input type="text" name="jumin"><span class="ex">예) 710101-1000001</span></td>
				</tr>
				<tr>
					<th>백신코드</th>
					<td><input type="text" name="vcode"><span class="ex">예) V001 ~ V003</span></td>
				</tr>
				<tr>
					<th>병원코드</th>
					<td><input type="text" name="hospcode"><span class="ex">예) H001</span></td>
				</tr>
				<tr>
					<th>예약일자</th>
					<td><input type="text" name="resvdate"><span class="ex">예) 20101231</span></td>
				</tr>
				<tr>
					<th>예약시간</th>
					<td><input type="text" name="resvtime"><span class="ex">에) 1230</span></td>
				</tr>
				<tr>
					<td colspan=2>
						<button class="btn" type="button" onclick="fn_submit(); return false;">등   록</button>
						<button class="btn"  type="reset" onclick="alter('정보를 지우고 처음부터 다시 입력합니다!')">다시쓰기</button>
					</td>
				</tr>
				</table>
			</div>
		</form>
	</section>
	<%@ include file="footer.jsp" %>
</body>
</html>