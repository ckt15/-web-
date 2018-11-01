 function myChange(){
        var vaSle = document.getElementById('vaSle');
        var value =vaSle.options[vaSle.selectedIndex].value;
        return value;
    }
window.onload = function(){
  //分析cookie值，显示上次的登陆信息
  var bankValue = getCookieValue("bank");
  document.getElementById("bank").value = bankValue;
  var pswValue = getCookieValue("psw");
  document.getElementById("psw").value = pswValue;  
  //写入点击事件
  document.getElementById("sub").onclick = function()
   {
    var bankValue = document.getElementById("bank").value;
    var pswValue = document.getElementById("psw").value;
    
    //服务器验证（模拟）  
    var toRole = document.getElementById('toRole');
    var isAdmin = bankValue == "admin" && pswValue =="123456";
    var isUserS = bankValue == "userCKT" && pswValue =="123456";
    var isUserT = bankValue == "teacherCKT" && pswValue =="123456";
    var isMatched = isAdmin || isUserS || isUserT;
    if(isMatched){
      if( document.getElementById("saveCookie").checked){ 
         setCookie("bank",document.getElementById("bank").value,24,"/");
         setCookie("psw",document.getElementById("psw").value,24,"/");
       }  
      if(myChange() == 1&&bankValue == "userCKT" && pswValue =="123456"){
          toRole.href = "studentindex.html";
      }else if(myChange() == 2&&bankValue == "teacherCKT" && pswValue =="123456"){
          toRole.href = "teacher.html";
      }else if(myChange() == 3&&bankValue == "admin" && pswValue =="123456"){
          toRole.href = "adminindex.html";
      }else{
          alert("请确认您的角色与账户密码是否匹配！");
      }
    }
      else alert("用户名或密码错误，请重新输入！");  
    }
}