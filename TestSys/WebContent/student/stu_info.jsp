<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
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
<link rel="stylesheet" href="<%=basePath%>/style/t_kj_layout.css">
</head>
<body>
	<!-- 标题栏 -->
	<jsp:include page="s_header.jsp" />
	<!-- 中间任务栏 -->
	<jsp:include page="s_navigator.jsp" />
	<!-- 内容板块 -->
	<div id="section1">
	<jsp:useBean  id="loginUser1" class="entity.Students" scope="session"/>
	<jsp:useBean  id="stu" class="entity.Students" scope="page"/>
	<jsp:useBean  id="studao" class="dao.StudentsDAO" scope="session"/>
	<%
	stu=studao.getIdByStudents(loginUser1);
	%>
	<div align="center">
	<form action="<%=basePath%>/student/do_stu_info.jsp" method="post" onsubmit="return isValid(this);">
		<div class="mmaincomm">
			<div class="mcomm mcomm2"><br>
				<div id="title"><h3>密码修改</h3></div><br>
				<div id="reg1">
					<div class="mitem">
						<label> 学号</label><input name="sid" type="text" id="tbemail"
							class="mtb" value="<%= stu.getSid()%>" /><span id="spanemail" class="mtishi2"></span>
					</div>
<br>
					<div class="mitem">
						<label> 名称</label><input name="name" type="text" id="tbnickname"
							class="mtb" value="<%=stu.getName() %>" /><span id="spannickname" class="mtishi2"></span>
					</div><br>
					<div class="mitem">
						<label> 密 码</label><input name="password" type="password"
							id="tbloginpass" class="mtb" value="<%=stu.getPassword() %>"/><span id="spanloginpass"
							class="mtishi2"></span>
					</div>
<br>
					<div class="mitem">
						<label> 确 认</label><input name="password2" type="password"
							id="tbloginpass2" class="mtb" value="<%=stu.getPassword() %>"/><span id="spanloginpass2"
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