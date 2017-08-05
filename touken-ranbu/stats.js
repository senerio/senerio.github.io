function max(value,total) {
	if (parseInt(value) < parseInt(total)) {
		return "<span class=\"stat\">"+value+"</span>/"+total;
	} else {
		return value+"/"+total;
	}
}
function maxlv(value) {
	if (value==99) {
		return "<span class=\"lv\">"+value+"</span>";
	} else {
		return value;
	}
}
function display() {
	// clean the table
	var table = document.getElementById("list").getElementsByTagName("tbody")[0];
	for (var i = table.rows.length - 1; i >= 0; i--) {
		table.deleteRow(i);
	}
	// process the input
	var response = JSON.parse(document.getElementById('input').value);
	for (var toudan in response.sword) {
		// get player sword information
		var no = response.sword[toudan].sword_id;
		var lock = response.sword[toudan].protect;
		var fatigue = response.sword[toudan].fatigue;
		var level = response.sword[toudan].level;
		var toku = response.sword[toudan].evol_num;
		var survival = parseInt(response.sword[toudan].hp_max);
		var impact = parseInt(response.sword[toudan].atk);
		var leadership = parseInt(response.sword[toudan].def);
		var mobility = parseInt(response.sword[toudan].mobile);
		var impulse = parseInt(response.sword[toudan].back);
		var scouting = parseInt(response.sword[toudan].scout);
		var camouflage = parseInt(response.sword[toudan].hide);
		var survival_max = survival+parseInt(response.sword[toudan].hp_up);
		var impact_max = impact+parseInt(response.sword[toudan].atk_up);
		var leadership_max = leadership+parseInt(response.sword[toudan].def_up);
		var mobility_max = mobility+parseInt(response.sword[toudan].mobile_up);
		var impulse_max = impulse+parseInt(response.sword[toudan].back_up);
		var scouting_max = scouting+parseInt(response.sword[toudan].scout_up);
		var loyalty = response.sword[toudan].loyalties;
		var birth = response.sword[toudan].created_at;
		// check if sword id is defined otherwise show blanks
		// prevents breaking if list contains a new sword
		if (define[no] !== undefined) {
			var name = define[no].name;
			var type = define[no].type;
		} else {
			var name = "";
			var type = "";
		}
		// computations
		var days = new Date() - Date.parse(birth.replace(/-/g,"/"));
		days = Math.round(days/1000/60/60/24);
		// display, only if locked
		if (lock=="1") {
			row = table.insertRow(-1);
			row.insertCell(0).innerHTML = no;
			row.insertCell(1).innerHTML = name;
			row.insertCell(2).innerHTML = type;
			row.insertCell(3).innerHTML = toku;
			row.insertCell(4).innerHTML = birth;
			row.insertCell(5).innerHTML = fatigue;
			row.insertCell(6).innerHTML = maxlv(level);
			row.insertCell(7).innerHTML = max(survival,survival_max);
			row.insertCell(8).innerHTML = max(impact,impact_max);
			row.insertCell(9).innerHTML = max(leadership,leadership_max);
			row.insertCell(10).innerHTML = max(mobility,mobility_max);
			row.insertCell(11).innerHTML = max(impulse,impulse_max);
			row.insertCell(12).innerHTML = loyalty;
			row.insertCell(13).innerHTML = max(scouting,scouting_max);
			row.insertCell(14).innerHTML = camouflage;
			row.insertCell(15).innerHTML = days;
		}
	}
}

