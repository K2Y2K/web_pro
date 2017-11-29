/**
 * 
 */
// 根据myselect里的值来隐藏文本框
function hide() {
	if (myselect.value == 1 || myselect.value == 2) {
		document.all["java_dxt_opt1"].style.display = "block";
		document.all["java_dxt_opt2"].style.display = "block";
		document.all["java_dxt_opt3"].style.display = "block";
		document.all["java_dxt_opt4"].style.display = "block";
	}
	if (myselect.value == 3) {
		// alert(myselect.value);
		// 隐藏成功

		document.all["java_dxt_opt1"].style.display = "none";
		document.all["java_dxt_opt2"].style.display = "none";
		document.all["java_dxt_opt3"].style.display = "none";
		document.all["java_dxt_opt4"].style.display = "none";
		// document.all["java_st"].style.display="none" ;
		// 设置不可见成功
		// document.all["java_dxt_question"].disabled=true
		// document.all["java_dxt_question1"].disabled=true

	}
}
// 用script在提交之前判断密码的正确性
function isValid(form) {

	if (form.myselect.value == 1) {
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
		} else if (form.java_dxt_result.value != form.java_dxt_opt1.value
				&& form.java_dxt_result.value != form.java_dxt_opt2.value
				&& form.java_dxt_result.value != form.java_dxt_opt3.value
				&& form.java_dxt_result.value != form.java_dxt_opt4.value) {
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
		if (form.java_dxt_question.value == "") {
			alert("问题描述不能为空");
			return false;
		} else if (form.java_dxt_result.value == "") {
			alert("答案不能为空！");
			return false;
		} else if (!(form.java_dxt_result.value == "0" || form.java_dxt_result.value == "1")) {
			alert("答案不符合要求！");
			return false;
		} else
			return true;
	}

}
// 有问题
function isValid1(form) {
	if (form.myselect.value == 1 || form.myselect.value == 2) {

		if (form.java_dxt_question.value == null) {
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
		} else if (form.java_dxt_result.value != form.java_dxt_opt1.value
				&& form.java_dxt_result.value != form.java_dxt_opt2.value
				&& form.java_dxt_result.value != form.java_dxt_opt3.value
				&& form.java_dxt_result.value != form.java_dxt_opt4.value) {
			alert("答案不正确！");
			return false;
		}
	}

	if (form.myselect.value == 3) {

		if (form.java_dxt_question.value == null) {
			alert("问题描述不能为空");
			return false;
		}

		if (form.java_dxt_result.value == "") {
			alert("答案不能为空！");
			return false;
		}

	}
}
