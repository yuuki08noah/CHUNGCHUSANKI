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
<title>GroupBy</title>
</head>
<body style="margin: 0; padding: 0; height: 900px; width: 100%">
	<jsp:include page="header.jsp"/>
	<h2 style="text-align: center">부서별 급여조회</h2>
	<div style="display: flex; justify-content: center; align-items: center; flex-direction: column">
		<table border="1">
			<tr style="text-align: center">
				<td>부서번호</td>
				<td>부서명</td>
				<td>합계</td>
			</tr>
			<%
			request.setCharacterEncoding("UTF-8");
			
			String sql = "select d.deptcode, d.deptname, sum(e.salary) from dept d, employee e where e.deptcode = d.deptcode group by d.deptcode, d.deptname";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();

			while(rs.next()) {
				%>
				<tr style="text-align: center">
					<td><%=rs.getString(1) %></td>
					<td><%=rs.getString(2) %></td>
					<td>￦<%=rs.getString(3) %></td>
				</tr>
				<%
			}
			%>
		</table>
	</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>