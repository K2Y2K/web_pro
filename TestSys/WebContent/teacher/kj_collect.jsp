<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.KjDAO"%>
<%@ page import="dao.KjDAOImp"%>
<%@ page import="entity.Kj"%>
<%@ page import="entity.Stu_result"%>
<%@ page import="dao.Stu_resultDAO"%>
<%@ page import="dao.Stu_resultDAOImp"%>
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
<link rel="stylesheet" href="<%=basePath%>/style/t_backstage.css">
<link rel="stylesheet" href="<%=basePath%>/style/t_kj_show.css">
</head>
<body>
	<!-- 标题栏 -->
	<jsp:include page="t_header.jsp" />
	<!-- 左侧任务栏 -->
	<jsp:include page="t_navigator.jsp" />
	<!-- 内容板块 -->
	<div id="section">
		<div class="kj_all">
			<div class="kj_title">考卷收集</div>
			<hr>
			<div class="kj_info">
				<form action="" method="">
					<table>
						<tr class="line_title">
							<th >考卷编号</th>
							<th >考卷名称</th>
							<th >考生名称</th>
							<th >单选答案</th>
							<th >单选正误</th>
							<th >多选答案</th>
							<th >多选正误</th>
							<th >判断答案</th>
							<th >判断正误</th>							
														
						</tr>
						<jsp:useBean id="kj" class="entity.Kj" scope="page"/>
						<jsp:useBean id="stu_result" class="entity.Stu_result" scope="page"/>
						<jsp:useBean id="stu" class="entity.Students" scope="page"/>
						<jsp:useBean id="stuDAO" class="dao.StudentsDAO" scope="page"/>
						<%
						Stu_resultDAO stu_rdao = new Stu_resultDAOImp();
						
						ArrayList<Object> list =stu_rdao.getAllStu_result();
						if (list != null && list.size() > 0) {
					 		for (int i = 0; i < list.size(); i++) {
					 			stu_result = (Stu_result)list.get(i);
						%>
						<tr class="line_info">
							<td><%=stu_result.getStu_r_id()%></td>
							<%KjDAO kjdao = new KjDAOImp();
							if(kjdao.getKtById(stu_result.getKj_id())!=null){
								kj=(Kj)kjdao.getKtById(stu_result.getKj_id());
							}
							%>
							<td><%=kj.getKj_name() %></td>
							<%if(stuDAO.getStudentsById(stu_result.getSid())!=null){
								stu=stuDAO.getStudentsById(stu_result.getSid());
							}
							%>
							<td><%=stu.getName() %></td>
							
							<td><%=stu_result.getStu_dxt_r() %></td>
							<td><%=stu_result.getStu_dxt_c() %></td>
							<td><%=stu_result.getStu_dxts_r() %></td>
							<td><%=stu_result.getStu_dxts_c() %></td>
							<td><%=stu_result.getStu_pdt_r() %></td>
							<td><%=stu_result.getStu_pdt_c() %></td>
							
							
						<% }}%>
					</table>
				</form>
			</div>
		</div>
	</div>
	<!-- 底部连接 -->
	<div id="footer">Copyright &copy; by lee</div>
</body>
</html>