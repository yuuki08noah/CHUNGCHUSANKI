/**
 * 
 */

function search() {
	window.location.href="list.jsp"
}
 
function addCheck() {
	 if (frm.id.value.length == 0) {
		 alert("교과목 코드 입력 안됨")
		 frm.id.focus();
		 return false;
	 } else if (frm.name.value.length == 0) {
		 alert("교과목 입력 안됨")
		 frm.name.focus();
		 return false;
	 } else if (frm.credit.value.length == 0) {
		 alert("학점 코드 입력 안됨")
		 frm.credit.focus();
		 return false;
	 } else if (frm.lecturer.value == 0) {
		 alert("강사 입력 안됨")
		 frm.lecterer.focus();
		 return false;
	 } else if (frm.week[0].checked == false && frm.week[1].checked == false && frm.week[2].checked == false && frm.week[3].checked == false && frm.week[5].checked == false) {
		 alert("요일 입력 안됨")
		 frm.week.focus();
		 return false;
	 } else if (frm.start_hour.value.length == 0) {
		 alert("시작시간 입력 안됨")
		 frm.start_hour.focus();
		 return false;
	 } else if (frm.end_hour.value.length == 0) {
		 alert("종료시간 입력 안됨")
		 frm.end_hour.focus();
		 return false;
	 } else {
		 alert("교과목 등록이 완료되었습니다")
		 document.frm.submit();
		 return true;
	 }
 }