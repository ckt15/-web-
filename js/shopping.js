var listObj = getAllData();
var table = document.getElementById("table")
var box = document.getElementById("box")
var tbody = document.getElementById("tbody");
var totalPrice = document.getElementById("totalPrice");
var allCheck = document.getElementById("allCheck");

if(listObj.length == 0) { //购物车为空
	box.className = "box";
	table.className = "hide";
} else {
	box.className = "box hide";
	table.className = "";
	for(var i = 0, len = listObj.length; i < len; i++) {
		var tr = document.createElement("tr");
		tr.setAttribute("pid", listObj[i].pid);
		tr.innerHTML = '<td>' +
			'<input type="checkbox" class="ck"  />' +
			'</td>' +
			'<td class="name">' +
			listObj[i].pName +
			'</td>' +
			'<td>' +
			'<button class="down" data-role="none">-</button><input type="text" value="'
			 + listObj[i].pCount + 
			 '" readonly="readonly"  data-role="none"/><button class="up" data-role="none">+</button>' +
			'</td>' +
			'<td class="name">' +
			'￥<span>' + listObj[i].price + '</span>' +
			'</td>' +
			'<td class="name">' +
			'￥<span>' + listObj[i].price * listObj[i].pCount + '</span>' +
			'</td>' +
			'<td>' +
			'<input class="del" data-role="none" type="button" value="删除"></input>' +
			'</td>';
		tbody.appendChild(tr);
	}
}

var cks = document.querySelectorAll("tbody .ck");

/*循环遍历为每一个checkbox添加一个onchange事件*/
for(var i = 0, len = cks.length; i < len; i++) {
	cks[i].onchange = function() {
		checkAllChecked();
	}
}

/*全选实现*/
allCheck.onchange = function() {
	if(this.checked) {
		for(var i = 0, len = cks.length; i < len; i++) {
			cks[i].checked = true;
		}
	} else {
		for(var i = 0, len = cks.length; i < len; i++) {
			cks[i].checked = false;
		}
	}
}

var downs = document.querySelectorAll(".down"); //一组减的按钮
var ups = document.querySelectorAll(".up"); //一组加的按钮
var dels = document.querySelectorAll(".del"); //一组删除按钮
for(var i = 0, len = downs.length; i < len; i++) {
	/*减按钮的实现*/
	downs[i].onclick = function() {
		var txtObj = this.nextElementSibling;
		var tr = this.parentNode.parentNode;
		var pid = tr.getAttribute("pid");
		txtObj.value = txtObj.value - 1;
		if(txtObj.value < 1) {
			txtObj.value = 1;
			updateObjById(pid, 0)
		} else {
			updateObjById(pid, -1)
		}
		tr.children[0].firstElementChild.checked = true;
		checkAllChecked();
		var price = tr.children[3].firstElementChild.innerHTML;
		tr.children[4].firstElementChild.innerHTML = price * txtObj.value;

	}
	/*加按钮的实现*/
	ups[i].onclick = function() {
		var txtObj = this.previousElementSibling;
		var tr = this.parentNode.parentNode;
		var pid = tr.getAttribute("pid");
		txtObj.value = Number(txtObj.value) + 1;
		updateObjById(pid, 1);
		tr.children[0].firstElementChild.checked = true;
		checkAllChecked();
		var price = tr.children[3].firstElementChild.innerHTML;
		tr.children[4].firstElementChild.innerHTML = price * txtObj.value;
	}
	/*删除按钮的实现*/
	dels[i].onclick = function() {
		var tr = this.parentNode.parentNode;
		var pid = tr.getAttribute("pid")
		if(listObj.length != 0) {
			//remove()  自杀
			tr.remove();
			listObj = deleteObjByPid(pid);
		}
		if(listObj.length == 0) { //购物车为空
			box.className = "box";
			table.className = "hide";
		} else {
			box.className = "box hide";
			table.className = "";
		}
	}
}

/*是否实现全选*/
function checkAllChecked() {
	var isSelected = true; 
	for(var j = 0, len = cks.length; j < len; j++) {
		if(cks[j].checked == false) {
			isSelected = false;
			break;
		}
	}
	allCheck.checked = isSelected;
}