/**
 * 
 */
function check() {

	var quests_dxt = document.getElementsByName("quest_dxt"); //获得所有隐藏域，每个问题对应一个
	var quests_dxtnum = quests_dxt.length;
	for (var i = 0; i < quests_dxtnum; i++) { //遍历每个问题
		var quests_dxt_id = quests_dxt[i].getAttribute("value"); //隐藏域的value属性，也就是每个问题单选、复选按钮的name属性
		var dxt_options = document.getElementsByName(quests_dxt_id); //获得所有选项
		var dxt_optionnum = dxt_options.length;
		var flag = 0;
		for (var j = 0; j < dxt_optionnum; j++) { //遍历每个选项
			if (dxt_options[j].checked) {
				flag = 1;
				break;
			}
		}
		if (flag == 0) {
			alert("您有单选题没回答！");
			return false;
		}
	}

	var quests_dxts = document.getElementsByName("quest_dxts"); //获得所有隐藏域，每个问题对应一个
	var quests_dxtsnum = quests_dxts.length;
	for (var i = 0; i < quests_dxtsnum; i++) { //遍历每个问题
		var quests_dxts_id = quests_dxts[i].getAttribute("value"); //隐藏域的value属性，也就是每个问题单选、复选按钮的name属性
		var dxts_options = document.getElementsByName(quests_dxts_id); //获得所有选项
		var dxts_optionnum = dxts_options.length;
		var flag1 = 0;
		for (var j = 0; j < dxts_optionnum; j++) { //遍历每个选项
			if (dxts_options[j].checked) {
				flag1 = 1;
				break;
			}
		}
		if (flag1 == 0) {
			alert("您有多选题没回答！");
			return false;
		}
	}
	var quests_pdt = document.getElementsByName("quest_pdt"); //获得所有隐藏域，每个问题对应一个
	var quests_pdtnum = quests_pdt.length;
	for (var i = 0; i < quests_pdtnum; i++) { //遍历每个问题
		var quests_pdt_id = quests_pdt[i].getAttribute("value"); //隐藏域的value属性，也就是每个问题单选、复选按钮的name属性
		var pdt_options = document.getElementsByName(quests_pdt_id); //获得所有选项
		var pdt_optionnum = pdt_options.length;
		var flag2 = 0;
		for (var j = 0; j < pdt_optionnum; j++) { //遍历每个选项
			if (pdt_options[j].checked) {
				flag2 = 1;
				break;
			}
		}
		if (flag2 == 0) {
			alert("您有判断题没回答！");
			return false;
		}
	}

	return true;
}
//交卷确认
function subcfm() {
	if (!confirm("确定要提交吗？")) {
		window.event.returnValue = false;
	}
	}