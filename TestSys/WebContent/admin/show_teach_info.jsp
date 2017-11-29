<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="entity.Teachers"%>
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
			<h1>老师记录</h1>
			<div align="right">
				<input type="submit" value="新增"
					onclick="<%=basePath%>/admin/add_teach_info.jsp">
			</div>
			<hr>
			<div>
				<form action="" method="">
					<table>
						<tr>
							<th class="tab">职工号</th>
							<th class="tab">名称</th>
							<th class="tab">学院</th>
							<th class="tab">修改</th>
							<th class="tab">删除</th>

						</tr>
<jsp:useBean  id="teacher" class="entity.Teachers" scope="session"/>
<jsp:useBean  id="teacherDAO" class="dao.TeachersDAO" scope="session"/>
						<!-- 循环的开始 -->
						<%
						
							ArrayList<Teachers> list = teacherDAO.getAllTeachers();
							if (list != null && list.size() > 0) {
								for (int i = 0; i < list.size(); i++) {
									teacher = list.get(i);
						%>
						<tr>
							<td class="tab"><%=teacher.getTid()%></td>
							<td class="tab"><%=teacher.getName()%></td>
							<td class="tab"><%=teacher.getAcademy()%></td>
							<td class="tab"><a
								href="<%=basePath%>/admin/update_teach_info.jsp?tid=<%=teacher.getTid()%>"
								onclick="delcfm();">修改</a></td>
							<td class="tab"><a
								href="<%=basePath%>/admin/del_teach_info.jsp?tid=<%=teacher.getTid()%>"
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