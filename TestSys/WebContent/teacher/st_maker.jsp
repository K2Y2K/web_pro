<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.Java_dxtDAO"%>
<%@ page import="entity.Java_dxt"%>
<%@ page import="entity.Java_dxts"%>
<%@ page import="entity.Java_pdt"%>
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
	function subcfm() {
		if (!confirm("确定要提交吗？")) {
			window.event.returnValue = false;
		}
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
			<jsp:useBean id="java_dxtDAO" class="dao.Java_dxtDAO" scope="session" />

			<jsp:useBean id="java_dxtsDAO" class="dao.Java_dxtsDAO" scope="session" />

			<jsp:useBean id="java_pdtDAO" class="dao.Java_pdtDAO" scope="session" />
			<%
				String list1= "", list2 = "", list3 = "";
				String[][] xuanzess = {};
				String[] xuanzes = {};String[] xuanzes1 = {};String[] xuanzes2 = {};
				String flag = request.getParameter("id");
				System.out.println("flag="+flag);
				//从客户端获得Cookies集合
				Cookie[] cookies = request.getCookies();
				//遍历这个Cookies集合
				System.out.println("cookies.length="+cookies.length);
				if (cookies != null && cookies.length > 0) {
					for (Cookie c : cookies) {
						if (c.getName().equals("Listdxt")) {
							list1 = c.getValue();
							System.out.println("list1="+list1);
						}
						if (c.getName().equals("Listdxts")) {
							list2 = c.getValue();
							System.out.println("list2="+list2);
						}
						if (c.getName().equals("Listpdt")) {
							list3 = c.getValue();
							System.out.println("list3="+list3);
						}
					}
				}
				if(flag.equals("1")){
					
					xuanzes = request.getParameterValues("xuanze1");
				
					System.out.println("xuanzes="+xuanzes);
					
					if (xuanzes !=null && xuanzes.length > 0 ) {
						System.out.println("xuanzes长度1="+xuanzes.length);
						for(int i=0;i<xuanzes.length;i++){
							if(!list1.contains(xuanzes[i])){//去掉重复的数据
								//list1.add(xuanzes[i]);					
							list1+=xuanzes[i]+"#";}
							System.out.println("list11="+list1);
						}
						//for (String f : xuanzes) {
							//list1 += f + "#";
						//}
						System.out.println("list111="+list1);
					}
					Cookie cookie1 = new Cookie("Listdxt", list1);
					cookie1.setMaxAge(24*60*60*15); 
					response.addCookie(cookie1);
				}else if(flag.equals("2")){
					xuanzes1 = request.getParameterValues("xuanze2");
					if (xuanzes1 !=null &&xuanzes1.length > 0) {
						for (String f : xuanzes1) {
							if(!list2.contains(f)){
							list2 += f + "#";
							System.out.println("list22="+list2);
							}
						}System.out.println("list222="+list2);
					}
					Cookie cookie2 = new Cookie("Listdxts", list2);
					cookie2.setMaxAge(24*60*60*15); 
					response.addCookie(cookie2);
				}else if(flag.equals("3")){
					xuanzes2 = request.getParameterValues("xuanze3");
					if (xuanzes2 !=null &&xuanzes2.length > 0) {
						for (String f : xuanzes2) {
							if(!list3.contains(f)){
							list3 += f + "#";
							System.out.println("list33="+list3);}
						}System.out.println("list333="+list3);
					}
					Cookie cookie3 = new Cookie("Listpdt", list3);
					cookie3.setMaxAge(24*60*60*15); 
					response.addCookie(cookie3);
				}else {System.out.println("cookies.length1="+cookies.length);
				Cookie[] cookiess = request.getCookies();
				System.out.println("cookiess.length1="+cookiess.length);
					if (cookiess != null && cookiess.length > 0) {
					for (Cookie c : cookiess) {
						if (c.getName().equals("Listdxt")) {
							list1 = c.getValue();
							System.out.println("list1a="+list1);
						}
						if (c.getName().equals("Listdxts")) {
							list2 = c.getValue();
							System.out.println("list2a="+list2);
						}
						if (c.getName().equals("Listpdt")) {
							list3 = c.getValue();
							System.out.println("list3a="+list3);
						}
					}
				}else 
					System.out.println("list为空"+list1);
					list1=""; list2="";list3="";
				}
			%>
<jsp:useBean  id="loginUser" class="entity.Teachers" scope="session"/>
<jsp:useBean  id="teach" class="entity.Teachers" scope="session"/>
	<jsp:useBean  id="teachdao" class="dao.TeachersDAO" scope="session"/>
	<%
	teach=teachdao.getIdByTeachers(loginUser);
	%>
			<form id="1" action="<%=basePath%>/Servlet/java_st_servlet" method="post">
			<div class="sec_title" align="center">
				<em>试题展示</em>&nbsp;&nbsp;<label> <input type="submit" align="right" value="提交" ></label>
				<br>试卷名称:<input type="text" name="kj_name">&nbsp;&nbsp;试卷类型:<input type="text" name="kj_type">
				<br>&nbsp;&nbsp;科目号:<input type="text" name="c_id">&nbsp;&nbsp;&nbsp;出题老师:<input type="text" name="tid" value="<%=teach.getTid()%>">
			</div>
			<div>
					<div class="sec_ti">
						>>单选题&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						设置分值：<input type="text"  name="kj_dxt_g">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<a href='<%=basePath%>/teacher/st_show.jsp'>添加</a>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

					</div>
					</br>
					<div>
						<table width="750" height="60" cellpadding="0" cellspacing="0"
							border="0">
							<tr>
								<td>
									<!-- 商品循环开始 --> <%
									System.out.println("list1单选题"+list1);
 	ArrayList<Java_dxt> dxtlist = java_dxtDAO.getViewList(list1);
 	if (dxtlist != null && dxtlist.size() > 0) {
 		for (Java_dxt java_dxt : dxtlist) {
 %>
									<div>
										<dl>
											<dt>
												<input type="checkbox"
													value="<%=java_dxt.getJava_dxt_id()%>" name="kj_dxt_id" checked="checked">
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
													href='<%=basePath%>/teacher/do_stCookie_del.jsp?java_st_id=<%=java_dxt.getJava_dxt_id()%>&id=1'
													onclick="delcfm()">删除</a>&nbsp;&nbsp;&nbsp;&nbsp;

											</dd>
										</dl>
									</div> <!-- 商品循环结束 --> <%
 	}
 	}
 %>
								</td>
							</tr>
						</table>
					</div>

				</div>

				<div>
					<div class="sec_ti">
						>>多选题&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						设置分值：<input type="text"  name="kj_dxts_g">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<a href='<%=basePath%>/teacher/st_show.jsp'>添加</a>					
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

					</div>
					<br>
					<div>
						<table width="750" height="60" cellpadding="0" cellspacing="0"
							border="0">
							<tr>
								<td>
									<!-- 商品循环开始 --> <%
									System.out.println("list2多选题"+list2);
 	ArrayList<Java_dxts> dxtslist = java_dxtsDAO.getViewList(list2);
 	if (dxtslist != null && dxtslist.size() > 0) {
 		for (Java_dxts java_dxts : dxtslist) {
 %>
									<div>
										<dl>
											<dt>
												<input type="checkbox"
													value="<%=java_dxts.getJava_dxts_id()%>" name="kj_dxts_id" checked="checked">
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
													href='<%=basePath%>/teacher/do_stCookie_del.jsp?java_st_id=<%=java_dxts.getJava_dxts_id()%>&id=2'
													onclick="delcfm()">删除</a>&nbsp;&nbsp;&nbsp;&nbsp;

											</dd>
										</dl>
									</div> <!-- 商品循环结束 --> <%
 	}
 	}
 %>
								</td>
							</tr>
						</table>
					</div>

				</div>

				<div>

					<div class="sec_ti">
						>>判断题&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						设置分值：<input type="text"  name="kj_pdt_g">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<a href='<%=basePath%>/teacher/st_show.jsp'>添加</a>						
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</div>
					<br>
					<div>
						<table width="750" height="60" cellpadding="0" cellspacing="0"
							border="0">
							<tr>
								<td>
									<!-- 商品循环开始 --> <%
									System.out.println("list3判断题"+list3);
 	ArrayList<Java_pdt> pdtlist = java_pdtDAO.getViewList(list3);
 	if (pdtlist != null && pdtlist.size() > 0) {
 		for (Java_pdt java_pdt : pdtlist) {
 %>
									<div>
										<dl>
											<dt>
												<input type="checkbox"
													value="<%=java_pdt.getJava_pdt_id()%>" name="kj_pdt_id" checked="checked">
												问题:<%=java_pdt.getJava_pdt_question()%>
											</dt>
											
											<dd>
												答案:<%=java_pdt.getJava_pdt_result()%></dd>
											<dd>
												<a
													href='<%=basePath%>/teacher/do_stCookie_del.jsp?java_st_id=<%=java_pdt.getJava_pdt_id()%>&id=3'
													onclick="delcfm()">删除</a>&nbsp;&nbsp;&nbsp;&nbsp;

											</dd>
										</dl>
									</div> <!-- 商品循环结束 --> <%
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
	<!-- 底部连接 -->
	<div id="footer"><td align="center">Copyright &copy; by lee</td></div>>
</body>
</html>