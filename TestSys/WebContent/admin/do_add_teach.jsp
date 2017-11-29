<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.Java_stDAO"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<jsp:useBean id="teach1" class="entity.Teachers" scope="page" />
<jsp:useBean id="teach1DAO" class="dao.TeachersDAO" scope="page" />
<jsp:setProperty property="*" name="teach1" />
<% 
if (teach1DAO.addTeachers(teach1)) {
	System.out.println("do_add_teachers.jsp添加成功");
	request.getRequestDispatcher("show_teach_info.jsp").forward(request, response);
} else
	request.getRequestDispatcher("add_teach_info.jsp").forward(request, response);
%>