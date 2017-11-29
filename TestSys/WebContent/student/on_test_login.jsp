<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="entity.Students" %>
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
	<!-- 内容板块 -->
	<div id="section1">
	<div align="center">
	<jsp:useBean  id="loginUser1" class="entity.Students" scope="session"/>
	<jsp:useBean  id="stu" class="entity.Students" scope="page"/>
	<jsp:useBean  id="studao" class="dao.StudentsDAO" scope="session"/>
	<%
	stu=studao.getIdByStudents(loginUser1);
	%>
	
	
	<form action="do_activate_login.jsp" method="post" onsubmit="return isValid(this);">
		<div class="mmaincomm">
			<div class="mcomm mcomm2"><br>
				<div id="title"><h2><font color="red">确认信息</font></h2></div><br>
				<div id="reg1">
					<div class="mitem">
						<label> 学 号</label><input name="sid" type="text" id="tbemail"
							class="mtb" value=""/><span id="spanemail" class="mtishi2"></span>
							
					</div>
<br>
					<div class="mitem">
						<label> 姓名</label><input name="name" type="text" id="tbnickname"
							class="mtb" value="<%= %>" /><span id="spannickname" class="mtishi2"></span>
					</div><br>
					<div class="mitem">
						<label> 班级</label><input name="banji" type="text"
							id="tbloginpass" class="mtb" value="<%= %>"/><span id="spanloginpass"
							class="mtishi2"></span>
					</div>
<br>
					<div class="mitem">
						<label> 考试科目</label><input name="c_name" type="text"
							id="tbloginpass2" class="mtb" value="JAVA"/><span id="spanloginpass2"
							class="mtishi2"></span>
					</div>
<br>

					<div class="mitem">
						<label> &nbsp;</label><span class="mtishi"> </span>
					</div>



					<div class="mitem">
						<label> &nbsp;</label><input type="submit" name="btnreg"
							value="登录" id="btnreg" class="mbtn" /> 
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