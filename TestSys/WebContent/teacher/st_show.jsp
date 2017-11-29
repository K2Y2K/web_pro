<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="entity.Java_dxt"%>
<%@ page import="dao.Java_dxtDAO"%>
<%@ page import="entity.Java_dxts"%>
<%@ page import="dao.Java_dxtsDAO"%>
<%@ page import="entity.Java_pdt"%>
<%@ page import="dao.Java_pdtDAO"%>
<%@ page import="dao.Java_stDAO"%>

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
<script language="javascript">
	//用script在删除前进行确认
	function delcfm() {
		if (!confirm("确定要删除？")) {
			window.event.returnValue = false;
		}
	}
	//用script在添加前进行确认
	function addcfm() {
		if (xuanze1.value != null) {
			alert("未选则要添加的试题");
			return false;}
		if (!confirm("确定要添加到试卷吗？")) {
			window.event.returnValue = false;
		}
	}
	function isValid(xuanze) {
		
			
		
	}
</script>
<body>
	<!-- 标题栏 -->
	<jsp:include page="t_header.jsp" />
	<!-- 左侧任务栏 -->
	<jsp:include page="t_navigator.jsp" />
	<!-- 内容板块 -->
	<div id="section">
		<div>
			<div class="sec_title" align="center">
				<em>试题展示</em>
			</div>
<div>
			<form id="1" action="<%=basePath%>/teacher/st_maker.jsp?id=1"
				method="post">
				<div>
					<div class="sec_ti">
						>>单选题&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<a href='<%=basePath%>/teacher/st_add.jsp'>插入</a>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
							type="submit" value="添加到试卷" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="st_dxt_details">>>more</a>
					</div>
					</br>
					<div>


						<table width="750" height="60" cellpadding="0" cellspacing="0"
							border="0">
							<tr>
								<td>
									<!-- 商品循环开始 --> <jsp:useBean id="java_dxt"
										class="entity.Java_dxt" scope="session" /> <jsp:useBean
										id="java_dxtDAO" class="dao.Java_dxtDAO" scope="session" /> <%
 	ArrayList<Java_dxt> list = java_dxtDAO.getAllJava_dxt();
 	if (list != null && list.size() > 0) {
 		for (int i = 0; i < list.size(); i++) {
 			java_dxt = list.get(i);
 %>
									<div>
										<dl>
											<dt>
												<input type="checkbox"
													value="<%=java_dxt.getJava_dxt_id()%>" name="xuanze1">
												问题:<%=java_dxt.getJava_dxt_question()%>
											</dt>
											<dd class="dd_name">
												A:<%=java_dxt.getJava_dxt_opt1()%>&nbsp;&nbsp;B:
												<%=java_dxt.getJava_dxt_opt2()%>

											</dd>
											<dd class="dd_city">
												C:<%=java_dxt.getJava_dxt_opt3()%>&nbsp;&nbsp; D:<%=java_dxt.getJava_dxt_opt4()%></dd>
											<dd>
												答案:<%=java_dxt.getJava_dxt_result()%></dd>
											<dd>
												<a
													href='<%=basePath%>/teacher/st_update.jsp?java_dxt_id=<%=java_dxt.getJava_dxt_id()%>&id=1'>修改</a>&nbsp;&nbsp;&nbsp;&nbsp;
												<a
													href='<%=basePath%>/teacher/do_st_delete.jsp?java_st_id=<%=java_dxt.getJava_dxt_id()%>&id=1'
													onclick="delcfm()">删除</a>&nbsp;&nbsp;&nbsp;&nbsp; 
											</dd>
										</dl>
									</div> <!-- 商品循环结束 --> <%
 	if (i >= 10)
 				break;
 		}
 	}
 %>
								</td>
							</tr>
						</table>
					</div>
				</div>

			</form>
