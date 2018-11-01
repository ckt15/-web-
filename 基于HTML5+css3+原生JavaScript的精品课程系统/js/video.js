//设置播放与暂停
var v = document.getElementById('video');
var playBtn = document.getElementById('playBtn');

playBtn.addEventListener("click",function(){
	if(v.paused){
		video.play();
		playBtn.innerHTML = '暂停';
	}else{
		v.pause();
		playBtn.innerHTML = '播放';
	}
});

//实现点击目录播放 
var vedioLi = document.getElementsByClassName("li");
 
var vedioArry = new Array("宣传视频3.21.mp4", "宣传视频3.21.mp4", "宣传视频3.21.mp4","宣传视频3.21.mp4", "宣传视频3.21.mp4", "宣传视频3.21.mp4","宣传视频3.21.mp4", "宣传视频3.21.mp4", "宣传视频3.21.mp4");
var arryNumber = 0;

for(var j = 0; j < vedioLi.length; j++) {
	vedioLi[j].onclick = function() {
        for(var i = 0; i < vedioLi.length; i++) {
		    if(vedioLi[i] == this) {
		        vedioLi[i].style.backgroundColor = "white";
		        arryNumber = i;
		        v.src = vedioArry[i];
	        }
	    }
    }
}


//设置当前播放进度与总进度
var nowTime = document.getElementById('nowTime');
var allTime = document.getElementById('allTime');
nowTime.innerHTML = "00:00";
allTime.innerHTML = "00:00";

function parseTime(time){
	time = Math.floor(time);
	var m,s;
	m = Math.floor(time/60);
	s = time - m*60;
	if(m<10){
		m = '0' + m;
	}
	if(s<10){
		s = '0' + s;
	}
	return m + ':' + s;
}
v.addEventListener('timeupdate', function(){
	nowTime.innerHTML = parseTime(v.currentTime);
});

v.addEventListener('loadedmetadata', function(){
	allTime.innerHTML = parseTime(v.duration);
});

//增大音量与减小音量
var vo = document.getElementById('voice');
vo.innerHTML = parseInt(v.volume*100,10);
var voP = document.getElementById('addVoice');
var voM = document.getElementById('lowVoice');

voP.addEventListener("click", function(){
	v.volume > 0.9?v.volume = 1:v.volume +=0.1;
	vo.innerHTML = parseInt(v.volume*100,10);
})
voM.addEventListener("click",function(){
	v.volume < 0.1?v.volume = 0:v.volume -= 0.1;
	vo.innerHTML = parseInt(v.volume*100,10)
})




 function logout(){
       if (confirm("您确定要退出系统吗？")){
       		top.location = "index.html";
       		return false;
       }	
}
