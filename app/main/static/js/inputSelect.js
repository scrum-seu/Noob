/*time:2019-3-3
  author:lishuo
  function:imitate drop-down box search function
*/
function putValueToInput(){
    var telUserName= document.getElementById("telUserName");
    var perpage=telUserName.options[telUserName.selectedIndex].text;
    var input=document.getElementById("input");
    input.value=perpage;
    var div=document.getElementById("DIV");
    div.style.display='none';
    div.innerHTML="";
}

function inputValue(){
    var input=document.getElementById("input").value;
    var telUserName= document.getElementById("telUserName");
    var options=telUserName.getElementsByTagName("option");
    var div=document.getElementById("DIV");
    div.innerHTML="";
    var a = 0;
    for(var i=options.length-1;i>=1;i--){
        var optionText=options[i].text;
        if(optionText.indexOf(input) >= 0){
            div.style.display='block';
            div.innerHTML+="<span style='font-size: 12px;' onclick='getVlaue(this)'>"+optionText+"</span><br/>";
            a++;
        }
    }
    if(a==0){
        div.style.display='none';
    }
}

function getVlaue(obj){
    var telUserName= document.getElementById("telUserName");
    var options=telUserName.getElementsByTagName("option");
    var div=document.getElementById("DIV");
    for(var i=options.length-1;i>=1;i--){
        var optionText=options[i].text;
        var optionValue=options[i].value;
        if(obj.innerHTML==optionText){
            telUserName.value=optionValue;
            document.getElementById("input").value=optionText;
            var obj = document.getElementById("telUserName"); //定位id
            var index = obj.selectedIndex; // 选中索引
            obj.options[index].text = optionText; // 选中文本
            div.style.display='none';
            div.innerHTML="";
        }
    }
}
