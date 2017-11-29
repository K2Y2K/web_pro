<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<%String flag = request.getParameter("id");
String st_id = request.getParameter("java_st_id");
//if(flag.equals("1")){
	String list1= "", list2 = "", list3 = "";
	//从客户端获得Cookies集合
	Cookie[] cookies = request.getCookies();
	//遍历这个Cookies集合
	System.out.println("cookies.length="+cookies.length);
	if (cookies != null && cookies.length > 0) {
		for (Cookie c : cookies) {
			if (flag.equals("1")&&c.getName().equals("Listdxt")) {
				System.out.println("del_dxt="+c.getValue());
				if(c.getValue().contains(st_id)){
					
					//String del=c.getValue();
					//System.out.println("del="+del);
					//del.replace(del, "");
					//System.out.println("del1="+del);
					//""代表为空;" "代表为null；
					c.setValue(c.getValue().replace(st_id+"#", ""));
					System.out.println("cookies.list1="+c.getValue());
					request.getRequestDispatcher("st_maker.jsp?id=1").forward(request, response);
				}
				//list1 = c.getValue();
				System.out.println("list1="+list1);
			}
			if (flag.equals("2")&&c.getName().equals("Listdxts")) {
				System.out.println("del_dxts="+c.getValue());
				if(c.getValue().contains(st_id)){
					c.setValue(c.getValue().replace(st_id+"#", ""));
					System.out.println("cookies.list2="+c.getValue());
					request.getRequestDispatcher("st_maker.jsp?id=2").forward(request, response);
				}
				//list2 = c.getValue();
				System.out.println("list2="+list2);
			}
			if (flag.equals("3")&&c.getName().equals("Listpdt")) {
				System.out.println("del_dxts="+c.getValue());
				if(c.getValue().contains(st_id)){
					c.setValue(c.getValue().replace(st_id+"#", ""));
					System.out.println("cookies.list3="+c.getValue());
					request.getRequestDispatcher("st_maker.jsp?id=3").forward(request, response);
				}
				//list3 = c.getValue();
				System.out.println("list3="+list3);
			}
		}
	}
//}
%>

