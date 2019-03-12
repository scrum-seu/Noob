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
    if(test.rows.length==1)
    {
        alert("未检测到购买信息,请检查!")
        return 0;
    }
    for(var i=1; i<test.rows.length;i++){
       tableData.push(GetRowData(test.rows[i]));
    }
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
//send：userid
//receive:good_name,good_price,position(保留)
function GetRecom_info(){
    var userid=document.getElementById("u_userid").value;
    if (userid=="")
    {
        alert("用户ID为空,请检查!")
        return 0;
    }
    var data={
    user_id:userid
    }
   $.ajax({
        type: 'POST',
        url: '/recom',
        data: JSON.stringify(data),
        contentType: 'application/json',
        success: function(data){
            if(data=="0")
                alert("暂无推荐信息")
             else
             {
                var arr=data.split(",");
                var num=arr.length;
                var str=""
                var col1=1;
                var col2=1;
                for(var i=0;i<arr.length;i++){
                    if(i%2==0)
                    {
                        if(arr[i]!="")
                        {
                            document.getElementById("showdata").rows[col1].cells[1].innerHTML=arr[i];
                            col1=col1+1;
                        }
                    }
                    else
                    {
                        if(arr[i]!="")
                        {
                            document.getElementById("showdata").rows[col2].cells[2].innerHTML=arr[i];
                            col2=col2+1;
                        }
                    }
                }
             }
        },
        error: function(jqXHR){console.log(jqXHR)},
    })
}