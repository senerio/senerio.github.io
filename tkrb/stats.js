function max(value,total) {
	if (value<total) {
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
		var survival = response.sword[toudan].hp_max;
		var impact = response.sword[toudan].atk;
		var leadership = response.sword[toudan].def;
		var mobility = response.sword[toudan].mobile;
		var impulse = response.sword[toudan].back;
		var scouting = response.sword[toudan].scout;
		var camouflage = response.sword[toudan].hide;
		var loyalty = response.sword[toudan].loyalties;
		var birth = response.sword[toudan].created_at;
		// check if sword id is defined otherwise show blanks
		// prevents breaking if list contains a new sword
		if (define[no] !== undefined) {
			var name = define[no].name;
			var type = define[no].type;
			var survival_max = define[no].survival;
			var impact_max = define[no].impact;
			var leadership_max = define[no].leadership;
			var mobility_max = define[no].mobility;
			var impulse_max = define[no].impulse;
			var loyalty_max = define[no].loyalty;
			var scouting_max = define[no].scouting;
			var camouflage_max = define[no].camouflage;
		} else {
			var name = "";
			var type = "";
			var survival_max = "";
			var impact_max = "";
			var leadership_max = "";
			var mobility_max = "";
			var impulse_max = "";
			var loyalty_max = "";
			var scouting_max = "";
			var camouflage_max = "";
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

