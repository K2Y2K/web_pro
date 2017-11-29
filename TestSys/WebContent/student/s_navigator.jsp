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
<div style="width: 1000; background-color: #136CD4;" align="center">
		<table width="1000" border="0" align="center" cellpadding="0"
			cellspacing="0" style="margin: 0 auto;">
			<tr>
				<td align="center" height="35"><a class="title"
					href="<%=basePath%>/student/stu_info.jsp" target="_self" style="color: #fff;">
						密码修改 </a></td>
				<td><img src="images/bg1.fw.png" width="1" height="35" /></td>
				<td align="center" height="35"><a class="title"
					href="<%=basePath%>/student/on_sel_km.jsp" target="_self" style="color: #fff;">
						在线考试 </a></td>
				<td><img src="images/bg1.fw.png" width="1" height="35" /></td>
				<td align="center" height="35"><a class="title"
					href="<%=basePath%>/student/stu_grade_sel.jsp" target="_self" style="color: #fff;">
						成绩查询 </a></td>

			</tr>
		</table>
	</div>