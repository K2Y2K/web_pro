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
<jsp:useBean id="loginstu1" class="entity.Students" scope="page" />
<jsp:useBean id="stuDAO1" class="dao.StudentsDAO" scope="page" />
<jsp:setProperty property="*" name="loginstu1" />
<% String str="";
if (request.getParameter("password").equals(request.getParameter("password2"))){
if(stuDAO1.usersActivate(loginstu1)){
request.getRequestDispatcher("manage_student.jsp").forward(request,response);
}else
	request.getRequestDispatcher("stu_info.jsp").forward(request,response);
}else
	
 request.getRequestDispatcher("stu_info.jsp").forward(request, response);
%>