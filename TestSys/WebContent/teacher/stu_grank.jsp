<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.KjDAO"%>
<%@ page import="dao.KjDAOImp"%>
<%@ page import="entity.Kj"%>
<%@ page import="entity.Stu_grank"%>
<%@ page import="dao.Stu_grankDAO"%>
<%@ page import="dao.Stu_grankDAOImp"%>
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
			<div class="kj_title">学生排名</div>
			<hr>
			<div class="kj_info">
				<form action="" method="">
					<table>
						<tr class="line_title">
							<th >排名记号</th>
							<th >试卷名称</th>
							<th >考生名称</th>
							<th >排名</th>												
						</tr>
						<jsp:useBean id="stu_gr" class="entity.Stu_grank" scope="page"/>
						<jsp:useBean id="stu_g" class="entity.Stu_grade" scope="page"/>
						<jsp:useBean id="kj" class="entity.Kj" scope="page"/>
						<jsp:useBean id="stu_result" class="entity.Stu_result" scope="page"/>
						<jsp:useBean id="stu" class="entity.Students" scope="page"/>
						<jsp:useBean id="stuDAO" class="dao.StudentsDAO" scope="page"/>
						<%
						Stu_grankDAO stu_grdao = new Stu_grankDAOImp();
						ArrayList<Object> list =stu_grdao.getAllStu_grank();
						if (list != null && list.size() > 0) {
					 		for (int i = 0; i < list.size(); i++) {
					 			stu_gr = (Stu_grank)list.get(i);
						%>
						<tr class="line_info">
							<td><%=stu_gr.getStu_gr_id() %></td>
							<%KjDAO kjdao = new KjDAOImp();
							if(kjdao.getKtById(stu_gr.getKj_id())!=null){
								kj=(Kj)kjdao.getKtById(stu_gr.getKj_id());
							}
							%>
							<td><%=kj.getKj_name() %></td>
							<%if(stuDAO.getStudentsById(stu_gr.getSid())!=null){
								stu=stuDAO.getStudentsById(stu_gr.getSid());
							}
							%>
							<td><%=stu.getName() %></td>
							
							<td><%=stu_gr.getStu_grank() %></td>
												
						</tr>
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