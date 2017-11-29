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
<script type="text/javascript" src="<%=basePath%>/js/login.js"></script>
<body>
<!-- 标题栏 -->
	<jsp:include page="i_header.jsp" />
	<div><br>
		<table border="0" width="100%" height="90%">
				<tr>
					<td valign="middle">
						<form action="<%=basePath%>/dologin_login.jsp" method="post" onsubmit="return isValid1(this);" >

							<table border="1" width="30%" height="300"  bordercolor="#d8d8d8"
								align="center" cellpadding="5">
								<tr>
									<td colspan="2" align="center" class="title">在线考试</td>
								</tr>
								<tr>
									<td align="center"><img src="<%=basePath%>/images/login.jpg"></td>
									<td>
										<input type="text" class="input w100 mb10" name="name" placeholder="用户名" /><br> <br> 
										<input type="password" class="input w100  " name="password" placeholder="密码" /><br><br>  
				<input type="radio" name="type" value="0" checked>教工
				 <input type="radio" name="type" value="1">学生
			<button type="submit" class="button btn-blue w100 mt10">登 录</button><br><br>
			<span>没有账号?<a href='<%=basePath%>/activate_login.jsp'>请先激活</a></span>
									</td>
								</tr>
								
								<tr>
									<td colspan="2"></td>

								</tr>
							</table>
						</form>
					</td>
				</tr>
			</table>
			<br>
	</div>
	

<!-- 底部连接 -->
	<div id="footer"><td align="center">Copyright &copy; by lee</td></div>	
</body>
</html>