var index=0;
window.onload=function(){   
    var lis = $('font');  
    var start=setInterval(autoPlay,1500);

    $('#imgchangediv').mouseover(function(){
        clearInterval(start);
    })
    $('#imgchangediv').mouseout(function(){
        start=setInterval(autoPlay,1000);
    })
    var funny = function(i){
        lis[i].onmouseover = function(){
            changeImg(i)
        }
    }
    for(var i=0;i<lis.length;i++){
        funny(i);
    }
}
function autoPlay(){
    if(index>3){
        index=0;
    }
    changeImg(index++);
}
function changeImg(index){
    var list = $('#imgchangediv img');
    var list1 = $('#imgyuan font');
    for(i=0;i<list.length;i++){
        list[i].style.display='none';
        list1[i].style.backgroundColor='white';
    }
    list[index].style.display='block';
    list1[index].style.backgroundColor='orange';
}