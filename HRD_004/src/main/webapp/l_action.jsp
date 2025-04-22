<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="db.jsp" %>
<%
request.setCharacterEncoding("UTF-8");
String empno = request.getParameter("empno");

String sql = "select * from tbl_resv_202108 where empno="+empno;
PreparedStatement pstmt = con.prepareStatement(sql);
ResultSet rs = pstmt.executeQuery();

if(rs.next()) {
	%>
	<jsp:forward page="success.jsp"></jsp:forward>
	<%
} else {
	%>
	<jsp:forward page="fail.jsp"></jsp:forward>
	<%
}
%>