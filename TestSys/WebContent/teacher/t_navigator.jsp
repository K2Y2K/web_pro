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
<div  id="nav" class="menu">
	<div class="cont">
		<div class="title"></div>
		<ul class="mList">
			<li>
				<h3>
					<span>>></span>个人资料
				</h3>
				<dl>
					<dd>
						<a href="#">个人信息</a>
					</dd>
					<dd>
						<a href="<%=basePath %>/teacher/teach_alert_mima.jsp">密码修改</a>
					</dd>
				</dl>
			</li>
			<li>
				<h3>
					<span>>></span>试卷管理
				</h3>
				<dl>
					<dd>
						<a href="<%=basePath %>/teacher/st_show.jsp">显示/删除试题</a>
					</dd>
					<dd>
						<a href="<%=basePath %>/teacher/st_add.jsp">插入试题</a>
					</dd>
					<dd>
						<a href="<%=basePath %>/teacher/st_show.jsp">修改试题</a>
					</dd>
					<dd>
						<a href="<%=basePath %>/teacher/st_maker.jsp?id=1">制作试卷</a>
					</dd>
					<dd>
						<a href="<%=basePath %>/teacher/kj_show.jsp">试卷整理</a>
						
					</dd>
					<dd>
						<a href="<%=basePath %>/teacher/kj_collect.jsp">考卷收集</a>
					</dd>
				</dl>
			</li>
			<li>
				<h3>
					<span>>></span>成绩管理
				</h3>
				<dl>
					<dd>
						<a href="<%=basePath %>/teacher/stu_grade.jsp">学生成绩</a>
					</dd>					
					<dd>
						<a href="<%=basePath %>/teacher/stu_grank.jsp">学生排名</a>
					</dd>
				</dl>
			</li>
		</ul>


	</div>
</div>