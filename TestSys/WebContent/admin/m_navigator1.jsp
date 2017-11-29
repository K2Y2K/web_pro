<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>无标题页</title>
<meta HTTP-EQUIV="Content-Type" content="text/html; charset=gb2312" />
</head>
<body onload='ChangeTime();scall();'>
<form id="form1">
<!--模拟页面宽度高度-->
<div align="center">
<center>
<table width="770" height="3000" border="0" cellpadding="0" cellspacing="0" bgcolor="#F4F4F4">
<tr>
<td width="100%" valign="top"></td>
</tr>
</table>
</center>
</div>
<!--弹出时间提示-->
<div id="Javascript.RightDiv" style="position: absolute;z-index:1000;width:200px;height:30px;top:-1000px;word-break:break-all;display:none;">
<div id="timeshow" style="width:200px;height:20px;line-height:20px;text-align:center;font-size:12px;color:#000;background-color:#CCC;border:1px solid #333;"></div>
</div>
<script LANGUAGE="JavaScript">
//弹出div
var showad = true;
var Toppx = 10;    //上端位置
var AdDivW = 200;   //宽度
var AdDivH = 25;   //高度
var PageWidth = 750; //页面多少宽度象素下正好不出现左右滚动条
var MinScreenW = 1000; //最小屏幕宽度象素
function scall(){
if(!showad){return;}
var Borderpx = ((window.screen.width-PageWidth)/2-AdDivW)/2;
document.getElementById("Javascript.RightDiv").style.display="";
document.getElementById("Javascript.RightDiv").style.top=document.body.scrollTop+Toppx;
document.getElementById("Javascript.RightDiv").style.left=document.body.scrollLeft+document.body.clientWidth-document.getElementById("Javascript.RightDiv").offsetWidth-Borderpx;
}
window.onscroll=scall;
window.onresize=scall;
 
//在线考试时间提示
var h=1; //设置考试时间(小时单位)  
var m=0.1; //设置考试时间(分钟单位)  
var timeShowId="timeshow"; //设置时间显示层ID  
var TimeNum=h*60*60+m*60;  
var timeStr;  
function ChangeTime()
{
  TimeNum--;
   
    if(TimeNum > 0)
    {
       timeStr=setTimeout("ChangeTime()",1000);
       if(TimeNum<300)
       {
         alert('距离系统自动提交时间还剩5分钟，请尽快做好提交准备');
       }
        if(TimeNum<30)
       {
         alert('距离系统自动提交时间还剩30秒，请马上交卷');
       }
    }
    else
    {  
       //系统提交  完善
    }  
    document.getElementById(timeShowId).innerHTML="系统提示：你的时间还剩<span style=\"color:#FF0000;\">"+Math.floor(TimeNum/60)+"分"+TimeNum%60+"秒</span>";
} 
</script>
</form>  
</body >
</html>