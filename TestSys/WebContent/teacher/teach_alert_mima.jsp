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
<link rel="stylesheet" href="<%=basePath%>/style/t_backstage.css">
</head>
<body>
	<!-- 标题栏 -->
	<jsp:include page="t_header.jsp" />
	<!-- 左侧任务栏 -->
	<jsp:include page="t_navigator.jsp" />
	<!-- 内容板块 -->
	<div id="section">
	<jsp:useBean  id="loginUser" class="entity.Teachers" scope="session"/>
	<jsp:useBean  id="teacher" class="entity.Teachers" scope="page"/>
	<jsp:useBean  id="teacherdao" class="dao.TeachersDAO" scope="session"/>
	<%
	teacher=teacherdao.getIdByTeachers(loginUser);
	%>
	<div align="center">
	<form action="<%=basePath%>/teacher/do_teach_mima.jsp" method="post" onsubmit="return isValid(this);">
		<div class="mmaincomm">
			<div class="mcomm mcomm2"><br>
				<div id="title"><h3>密码修改</h3></div><br>
				<div id="reg1">
					<div class="mitem">
						<label> 职工号</label><input name="tid" type="text" id="tbemail"
							class="mtb" value="<%=teacher.getTid() %>" /><span id="spanemail" class="mtishi2"></span>
					</div>
<br>
					<div class="mitem">
						<label> 名称</label><input name="name" type="text" id="tbnickname"
							class="mtb" value="<%=loginUser.getName() %>" /><span id="spannickname" class="mtishi2"></span>
					</div><br>
					<div class="mitem">
						<label> 密 码</label><input name="password" type="password"
							id="tbloginpass" class="mtb" value="<%=loginUser.getPassword() %>"/><span id="spanloginpass"
							class="mtishi2"></span>
					</div>
<br>
					<div class="mitem">
						<label> 确 认</label><input name="password2" type="password"
							id="tbloginpass2" class="mtb" value="<%=loginUser.getPassword() %>"/><span id="spanloginpass2"
							class="mtishi2"></span>
					</div>
<br>

					<div class="mitem">
						<label> &nbsp;</label><span class="mtishi"> </span>
					</div>



					<div class="mitem">
						<label> &nbsp;</label><input type="submit" name="btnreg"
							value="提交" id="btnreg" class="mbtn" /> &nbsp;&nbsp;&nbsp;<input type="reset" name="btnreg"
							value="重置" id="btnreg" class="mbtn" /> <br /> <label>
							&nbsp;</label><span class="mcolorCheng"></span>
					</div>
				</div>

			</div>
		</div>
	</form>
	</div>
	</div>
	<!-- 底部连接 -->
	<div id="footer">
		<td align="center">Copyright &copy; by lee</td>
	</div>
</body>
</html>