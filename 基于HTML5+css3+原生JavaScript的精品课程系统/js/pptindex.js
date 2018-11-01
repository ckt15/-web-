function logout(){
	       if (confirm("您确定要退出系统吗？")){
	       		top.location = "index.html";
	       		return false;
	       }	
		}

		function newPPT(){
			var h1 = document.getElementById('h1');
			var h2 = document.getElementById('h2');
			var li =  document.getElementsByClassName('li');
			var ppt = document.getElementById('ppt');

			for(var i = 0;i<li.length; i++){
				li[i].onclick = function(){
					h2.innerHTML = this.innerHTML;
					ppt.src = "https://docs.zoho.com.cn/show/publish/pm6m6497eceebf48c456db287672d93e7db95" ;
				}
			}
		}

		function sosuo(){
			var li=document.getElementsByClassName('li');
          	var text=document.getElementById('search');
	         	var arr=text.value;
	            for(var i=0;i<li.length;i++)
	            {
	              	li[i].style.display="none";
	              	if(li[i].getAttribute('pname').indexOf(arr)!=-1)
	              	{
	                	li[i].style.display="block";
	              	}
	            }   
		}