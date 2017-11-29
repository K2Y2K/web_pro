<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
String flag = request.getParameter("id");
String st_id = request.getParameter("java_st_id");
//从客户端获得Cookies集合
Cookie[] cookies = request.getCookies();
//遍历这个Cookies集合
System.out.println("cookies.length="+cookies.length);
if (cookies != null && cookies.length > 0) {
	for (Cookie c : cookies) {
		if (flag.equals("1")&&c.getName().equals("Listdxt")) {
			System.out.println("del_dxt_sql="+c.getValue());
			if(c.getValue().contains(st_id)){			
				c.setValue(c.getValue().replace(st_id+"#", ""));
				System.out.println("cookies.list1="+c.getValue());				
			}				
		}
		if (flag.equals("2")&&c.getName().equals("Listdxts")) {
			System.out.println("del_dxts_sql="+c.getValue());
			if(c.getValue().contains(st_id)){
				c.setValue(c.getValue().replace(st_id+"#", ""));
				System.out.println("cookies.list2="+c.getValue());				
			}			
		}
		if (flag.equals("3")&&c.getName().equals("Listpdt")) {
			System.out.println("del_dxts_sql="+c.getValue());
			if(c.getValue().contains(st_id)){
				c.setValue(c.getValue().replace(st_id+"#", ""));
				System.out.println("cookies.list3="+c.getValue());					
			}
		}
	}
}
if(flag.equals("1")){
	if (java_dxtDAO.deleteJava_dxt(Integer.parseInt(st_id))) {
		request.getRequestDispatcher("st_show.jsp").forward(request, response);
	} else
		request.getRequestDispatcher("delete_failure.jsp").forward(request, response);
}else if(flag.equals("2")){
	if (java_dxtsDAO.deleteJava_dxts(Integer.parseInt(st_id))) {
		request.getRequestDispatcher("st_show.jsp").forward(request, response);
	} else
		request.getRequestDispatcher("delete_failure.jsp").forward(request, response);
}else if(flag.equals("3")){
	if (java_pdtDAO.deleteJava_st(Integer.parseInt(st_id))) {
		request.getRequestDispatcher("st_show.jsp").forward(request, response);
	}
}	



%>

