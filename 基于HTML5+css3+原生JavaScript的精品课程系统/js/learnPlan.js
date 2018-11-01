function innerDiv(){
	var title = document.getElementById('title');
	var pagra = document.getElementById('pagra');
	var plan = document.getElementById('plan');
	var plan1 = document.getElementById('plan1');
	var inp = document.getElementById('inp');

	plan.innerHTML = '<label class="lab">计划名称：</label>'+'<span class="sp">'+title.value+'</span>'+'<br><br>'+
	'<label class="lab">计划内容：</label>'+'<div class="sp">'+pagra.value+'</div>';
	plan.style.display = "block";
	plan1.style.display = "none";
	inp.style.display = "block";
}
