<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DBTKG.Util"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Modify</title>
<style>
section {
	width: 100%;
	height: 100%;
	padding: 20px;
	display: flex;
	flex-direction: column;
	gap: 20px;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp" />
	<jsp:include page="nav.jsp" />
	<section>
		<h2 style="align-items:center; text-align: center;">회원목록조회/수정</h2>
		<form name="frm" method="post" action="action.jsp" style="display: flex; align-items: center; justify-content: center; text-align: center">
		<input type="hidden" name="mode" value="modify"/>
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
						
						String sql = "select * from member_tbl_02 where custno="+request.getParameter("mod_custno");
						
						ResultSet rs = stmt.executeQuery(sql);
						rs.next();
						SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
						String joinDateStr = transFormat.format(rs.getDate("joindate"));
				%>
				<td> <input type="text" name="custno"  value="<%=request.getParameter("mod_custno")%>" readonly/></td>
			</tr>
			<tr>
				<td>회원 성명</td>
				<td><input type="text" name="custname" value="<%=rs.getString("custname") %>" readonly/></td>
			</tr>
			<tr>
				<td>회원 전화</td>
				<td><input type="text" name="phone" value="<%=rs.getString("phone")%>"/></td>
			</tr>
			<tr>
				<td>회원 주소</td>
				<td><input type="text" name="address" value="<%=rs.getString("address")%>"/></td>
			</tr>
			<tr>
				<td>가입일자</td>
				<td><input type="text" name="joindate" value="<%=joinDateStr%>" readonly/></td>
			</tr>
			<tr>
				<td>고객등급(A: VIP, B: 일반, C: 직원)</td>
				<td><input type="text" name="grade" value="<%=rs.getString("grade")%>" readonly/></td>
			</tr>
			<tr>
				<td>도시코드</td>
				<td><input type="text" name="city" value="<%=rs.getString("city")%>"/></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="등록" name="register" onclick="return modify()"/><input type="button" value="조회" name="search" onclick="return search()"/></td>
			</tr>
			<%} catch (Exception e) {
				e.printStackTrace();
			}	
					%>
		</table>
	</form>
	</section>
	<jsp:include page="footer.jsp" />
	<script src="check.js">
	</script>
</body>
</html>