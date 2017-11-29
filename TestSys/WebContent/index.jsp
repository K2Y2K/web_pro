<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Welcom to TestSystem</title>
</head>
<body>
	<%
		String loginUser0 = "";String loginUser1 = "";
		String loginUser2 = "";String loginUser3 = "";
		if (session.getAttribute("loginUser") != null) {
			loginUser0 = "欢迎"+session.getAttribute("loginUser").toString()+"登录"+"  ";
			loginUser1="退出";
		}else{
		loginUser2="请先登录";loginUser3="注册";
		}
	%>
	<div width="1000" border="0" align="right" cellpadding="0"
		cellspacing="0" style="margin: 0 auto;">
	<font  color="red"><%=loginUser0%></font>
	<a href="doquit.jsp"><font  color="blue"><%=loginUser1%></font></a>
	</div>
	<div width="1000" border="0" align="right" cellpadding="0"
		cellspacing="0" style="margin: 0 auto;">
		<a href="login.jsp"><%=loginUser2%></a> <a href="zhuce.jsp"><%=loginUser3%></a>
	</div>

	<table width="1000" border="0" align="center" cellpadding="0"
		cellspacing="0" style="margin: 0 auto;">
		<tr>
			<td width="744" height="112"><br>
			<a href="index.jsp"><img src="images/login_index.jpg" width="680"
					height="56" alt="济南大学在线考试" /></a></td>
			<td style="padding-top: 5px;">
			<script type="text/javascript">
				function SerchType(Serch) { //判断用户点击了搜索框
					if (Serch.value == '请输入关键词') {
						Serch.value = '';
						Serch.style.color = 'black';
					}
				}
				function returnvalue(Serch) { //判断如果用户没有输入关键词，则框内恢复原状
					if (Serch.value == '') {
						Serch.value = '请输入关键词'; //输入框恢复原值   
						Serch.style.color = 'Gray';
					} //还原输入框中的字体颜色为灰色
				}
			</script>
				<form action="search.jsp" method="get">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td style="border: 1px solid #ccc; border-right: 0;"><input
								type="text" name="keyword" id="keyword" value="请输入关键词"
								onblur="returnvalue(this)" onclick="SerchType(this)"
								class="inputa" /> <input name="bywhat" id="bywhat"
								type="hidden" value="biaoti" /></td>
							<td><input name="" type="image" src="images/sss.jpg"
								alt="搜索" /></td>
						</tr>
					</table>
				</form></td>
		</tr>
	</table>
	<div style="width: 100%; background-color: #136CD4;">
		<table width="1000" border="0" align="center" cellpadding="0"
			cellspacing="0" style="margin: 0 auto;">
			<tr>

				<td align="center" height="35"><a class="title"
					href="list.asp?sortsid=455" target="_self" style="color: #fff;">
						题库训练 </a></td>

				<td><img src="images/bg1.fw.png" width="1" height="35" /></td>


				<td align="center" height="35"><a class="title"
					href="list.asp?sortsid=451" target="_self" style="color: #fff;">
						在线考试 </a></td>

				<td><img src="images/bg1.fw.png" width="1" height="35" /></td>

				

			</tr>
		</table>
	</div>
</body>
</html>