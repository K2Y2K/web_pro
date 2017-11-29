<%@ page language="java"  import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<link rel="stylesheet" href="<%=basePath %>/style/t_backstage.css">
<body>
<jsp:useBean  id="loginUser" class="entity.Managers" scope="session"/>

	<!-- 标题栏 -->
	<jsp:include page="m_header.jsp" />
	<!-- 左侧任务栏 -->
	<jsp:include page="m_navigator.jsp" />
	<!-- 内容板块 -->
	<div id="section">
		<div align="center">
			
			<form style="width: 343px;" method="post" action="#"
				onsubmit="return isValid(this);">
				<div align="center">
					<font><em>添加学生记录</em></font>
				</div>
				<div></div>
				<table>
					
					<tr>
						<td style="width: 87px;" align="center">学生名称</td>
						<td><input style="width: 323px;" name="name"></td>
					</tr>
					<tr>
						<td style="width: 87px;" align="center">班级</td>
						<td><input style="width: 323px;" name="banji"></td>
					</tr>
					<tr>
						<td style="width: 87px;" align="center">学院</td>
						<td><input style="width: 323px;" name="academy"></td>
					</tr>
					<tr>
						<td><div style="width: 87px;"></div></td>
						<td><input type="submit" align="left" value="提交" > <input
							type="reset" value="重置"></td>

					</tr>
				</table>

			</form>
			
		</div>

	</div>
	<!-- 底部连接 -->
	<div id="footer">
		<td align="center">Copyright &copy; by lee</td>
	</div>
</body>
</html>