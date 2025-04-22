/**
 * 
 */

 function check() {
	 var frm = document.querySelectorAll("input")
	 for(i of frm) {
		 if(!i.value.length) {
			 alert("NO")
			 i.focus()
			 return
		 }
	 }
	 frm.submit();
 }
 
 function res() {
		document.	 frm.reset();
 }
 
 function check2() {
	 if(!document.frm.empno.value.length) {
		 alert("사원번호를 입력 하라 야이 이것도 입력을 제대로 못하냐")
		 document.frm.empno.focus()
		 return;
	 }
	 document.frm.submit()
 }
 
 function home() {
	 window.location = 'index.jsp'
 }