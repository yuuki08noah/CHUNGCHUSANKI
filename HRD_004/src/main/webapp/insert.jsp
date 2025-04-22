<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert</title>
</head>
<body>
	<script src="check.js"></script>
	<jsp:include page="header.jsp"></jsp:include>
	<section style="background-color: #E80074; color: black; font-weight: 800; width: 100%; height: 900px; padding: 30px; display: flex; justify-content: center; align-items: center">
	<form method="post" style="display: flex; justify-content: center; align-items: center" name="frm" action="i_action.jsp">
		<table border="1" style="display: flex; justify-content: center; align-items: center;">
			<tr>
				<td>예약번호</td>
				<td><input type="text" name="resvno">예) 20210001</td>
			</tr>
			<tr>
				<td>사원번호</td>
				<td><input type="text" name="empno">예) 1001</td>
			</tr>
			<tr>
				<td>근무일자</td>
				<td><input type="text" name="resvdate">예) 20211231</td>
			</tr>
			<tr>
				<td>좌석번호</td>
				<td><input type="text" name="seatno">예) 15001-5009</td>
			</tr>
			<tr >
				<td colspan="2" style="text-align: center">
				<input type="button" value="check" onclick="check()">
				<input type="button" value="reset" onclick="res()">
				</td>
			</tr>
		</table>
	</form>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>