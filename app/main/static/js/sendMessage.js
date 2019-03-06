/*time:2019-3-3
  author:lishuo
  function:front and back and database interaction
*/
//提交注册信息，接收商品名称及价格
function onSubmit(){
var userid = document.getElementById("u_userid").value;
var name = document.getElementById("u_name").value;
if(userid==""||name=="")
{
    alert("用户信息为空请检查！")
    return 0;
}

document.getElementById("userid").value=userid;
var sex = document.getElementById("u_sex").value;
var age = document.getElementById("u_age").value;
var number = document.getElementById("u_number").value;
    var data = {
        "userid": userid,
        "username": name,
        "usersex": sex,
        "userage": age,
        "usernumber":number
    };

    $.ajax({
        type: 'POST',
        url: '/login',
        data: JSON.stringify(data),
        contentType: 'application/json',
        success: function(data){
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