var fairy = {};

dropdown = document.getElementById("list");
// generate dropdown
for(id in list) {
	if(id > 1000) {
		fairy[id] = 0;
	}
	else {
		var node = document.createElement("option");
		var text = document.createTextNode(list[id]["name"]);
		node.appendChild(text);
		dropdown.appendChild(node).setAttribute("value", list[id]["cardId"]);
	}
}

document.getElementById("submit").addEventListener("click", function() {
	for(var item in fairy) {
		fairy[item]=0;
	}
	var selected = [];
	selected.push(dropdown.value);
	route = "SUN";
	for(let i of selected) {
		for(var j=1; j<=6; j++) {
			update(i, route, j);
		}

	}
});

function update(princeId, route, seqNo) {
	//make key
	sacrificeData = sacrifice[princeId+","+route+","+seqNo];
	if(sacrificeData != undefined) {
		//increment
		id = sacrificeData["sacrificeCardId"];
		count = sacrificeData["sacrificeCount"];
		fairy[id] += count;
		//display
		console.log(list[id]["name"]);
		display = document.getElementById("f"+id);
		if(display != null) {
			display.innerHTML = fairy[id];
		}
		else {
			document.getElementById("misc").innerHTML += list[id]["name"] + "<br>";
		}
	}
}

function debug(id, count) {
	document.getElementById("debug").innerHTML = count+"x "+id+"<br>"+list[id]["name"];
}
