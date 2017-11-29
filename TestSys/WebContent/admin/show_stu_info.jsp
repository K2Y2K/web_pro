<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="entity.Students"%>
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
<link rel="stylesheet" href="<%=basePath%>/style/m_backstage.css">
</head>
<body>
<!-- 标题栏 -->
	<jsp:include page="m_header.jsp" />
	<!-- 左侧任务栏 -->
	<jsp:include page="m_navigator.jsp" />
	<!-- 内容板块 -->
	<div id="section">
		<div align="center">
			<h1>学生记录</h1>
			<div align="right">
				<input type="submit" value="新增"
					onclick="Servlet/managersInfoServlet?action=add">
			</div>
			<hr>
			<div>
				<form action="" method="">
					<table>
						<tr>
							<th class="tab">学号</th>
							<th class="tab">名称</th>
							<th class="tab">班级</th>
							<th class="tab">学院</th>
							<th class="tab">修改</th>
							<th class="tab">删除</th>

						</tr>
<jsp:useBean  id="stu" class="entity.Students" scope="session"/>
<jsp:useBean  id="stuDAO" class="dao.StudentsDAO" scope="session"/>
						<!-- 循环的开始 -->
						<%							
							ArrayList<Students> list = stuDAO.getAllStudents();
							if (list != null && list.size() > 0) {
								for (int i = 0; i < list.size(); i++) {
									stu= list.get(i);
						%>
						<tr>
							<td class="tab"><%=stu.getSid()%></td>
							<td class="tab"><%=stu.getName()%></td>
							<td class="tab"><%=stu.getBanji()%></td>
							<td class="tab"><%=stu.getAcademy()%></td>
							<td class="tab"><a
								href="<%=basePath%>/admin/update_stu_info.jsp?sid=<%=stu.getSid()%>"
								onclick="delcfm();">修改</a></td>
							<td class="tab"><a
								href="<%=basePath%>/admin/del_stu_info.jsp?sid=<%=stu.getSid()%>"
								onclick="delcfm();">删除</a></td>
							
						
						</tr>
						<%
							}
							}
						%>
						<!--循环的结束-->
					</table>
				</form>
			</div>
		</div>
	</div>
	<!-- 底部连接 -->
	<div id="footer">
		<td align="center">Copyright &copy; by lee</td>
	</div>
</body>
</html>