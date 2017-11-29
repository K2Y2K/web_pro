<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

	
	
	<script language="JavaScript" type="text/javascript">
	 function setCookie() {
		//以下三句是获取客户输入的信息：cookie变量的值、名和保存时间
		n=Time.value; 
		//cookie变量的保存时间
		var name=Name.value; 
		//cookie变量的名
		var psd=Value.value; 
		//cookie变量的值
		if(name!="") 
		{ 
			var date=new Date(); //获取当前时间 
		var expireDays=n*24*3600*1000; //将date设置为n天以后的时间
		date.setTime(date.getTime()+expireDays); //将userId和userName两个cookie设置为10天后过期 
		document.cookie=name+"=;" +escape(psd)+"; expire="+date.toGMTString (); 
		alert("设置成功!时间为："+expireDays+"秒（"+n+"天）"); //输出信息
		} else { alert("设置失败，cookie变量名不能为空"); //提示用户设置失败 
		} 
		} 
		
	</script>
	<!--JavaScript标签的结束  -->
	<body>
	<!--文档的标题-->
	cookie名：
	<input type="text" name="Name">
	<!-- cookie名的文本框-->
	<br>
	<!--  -->换行-->
	cookie值：
	<input type="text" name="Value">
	<!--cookie值的文本框- -->
	<br>
	<!--换行-->
	cookie时间：
	<select name="Time" size="1">
		<!-- 选择列表组合框-->
		<option value="1">一天</option>
		<!--列表项1  -->
		<option value="2">二天</option>
		<!-- 列表项2 -->
		<option value="3">三天</option>
		<!-- 列表项3 -->
		<option value="4">四天</option>
		
		<option value="5">五天</option>
	
		<option value="6">六天</option>
	
		<option value="7">七天</option>
		
		<option value="8">八天</option>
		
	</select>
	<input type="submit" name="Submit" value="设置cookie"
		onClick="setCookie()">
</body>
</html>