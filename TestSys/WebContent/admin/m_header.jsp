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
<jsp:useBean id="loginUser" class="entity.Managers" scope="session" />
<%
	String loginUser0 = "";
	String loginUser1 = "";
	if (loginUser != null) {
		loginUser0 = loginUser.getM_name() + "  ";
		loginUser1 = "退出";
%>
<div id="header_info">
	<font color="red"><%=loginUser0%></font> <a
		href="<%=basePath%>/doquit.jsp?id=1"> <font color="blue"><%=loginUser1%></font></a>
	<%
		} else
			request.getRequestDispatcher("/admin/admin_login.jsp").forward(request, response);
	%>
</div>
<div id="header">
	<td width="1000" height="150"><br> <a
		href="<%=basePath%>/admin/admin_login.jsp"><img
			src="<%=basePath%>/images/login_index.jpg" width="680" height="56"
			alt="济南大学在线考试" /></a></td>
</div>
<div id="header_line">
	<em><a href="<%=basePath%>/admin/manager_info.jsp"><font
			color=white>>></font></a></em>
</div>