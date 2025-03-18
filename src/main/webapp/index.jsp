<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
@charset "UTF-8";
* {
	margin: 0 0
}
body {
	height: 100%;
	width: 100%;
}
section {
	width: 100%;
	height: 100%;
	padding: 20px;
	display: flex;
	flex-direction: column;
	gap: 20px;
}
.title {
	width: 100%;
	height: 50px;
	font-weight: 600;
	display: flex;
	align-items: center;
	justify-content: center;
}

</style>
</head>
<body>
	<jsp:include page="header.jsp"/>
	<jsp:include page="nav.jsp"/>
	<section>
	<div class="title">쇼핑몰 회원관리 프로그램</div>
	<div>쇼핑몰 회원정보와 회원매출정보 데이터베이스를 구축하고 회원관리 프로그램을 작성하는 프로그램이다.<br>프로그램 작성 순서<br>1. 회원정보 테이블을 생성한다.<br>2. 매출정보 테이블을 생성한다.<br>3. 회원정보, 매출정보 테이블에 제시된 문제지의 참조데이터를 추가 생성한다.<br>4. 회원정보 이벽 화면프로그램을 작성한다.<br>5. 회원정보 조회 프로그램을 작성한다.<br>6. 회원매출정보 조회 프로그램을 작성한다.</div>
	</section>
	<jsp:include page="footer.jsp"/>
</body>
</html>