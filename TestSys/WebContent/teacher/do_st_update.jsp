<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="entity.Java_dxt" %>
<%@ page import="entity.Java_dxts" %>
<%@ page import="entity.Java_pdt" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<jsp:useBean id="java_dxtDAO" class="dao.Java_dxtDAO" scope="page" />
<jsp:useBean id="java_dxtsDAO" class="dao.Java_dxtsDAO" scope="page" />
<jsp:useBean id="java_pdtDAO" class="dao.Java_pdtDAO" scope="page" />
<%
	String flag = request.getParameter("myselect");
	System.out.println("获取st_update.jsp界面要修改的题型代号" + flag);
	//如果插入成功，怎登录st_show.jsp,否则停留在当前页面，提示插入失败；
	if (flag.equals("1")) {
		System.out.println(flag + "是修改单选题的题型代号");
		Java_dxt java_dxt = new Java_dxt();
		java_dxt.setJava_dxt_id(Integer.parseInt(request.getParameter("java_st_id")));
		java_dxt.setJava_dxt_question(request.getParameter("java_st_question"));
		java_dxt.setJava_dxt_opt1(request.getParameter("java_st_opt1"));
		java_dxt.setJava_dxt_opt2(request.getParameter("java_st_opt2"));
		java_dxt.setJava_dxt_opt3(request.getParameter("java_st_opt3"));
		java_dxt.setJava_dxt_opt4(request.getParameter("java_st_opt4"));
		java_dxt.setJava_dxt_result(request.getParameter("java_st_result"));
		if (java_dxtDAO.updateJava_dxt(java_dxt)) {
			System.out.println("st_update.jsp界面修改单选题成功，成功跳转到st_show.jsp即试题显示界面");
			request.getRequestDispatcher("st_show.jsp").forward(request, response);
		} else
			request.getRequestDispatcher("st_update.jsp").forward(request, response);
	} else if (flag.equals("2")) {
		System.out.println(flag + "是修改多选题题型的题型代号");
		Java_dxts java_dxts = new Java_dxts();
		java_dxts.setJava_dxts_id(Integer.parseInt(request.getParameter("java_st_id")));
		java_dxts.setJava_dxts_question(request.getParameter("java_st_question"));
		java_dxts.setJava_dxts_opt1(request.getParameter("java_st_opt1"));
		java_dxts.setJava_dxts_opt2(request.getParameter("java_st_opt2"));
		java_dxts.setJava_dxts_opt3(request.getParameter("java_st_opt3"));
		java_dxts.setJava_dxts_opt4(request.getParameter("java_st_opt4"));
		java_dxts.setJava_dxts_result(request.getParameter("java_st_result"));
		if (java_dxtsDAO.updateJava_dxts(java_dxts)) {
			System.out.println("st_update.jsp界面修改多选题成功，成功跳转到st_show.jsp即试题显示界面");
			request.getRequestDispatcher("st_show.jsp").forward(request, response);
		} else
			request.getRequestDispatcher("st_update.jsp").forward(request, response);
	} else if (flag.equals("3")) {
		System.out.println(flag + "是修改判断题的题型代号");
		Java_pdt java_pdt = new Java_pdt();
		java_pdt.setJava_pdt_id(Integer.parseInt(request.getParameter("java_st_id")));
		java_pdt.setJava_pdt_question(request.getParameter("java_st_question"));

		java_pdt.setJava_pdt_result(Integer.parseInt(request.getParameter("java_st_result")));

		if (java_pdtDAO.updateJava_st(java_pdt)) {
			System.out.println("st_update.jsp界面修改判断题成功，成功跳转到st_show.jsp即试题显示界面");
			request.getRequestDispatcher("st_show.jsp").forward(request, response);
		} else
			request.getRequestDispatcher("st_update.jsp").forward(request, response);
	}
%>