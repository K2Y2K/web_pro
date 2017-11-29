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
<jsp:useBean  id="loginUser1" class="entity.Students" scope="session"/>
<%
String logindo="",loginquit="";
if(loginUser1.getName()==null){
	request.getRequestDispatcher("../login.jsp").forward(request,response);
}
if(loginUser1!=null){
	logindo=loginUser1.getName();
	loginquit="退出";

%>
<div id="header_info">
	<font color="red"><%=logindo %></font> <a href="<%=basePath %>/doquit.jsp?id=2">
	<font color="blue"><%=loginquit %></font></a>
</div>
<%}else
	request.getRequestDispatcher("../login.jsp").forward(request,response);
%>