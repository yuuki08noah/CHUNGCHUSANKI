<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="db.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Total</title>
</head>
<body>
	<jsp:include page="header.jsp"/>
	<section style="background-color: DimGray; width: 100%; height: 900px; color: white; padding-left: 30px; padding-top: 20px">
		<h2 style="margin-bottom: 30px; text-align: center">백신정보조회</h2>
		<form>
			<table border=1 style="align-items:center; justify-content: center; text-align: center; display: flex">
				<tr>
					<td>백신코드</td>
					<td>대상감염병</td>
					<td>백신종류</td>
					<td>정상접종횟수</td>
				</tr>
				<%
				request.setCharacterEncoding("UTF-8");
				
				try {
					String sql = "select v.vaccinate_code, k.infectious_disease, k.vaccines, count(v.vaccinate_code) from tbl_vaccination v join tbl_vaccine k on v.vaccinate_code = k.vaccine_code where v.vaccinate_result = 'N' group by v.vaccinate_code, k.infectious_disease, k.vaccines order by v.vaccinate_code";
					PreparedStatement pstmt = conn.prepareStatement(sql);
					ResultSet rs = pstmt.executeQuery();
					while(rs.next()) {
						%>
						<tr>
							<td><%=rs.getString(1)%></td>
							<td><%=rs.getString(2)%></td>
							<td><%=rs.getString(3)%></td>
							<td><%=rs.getString(4)%></td>
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