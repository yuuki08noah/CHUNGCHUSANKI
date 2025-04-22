<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="db.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Success</title>
</head>
<body>
<%
			String empno = request.getParameter("empno");
%>
	<script src="check.js"></script>
	<jsp:include page="header.jsp"></jsp:include>
	<section style="background-color: #E80074; color: black; font-weight: 800; width: 100%; height: 900px; padding: 30px; display: flex; flex-direction: column; justify-content: center; align-items: center">
	<h2 style="text-align:center">사원번호: <%=empno %> 님의 좌석예약조회</h2>
	<form style="display: flex; justify-content: center; align-items: center" name="frm">
		<table border="1" style="display: flex; justify-content: center; align-items: center;">
			<tr>
				<td>사원번호</td>
				<td>이름</td>
				<td>근무일자</td>
				<td>좌석번호</td>
				<td>좌석위치</td>
				<td>내선번호</td>
			</tr>
		
			<%
			request.setCharacterEncoding("UTF-8");
			String sql = "select e.empno, e.empname, r.resvdate, r.seatno, s.office, s.callno from tbl_emp_202108 e join tbl_resv_202108 r on e.empno = r.empno join tbl_seat_202108 s on r.seatno = s.seatno where e.empno = "+empno;
			
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				String date = rs.getString(3);
				String date2 = date.substring(0, 4) + "년" + date.substring(4, 6) + "월" + date.substring(6, 8) + "일";
				%>
				<tr>
					<td><%=rs.getString(1) %></td>
					<td><%=rs.getString(2) %></td>
					<td><%=date2 %></td>
					<td><%=rs.getString(4) %></td>
					<td><%=rs.getString(5) %></td>
					<td><%=rs.getString(6) %></td>
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