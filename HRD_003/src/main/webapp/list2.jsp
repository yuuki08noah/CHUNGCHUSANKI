<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="db.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List2</title>
</head>
<body>
	<jsp:include page="header.jsp"/>
	<section style="background-color: DimGray; width: 100%; height: 900px; color: white; padding-left: 30px; padding-top: 20px">
		<h2 style="margin-bottom: 30px; text-align: center">백신정보조회</h2>
		<form>
			<table border=1 style="align-items:center; justify-content: center; text-align: center; display: flex">
				<tr>
					<td>접종이력번호</td>
					<td>아이디</td>
					<td>성명</td>
					<td>백신코드</td>
					<td>백신종류</td>
					<td>백신권장</td>
					<td>접종일자</td>
					<td>접종회차</td>
					<td>접종결과</td>
					<td>기관이름</td>
				</tr>
				<%
				request.setCharacterEncoding("UTF-8");
				
				try {
					String sql = "select h.vaccinate_no, h.people_id, p.people_name, v.vaccine_code, v.vaccines, v.vaccine_recommendation, h.vaccinate_date, h.vaccinate_round, h.vaccinate_result, a.institutional_name " + 
							"from tbl_vaccination h join tbl_vaccine v on h.vaccinate_code = v.vaccine_code join tbl_people p on p.people_id = h.people_id join tbl_institutional a on a.visit_agency = h.visit_agency " +
							"order by h.vaccinate_no";
					PreparedStatement pstmt = conn.prepareStatement(sql);
					ResultSet rs = pstmt.executeQuery();
					while(rs.next()) {
						String recommend = rs.getString(6);
						if(recommend.equals("1")) recommend = "연령권장";
						else if(recommend.equals("2")) recommend = "위험권장";
						
						String date = rs.getString(7);
						String date2 = "20"+date.substring(0, 2)+"/"+date.substring(2,4)+"/"+date.substring(4, 6);
						int round = rs.getInt(8);
						String round2 = "";
						if(round==1) round2 = "1회차";
						else if(round==2) round2 = "2회차";
						
						String result = rs.getString(9);
						if(result.equals("N")) result = "정상";
						else if(result.equals("A")) result = "이상";
						%>
						<tr>
							<td><%=rs.getString(1) %></td>
							<td><%=rs.getString(2) %></td>
							<td><%=rs.getString(3) %></td>
							<td><%=rs.getString(4) %></td>
							<td><%=rs.getString(5) %></td>
							<td><%=recommend %></td>
							<td><%=date2 %></td>
							<td><%=round2 %></td>
							<td><%=result %></td>
							<td><%=rs.getString(10) %></td>
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