<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="entity.Students"%>
<%@ page import="dao.StudentsDAO"%>
<%@ page import="entity.Teachers"%>
<%@ page import="dao.TeachersDAO"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<% 
  request.setCharacterEncoding("utf-8");
%>
<%
String flag =request.getParameter("type");
 //int flat=Integer.parseInt(request.getParameter("type"));
if(flag.equals('1')){
  Students stu =new Students();
  stu.setName(request.getParameter("name"));
  stu.setPassword(request.getParameter("password"));
  StudentsDAO userDAO=new StudentsDAO();
  //如果用户和密码都等于admin,则登录成功
  if(userDAO.usersLogin(stu))
  {
     session.setAttribute("loginUser", stu.getName());
     request.getRequestDispatcher("index.jsp").forward(request, response);
     
  }
  else
  {
     response.sendRedirect("login_failure.jsp");
  }
}else if(flag.equals('0')){
	Teachers teacher =new Teachers();
	teacher.setName(request.getParameter("name"));
	teacher.setPassword(request.getParameter("password"));
	  TeachersDAO teacherDAO=new TeachersDAO();
	  //如果用户和密码都等于admin,则登录成功
	  if(teacherDAO.teacherLogin(teacher))
	  {
	     session.setAttribute("loginUser", teacher.getName());
	     request.getRequestDispatcher("index.jsp").forward(request, response);
	     
	  }
	  else
	  {
	     response.sendRedirect("login_failure.jsp");
	  }
}
else{
	response.sendRedirect("login_failure.jsp");
}
%>

