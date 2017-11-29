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

<jsp:useBean id="loginUser" class="entity.Students" scope="page" />
<jsp:useBean id="userDAO" class="dao.StudentsDAO" scope="page" />
<jsp:setProperty property="*" name="loginUser" />
<jsp:useBean id="loginUser1" class="entity.Teachers" scope="page" />
<jsp:useBean id="userDAO1" class="dao.TeachersDAO" scope="page" />
<jsp:setProperty property="*" name="loginUser1" />
<%
	//获取type的值，如果为1表示学生登录，为0表示老师登录
	String flag = request.getParameter("type");
	System.out.println("获取login.jsp界面type的值" + flag);
	//1表示学生登录
	if (flag.equals("1")) {
		System.out.println(flag + "是学生登录代号");
		//如果用户和密码都等于admin,则登录成功
		if (userDAO.usersLogin(loginUser)) {
			System.out.println("登录用户和密码数据库表中学生的数据一致，则成功跳转到manage_student.jsp即学生系统界面");
			session.setAttribute("loginUser1", loginUser);//把登录用户的数据存储再session里
			request.getRequestDispatcher("/student/manage_student.jsp").forward(request, response);
		} else {
			response.sendRedirect("login_failure.jsp");
		}
	}
	//0表示老师登录
	else if (flag.equals("0")) {
		System.out.println(flag + "是老师登录代号");
		if (userDAO1.teacherLogin(loginUser1)) {
			System.out.println("登录用户和密码数据库表中老师的数据一致，则成功跳转到manage_teacher.jsp即老师系统界面");
			session.setAttribute("loginUser", loginUser1);
			request.getRequestDispatcher("/teacher/manage_teacher.jsp").forward(request, response);
		} else {
			response.sendRedirect("login_failure.jsp");
		}
	} else
		System.out.println("传值不成功，系统报错");
%>