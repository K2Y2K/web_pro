/**
 * 
 */

function enableRightNavExpand() {
	if (!document.getElementById)
		return false;
	if (!document.getElementById("rightNav"))
		return false;
	var nav = document.getElementById("rightNav");
	var navItem = nav.getElementsByTagName("li");
	for (var i = 0; i < navItem.length; i++) {
		navItem[i].onclick = function() {
			if (this.className == "selected") {
				this.className = "";
			} else if (this.className == "") {
				this.className = "selected";
			}
		}
	}
}
