<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="db.jsp" %>
    <%
    request.setCharacterEncoding("UTF-8");
    try {
String id = request.getParameter("id");

String sql = "delete from course_tbl where id=" + id;
PreparedStatement pstmt = conn.prepareStatement(sql);
pstmt.executeQuery();
    } catch (Exception e) {
    	e.printStackTrace();
    }

	%>
	<jsp:forward page="list.jsp"/>
