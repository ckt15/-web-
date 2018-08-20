 $.ajax({
 			/*解析json数据*/
			url:"http://yunxtec.com/test/discount.php",
			type:"post",
			success:function(data){
				var obj = eval("("+data+")");
				var dis = obj.discount;
				var imgs = [];
				var urls = [];
				var goods = [];
				var descrs = [];
				var prices = [];
				var dprices = [];
				for(var i in dis){
					imgs.push(dis[i].img);
					urls.push(dis[i].url);
					goods.push(dis[i].goods);
					descrs.push(dis[i].descr);
					prices.push(dis[i].price);
					dprices.push(dis[i].dprice);
				}
				/*展示数据到页面*/
				for(var i in imgs){
					$('#shangDiv img')[i].src=imgs[i];
				}
				for(var i in urls){
					$('#shangDiv>a')[i].href = urls[i];
				}
				for(var i in goods){
					$('#shangDiv h3')[i].innerHTML = goods[i];
				}
				for(var i in descrs){
					$('#shangDiv h4')[i].innerHTML = descrs[i];
				}
				for(var i in prices){
					$('#shangDiv h6')[i].innerHTML = "<i>原价：￥"+prices[i]+"</i>";
				}
				for(var i in dprices){
					$('#shangDiv h5')[i].innerHTML = "￥"+dprices[i];
				}
			}
		});