<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="db.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List</title>
</head>
<body style="height: 800px; margin: 0; padding: 0;">
	<jsp:include page="header.jsp"/>
	<div style="display: flex; justify-content: center; align-items: center; flex-direction: column; height: 100%">
	<h2 style="text-align: center">
	교과목 목록
	</h2>
	<form action="" method="post">
		<table border=1>
			<tr>
				<td>과목코드</td>
				<td>과목명</td>
				<td>학점</td>
				<td>담당강사</td>
				<td>요일</td>
				<td>시작시간</td>
				<td>종료시간</td>
				<td>삭제</td>
			</tr>
						<%
			request.setCharacterEncoding("UTF-8");
			String sql = "select c.id, c.name, c.credit, l.name, c.week, c.start_hour, c.end_hour from course_tbl c join lecturer_tbl l on c.lecturer = l.idx";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			Map<String, String> map = Map.of(
					"1", "월요일",
					"2", "화요일",
					"3", "수요일",
					"4", "목요일",
					"5", "금요일"
					);
			while(rs.next()) {
				try {
				String id = rs.getString(1);
				String name = rs.getString(2);
				String credit = rs.getString(3);
				String lecturer = rs.getString(4);
				String week = map.get(rs.getString(5));
				int l = rs.getString(6).length() == 4 ? 0 : 1;
				int r = rs.getString(7).length() == 4 ? 0 : 1;
				String start_hour = rs.getString(6).substring(0, 2-l) + "시" + rs.getString(6).substring(2-l, 4-l) + "분";
				String end_hour = rs.getString(7).substring(0, 2-r) + "시" + rs.getString(7).substring(2-r, 4-r) + "분";
				String start_hour_org = (rs.getString(6).length() == 4 ? "" : "0") + rs.getString(6);
				String end_hour_org = (rs.getString(7).length() == 4 ? "" : "0") + rs.getString(7);
								%>
				<tr>
					<td><a href="modify.jsp?id=<%=id%>&name=<%=name %>&credit=<%=credit %>&lecturer=<%=lecturer %>&week=<%=week%>&start_hour=<%=start_hour_org%>&end_hour=<%=end_hour_org%>"><%=id %></a></td>
					<td><%=name %></td>
					<td><%=credit %></td>
					<td><%=lecturer %></td>
					<td><%=week %></td>
					<td><%=start_hour %></td>
					<td><%=end_hour %></td>
					<td><a href="delete.jsp?id=<%=id%>">삭제</a></td>
				</tr>
				<%
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			%>
		</table>
	</form>
	</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>