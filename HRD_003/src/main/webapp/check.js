/**
 * 
 */

 function addCheck() {
	 var f = document.frm;
	 var list = [
		 f.v_no,
		 f.v_code,
		 f.p_id,
		 f.v_round,
		 f.v_date,
		 f.visit_agency,
		 f.v_result
	 ]
	 
	 for (i of list) {
		 if (i.value.length == 0) {
			 alert("Noo " + i)
			 i.focus()
			 return false;
		 }
	 }
	 f.submit();
	 return true;
 }
 
 function res() {
 	 var f = document.frm;
	 f.reset();
	 return true;
 }
 