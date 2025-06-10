<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
* {
	margin: 0;
	padding: 0;
}
</style>
</head>
<body style="height: 800px; margin: 0; padding: 0; top: 0">
	<jsp:include page="header.jsp"/>
	<section style="height: 100%; width: 100%;">
		<h2 style="text-align: center">
		수강신청 관리 프로그램
		</h2>
		<div style="padding-left: 30px">
		1. 총 10개의 교과목이 있습니다.<br>
		2. 교과목 목록을 확인하려면 교과목록 조회/수정 메뉴를 클릭하세요.<br>
		3. 교과목을 추가하려면 교과목 추가 메뉴를 클릭하세요.<br>
		4. 교과목을 수정하려면 교과목 목록 메뉴에서 과목코드를 클릭하세요.<br>
		</div>
	</section>
	<jsp:include page="footer.jsp"/>
</body>
</html>