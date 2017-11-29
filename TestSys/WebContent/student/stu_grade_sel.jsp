<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.KjDAO"%>
<%@ page import="dao.KjDAOImp"%>
<%@ page import="entity.Kj"%>
<%@ page import="entity.Stu_grank"%>
<%@ page import="dao.Stu_grankDAO"%>
<%@ page import="dao.Stu_grankDAOImp"%>
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
<link rel="stylesheet" href="<%=basePath%>/style/t_kj_layout.css">
</head>
<body>
	<!-- 标题栏 -->
	<jsp:include page="s_header.jsp" />
	<!-- 中间任务栏 -->
	<jsp:include page="s_navigator.jsp" />
	<!-- 内容板块 -->
	<div id="section1">
	<jsp:useBean  id="loginUser1" class="entity.Students" scope="session"/>
	
		<div class="kj_all">
			<div class="kj_title" align="center">成绩查询</div>
			<hr>
			<div class="kj_info" align="center">
				<form action="" method="">
					<table align="center">
						<tr class="line_title">
							<th >考生名称</th>
							<th >试卷名称</th>
							<th >考生成绩</th>
							<th >排名</th>												
						</tr>
						<jsp:useBean id="stu_gr" class="entity.Stu_grank" scope="page"/>
						<jsp:useBean id="stu_g" class="entity.Stu_grade" scope="page"/>
						<jsp:useBean id="kj" class="entity.Kj" scope="page"/>
						<jsp:useBean id="stu_result" class="entity.Stu_result" scope="page"/>
						<jsp:useBean id="stu" class="entity.Students" scope="page"/>
						<jsp:useBean id="stuDAO" class="dao.StudentsDAO" scope="page"/>
					
						<%
	stu=stuDAO.getIdByStudents(loginUser1);
						 int sid=stu.getSid();
	%>
		
						<%
						Stu_gradeDAO stu_gdao = new Stu_gradeDAOImp();
						ArrayList<Object> list =stu_gdao.getStu_gradeBySid(sid);
						if (list != null && list.size() > 0) {
					 		for (int i = 0; i < list.size(); i++) {
					 			stu_g = (Stu_grade)list.get(i);
						%>
						<tr class="line_info">
							<td><%=stu.getName() %></td>
							<%KjDAO kjdao = new KjDAOImp();
							if(kjdao.getKtById(stu_g.getKj_id())!=null){
								kj=(Kj)kjdao.getKtById(stu_g.getKj_id());
							}
							String r="JAVA期末考试(2016)";
							%>
							<td><%=kj.getKj_name() %></td>
							
							<td><%=stu_g.getStu_total_g() %></td>
							
							<td><%="1" %></td>
												
						</tr>
						<% }}%>
					</table>
				</form>
			</div>
		</div>
	</div>
	
</body>
</html>