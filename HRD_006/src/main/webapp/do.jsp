<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="db.jsp" %>
<%
request.setCharacterEncoding("UTF-8");

String empno = request.getParameter("empno");
String month = request.getParameter("month");
Integer ab = Integer.parseInt(request.getParameter("ab"));
Integer night = Integer.parseInt(request.getParameter("night"));
Integer holiday = Integer.parseInt(request.getParameter("holiday"));
Integer trip = Integer.parseInt(request.getParameter("trip"));

String sql = "select * from work where empno = '" + empno + "'";
PreparedStatement pstmt = conn.prepareStatement(sql);
ResultSet rs = pstmt.executeQuery();
rs.next();
ab = Integer.parseInt(rs.getString(3)) + ab;
night = Integer.parseInt(rs.getString(4)) + night;
holiday = Integer.parseInt(rs.getString(5)) + holiday;
trip = Integer.parseInt(rs.getString(6)) + trip;
sql = "update work set absence = " + ab + ", night = " + night + ", holiday = " + holiday + ", trip = " + trip + " where empno = '" + empno + "'";
pstmt = conn.prepareStatement(sql);
pstmt.executeUpdate();

%>

<jsp:forward page="index.jsp"></jsp:forward>