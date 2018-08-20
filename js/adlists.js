 $.ajax({
 	/*解析json数据*/
	url:"http://yunxtec.com/test/adlist.php",
	type:"post",
	success:function(data){
		var obj = eval("("+data+")");
		var ad = obj.adlist;
		var imgs = [];
		var urls = [];
		var names = [];
		for(var i in ad){
			imgs.push(ad[i].img);
			urls.push(ad[i].url);
			names.push(ad[i].name);
		}
		/*展示数据到页面*/
		for(var i in imgs){
			$('#imgchangediv img')[i].src = imgs[i];
		}
		for(var i in urls){
			$('#imgchangediv>a')[i].href = urls[i];
		}
		for(var i in urls){
			$('#imgchangediv img')[i].title = names[i];
		}
	}
});