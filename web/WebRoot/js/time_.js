

function _SetTime(time,h_name,m_name) {
	var hour = time.split(":")[0];
	var min = time.split(":")[1];
    var str = "";
	str += "\u65f6<select name='"+h_name+"' id='"+h_name+"'>";
	for (h = 0; h <= 23; h++) {
		var h_str = h + "";
		if(h_str.length == 1)h_str = "0"+h_str;
		if(h_str == hour){str += "<option selected=\"selected\" value=\"" + h_str + "\">" + h_str + "</option>";}
	    else {str += "<option value=\"" + h_str + "\">" + h_str + "</option>";}
	}
	str += "</select>: \u5206<select name='"+m_name+"' id='"+m_name+"'>";
	
	for (m = 0; m <= 59; m++) {
		var m_str = m + "";
		if(m_str.length == 1)m_str = "0"+m_str;
		if(m_str == min){str += "<option selected=\"selected\" value=\"" + m_str + "\">" + m_str + "</option>";}
		else {str += "<option value=\"" +m_str + "\">" + m_str + "</option>";}
	}
	str += "</select>";
	document.writeln(str);
}
function _getTimeValue(h_name,m_name) {
   var hour = document.getElementById(h_name).value;
   var mint = document.getElementById(m_name).value;
   return hour+":"+mint+":"+"00";
}
