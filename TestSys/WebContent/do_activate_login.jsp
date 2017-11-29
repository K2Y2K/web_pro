<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="entity.Students"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<jsp:useBean id="loginUser" class="entity.Students" scope="page" />
<jsp:useBean id="userDAO" class="dao.StudentsDAO" scope="page" />
<jsp:setProperty property="*" name="loginUser" />
<% String str="";
if (request.getParameter("password").equals(request.getParameter("password2"))){
if(userDAO.usersActivate(loginUser)){
request.getRequestDispatcher("login.jsp").forward(request,response);
}else
	request.getRequestDispatcher("activate_login.jsp").forward(request,response);
}else
	
 request.getRequestDispatcher("activate_login.jsp").forward(request, response);
%>