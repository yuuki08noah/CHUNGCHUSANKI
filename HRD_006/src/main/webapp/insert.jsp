<%@page import="java.util.Map"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file='db.jsp' %>
<!DOCTYPE html>
<html style="margin: 0; padding: 0; height: 900px; width: 100%">
<head style="margin: 0; padding: 0; height: 900px; width: 100%">
<meta charset="UTF-8">
<title>Insert</title>
</head>
<body style="margin: 0; padding: 0; height: 900px; width: 100%">
	<script src="check.js"></script>
	<jsp:include page="header.jsp"/>
	<h2 style="text-align: center">초과근무 등록</h2>
	<div style="display: flex; justify-content: center; align-items: center; flex-direction: column">
		<form name="frm" action="do.jsp">
			<table border="1">
				<tr style="text-align: center">
					<td>사원번호</td>
					<td><input type="text" name="empno"/>예)E001</td>
				</tr>
				<tr style="text-align: center">
					<td>수당지급월</td>
					<td><input type="text" name="month"/>예)202205</td>
				</tr>
				<tr style="text-align: center">
					<td>결근</td>
					<td><input type="text" name="ab"/>회(1~100)</td>
				</tr>
				<tr style="text-align: center">
					<td>야근</td>
					<td><input type="text" name="night"/>회(1~100)</td>
				</tr>
				<tr style="text-align: center">
					<td>휴일</td>
					<td><input type="text" name="holiday"/>회(1~100)</td>
				</tr>
				<tr style="text-align: center">
					<td>출장</td>
					<td><input type="text" name="trip"/>회(1~100)</td>
				</tr>
				<tr style="text-align: center">
					<td colspan="2">
						<input type="button" name="go" value="등록" onclick="check()"/>
						<input type="button" name="reset" value="다시쓰기" onclick="r()"/>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>