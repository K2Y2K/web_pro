<%@ page language="java" import="java.util.*"  contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.KjDAO"%>
<%@ page import="dao.KjDAOImp"%>
<%@ page import="entity.Kj"%>
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
<link rel="stylesheet" href="<%=basePath%>/style/s_on_km.css">
</head>
<body style="background-color: #8080c0;">
	<!-- 选择科目的下拉菜单 -->
	<div class="c_layout">
		<form action="<%=basePath %>/student/on_ks.jsp" method="post">
			<div class="c_title">请选择考试科目</div>
			<div class="c_xlb">
				<select style="width: 300px; height: 50px;" id="kj_select"
					name="kj_select" >
					<jsp:useBean id="kj" class="entity.Kj" scope="page"/>
					<%
					KjDAO kjdao = new KjDAOImp();
					ArrayList<Object> list =kjdao.getAllKj();
					if (list != null && list.size() > 0) {
				 		for (int i = 0; i < list.size(); i++) {
				 			kj = (Kj)list.get(i);%>												
					<option value="<%=kj.getKj_id()%>"><%=kj.getKj_name() %></option>					
					<%}}%>
				</select>
			</div>
			<div class="c_sub">
				<input type="submit" align="middle" value="进入考试系统">
			</div>
		</form>
	</div>
</body>
</html>