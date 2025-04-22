<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="db.jsp" %>
<%
request.setCharacterEncoding("UTF-8");
String resvno = request.getParameter("resvno");
String empno = request.getParameter("empno");
String resvdate = request.getParameter("resvdate");
String seatno = request.getParameter("seatno");

String sql = "insert into tbl_resv_202108 values(" + resvno + ", " + empno + ", " + resvdate + ", " + seatno + ")";
PreparedStatement pstmt = con.prepareStatement(sql);
ResultSet rs = pstmt.executeQuery();
%>