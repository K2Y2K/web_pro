<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="entity.Java_dxt"%>
<%@ page import="entity.Java_dxts"%>
<%@ page import="entity.Java_pdt"%>
<%@ page import="entity.Java_st"%>
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
<script type="text/javascript"
	src="<%=basePath%>/js/st_update_alert.js"></script>
<script type="text/javascript">
	function hide() {
		//用body标签下的onload属性
		if (myselect.value == 1 || myselect.value == 2) {
			document.all["java_st_opt1"].style.display = "block";
			document.all["java_st_opt2"].style.display = "block";
			document.all["java_st_opt3"].style.display = "block";
			document.all["java_st_opt4"].style.display = "block";
		} else if (myselect.value == 3) {
			document.all["java_st_opt1"].style.display = "none";
			document.all["java_st_opt2"].style.display = "none";
			document.all["java_st_opt3"].style.display = "none";
			document.all["java_st_opt4"].style.display = "none";
		}
	}
</script>
<body onload="hide()">
	<!-- 标题栏 -->
	<jsp:include page="t_header.jsp" />
	<!-- 左侧任务栏 -->
	<jsp:include page="t_navigator.jsp" />
	<!-- 内容板块 -->
	<div id="section">
		<div>
			<jsp:useBean id="java_dxt" class="entity.Java_dxt" scope="page" />
			<jsp:useBean id="java_dxts" class="entity.Java_dxts" scope="page" />
			<jsp:useBean id="java_pdt" class="entity.Java_pdt" scope="page" />
			<jsp:useBean id="java_dxtDAO" class="dao.Java_dxtDAO" scope="page" />
			<jsp:useBean id="java_dxtsDAO" class="dao.Java_dxtsDAO" scope="page" />
			<jsp:useBean id="java_pdtDAO" class="dao.Java_pdtDAO" scope="page" />
			<%
				Java_st java_st = new Java_st();
				String select = "单选题";
				String flag = request.getParameter("id");
				if (flag.equals("1")) {
					java_dxt = java_dxtDAO.getJava_dxtById(Integer.parseInt(request.getParameter("java_dxt_id")));
					java_st.setJava_st_id(java_dxt.getJava_dxt_id());
					java_st.setJava_st_question(java_dxt.getJava_dxt_question());
					java_st.setJava_st_opt1(java_dxt.getJava_dxt_opt1());
					java_st.setJava_st_opt2(java_dxt.getJava_dxt_opt2());
					java_st.setJava_st_opt3(java_dxt.getJava_dxt_opt3());
					java_st.setJava_st_opt4(java_dxt.getJava_dxt_opt4());
					java_st.setJava_st_result(java_dxt.getJava_dxt_result());
				} else if (flag.equals("2")) {
					java_dxts = java_dxtsDAO.getJava_dxtsById(Integer.parseInt(request.getParameter("java_dxts_id")));
					java_st.setJava_st_id(java_dxts.getJava_dxts_id());
					java_st.setJava_st_question(java_dxts.getJava_dxts_question());
					java_st.setJava_st_opt1(java_dxts.getJava_dxts_opt1());
					java_st.setJava_st_opt2(java_dxts.getJava_dxts_opt2());
					java_st.setJava_st_opt3(java_dxts.getJava_dxts_opt3());
					java_st.setJava_st_opt4(java_dxts.getJava_dxts_opt4());
					java_st.setJava_st_result(java_dxts.getJava_dxts_result());
					select = "多选题";
				} else if (flag.equals("3")) {
					java_pdt = (Java_pdt) java_pdtDAO.getJava_stById(Integer.parseInt(request.getParameter("java_pdt_id")));
					java_st.setJava_st_id(java_pdt.getJava_pdt_id());
					java_st.setJava_st_question(java_pdt.getJava_pdt_question());
					//把int类型转换成String
					java_st.setJava_st_result(Integer.toString(java_pdt.getJava_pdt_result()));
					select = "判断题";
				}
			%>
			<form style="width: 343px;" method="post"
				action="<%=basePath%>/teacher/do_st_update.jsp?java_st_id=<%=java_st.getJava_st_id()%>"
				onsubmit="return isValid(this);" >

				<div align="center">
					<font><em>修改试题</em></font>
				</div>
				<div></div>
				<table>
					<tr>
						<td style="width: 150px;" align="center">选择类型</td>
						<td><select style="width: 323px;" id="myselect"
							name="myselect">
								<option value="<%=flag%>"><%=select%></option>

						</select></td>
					</tr>
					<tr>
						<td style="width: 87px;" align="center">问题描述</td>
						<td><textarea style="width: 323px;" name="java_st_question"><%=java_st.getJava_st_question()%></textarea></td>
					</tr>
					<tr>
						<td style="width: 87px;" align="center"></td>
						<td><textarea style="width: 323px;" name="java_st_opt1"><%=java_st.getJava_st_opt1()%></textarea></td>
					</tr>
					<tr>
						<td style="width: 87px;" align="center"></td>
						<td><textarea style="width: 323px;" name="java_st_opt2"><%=java_st.getJava_st_opt2()%></textarea></td>
					</tr>
					<tr>
						<td style="width: 87px;" align="center"></td>
						<td><textarea style="width: 323px;" name="java_st_opt3"><%=java_st.getJava_st_opt3()%></textarea></td>
					</tr>

					<tr>
						<td style="width: 87px;" align="center"></td>
						<td><textarea style="width: 323px;" name="java_st_opt4"><%=java_st.getJava_st_opt4()%></textarea></td>
					</tr>
					<tr>
						<td style="width: 87px;" align="center">答案</td>
						<td><textarea style="width: 323px;" name="java_st_result"><%=java_st.getJava_st_result()%></textarea></td>
					</tr>
					<tr>
						<td><div style="width: 87px;"></div></td>
						<td><input type="submit" align="left" value="提交"> <input
							type="reset" value="重置"></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	</div>
	<!-- 底部连接 -->
	<div id="footer"><td align="center">Copyright &copy; by lee</td></div>
</body>
</html>