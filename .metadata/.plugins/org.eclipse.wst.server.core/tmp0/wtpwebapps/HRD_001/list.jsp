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
<title>Insert title here</title>
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
		<form
			style="display: flex; align-items: center; justify-content: center; text-align: center;">
			<table border="1">
				<tr>
					<td>회원번호</td>
					<td>회원성명</td>
					<td>전화번호</td>
					<td>주소</td>
					<td>가입일자</td>
					<td>고객등급</td>
					<td>거주지역</td>
				</tr>
				<%
			Connection conn = null;
			Statement stmt = null;
			String grade = "";
			try {
				conn = Util.getConnection();
				stmt = conn.createStatement();
				
				String sql = "select * from member_tbl_02 order by custno";
				ResultSet rs = stmt.executeQuery(sql);
				
				while(rs.next()) {
					grade = rs.getString("grade");
					switch(grade) {
					case "A":
						grade = "VIP";
						break;
					case "B":
						grade = "일반";
						break;
					case "C":
						grade = "직원";
						break;
					}
					%>
					<tr>
						<td><a href="modify.jsp?mod_custno=<%=rs.getString("custno")%>"><%=rs.getString("custno")%></a></td>
						<td><%=rs.getString("custname")%></td>
						<td><%=rs.getString("phone")%></td>
						<td><%=rs.getString("address")%></td>
						<td><%=rs.getDate("joindate")%></td>
						<td><%=grade%></td>
						<td><%=rs.getString("city")%></td>
					</tr>
					<%
				}
			} catch(Exception e) {
				
			}
			%>
			</table>
		</form>
	</section>
	<jsp:include page="footer.jsp" />

</body>
</html>