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
<jsp:useBean id="loginteach" class="entity.Teachers" scope="page" />
<jsp:useBean id="stuDAO1" class="dao.TeachersDAO" scope="page" />
<jsp:setProperty property="*" name="loginteach" />
<% String str="";
if (request.getParameter("password").equals(request.getParameter("password2"))){
if(stuDAO1.usersActivate(loginteach)){
request.getRequestDispatcher("manage_teacher.jsp").forward(request,response);
}else
	request.getRequestDispatcher("teach_alert_mima.jsp").forward(request,response);
}else
	
 request.getRequestDispatcher("teach_alert_mima.jsp").forward(request, response);
%>