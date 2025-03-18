<%@page import="DBTKG.Util"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Salary</title>
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
	<jsp:include page="header.jsp"></jsp:include>
	<jsp:include page="nav.jsp"/>
	
	<section>
	<h2 style="text-align: center">회원매출조회</h2>
	<form style="display: flex; align-items: center; justify-content: center; text-align:center">
		<table border="1">
			<tr>
				<td>회원번호</td>
				<td>회원성명</td>
				<td>고객등급</td>
				<td>매출</td>
			</tr>
			<%
			request.setCharacterEncoding("UTF-8");
			Connection conn = null;
			Statement stmt = null;
			String grade = "";
			try {
				conn = Util.getConnection();
				stmt = conn.createStatement();
				
				String sql = "select me.custno, me.custname, me.grade, sum(mo.price) "
						+"from member_tbl_02 me, money_tbl_02 mo "
						+"where me.custno=mo.custno "
						+"group by me.custno, me.custname, me.grade "
						+"order by sum(mo.price) desc";
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
						<td><%=rs.getString("custno") %></td>
						<td><%=rs.getString("custname") %></td>
						<td><%=grade %></td>
						<td><%=rs.getString("sum(mo.price)") %></td>
					</tr>
					<%
				}
			} catch (Exception e) {
				e.printStackTrace();
			}	
			%>
		</table>
	</form>
	</section>
	
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>