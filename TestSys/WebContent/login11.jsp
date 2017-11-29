<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="<%=basePath %>/style/t_backstage.css">
<body>
<!-- 标题栏 -->
	<jsp:include page="i_header.jsp" />
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
	</div>
	<div class="service-box">
		<form action="dologin_login1.jsp" method="post">
			<input type="text" class="input w100 mb10" name="name"
				placeholder="用户名" /><br> <input type="password"
				class="input w100  " name="password" placeholder="密码" /><br> 
				<input type="radio" name="type" value="0" checked>教工
				 <input type="radio" name="type" value="1">学生
			<button type="submit" class="button btn-blue w100 mt10">登 录</button>
		</form>
	</div>

<!-- 底部连接 -->
	<div id="footer">6</div>	
</body>
</html>