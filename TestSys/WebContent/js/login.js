/**
 * 
 */
//用script在提交之前判断密码的正确性
	function isValid(form) {
	if (form.m_name.value == null) {
		alert("用户名不能为空");
		return false;
	} else if (form.m_password.value == "") {
		alert("密码不能为空！");
		return false;
	} else if (((form.m_password.value.length < 3) || (form.m_password.value.length > 10))
			&& (form.m_password.value != "")) {
		alert("密码不够3-11位的字母或数字！");
		return false;
	} else
		return true;
}
	function isValid1(form) {
	if (form.name.value == null) {
		alert("用户名不能为空");
		return false;
	} else if (form.password.value == "") {
		alert("密码不能为空！");
		return false;
	} else if (((form.password.value.length < 3) || (form.password.value.length > 10))
			&& (form.password.value != "")) {
		alert("密码不够3-11位的字母或数字！");
		return false;
	} else
		return true;
}
