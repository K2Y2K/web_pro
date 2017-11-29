<%@ page language="java" contentType="text/html; charset=UTF-8"
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
<body>
<% String list1="",list_dxts="",list2="";
String[]  get_quest_dxt={},get_quest_dxts={},get_quest_x_dxts={},get_quest_pdt={};
String[] java_dxt_xx={};
get_quest_dxt =request.getParameterValues("quest_dxt");
System.out.println("输出从on_ks获取的考卷单选题题干" + get_quest_dxt );
for(int i=0;i<get_quest_dxt.length;i++){
System.out.println("输出从on_ks获取的考卷单选题题干具体选项内容" + get_quest_dxt[i] );
System.out.println("输出从on_ks获取的考卷单选题题干具体选项内容" + request.getParameter(get_quest_dxt[i]) );
list1+=request.getParameter(get_quest_dxt[i])+"#";
//java_dxt_xx[i]=request.getParameter(get_quest_dxt[i]).trim();这种方法不对
System.out.println("输出从on_ks获取的考试该单选题详细答案" +list1 );	
}
get_quest_dxts =request.getParameterValues("quest_dxts");
System.out.println("输出从on_ks获取的考卷多选题题干" + get_quest_dxts );
for(int i=0;i<get_quest_dxts.length;i++){
System.out.println("输出从on_ks获取的考卷多选题题干具体选项内容" + get_quest_dxts[i] );
System.out.println("输出从on_ks获取的考卷多选题题干具体选项内容" + request.getParameterValues(get_quest_dxts[i]));
get_quest_x_dxts=request.getParameterValues(get_quest_dxts[i]);
System.out.println("输出从on_ks获取的考卷多选题题干具体选项内容" + get_quest_x_dxts );
for(int j=0;j<get_quest_x_dxts.length;j++){
	list_dxts+=get_quest_x_dxts[j]+":";
	System.out.println("输出从on_ks获取的考试该多选题详细答案" +list_dxts);	
}
list2+=list_dxts+"#";
list_dxts="";

System.out.println("输出从on_ks获取的考试所有多选题详细答案" +list2);	
}
%>


</body>
</html>