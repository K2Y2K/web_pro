<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.KjDAO"%>
<%@ page import="dao.KjDAOImp"%>
<%@ page import="entity.Kj"%>
<%@ page import="entity.Course"%>
<%@ page import="dao.CourseDAO"%>
<%@ page import="dao.CourseDAOImp"%>
<%@ page import="entity.Java_pdt"%>
<%@ page import="dao.Java_stDAO"%>
<%@ page import="dao.Java_pdtDAO"%>
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
<link rel="stylesheet" href="<%=basePath%>/style/t_backstage.css">
<link rel="stylesheet" href="<%=basePath%>/style/t_kj_layout.css">
<script type="text/javascript" src="<%=basePath %>/js/on_ks_alert.js"></script>
<script type="text/javascript">
	//隐藏答案
	function show() {
		if (document.all["st_result"].style.display == "block") {

			document.all["st_result"].style.display = "none";
		} else
			document.all["st_result"].style.display = "block";
	}

</script>
<body>
	<!-- 标题栏 -->
	<jsp:include page="s_header.jsp" />
	<jsp:include page="kj_header.jsp" />
	<!-- 内容板块 -->
	<div id="section1">
	    <jsp:useBean id="java_dxt" class="entity.Java_dxt" scope="page"/>
		<jsp:useBean id="java_dxts" class="entity.Java_dxts" scope="page"/>		
		<jsp:useBean id="java_pdt" class="entity.Java_pdt" scope="page"/>
		<jsp:useBean id="java_dxtDAO" class="dao.Java_dxtDAO" scope="page" />
		<jsp:useBean id="java_dxtsDAO" class="dao.Java_dxtsDAO" scope="page" />
		<jsp:useBean id="kj" class="entity.Kj" scope="page"/>
		<jsp:useBean id="c" class="entity.Course" scope="page"/>
		<jsp:useBean id="t" class="entity.Teachers" scope="page"/>
		<jsp:useBean id="t_dao" class="dao.TeachersDAO" scope="page"/>
		<jsp:useBean id="stu" class="entity.Students" scope="page"/>
		<jsp:useBean id="stu_dao" class="dao.StudentsDAO" scope="page"/>
		<jsp:useBean  id="loginUser1" class="entity.Students" scope="session"/>
		<%
	stu=stu_dao.getIdByStudents(loginUser1);
	%>
		<%
			KjDAO kjdao = new KjDAOImp();		    
			kj = (Kj) kjdao.getKtById(Integer.parseInt(request.getParameter("kj_select")));
			String type = "";
			if (kj.getKj_type() == 1) {
				type = "试卷A";
			} else
				type = "试卷B";
			CourseDAO cdao=new CourseDAOImp();
			if(cdao.getCourseById(kj.getC_id())!=null){
				c=(Course)cdao.getCourseById(kj.getC_id());}
			if(t_dao.getTeachersById(kj.getTid())!=null){
				t=t_dao.getTeachersById(kj.getTid());							
			}
			if(stu_dao.getStudentsById(stu.getSid())!=null){
				t=t_dao.getTeachersById(kj.getTid());							
			}
		%>
		<%
			int icount1, icount2, icount3;
			if (kj.getKj_dxt_id() != null) {
				String[] arr = kj.getKj_dxt_id().split("#");
				icount1 = arr.length;
			} else
				icount1 = 0;
			if (kj.getKj_dxts_id() != null) {
				String[] arr = kj.getKj_dxts_id().split("#");
				icount2 = arr.length;
			} else
				icount2 = 0;
			if (kj.getKj_pdt_id() != null) {
				String[] arr = kj.getKj_pdt_id().split("#");
				icount3 = arr.length;
			} else
				icount3 = 0;
			
		%>
		<form action="<%=basePath%>/Servlet/do_on_ksServlet?kj_id=<%=kj.getKj_id()%>&sid=<%=stu.getSid() %>"  method="post" onsubmit="return check()">
		<div class="kj_name">
			<em><%=kj.getKj_name() %></em>
		</div>
		<div class="kj_info"><label>考卷类型：<%=type %></label><br><label>考卷科目：<%=c.getC_name() %></label>
		<br><label>出题人：<%=t.getName() %></label><br><label>考生：<%=stu.getName() %></label>
		</div>
		<hr class="kj_tab">		
		<div class="kj_1">
			<div class="kj_2">
				<h3>一、单选题:(<%=icount1 %>个题*<%=kj.getKj_dxt_g() %>分)</h3>
			</div>
			<%int count1=1;
				if (kj.getKj_dxt_id() != null) {
					String[] arr = kj.getKj_dxt_id().split("#");
					for (int i = 0; i < arr.length; i++,count1++) {
						if(java_dxtDAO.getJava_dxtById(Integer.parseInt(arr[i]))!=null){
						java_dxt = java_dxtDAO.getJava_dxtById(Integer.parseInt(arr[i]));					
			%>			
			<div class="kj_tm"><%=count1 %>:<%=java_dxt.getJava_dxt_question() %></div>
			<div class="kj_xx">
			<input type="hidden" value="<%=java_dxt.getJava_dxt_id() %>" name="quest_dxt">
				<input type="radio" value="<%=java_dxt.getJava_dxt_opt1() %>" name="<%=java_dxt.getJava_dxt_id() %>">A:<%=java_dxt.getJava_dxt_opt1() %> 
				
			</div>
			<div class="kj_xx">
				<input type="radio" value="<%=java_dxt.getJava_dxt_opt2() %>" name="<%=java_dxt.getJava_dxt_id() %>">B:<%=java_dxt.getJava_dxt_opt2() %>
				
			</div>
			<div class="kj_xx">
				<input type="radio" value="<%=java_dxt.getJava_dxt_opt3() %>" name="<%=java_dxt.getJava_dxt_id() %>">C:<%=java_dxt.getJava_dxt_opt3() %>
			</div>
			<div class="kj_xx">
				<input type="radio" value="<%=java_dxt.getJava_dxt_opt4() %>" name="<%=java_dxt.getJava_dxt_id() %>">D:<%=java_dxt.getJava_dxt_opt4() %>
			</div><%}}} %>
			<div class="kj_2">
				<h3>二、多选题:(<%=icount2 %>个题*<%=kj.getKj_dxts_g() %>分)</h3>
			</div>
			<%int count2=1;
				if (kj.getKj_dxts_id() != null) {
					String[] arr = kj.getKj_dxts_id().split("#");
					for (int i = 0; i < arr.length; i++,count2++) {
						if( java_dxtsDAO.getJava_dxtsById(Integer.parseInt(arr[i]))!=null){
						java_dxts = java_dxtsDAO.getJava_dxtsById(Integer.parseInt(arr[i]));
			%>
			<div class="kj_tm"><%=count2 %>:<%=java_dxts.getJava_dxts_question() %></div>
			<div class="kj_xx">
			    <input type="hidden" value="<%=java_dxts.getJava_dxts_id() %>" name="quest_dxts">
				<input type="checkbox" value="<%=java_dxts.getJava_dxts_opt1() %>" name="<%=java_dxts.getJava_dxts_id() %>">A:<%=java_dxts.getJava_dxts_opt1() %>
			    
			</div>
			<div class="kj_xx">
				<input type="checkbox" value="<%=java_dxts.getJava_dxts_opt2() %>" name="<%=java_dxts.getJava_dxts_id() %>">B:<%=java_dxts.getJava_dxts_opt2() %>
                
			</div>
			<div class="kj_xx">
				<input type="checkbox" value="<%=java_dxts.getJava_dxts_opt3() %>" name="<%=java_dxts.getJava_dxts_id() %>">C:<%=java_dxts.getJava_dxts_opt3() %>
			</div>
			<div class="kj_xx">
				<input type="checkbox" value="<%=java_dxts.getJava_dxts_opt4() %>" name="<%=java_dxts.getJava_dxts_id() %>">D:<%=java_dxts.getJava_dxts_opt4() %>
			</div><% }}}%>
			<div class="kj_2">
				<h3>三、判断题:(<%=icount3 %>个题*<%=kj.getKj_pdt_g() %>分)</h3>
			</div>
			<%	int count3=1;
			Java_stDAO j_stdao =new Java_pdtDAO();	
				if (kj.getKj_pdt_id() != null) {
					String[] arr = kj.getKj_pdt_id().split("#");
					for (int i = 0; i < arr.length; i++,count3++) {
						if(j_stdao.getJava_stById(Integer.parseInt(arr[i]))!=null){//防止数据库该id 被删掉
						java_pdt = (Java_pdt)j_stdao.getJava_stById(Integer.parseInt(arr[i]));
			%>			
			<div class="kj_tm"><%=count3 %>:<%=java_pdt.getJava_pdt_question() %></div>
			<div class="kj_xx">
				<input type="hidden" value="<%=java_pdt.getJava_pdt_id() %>" name="quest_pdt">
				<input type="radio" value="1" name="<%=java_pdt.getJava_pdt_id() %>">正确
                
			</div>
			<div class="kj_xx">
				<input type="radio" value="0" name="<%=java_pdt.getJava_pdt_id() %>">错误
                 <% String result="";
                 if(java_pdt.getJava_pdt_result()==1){
                	result="正确";
                 } else result="错误";%>
                 
			</div><% }}}%>
			 <div class="kj_tj"><label> <input type="submit" align="right" value="交卷"  ></label></div>	
			</div>
		</form>
	</div>
	<!-- 底部连接 -->
	<div id="footer">Copyright &copy; by lee</div>
</body>
</html>