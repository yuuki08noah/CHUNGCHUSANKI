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
<title>Index</title>
</head>
<body style="margin: 0; padding: 0; height: 900px; width: 100%">
	<jsp:include page="header.jsp"/>
	<h2 style="text-align: center">급여조회(2022년 5월)</h2>
	<div style="display: flex; justify-content: center; align-items: center; flex-direction: column">
		<table border="1">
			<tr style="text-align: center">
				<td>사원번호</td>
				<td>사원성명</td>
				<td>입사일</td>
				<td>부서</td>
				<td>직급</td>
				<td>결근</td>
				<td>야근</td>
				<td>휴일</td>
				<td>출장</td>
				<td>급여</td>
			</tr>
			<%
			request.setCharacterEncoding("UTF-8");
			
			String sql = "select e.empno, e.empname, e.hiredate, d.deptname, e.job, w.absence, w.night, w.holiday, w.trip, e.salary from employee e, dept d, work w where e.empno = w.empno and e.deptcode = d.deptcode order by empno";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			Map<String, String> map = Map.of(
					"1", "사원",
					"2", "주임",
					"3", "대리",
					"4", "과장",
					"5", "차장",
					"6", "부장",
					"7", "상무",
					"8", "전무",
					"9", "사장"
					);
			while(rs.next()) {
				String empno = rs.getString(1);
				String empname = rs.getString(2);
				String hiredate = rs.getString(3);
				String dept = rs.getString(4);
				String job = rs.getString(5);
				String ab = rs.getString(6);
				String night = rs.getString(7);
				String holiday = rs.getString(8);
				String trip = rs.getString(9);
				String salary = rs.getString(10);
				
				hiredate = hiredate.split(" ")[0];
				
				int cnt = 0;
				for(int i = 3; i < salary.length(); i+=(3+cnt)) {
					salary = salary.substring(0, salary.length() - i) + ',' + salary.substring(salary.length() - i, salary.length());
					cnt++;
				}
				%>
				<tr style="text-align: center">
					<td><%=empno %></td>
					<td><%=empname %></td>
					<td><%=hiredate %></td>
					<td><%=dept %></td>
					<td><%=map.get(job) %></td>
					<td><%=ab %>일</td>
					<td><%=night %>일</td>
					<td><%=holiday %>일</td>
					<td><%=trip %>일</td>
					<td>￦<%=salary %></td>
				</tr>
				<%
			}
			%>
		</table>
	</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>