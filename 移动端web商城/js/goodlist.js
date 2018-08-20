 $.ajax({
 			/*解析json数据*/
			url:"http://yunxtec.com/test/goodslist.php",
			type:"post",
			success:function(data){
				var obj = eval("("+data+")");
				var dis = obj.goodslist;
				var imgs = [];
				var urls = [];
				var goods = [];
				var descrs = [];
				var prices = [];
				for(var i in dis){
					imgs.push(dis[i].img);
					urls.push(dis[i].url);
					goods.push(dis[i].goods);
					descrs.push(dis[i].descr);
					prices.push(dis[i].price);
				}
				/*展示数据到页面*/
				for(var i in imgs){
					$('.list .img1')[i].src=imgs[i];
				}
				for(var i in urls){
					$('.list .a1')[i].href = urls[i];
				}
				for(var i in goods){
					$('.list .d1')[i].innerHTML = goods[i];
				}
				for(var i in descrs){
					$('.list .d2')[i].innerHTML = descrs[i];
				}
				for(var i in prices){
					$('.list span')[i].innerHTML = prices[i];
				}
			}
		});