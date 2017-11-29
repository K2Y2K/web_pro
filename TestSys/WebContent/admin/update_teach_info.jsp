<%@ page language="java" contentType="text/html; charset=UTF-8"
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
</head>
<link rel="stylesheet" href="<%=basePath%>/style/t_backstage.css">
<script type="text/javascript"
	src="<%=basePath%>/js/st_update_alert.js"></script>

<body >
	<!-- 标题栏 -->
	<jsp:include page="m_header.jsp" />
	<!-- 左侧任务栏 -->
	<jsp:include page="m_navigator.jsp" />
	<!-- 内容板块 -->
	<div id="section">
		<div>
			<jsp:useBean id="teachers1" class="entity.Teachers" scope="page" />
			
			<jsp:useBean id="teachersDAO1" class="dao.TeachersDAO" scope="page" />
			
			<%
				teachers1=teachersDAO1.getTeachersById(Integer.parseInt(request.getParameter("tid")));
			%>
			<form style="width: 343px;" method="post"
				action="<%=basePath%>/admin/do_update_teach.jsp?t_id=<%=teachers1.getTid()%>"
				onsubmit="return isValid(this);" >

				<div align="center">
					<font><em>修改老师信息</em></font>
				</div>
				<div></div>
				<table>				
					
					<tr>
						<td style="width: 87px;" align="center">名称</td>
						<td><textarea style="width: 323px;" name="name"><%=teachers1.getName()%></textarea></td>
					</tr>
					<tr>
						<td style="width: 87px;" align="center">学院</td>
						<td><textarea style="width: 323px;" name="academy"><%=teachers1.getAcademy()%></textarea></td>
					</tr>
					
					<tr>
						<td><div style="width: 87px;"></div></td>
						<td><input type="submit" align="left" value="提交"> <input
							type="reset" value="重置"></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	</div>
	<!-- 底部连接 -->
	<div id="footer"><td align="center">Copyright &copy; by lee</td></div>
</body>
</html>