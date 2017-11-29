/**
 * 
 */
function check(){ 
    var quests=document.getElementsByName("quest");      //获得所有隐藏域，每个问题对应一个
    var questnum=quests.length;
    for(var i=0;i<questnum;i++){                         //遍历每个问题
var questid=quests[i].getAttribute("value");   //隐藏域的value属性，也就是每个问题单选、复选按钮的name属性
var options=document.getElementsByName(questid);    //获得所有选项
var optionnum=options.length;
var flag=0;
for(var j=0;j<optionnum;j++){                   //遍历每个选项
    if(options[j].checked){
flag=1;
break;
    }
}
if(flag==0){
    alert("您有问题没回答！");
    return false;
}
    }
    return true;
}