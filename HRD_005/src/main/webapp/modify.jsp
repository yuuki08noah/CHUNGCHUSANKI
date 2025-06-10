<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Modify</title>
</head>
<body style="height: 800px">
<%
String id = request.getParameter("id");
String name = request.getParameter("name");
String credit = request.getParameter("credit");
String lecturer = request.getParameter("lecturer");
String week = request.getParameter("week");
String start_hour = request.getParameter("start_hour");
String end_hour = request.getParameter("end_hour");
Map<String, Integer> map = Map.of(
		"김교수", 1,
		"이교수", 2,
		"박교수", 3,
		"우교수", 4,
		"최교수", 5,
		"임교수", 6
		);
Map<String, Integer> map1 = Map.of(
		"월요일", 1,
		"화요일", 2,
		"수요일", 3,
		"목요일", 4,
		"금요일", 5
		);
%>
	<jsp:include page="header.jsp"/>
		<div style="display: flex; justify-content: center; align-items: center; flex-direction: column; height: 100%">
	<h2 style="text-align: center">
	교과목 목록
	</h2>
	<form action="modify_process.jsp" method="post" name="frm">
		<table border=1>
			<tr>
				<td>과목코드</td>
				<td><input type="text" value="<%=id %>" name="id" readonly></td>
			</tr>
			<tr>
				<td>과목명</td>
				<td><input type="text" value="<%=name %>" name="name"></td>
			
			</tr>
			<tr>
				<td>학점</td>
				<td><input type="text" value="<%=credit %>" name="credit"></td>
			</tr>
			<tr>
				<td>담당강사</td>
				<td>
					<select name="lecturer">
						<option <%=map.get(lecturer)==1?"selected":""%>>김교수
						</option>
												<option value="1" <%=map.get(lecturer)==1?"selected":""%>>김교수
						</option>
												<option value="2"<%=map.get(lecturer)==2?"selected":""%>>이교수
						</option>
												<option value="3"<%=map.get(lecturer)==3?"selected":""%>>박교수
						</option>
												<option value="4"<%=map.get(lecturer)==4?"selected":""%>>우교수
						</option>
												<option value="5"<%=map.get(lecturer)==5?"selected":""%>>최교수
						</option>
												<option value="6"<%=map.get(lecturer)==6?"selected":""%>>임교수
						</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>요일</td>
				<td>
				<input type="radio" name="week" value="1" <%=map1.get(week)==1?"checked":""%>>월</input>
				<input type="radio" name="week" value="2" <%=map1.get(week)==2?"checked":""%>>화</input>
				<input type="radio" name="week" value="3" <%=map1.get(week)==3?"checked":""%>>수</input>
				<input type="radio" name="week" value="4" <%=map1.get(week)==4?"checked":""%>>목</input>
				<input type="radio" name="week" value="5" <%=map1.get(week)==5?"checked":""%>>금</input>
				</td>
			</tr>
			<tr>
				<td>시작시간</td>
				<td>
				<input type="text" name="start_hour" value="<%=start_hour %>"/>
				</td>
			</tr>
			<tr>
				<td>종료시간</td>
				<td>
				<input type="text" name="end_hour" value="<%=end_hour %>"/>
				</td>
			</tr>
			<tr>
				<td colspan=2 style="text-align: center">
				<input type="button" onClick="sm()" value="수정"/>
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