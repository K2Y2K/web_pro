<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script  language="javascript">
	//用script在提交之前判断密码的正确性
	function isValid(form) {
		if (((form.password.value.length < 3) || (form.password.value.length > 8))
				&& (form.password.value != "")) {
			alert("密码必须是3-8位的字母或数字！");
			return false;
		} else if (form.password.value != form.password2.value) {
			alert("两次输入的密码不同！");
			return false;
		} else if (form.password.value == "") {
			alert("用户密码不能为空！");
			return false;
		} else
			return true;
	}
</script>
</head>
<link rel="stylesheet" href="<%=basePath %>/style/t_backstage.css">
<body>
<!-- 标题栏 -->
	<jsp:include page="i_header.jsp" />
	<div align="center">
	<form action="do_activate_login.jsp" method="post" onsubmit="return isValid(this);">
		<div class="mmaincomm">
			<div class="mcomm mcomm2"><br>
				<div id="title"><h1>激活/修改密码</h1></div><br>
				<div id="reg1">
					<div class="mitem">
						<label> 学 号</label><input name="sid" type="text" id="tbemail"
							class="mtb" /><span id="spanemail" class="mtishi2"></span>
					</div>
<br>
					<div class="mitem">
						<label> 昵 称</label><input name="name" type="text" id="tbnickname"
							class="mtb" /><span id="spannickname" class="mtishi2"></span>
					</div><br>
					<div class="mitem">
						<label> 密 码</label><input name="password" type="password"
							id="tbloginpass" class="mtb" /><span id="spanloginpass"
							class="mtishi2"></span>
					</div>
<br>
					<div class="mitem">
						<label> 确 认</label><input name="password2" type="password"
							id="tbloginpass2" class="mtb" /><span id="spanloginpass2"
							class="mtishi2"></span>
					</div>
<br>

					<div class="mitem">
						<label> &nbsp;</label><span class="mtishi"> </span>
					</div>



					<div class="mitem">
						<label> &nbsp;</label><input type="submit" name="btnreg"
							value="激活" id="btnreg" class="mbtn" /> &nbsp;&nbsp;&nbsp;已激活？<span><a
							href="login.jsp" class="mcolorlan">直接登录</a></span> <br /> <label>
							&nbsp;</label><span class="mcolorCheng"></span>
					</div>
				</div>

			</div>
		</div>
	</form>
	</div>
	<!-- 底部连接 -->
	<div id="footer"><td align="center">Copyright &copy; by lee</td></div>	
</body>
</html>