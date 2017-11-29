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
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="<%=basePath %>/style/t_backstage.css">
<script type="text/javascript" src="<%=basePath %>/js/st_add_alert.js"></script>
<body>
	<!-- 标题栏 -->
	<jsp:include page="t_header.jsp" />
	<!-- 左侧任务栏 -->
	<jsp:include page="t_navigator.jsp" />
	<!-- 内容板块 -->
	<div id="section">


		<div>
			<form style="width: 343px;" method="post" action="<%=basePath %>/teacher/do_st_add.jsp"
				onsubmit="return isValid(this);">
				<div align="center">
					<font><em>插入试题</em></font>
				</div>
				<div></div>
				<table>
					<tr>
						<td style="width: 150px;" align="center">选择类型</td>
						<td><select style="width: 323px;" id="myselect"
							name="myselect"  onclick="hide()">
								<option value="1">单选题</option>								
								<option value="2">多选题</option>
								<option value="3">判断题</option>
						</select></td>
					</tr>
					<tr>
						<td style="width: 87px;" align="center">问题描述</td>
						<td><textarea style="width: 323px;" name="java_dxt_question"></textarea></td>
					</tr>
					<tr>
						<td style="width: 87px;" align="center"></td>
						<td><textarea style="width: 323px;" name="java_dxt_opt1"></textarea></td>
					</tr>
					<tr>
						<td style="width: 87px;" align="center"></td>
						<td><textarea style="width: 323px;" name="java_dxt_opt2"></textarea></td>
					</tr>
					<tr>
						<td style="width: 87px;" align="center" ></td>
						<td><textarea style="width: 323px;" name="java_dxt_opt3"></textarea></td>
					</tr>

					<tr>
						<td style="width: 87px;" align="center" ></td>
						<td><textarea style="width: 323px;" name="java_dxt_opt4"></textarea></td>
					</tr>
					<tr>
						<td style="width: 87px;" align="center">答案</td>
						<td><textarea style="width: 323px;" name="java_dxt_result"></textarea></td>
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
	<div id="footer"><td align="center">Copyright &copy; by lee</td></div>
</body>
</html>