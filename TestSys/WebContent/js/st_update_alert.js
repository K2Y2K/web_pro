/**
 * 
 */
// 用script在提交之前判断密码的正确性
function isValid(form) {

	if (form.myselect.value == 1 ) {
		if (form.java_st_question.value =="") {
			alert("问题描述不能为空");
			return false;
		}
		if (form.java_st_opt1.value == "") {
			alert("选项一不能为空！");
			return false;
		}
		if (form.java_st_opt2.value == "") {
			alert("选项二不能为空！");
			return false;
		}
		if (form.java_st_opt3.value == "") {
			alert("选项三不能为空！");
			return false;
		}
		if (form.java_st_opt4.value == "") {
			alert("选项四不能为空！");
			return false;
		}
		if (form.java_st_result.value == "") {
			alert("答案不能为空！");
			return false;
		} else if (form.java_st_result.value != form.java_st_opt1.value
				&& form.java_st_result.value != form.java_st_opt2.value
				&& form.java_st_result.value != form.java_st_opt3.value
				&& form.java_st_result.value != form.java_st_opt4.value) {
			alert("答案不正确！");
			return false;
		} else
			return true;
	}
	if (form.myselect.value == 2) {
		if (form.java_dxt_question.value == "") {
			alert("问题描述不能为空");
			return false;
		}
		if (form.java_dxt_opt1.value == "") {
			alert("选项一不能为空！");
			return false;
		}
		if (form.java_dxt_opt2.value == "") {
			alert("选项二不能为空！");
			return false;
		}
		if (form.java_dxt_opt3.value == "") {
			alert("选项三不能为空！");
			return false;
		}
		if (form.java_dxt_opt4.value == "") {
			alert("选项四不能为空！");
			return false;
		}
		if (form.java_dxt_result.value == "") {
			alert("答案不能为空！");
			return false;
		} else
			return true;
	}
	if (form.myselect.value == 3) {
		if (form.java_st_question.value == "") {
			alert("问题描述不能为空");
			return false;
		}else if (form.java_st_result.value == "") {
			alert("答案不能为空！");
			return false;
		} else if (!(form.java_st_result.value == "0"||form.java_st_result.value == "1")) {
			alert("答案不符合要求！");
			return false;
		} else
			return true;
	}

}