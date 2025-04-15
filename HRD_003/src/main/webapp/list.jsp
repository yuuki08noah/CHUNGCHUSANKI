<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="db.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List</title>
<style>
html,body {
    height:100%;
}

</style>
</head>
<body>
	<jsp:include page="header.jsp"/>
	<section style="background-color: DimGray; width: 100%; height: 100%; color: white; padding-left: 30px; padding-top: 20px">
		<h2 style="margin-bottom: 30px; text-align: center">백신정보조회</h2>
		<form>
			<table border=1 style="align-items:center; justify-content: center; text-align: center; display: flex">
				<tr>
					<td>백신코드</td>
					<td>대상감염병</td>
					<td>백신종류</td>
					<td>백신접종시기</td>
					<td>백신권장</td>
				</tr>
				<%
				request.setCharacterEncoding("UTF-8");
				
				try {
					String sql = "select * from tbl_vaccine";
					PreparedStatement pstmt = conn.prepareStatement(sql);
					ResultSet rs = pstmt.executeQuery();
					while(rs.next()) {
						String recommend = rs.getString(5);
						if(recommend.equals("1")) recommend = "연령권장";
						else if(recommend.equals("2")) recommend = "위험권장";
						%>
						<tr>
							<td><%=rs.getString(1)%></td>
							<td><%=rs.getString(2)%></td>
							<td><%=rs.getString(3)%></td>
							<td><%=rs.getString(4)%></td>
							<td><%=recommend%></td>
						</tr>
						<%
					}
					
				} catch(Exception e) {
					e.printStackTrace();
				}
				%>
			</table>
		</form>
	</section>
	<jsp:include page="footer.jsp"/>
</body>
</html>