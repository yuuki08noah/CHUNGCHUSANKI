<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert</title>
<style>
html,body {
    height:100%;
}

</style>
</head>
<body>
	<script src="check.js"></script>
	<jsp:include page="header.jsp"/>
	<section style="background-color: DimGray; width: 100%; height: 100%; color: white; padding-left: 30px; padding-top: 20px; justify-content: center;">
		<h2 style="margin-bottom: 30px; text-align: center">예방접종이력목록</h2>
		<form name="frm" action="i_action.jsp" method="post" style="align-items:center; justify-content: center; text-align: center; display: flex">
			<table border=1>
				<tr>
					<td>접종이력번호</td>
					<td><input type="text" name="v_no">예: A001</td>
				</tr>
				<tr>
					<td>아이디</td>
					<td><input type="text" name="p_id">예: C001</td>
				</tr>
				<tr>
					<td>백신코드</td>
					<td><input type="text" name="v_code">예: V008</td>
				</tr>
				<tr>
					<td>접종일자</td>
					<td><select name="v_date">
						<option value=""></option>
						<option value="1">V001</option>
						<option value="2">V002</option>
						<option value="3">V003</option>
						<option value="4">V004</option>
						<option value="5">V005</option>
						<option value="6">V006</option>
						<option value="7">V007</option>
						<option value="8">V008</option>
						<option value="9">V009</option>
					</select>
					예: 230701</td>
				</tr>
				<tr>
					<td>접종회차</td>
					<td><input type="text" name="v_round">예: 1</td>
				</tr>
				<tr>
					<td>접종결과</td>
					<td>
						<select name="v_result">
							<option value="">결과선택</option>
							<option value="N">[N] 정상</option>
							<option value="A">[A] 이상</option>
						</select>
						예: (N)정상
					</td>
				</tr>
				<tr>
					<td>기관</td>
					<td><input type="text" name="visit_agency">예: B023</td>
				</tr>
				<tr>
					<td colspan="2" style=";"><input type="button" onclick="addCheck()" value="등록" name="register">
					<input type="button" onclick="res()" value="다시쓰기"></td>
				</tr>
			</table>
		</form>
	</section>
	<jsp:include page="footer.jsp"/>
</body>
</html>