<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<head>
<title>Testsystem to Login</title>
</head>
<link rel="stylesheet" href="<%=basePath %>/style/t_backstage.css">
<body >
	<!-- 标题栏 -->
	<jsp:include page="i_header.jsp" />
	<div>	
		<div>
			<table border="0" width="100%" height="90%">
				<tr>
					<td valign="middle">
						<form action="dologin_login.jsp" method="post">

							<table border="1" width="30%" height="300"  bordercolor="#d8d8d8"
								align="center" cellpadding="5">
								<tr>
									<td colspan="2" align="center" class="title">在线考试</td>
								</tr>
								<tr>
									<td align="center"><img src="images/login.jpg"></td>
									<td>
										<table align="center">
											<tr>
												<td>用户名</td>
												<td><input type="text" name="name" class="box2" /></td>
											</tr>
											<tr>
												<td>密码</td>
												<td><input type="password" name="password" class="box2" /></td>
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
			<table border="0" width="100%">
				<tr>
					<td align="center">Copyright &copy; by lee</td>
				</tr>
			</table>


		</div>
		
	</div>
</body>
</html>