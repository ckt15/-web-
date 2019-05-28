var course = document.getElementById('course');
		var collect = document.getElementById('collect');
		var personal = document.getElementById('personal');
		var note = document.getElementById('note');

		function Mycollect(){
			course.style.display = "none";
			note.style.display = "none";
			personal.style.display = "none";
			collect.style.display = "block";
		}

		function Couse(){
			course.style.display = "block";
			note.style.display = "none";
			collect.style.display = "none";
			personal.style.display = "none";
		}

		function Personal(){
			course.style.display = "none";
			note.style.display = "none";
			collect.style.display = "none";
			personal.style.display = "block";
		}
		function Mynote(){
			course.style.display = "none";
			note.style.display = "block";
			collect.style.display = "none";
			personal.style.display = "none";
		}
		 function logout(){
		       if (confirm("您确定要退出系统吗？")){
		       		top.location = "index.html";
		       		return false;
		       }	
		}