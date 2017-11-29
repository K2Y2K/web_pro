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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Welcome to manager</title>
</head>
<link rel="stylesheet" href="<%=basePath%>/style/t_backstage.css">
<script type="text/javascript" src="<%=basePath%>/js/login.js"></script>
<body>
	<!-- 标题栏 -->
	<div id="header">

		<td width="1000" height="150"><br> <a
			href="<%=basePath%>/admin/admin_login.jsp"><img
				src="<%=basePath%>/images/login_index.jpg" width="680" height="56"
				alt="济南大学在线考试" /></a></td>
	</div>
	<div id="header_line">

		<em><a href="<%=basePath%>/admin/manager_info.jsp"><font
				color=white>>></font></a></em>

	</div>
	<div>
		<table border="0" width="100%" height="90%">
			<tr>
				<td valign="middle">
					<form action="<%=basePath%>/Servlet/managersServlet" method="post"
						onsubmit="return isValid(this);">

						<table border="1" width="30%" height="300" bordercolor="#d8d8d8"
							align="center" cellpadding="5">
							<tr>
								<td colspan="2" align="center" class="title">管理员登录</td>
							</tr>
							<tr>
								<td align="center"><img
									src="<%=basePath%>/images/login.jpg"></td>
								<td>
									<table align="center">
										<tr>
											<td>用户名</td>
											<td><input type="text" name="m_name" class="box2" /></td>
										</tr>
										<tr>
											<td>密码</td>
											<td><input type="password" name="m_password"
												class="box2" /></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td colspan="2" align="center"><input type="submit"
									value="登录" /> <input type="reset" value="重填" /></td>

							</tr>
							<tr>
								<td colspan="2"></td>

							</tr>
						</table>
					</form>
				</td>
			</tr>
		</table>
	</div>


	<!-- 底部连接 -->
	<div id="footer">
		<td align="center">Copyright &copy; by lee</td>
	</div>
</body>
</html>