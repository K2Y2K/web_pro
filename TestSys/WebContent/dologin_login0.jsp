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
<jsp:useBean id="loginUser" class="entity.Students" scope="page"/>
<jsp:useBean id="userDAO" class="dao.StudentsDAO" scope="page"/>
<jsp:setProperty property="*" name="loginUser"/>

<%

  //如果用户和密码数据库存在,则登录成功
  if(userDAO.usersLogin(loginUser))
  {
     session.setAttribute("loginUser", loginUser.getName());
     request.getRequestDispatcher("index.jsp").forward(request, response);
     
  }
  else
  {
     response.sendRedirect("login_failure.jsp");
  }
%>
    