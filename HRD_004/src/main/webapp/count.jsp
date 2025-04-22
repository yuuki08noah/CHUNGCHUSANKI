<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="db.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Count</title>
</head>
<body>
	<script src="check.js"></script>
	<jsp:include page="header.jsp"></jsp:include>
	<section style="background-color: #E80074; color: black; font-weight: 800; width: 100%; height: 900px; padding: 30px; display: flex; flex-direction: column; justify-content: center; align-items: center">
	<h2 style="text-align:center">부서별근무일수집계</h2>
	<form style="display: flex; justify-content: center; align-items: center" name="frm">
		<table border="1" style="display: flex; justify-content: center; align-items: center;">
			<tr>
				<td>사원번호</td>
				<td>이름</td>
				<td>부서명</td>
				<td>근무일수</td>
			</tr>
		
			<%
			request.setCharacterEncoding("UTF-8");
			String sql = "select e.empno, e.empname, e.deptcode, count(r.resvdate) from tbl_emp_202108 e join tbl_resv_202108 r on e.empno = r.empno group by e.empno, e.empname, e.deptcode";
			
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next()) {
				String dept = rs.getString(3);
				dept = dept.equals("10") ? "영업팀" : dept.equals("20") ? "총무팀" : "구매팀";
						
				%>
				<tr>
					<td><%=rs.getString(1) %></td>
					<td><%=rs.getString(2) %></td>
					<td><%=dept %></td>
					<td><%=rs.getString(4) %></td>
				</tr>
				<%
			}
			%>
		</table>
	</form>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>