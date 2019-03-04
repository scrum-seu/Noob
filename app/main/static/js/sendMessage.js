/*time:2019-3-3
  author:lishuo
  function:front and back and database interaction
*/
//提交注册信息，接收商品名称及价格
function onSubmit(){
var name = document.getElementById("u1").value;
var age = document.getElementById("u2").value;
var call = document.getElementById("u3").value;
    var data = {
        "username": name,
        "userage": age,
        "usernumber":call
    };

    $.ajax({
        type: 'POST',
        url: '/login',
        data: JSON.stringify(data),
        contentType: 'application/json',
        success: function(data){
        var arr1=data.split(" ");
        var obj=document.getElementById("telUserName");
        var j=1;
        for(var i=0;i<arr1.length;i++){
            if(i%3==0)
            {
                obj.options[j]=new Option((arr1[i]+":"+arr1[i+1]+":"+arr1[i+2]),"新值");
                j=j+1;
            }
        }
        getNowFormatDate();
        },
        error: function(jqXHR){console.log(jqXHR)},
    })
}

//提取表格的值,发送到后台
function GetTableData(table){
    var test=document.getElementById("tabProduct");
    var tableData = new Array();
    for(var i=1; i<test.rows.length;i++){
       tableData.push(GetRowData(test.rows[i]));
    }
   console.log(tableData)
   $.ajax({
        type: 'POST',
        url: '/goods',
        data: JSON.stringify(tableData),
        contentType: 'application/json',
        success: function(data){
            console.log(data)
        },
        error: function(jqXHR){console.log(jqXHR)},
    })
}
//获取推荐信息模块
function GetRecom_info(){
    var data={
    user_id:"get recommend_info"
    }
   $.ajax({
        type: 'POST',
        url: '/recom',
        data: JSON.stringify(data),
        contentType: 'application/json',
        success: function(data){
            console.log(data)
            console.log(typeof(data))
        },
        error: function(jqXHR){console.log(jqXHR)},
    })
}