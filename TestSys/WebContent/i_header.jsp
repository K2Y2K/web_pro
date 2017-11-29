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
<div id="header_info">
	<font color="red"></font> <a href="<%=basePath %>/doquit.jsp">
	<font color="blue"></font></a>
</div>

<div id="header">
	
	<td width="1000" height="150"><br> <a href="<%=basePath %>/login.jsp"><img
			src="<%=basePath %>/images/login_index.jpg" width="680" height="56" alt="济南大学在线考试" /></a></td>
</div>
<div id="header_line">
	
		<em><a href="<%=basePath %>/manage_teacher.jsp"><font color=white>>></font></a></em>
	
</div>