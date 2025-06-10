function check() {
	var f = document.frm
	console.log("이런!!')")
	
	if(f.empno.value.length == 0) {
		alert("사원번호가 입력되지 않았습니다!")
		f.empno.focus()
	}
	else if(f.month.value.length == 0) {
		alert("수당지급월이 입력되지 않았습니다!")
		f.month.focus()
	}
		else if(f.ab.value.length == 0) {
		alert("결근이 입력되지 않았습니다!")
		f.ab.focus()
	}
		else if(f.night.value.length == 0) {
		alert("야근이 입력되지 않았습니다!")
		f.night.focus()
	}
		else if(f.holiday.value.length == 0) {
		alert("휴일이 입력되지 않았습니다!")
		f.holiday.focus()
	}
		else if(f.trip.value.length == 0) {
		alert("출장이 입력되지 않았습니다!")
		f.trip()
	} else {
		alert("초과근무일지정보가 정상적으로 등록 하였습니다!")
		f.submit()
	}
}

function r() {
	document.frm.reset()
}