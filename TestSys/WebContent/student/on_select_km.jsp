<%@ page language="java" import="java.util.*"  contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="entity.Course"%>
<%@ page import="dao.CourseDAO"%>
<%@ page import="dao.CourseDAOImp"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=basePath%>/style/s_on_km.css">
</head>
<body style="background-color: #8080c0;">
<jsp:useBean id="c" class="entity.Course" scope="page"/>

	<!-- 选择科目的下拉菜单 -->
	<div class="c_layout">
		<form action="<%=basePath %>/student/on_ks1.jsp" method="post">
			<div class="c_title">请选择考试科目</div>
			<div class="c_xlb">
				<select style="width: 300px; height: 50px;" id="c_select"
					name="c_select" onclick="hide()">
					<%
						CourseDAO c_dao = new CourseDAOImp();
						ArrayList<Object> list = c_dao.getAllCourse();
						if (list != null && list.size() > 0) {
							for (int i = 0; i < list.size(); i++) {
								c = (Course) list.get(i);%>												
					<option value="<%=c.getC_id()%>"><%=c.getC_name() %></option>					
					<%}}%>
				</select>
			</div>
			<div class="c_sub">
				<input type="submit" align="middle" value="进入考试系统">
			</div>
		</form>
	</div>
</body>
</html>