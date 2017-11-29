<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="entity.Students"%>
<%@ page import="dao.StudentsDAO"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<% 
  request.setCharacterEncoding("utf-8");
%>

<%
  Students stu =new Students();
  stu.setName(request.getParameter("name"));
  stu.setPassword(request.getParameter("password"));
 
  StudentsDAO userDAO=new StudentsDAO();
  //如果用户和密码和数据库里的一致,则登录成功
  if(userDAO.usersLogin(stu))
  {
     session.setAttribute("loginUser", stu.getName());
     request.getRequestDispatcher("index.jsp").forward(request, response);
     
  }
  else
  {
     response.sendRedirect("index.jsp");
  }
%>
    