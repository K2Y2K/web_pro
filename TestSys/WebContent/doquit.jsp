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
<%
	//销毁session对象，跳转到首页
	if (session.getAttribute("loginUser") != null) {
		session.invalidate();
		if (request.getParameter("id").equals("1")) {
			request.getRequestDispatcher("/admin/admin_login.jsp").forward(request, response);
		} else
			request.getRequestDispatcher("/login.jsp").forward(request, response);
	}
if (session.getAttribute("loginUser1") != null) {
	session.invalidate();
	if (request.getParameter("id").equals("2")) {
		
		request.getRequestDispatcher("/login.jsp").forward(request, response);
}}


%>