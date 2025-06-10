<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert</title>
</head>
<body style="height: 800px; margin: 0; padding: 0">
<%
%>
	<jsp:include page="header.jsp"/>
		<div style="display: flex; justify-content: center; align-items: center; flex-direction: column; height: 100%">
	<h2 style="text-align: center">
	교과목 추가
	</h2>
	<form action="insert_process.jsp" method="post" name="frm">
		<table border=1>
			<tr>
				<td>과목코드</td>
				<td><input type="text" name="id"></td>
			</tr>
			<tr>
				<td>과목명</td>
				<td><input type="text" name="name"></td>
			
			</tr>
			<tr>
				<td>학점</td>
				<td><input type="text" name="credit"></td>
			</tr>
			<tr>
				<td>담당강사</td>
				<td>
					<select name="lecturer">
						<option >김교수
						</option>
												<option value="1">김교수
						</option>
												<option value="2">이교수
						</option>
												<option value="3">박교수
						</option>
												<option value="4">우교수
						</option>
												<option value="5">최교수
						</option>
												<option value="6">임교수
						</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>요일</td>
				<td>
				<input type="radio" name="week" value="1">월</input>
				<input type="radio" name="week" value="2" >화</input>
				<input type="radio" name="week" value="3" >수</input>
				<input type="radio" name="week" value="4" >목</input>
				<input type="radio" name="week" value="5" >금</input>
				</td>
			</tr>
			<tr>
				<td>시작시간</td>
				<td>
				<input type="text" name="start_hour"/>
				</td>
			</tr>
			<tr>
				<td>종료시간</td>
				<td>
				<input type="text" name="end_hour" />
				</td>
			</tr>
			<tr>
				<td colspan=2 style="text-align: center">
				<input type="button" onClick="sm()" value="추가"/>
				<button onClick="dl()">취소</button>
				</td>
			</tr>
			</table>
			</form></div>
	<jsp:include page="footer.jsp"/>
	<script>
	function sm() {
		const f = document.frm
		if(f.name.value.length == 0) {
			f.name.focus();
			alert("이름이 비어있어요");
			return;
		}
		else if(f.credit.value.length == 0) {
			f.credit.focus();
			alert("학점이 비어있어요");
			return;
		}
		else if(f.start_hour.value.length == 0) {
			f.start_hour.focus();
			alert("시작시간이 비어있어요");
			return;
		}
		else if(f.end_hour.value.length == 0) {
			f.end_hour.focus();
			alert("종료시간이 비어있어요");
			return;
		}
		f.submit();
	}
	
	function dl() {
		document.frm.reset();
	}
	</script>
</body>
</html>