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
<!-- 左侧列表-->
<div id="nav" class="menu">
	<div class="cont">
		<div class="title"></div>
		<ul class="mList">
			<li>
				<h3>
					<span>>></span>管理员资料
				</h3>
				<dl>
					<dd>
						<a href="#">个人信息</a>
					</dd>

					<dd>
						<a href="<%=basePath%>/admin/show_manager.jsp">新增管理员</a>
					</dd>
				</dl>
			</li>
			<li>
				<h3>
					<span>>></span><a href="<%=basePath%>/admin/show_teach_info.jsp">老师记录</a>
				</h3>
				<dl>

					<dd>
						<a href="<%=basePath%>/admin/add_teach_info.jsp">添加老师记录</a>
					</dd>
					<dd>
						<a href="<%=basePath%>/admin/update_teach_info.jsp">修改老师记录</a>
					</dd>
					

				</dl>
			</li>
			<li>
				<h3>
					<span>>></span><a href="<%=basePath%>/admin/show_stu_info.jsp">学生记录</a>
				</h3>
				<dl>

					<dd>
						<a href="<%=basePath%>/admin/add_stu_info.jsp">添加学生记录</a>
					</dd>
					<dd>
						<a href="<%=basePath%>/admin/update_stu_info.jsp">修改学生记录</a>
					</dd>
					<dd>
						<a href="<%=basePath%>/admin/stu_grades.jsp">学生成绩</a>
					</dd>
				</dl>
			</li>
			<li>
				<h3>
					<span>>></span><a href="<%=basePath%>/admin/show_ks_info.jsp">考试信息</a>
				</h3>
				
			</li>
		</ul>


	</div>
</div>