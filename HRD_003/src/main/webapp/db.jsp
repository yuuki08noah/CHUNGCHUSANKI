<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%
Class.forName("oracle.jdbc.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
%>