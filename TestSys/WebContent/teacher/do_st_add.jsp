<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.Java_stDAO"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<jsp:useBean id="java_pdt" class="entity.Java_pdt" scope="page" />
<jsp:useBean id="java_pdtDAO" class="dao.Java_pdtDAO" scope="page" />
<jsp:useBean id="java_dxt" class="entity.Java_dxt" scope="page" />
<jsp:useBean id="java_dxtDAO" class="dao.Java_dxtDAO" scope="page" />
<jsp:useBean id="java_dxts" class="entity.Java_dxts" scope="page" />
<jsp:useBean id="java_dxtsDAO" class="dao.Java_dxtsDAO" scope="page" />
<jsp:setProperty property="*" name="java_dxt" />
<%
	String flag = request.getParameter("myselect");
	System.out.println("获取st_add.jsp界面要插入的题型代号" + flag);
	if (flag.equals("1")) {
		System.out.println(flag+"是st_add.jsp界面插入单选题的题型代号");
		//如果插入成功，怎登录st_show.jsp,否则停留在当前页面，提示插入失败；
		if (java_dxtDAO.addJava_dxt(java_dxt)) {
			System.out.println("do_add.jsp界面插入单选判读题插入成功跳转到st_show.jsp即试题显示界面");
			request.getRequestDispatcher("st_show.jsp").forward(request, response);
		} else
			request.getRequestDispatcher("st_add.jsp").forward(request, response);
	} else if (flag.equals("2")) {
		System.out.println(flag+"是st_add.jsp界面插入多选题题型代号");
		java_dxts.setJava_dxts_question(request.getParameter("java_dxt_question"));
		java_dxts.setJava_dxts_opt1(request.getParameter("java_dxt_opt1"));
		java_dxts.setJava_dxts_opt2(request.getParameter("java_dxt_opt2"));
		java_dxts.setJava_dxts_opt3(request.getParameter("java_dxt_opt3"));
		java_dxts.setJava_dxts_opt4(request.getParameter("java_dxt_opt4"));
		java_dxts.setJava_dxts_result(request.getParameter("java_dxt_result"));
		if (java_dxtsDAO.addJava_dxts(java_dxts)) {
			System.out.println("do_add.jsp界面插入多选题插入成功跳转到st_show.jsp即试题显示界面");
			request.getRequestDispatcher("st_show.jsp").forward(request, response);
		} else
			request.getRequestDispatcher("st_add.jsp").forward(request, response);
	} else if (flag.equals("3")) {
		System.out.println(flag+"是do_add.jsp界面插入判读题题型代号");
		java_pdt.setJava_pdt_question(request.getParameter("java_dxt_question"));
		java_pdt.setJava_pdt_result(Integer.parseInt(request.getParameter("java_dxt_result")));
		Java_stDAO java_stDAO = java_pdtDAO;
		if (java_stDAO.addJava_st((Object) java_pdt)) {
			System.out.println("do_add.jsp界面插入判读题插入成功跳转到st_show.jsp即试题显示界面");
			request.getRequestDispatcher("st_show.jsp").forward(request, response);
		} else
			request.getRequestDispatcher("st_add.jsp").forward(request, response);
	} else
		request.getRequestDispatcher("st_add.jsp").forward(request, response);
%>