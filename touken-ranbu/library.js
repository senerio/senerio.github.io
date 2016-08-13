function display() {
	// clean the table
	var table = document.getElementById("list").getElementsByTagName("tbody")[0];
	for (var i = table.rows.length - 1; i >= 0; i--) {
		table.deleteRow(i);
	}
	// process the input
	var response = JSON.parse(document.getElementById('input').value);
	for (var toudan in response.sword) {// get player sword information
		var no = response.sword[toudan].sword_id;
		var cg = response.sword[toudan].image_flg;
		// check if sword id is defined otherwise show blanks
		// prevents breaking if list contains a new sword
		if (define[no] !== undefined) {
			var name = define[no].name;
		} else {
			var name = "";
		}
		// computations
		var df = 0;
		var bt = 0;
		var dg = 0;
		var sh = 0;
		var ia = 0;
		if ((cg & 1) == 1) df = 1;
		if ((cg & 2) == 2) bt = 1;
		if ((cg & 4) == 4) dg = 1;
		if ((cg & 8) == 8) sh = 1;
		if ((cg & 16) == 16) ia = 1;
		// display
		row = table.insertRow(-1);
		row.insertCell(0).innerHTML = no;
		row.insertCell(1).innerHTML = name;
		row.insertCell(2).innerHTML = df;
		row.insertCell(3).innerHTML = bt;
		row.insertCell(4).innerHTML = dg;
		row.insertCell(5).innerHTML = sh;
		row.insertCell(6).innerHTML = ia;
	}
}