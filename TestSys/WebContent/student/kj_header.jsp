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



<div id="header_line">
	
		<em><a href="<%=basePath %>/teacher/manage_teacher.jsp"><font color=white>>></font></a></em>
	
</div>