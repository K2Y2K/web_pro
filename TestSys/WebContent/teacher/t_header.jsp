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
<jsp:useBean  id="loginUser" class="entity.Teachers" scope="session"/>
<jsp:useBean  id="teach" class="entity.Teachers" scope="session"/>
	<jsp:useBean  id="teachdao" class="dao.TeachersDAO" scope="session"/>
	<%
	teach=teachdao.getIdByTeachers(loginUser);
	%>
<%
String logindo="",loginquit="";
if(loginUser.getName()==null){
	request.getRequestDispatcher("../login.jsp").forward(request,response);
}
if(loginUser!=null){
	int tid=loginUser.getTid();
	Cookie cookie = new Cookie("on_tid", String.valueOf(tid));	 
	response.addCookie(cookie);
	
	logindo=loginUser.getName();
	loginquit="退出";

%>
<div id="header_info">
	<font color="red"><%=logindo %></font> <a href="<%=basePath %>/doquit.jsp?id=2">
	<font color="blue"><%=loginquit %></font></a>
</div>
<%}else
	request.getRequestDispatcher("../login.jsp").forward(request,response);
%>
<div id="header">
	
	<td width="1000" height="150"><br> <a href="<%=basePath %>/teacher/manage_teacher.jsp"><img
			src="<%=basePath %>/images/login_index.jpg" width="680" height="56" alt="济南大学在线考试" /></a></td>
</div>
<div id="header_line">
	
		<em><a href="<%=basePath %>/teacher/manage_teacher.jsp"><font color=white>>></font></a></em>
	
</div>