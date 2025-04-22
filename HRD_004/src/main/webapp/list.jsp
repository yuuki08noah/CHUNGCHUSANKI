<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List</title>
</head>
<body>
	<script src="check.js"></script>
	<jsp:include page="header.jsp"></jsp:include>
	<section style="background-color: #E80074; color: black; font-weight: 800; width: 100%; height: 900px; padding: 30px; display: flex; justify-content: center; align-items: center">
	<form style="display: flex; justify-content: center; align-items: center" name="frm" action="l_action.jsp">
		<table border="1" style="display: flex; justify-content: center; align-items: center;">
			<tr>
				<td>사원번호를 입력하시오</td>
				<td><input type="text" name="empno"></td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center"><input type="button" value="좌석예약조회" onclick="check2()"><input type="button" value="홈으로" onclick="home()"></td>
			</tr>
		</table>
	</form>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>