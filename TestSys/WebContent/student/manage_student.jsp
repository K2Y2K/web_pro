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
		<div align="center">
			<h1>
				<font color="red">欢迎<em> <%=loginUser1.getName()%> </em>登录考试系统
				</font>
			</h1>
		</div>
	</div>
	
</body>
</html>