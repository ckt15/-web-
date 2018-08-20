
var ccount = document.getElementById("ccount"); //显示商品总数量的标签节点对象
var btns = document.querySelectorAll(".list dl dd a"); //所有的购物车添加链接
var listStr = cookieObj.get("datas");

if(!listStr) { //没有购物车
	cookieObj.set({
		name: "datas",
		value: "[]"
	});
	listStr = cookieObj.get("datas");
}

var listObj = JSON.parse(listStr);
var totalCount = 0; 
for(var i = 0, len = listObj.length; i < len; i++) {
	totalCount = listObj[i].pCount + totalCount;
}
ccount.innerHTML = totalCount;

for(var i = 0, len = btns.length; i < len; i++) {
	btns[i].onclick = function() {
		var dl = this.parentNode.parentNode;
		var pid = dl.getAttribute("pid");//获取自定义属性
		var arrs = dl.children;//获取所有子节点
		if(checkObjByPid(pid)) {
			listObj = updateObjById(pid, 1)
		} else {
			var imgSrc = arrs[0].firstElementChild.src;
			var pName = arrs[1].innerHTML;
			var pDesc = arrs[2].innerHTML;
			var price = arrs[3].firstElementChild.innerHTML;
			var obj = {
				pid: pid,
				pImg: imgSrc,
				pName: pName,
				pDesc: pDesc,
				price: price,
				pCount: 1
			};
			listObj.push(obj)
			listObj = updateData(listObj);
		}
		ccount.innerHTML = getTotalCount();
	}
}