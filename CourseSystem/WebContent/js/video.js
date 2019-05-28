function changeSearch(){
	document.getElementById('search').style.backgroundColor = "white";
	document.getElementById('bbtn').style.backgroundColor = "black";
	document.getElementById('bbtn').style.color = "white";
}
function changeSearch2(){
	document.getElementById('search').style.backgroundColor = "#f3f5f6";
	document.getElementById('bbtn').style.backgroundColor = "#C0C0C0";
	document.getElementById('bbtn').style.color = "black";
}

var li =  document.getElementsByClassName('li');
function sosuo(){
	var li=document.getElementsByClassName('li');
  	var text=document.getElementById('search');
     	var arr=text.value;
        for(var i=0;i<li.length;i++)
        {
          	li[i].style.display="none";
          	if(li[i].getAttribute('pname').indexOf(arr)!=-1)
          	{
            	li[i].style.display = "block";
          	}
        }   
}
document.onkeydown = function (event) { 
    var e = event || window.event ||arguments.callee.caller.arguments[0]; 
    if (e && e.keyCode == 13) { 
    	sosuo();
    } 
}