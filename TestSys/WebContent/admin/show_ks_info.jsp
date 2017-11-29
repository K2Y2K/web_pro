<%@ page language="java"  import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.KjDAO"%>
<%@ page import="dao.KjDAOImp"%>
<%@ page import="entity.Kj"%>
<%@ page import="entity.Course"%>
<%@ page import="dao.CourseDAO"%>
<%@ page import="dao.CourseDAOImp"%>
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
<link rel="stylesheet" href="<%=basePath %>/style/t_backstage.css">
<body>
<jsp:useBean  id="loginUser" class="entity.Managers" scope="session"/>

	<!-- 标题栏 -->
	<jsp:include page="m_header.jsp" />
	<!-- 左侧任务栏 -->
	<jsp:include page="m_navigator.jsp" />
	<!-- 内容板块 -->
	<div id="section">
		<div class="kj_all">
			<div class="kj_title">试卷详情</div>
			<hr>
			<div class="kj_info">
				<form action="" method="">
					<table>
						<tr class="line_title">
							<th >试卷编号</th>
							<th >试卷名字</th>
							<th >单选题数量</th>
							<th >单选分值</th>
							<th >多选题数量</th>
							<th >多选分值</th>
							<th >判断题数量</th>
							<th >判断分值</th>
							<th >考卷类型</th>
							<th >考卷科目</th>
							<th >出题人</th>
							<th >查看试卷</th>							
						</tr>
						<jsp:useBean id="kj" class="entity.Kj" scope="page"/>
						<%
						KjDAO kjdao = new KjDAOImp();
						ArrayList<Object> list =kjdao.getAllKj();
						if (list != null && list.size() > 0) {
					 		for (int i = 0; i < list.size(); i++) {
					 			kj = (Kj)list.get(i);
						%>
						<tr class="line_info">
							<td><%=kj.getKj_id() %></td>
							<td><%=kj.getKj_name() %></td>
							<%int count1,count2,count3;
							if(kj.getKj_dxt_id()!=null){
							String[] arr = kj.getKj_dxt_id().split("#");
							count1=arr.length;}else count1=0;
							if(kj.getKj_dxts_id()!=null){
								String[] arr = kj.getKj_dxts_id().split("#");
								count2=arr.length;}else count2=0;
							if(kj.getKj_pdt_id()!=null){
								String[] arr = kj.getKj_pdt_id().split("#");
								count3=arr.length;}else count3=0;
							%>
							<td><%=count1 %></td>
							<td><%=kj.getKj_dxt_g() %></td>
							<td><%=count2 %></td>
							<td><%=kj.getKj_dxts_g() %></td>
							<td><%=count3 %></td>
							<td><%=kj.getKj_pdt_g() %></td>
							<%String type="";
							if(kj.getKj_type()==1){
								type="试卷A";
							}else type="试卷B";
							%>
							<td><%=type%></td>
							<jsp:useBean id="c" class="entity.Course" scope="page"/>
							<%CourseDAO cdao=new CourseDAOImp();
							if(cdao.getCourseById(kj.getC_id())!=null){
								c=(Course)cdao.getCourseById(kj.getC_id());
							
							}
							%>
							<td><%=c.getC_name() %></td>
							<jsp:useBean id="t" class="entity.Teachers" scope="page"/>
							<jsp:useBean id="t_dao" class="dao.TeachersDAO" scope="page"/>
							<% 
							if(t_dao.getTeachersById(kj.getTid())!=null){
								t=t_dao.getTeachersById(kj.getTid());							
							}
							%>
							<td><%=t.getName() %></td>
							<td>
							<a href='<%=basePath%>/admin/kj_detail1.jsp?kj_id=<%=kj.getKj_id()%>'>查看</a>
							</td>						
						</tr>
						<% }}%>
					</table>
				</form>
			</div>
		</div>

	</div>
	<!-- 底部连接 -->
	<div id="footer">
		<td align="center">Copyright &copy; by lee</td>
	</div>
</body>
</html>