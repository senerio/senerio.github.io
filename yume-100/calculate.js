var fairy = {};
var misc = [];
datalist = document.getElementById("princes");
init();

document.getElementById("input").addEventListener("keyup", addByEnter);
document.getElementById("sun").addEventListener("keyup", addByEnter);
document.getElementById("moon").addEventListener("keyup", addByEnter);
document.getElementById("add").addEventListener("click", add);

function init() {
	resetCount();
	generateDropdown();
}

function resetCount() {
	for(var item in fairy) {
		fairy[item]=0;
	}
}

function generateDropdown() {
	for(id in list) {
		if(id > 1000) {
			fairy[id] = 0;
		}
		else {
			var option = document.createElement("option");
			option.value = list[id]["name"];
			datalist.appendChild(option).setAttribute("data-value",id);
		}
	}
}

function addByEnter(event) {
	if(event.keyCode == 13) {
		add();
	}
}

function add() {
	var input = document.getElementById("input").value;
	cardId = updateTable(input, true);
	if(cardId != 0) {
		appendList(input, cardId);
		clearInput(input);
	}
}	

function appendList(input, cardId) {
	document.getElementById("added").innerHTML += "<button id=\""
		+ getRoute()
		+ cardId
		+ "\""
		+ " onclick=\"remove(\'"
		+ getRoute()
		+ cardId
		+ "\')\""
		+ ">"
		+ input
		+ " - "
		+ getRoute()
		+ "</button>";
}

function remove(id) {
	updateTable(id, false);
	document.getElementById(id).remove();
}

function clearInput(input) {
	if(document.getElementById("sun").checked || document.getElementById("moon").checked) {
		document.getElementById("input").value = "";	
	}
}

function updateTable(input, add) {
	var cardId = 0
	if(add) {
		for(var i=0; i < datalist.options.length; i++) {
			if(datalist.options[i].value == input) {
				cardId = datalist.options[i].getAttribute("data-value");
				for(var j=1; j<=6; j++) {
					updateOne(cardId, getRoute(), j, add);
				}
			}
		}
	}
	else {
		for(var j=1; j<=6; j++) {
			slice = input.indexOf(input.match(/[0-9]/));
			updateOne(input.slice(slice), input.slice(0,slice), j, add);
		}
	}
	return cardId;
}

function updateOne(princeId, route, seqNo, add) {
	//make key
	sacrificeData = sacrifice[princeId+","+route+","+seqNo];
	if(sacrificeData != undefined) {
		//increment
		id = sacrificeData["sacrificeCardId"];
		count = sacrificeData["sacrificeCount"];
		if(add) {
			fairy[id] += count;	
		}
		else {
			fairy[id] -= count;
		}
		//display
		display = document.getElementById("f"+id);
		if(display != null) {
			display.innerHTML = fairy[id];
		}
		else {
			if(add) {
				misc.push(list[id]["name"]);	
			}
			else {
				misc = misc.filter(function(value) {
					return value != list[id]["name"];
				});
			}
			updateMisc();
		}
	}
}

function updateMisc() {
	document.getElementById("misc").innerHTML = "";
	misc.forEach(function(item, index) {
		document.getElementById("misc").innerHTML += item + "<br>";
	});
}

function getRoute() {
	if (document.getElementById("sun").checked) {
		return "SUN";
	}
	else if (document.getElementById("moon").checked) {
		return "MOON";
	}
}
