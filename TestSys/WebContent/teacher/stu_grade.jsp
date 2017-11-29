<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.KjDAO"%>
<%@ page import="dao.KjDAOImp"%>
<%@ page import="entity.Kj"%>
<%@ page import="entity.Stu_grade"%>
<%@ page import="dao.Stu_gradeDAO"%>
<%@ page import="dao.Stu_gradeDAOImp"%>
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
			<div class="kj_title">学生成绩</div>
			<hr>
			<div class="kj_info" align="center">
				<form action="" method="">
					<table>
						<tr class="line_title">
							<th >考卷记号</th>
							<th >试卷名称</th>
							<th >考试名称</th>
							<th >单选得分</th>
							<th >多选得分</th>
							<th >判断得分</th>
							<th >总分</th>						
												
						</tr>
						<jsp:useBean id="stu_g" class="entity.Stu_grade" scope="page"/>
						<jsp:useBean id="kj" class="entity.Kj" scope="page"/>
						<jsp:useBean id="stu_result" class="entity.Stu_result" scope="page"/>
						<jsp:useBean id="stu" class="entity.Students" scope="page"/>
						<jsp:useBean id="stuDAO" class="dao.StudentsDAO" scope="page"/>
						<%
						Stu_gradeDAO stu_gdao = new Stu_gradeDAOImp();
						ArrayList<Object> list =stu_gdao.getAllStu_grade();
						if (list != null && list.size() > 0) {
					 		for (int i = 0; i < list.size(); i++) {
					 			stu_g = (Stu_grade)list.get(i);
						%>
						<tr class="line_info">
							<td><%=stu_g.getStu_g_id() %></td>
							<%KjDAO kjdao = new KjDAOImp();
							if(kjdao.getKtById(stu_g.getKj_id())!=null){
								kj=(Kj)kjdao.getKtById(stu_g.getKj_id());
							}
							%>
							<td><%=kj.getKj_name() %></td>
							<%if(stuDAO.getStudentsById(stu_g.getSid())!=null){
								stu=stuDAO.getStudentsById(stu_g.getSid());
							}
							%>
							<td><%=stu.getName() %></td>
							
							
							<td><%=stu_g.getStu_dxt_g() %></td>
							<td><%=stu_g.getStu_dxts_g() %></td>
							<td><%=stu_g.getStu_pdt_g() %></td>
							
							<td><%=stu_g.getStu_total_g() %></td>
							
							
													
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