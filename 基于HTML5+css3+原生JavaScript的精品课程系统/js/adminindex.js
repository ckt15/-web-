var database = document.getElementById('database');
var system = document.getElementById('system');
var user = document.getElementById('ueser');

function User(){
			database.style.display = "none";
			system.style.display = "none";
			user.style.display = "block";
}

function Database(){
	database.style.display = "block";
	system.style.display = "none";
	user.style.display = "none";
}

function System(){	
	database.style.display = "none";
	system.style.display = "block";
	user.style.display = "none";
}
 function logout(){
    if (confirm("您确定要退出系统吗？")){
        top.location = "index.html";
       	return false;
    }	
}
	