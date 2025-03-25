<%@page import="DBTKG.Util"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	tr {
		border: 1px solid black
	}
	td {
		border: 1px solid black;
	}
</style>
</head>
<body>
	<script type="text/javascript" src="check.js"></script>
	<jsp:include page="header.jsp"></jsp:include>
	<jsp:include page="nav.jsp"></jsp:include> 
	<form method="post" name="frm" action="action.jsp" style="display: flex; align-items: center; justify-content: center; text-align: center">
		<input type="hidden" name="mode" value="insert"/>
		<table style="border: 1px solid black">
			<tr>
				<td>회원 번호(자동발생)</td>
				<%
					request.setCharacterEncoding("UTF-8");
					Connection conn = null;
					Statement stmt = null;
					String custno = "";
					try {
						conn = Util.getConnection();
						stmt = conn.createStatement();
						
						String sql = "SELECT MAX(custno)+1 custno FROM member_tbl_02";
						ResultSet rs = stmt.executeQuery(sql);
						rs.next();
						custno = rs.getString("custno");
					} catch (Exception e) {
						e.printStackTrace();
					}	
				%>
				<td><input type="text" name="custno"  value="<%=custno%>" readonly/></td>
			</tr>
			<tr>
				<td>회원 성명</td>
				<td><input type="text" name="custname" /></td>
			</tr>
			<tr>
				<td>회원 전화</td>
				<td><input type="text" name="phone" /></td>
			</tr>
			<tr>
				<td>회원 주소</td>
				<td><input type="text" name="address" /></td>
			</tr>
			<tr>
				<td>가입일자</td>
				<td><input type="text" name="joindate" /></td>
			</tr>
			<tr>
				<td>고객등급(A: VIP, B: 일반, C: 직원)</td>
				<td><input type="text" name="grade" /></td>
			</tr>
			<tr>
				<td>도시코드</td>
				<td><input type="text" name="city" /></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="등록" name="register" onclick="return joincheck()"/><input type="submit" value="조회" name="search" /></td>
			</tr>
		</table>
	</form>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>