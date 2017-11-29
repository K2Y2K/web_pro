<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String loginUser0 = "";
		String loginUser1 = "";
		String loginUser2 = "";
		String loginUser3 = "";
		if (session.getAttribute("loginUser") != null) {
			loginUser0 = "欢迎" + session.getAttribute("loginUser").toString() + "登录" + "  ";
			loginUser1 = "退出";
		} else {
			request.getRequestDispatcher("login1.jsp").forward(request, response);
		}
	%>

	<div width="1000" border="0" align="right" cellpadding="0"
		cellspacing="0" style="margin: 0 auto;">
		<font color="red"><%=loginUser0%></font> <a href="doquit.jsp"><font
			color="blue"><%=loginUser1%></font></a>
	</div>

	<div width="1000" border="0" align="center" cellpadding="0"
		cellspacing="0" style="margin: 0 auto;">
		<td width="1000" height="150"><br> <a href="index.jsp"><img
				src="images/login_index.jpg" width="680" height="56" alt="济南大学在线考试" /></a></td>
	</div>

	<div style="width: 1000; background-color: #136CD4;" align="center">
		<table width="1000" border="0" align="center" cellpadding="0"
			cellspacing="0" style="margin: 0 auto;">
			<tr>

				<td align="center" height="35"><a class="title"
					href="list.asp?sortsid=455" target="_self" style="color: #fff;">
						个人资料 </a></td>

				<td><img src="images/bg1.fw.png" width="1" height="35" /></td>


				<td align="center" height="35"><a class="title"
					href="list.asp?sortsid=451" target="_self" style="color: #fff;">
						试卷管理 </a></td>

				<td><img src="images/bg1.fw.png" width="1" height="35" /></td>

				<td align="center" height="35"><a class="title"
					href="list.asp?sortsid=455" target="_self" style="color: #fff;">
						成绩统计</a></td>


			</tr>
		</table>
	</div>
	<jsp:include page="t_navigator.jsp"/>
</body>
</html>