</div>
<div>
			<form id="2" action="<%=basePath%>/teacher/st_maker.jsp?id=2"
				method="post">
				<div>
					<div class="sec_ti">>>多选题
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<a href='<%=basePath%>/teacher/st_add.jsp'>插入</a>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
							type="submit" value="添加到试卷" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="st_dxts_details">>>more</a>
					</div>
					<br>
					<div>
					<table width="750" height="60" cellpadding="0" cellspacing="0"
							border="0">
							<tr>
								<td>
									<!-- 商品循环开始 --> 
									<jsp:useBean id="java_dxts"
										class="entity.Java_dxts" scope="session" /> 
										<jsp:useBean
										id="java_dxtsDAO" class="dao.Java_dxtsDAO" scope="session" /> <%
 	ArrayList<Java_dxts> list1 = java_dxtsDAO.getAllJava_dxts();
 	if (list1 != null && list1.size() > 0) {
 		for (int i = 0; i < list1.size(); i++) {
 			java_dxts = list1.get(i);
 %>
										<div>
										<dl>
											<dt>
												<input type="checkbox"
													value="<%=java_dxts.getJava_dxts_id()%>" name="xuanze2">
												问题:<%=java_dxts.getJava_dxts_question()%>
											</dt>
											<dd class="dd_name">
												A:<%=java_dxts.getJava_dxts_opt1()%>&nbsp;&nbsp;B:
												<%=java_dxts.getJava_dxts_opt2()%>

											</dd>
											<dd class="dd_city">
												C:<%=java_dxts.getJava_dxts_opt3()%>&nbsp;&nbsp; D:<%=java_dxts.getJava_dxts_opt4()%></dd>
											<dd>
												答案:<%=java_dxts.getJava_dxts_result()%></dd>
											<dd>
												<a
													href='<%=basePath%>/teacher/st_update.jsp?java_dxts_id=<%=java_dxts.getJava_dxts_id()%>&id=2'>修改</a>&nbsp;&nbsp;&nbsp;&nbsp;
												<a
													href='<%=basePath%>/teacher/do_st_delete.jsp?java_st_id=<%=java_dxts.getJava_dxts_id()%>&id=2'
													onclick="delcfm()">删除</a>&nbsp;&nbsp;&nbsp;&nbsp; 	</dd>
										</dl>
									</div> <!-- 商品循环结束 --> <%
 	if (i >= 4)
 				break;
 		}
 	}
 %>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</form>
</div>
<div>
			<form id="3" action="<%=basePath%>/teacher/st_maker.jsp?id=3"
				method="post">
				<div>
					<div class="sec_ti">>>判断题
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<a href='<%=basePath%>/teacher/st_add.jsp'>插入</a>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
							type="submit" value="添加到试卷" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="st_pdt_details">>>more</a>
					</div>
					<br>
					<div>
					<table width="750" height="60" cellpadding="0" cellspacing="0"
							border="0">
							<tr>
								<td>
									<!-- 商品循环开始 --> 
									<jsp:useBean id="java_pdt"
										class="entity.Java_pdt" scope="session" /> 
										<jsp:useBean id="java_pdtDAO" class="dao.Java_pdtDAO" scope="session" /> 
										
										<%
										Java_stDAO java_stDAO =new Java_pdtDAO();
 	ArrayList<Object> list2 = java_stDAO.getAllJava_st();
 	if (list2 != null && list2.size() > 0) {
 		for (int i = 0; i < list2.size(); i++) {
 			java_pdt = (Java_pdt)list2.get(i);
 %>
									<div>
										<dl>
											<dt>
												<input type="checkbox"
													value="<%=java_pdt.getJava_pdt_id()%>" name="xuanze3">
												问题:<%=java_pdt.getJava_pdt_question()%>
											</dt>
											
											<dd>
												答案:<%=java_pdt.getJava_pdt_result()%></dd>
											<dd>
												<a
													href='<%=basePath%>/teacher/st_update.jsp?java_pdt_id=<%=java_pdt.getJava_pdt_id()%>&id=3'>修改</a>&nbsp;&nbsp;&nbsp;&nbsp;
												<a
													href='<%=basePath%>/teacher/do_st_delete.jsp?java_st_id=<%=java_pdt.getJava_pdt_id()%>&id=3'
													onclick="delcfm()">删除</a>&nbsp;&nbsp;&nbsp;&nbsp; 
											</dd>
										</dl>
									</div> <!-- 商品循环结束 --> <%
 	if (i >= 4)
 				break;
 		}
 	}
 %>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</form>
</div>
		</div>

	</div>
	<!-- 底部连接 -->
	<div id="footer"><td align="center">Copyright &copy; by lee</td></div>
</body>
</html>