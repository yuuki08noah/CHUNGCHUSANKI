<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
	height: 100%;
	width: 100%;
}
nav {
	height: 50px;
	width: 100%;
	color: white;
	background-color: blue;
	display: flex;
	align-items: center;
	gap: 40px;
	flex-direction: flex-start;
	padding-left: 30px;
}
nav > a {
	text-decoration: none;
	color: white;
}
</style>
</head>
<body>
<nav>
		<a href="join.jsp">회원등록</a>
		<a href="list.jsp">회원목록조회/수정</a>
		<a href="salary.jsp">회원매출조회</a>
		<a href="index.jsp">홈으로</a>
	</nav>
</body>
</html>