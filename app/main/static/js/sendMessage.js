/*time:2019-3-3
  author:lishuo
  function:front and back and database interaction
*/
//获取系统时间并在文本框显示
function getNowFormatDate() {
    var date = new Date();
    var seperator1 = "-";
    var seperator2 = ":";
    var month = date.getMonth() + 1;
    var strDate = date.getDate();
    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
    if (strDate >= 0 && strDate <= 9) {
        strDate = "0" + strDate;
    }
    var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate
            + " " + date.getHours() + seperator2 + date.getMinutes()
            + seperator2 + date.getSeconds();
    return currentdate;
}
//提交注册信息
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
                document.getElementById("submit").disabled=true;
            },
            error: function(jqXHR){console.log(jqXHR)},
        })
}

//向后台请求用户购买信息显示在table
function GetPurchaseData(){
    var data={
    "message":"success",
    }
   // console.log($('#datatable').DataTable().data()[0][1]);
//    $('#datatable').DataTable().data()[0][1]="123";
//    console.log($('#datatable').DataTable().data()[0][1]);
//    console.log(typeof($('#datatable').DataTable().data()));
   // console.log(document.getElementById("datatable").rows.length);
   $.ajax({
        type: 'POST',
        url: '/purchase',
        data: JSON.stringify(data),
        contentType: 'application/json',
        success: function(data){
            var dataArr=data.split(",");
            var totalPrice=0;

            for(var i = 0; i < dataArr.length; i++)
            {
                if(i%4==0)
                {
                    document.getElementById("datatable").rows[i/4+1].cells[1].innerHTML=dataArr[i];
                    document.getElementById("datatable").rows[i/4+1].cells[2].innerHTML=dataArr[i+1];
                    document.getElementById("datatable").rows[i/4+1].cells[3].innerHTML=dataArr[i+2];
                    document.getElementById("datatable").rows[i/4+1].cells[4].innerHTML=dataArr[i+3];
                    totalPrice=totalPrice+parseInt(dataArr[i+2])*parseInt(dataArr[i+3]);
                }
            }
            document.getElementById("settle").disabled=false;
            var time1=getNowFormatDate();
            var obj = document.getElementById("purtime");
            obj.innerText= time1;
            var obj = document.getElementById("totalNum");
            obj.innerText= "￥"+totalPrice;
            //更新二维码
            var o = document.getElementById("generatecode");
            var h = o.offsetHeight;
            var w = o.offsetWidth;
            var money="购物总金额:￥"+totalPrice;
            $('#generatecode').html("");
             $("#generatecode").qrcode({
                 render : "canvas",    //设置渲染方式，有table和canvas，使用canvas方式渲染性能相对来说比较好
                 text : money,    //扫描二维码后显示的内容,可以直接填一个网址，扫描二维码后自动跳向该链接
                 width : w,               //二维码的宽度
                 height : h,              //二维码的高度
                 background : "#ffffff",       //二维码的后景色
                 foreground : "#000000",        //二维码的前景色
            });
        },
        error: function(jqXHR){console.log(jqXHR)},
    })
}
//提取指定行的数据，JSON格式
function GetRowData(row){
    var rowData = {};
    name="user_id";
    var value1=document.getElementById("u_userid").value;
    rowData[name] = value1;
    for(var j=1;j<5; j++){
        if(j==1){
            name="good_id";
            var value = row.cells[j].innerHTML;
            rowData[name] = value;
        }
        if(j==3){
            name="count";
            var value = row.cells[j].innerHTML;
            rowData[name] = value;
        }
       if(j==4)
       {
            name = "total_price";
            var count1=parseFloat(row.cells[3].innerHTML);
            var price1=parseFloat(row.cells[j].innerHTML);
            var total1=count1*price1;
            var value=total1.toString();
            rowData[name] = value;
       }
    }
    name="purchase_date";
    var value1=document.getElementById("purtime").innerText;
    rowData[name] = value1;
    return rowData;
}
//提取表格的值,发送到后台
function GetTableData(){
    var dateTab=document.getElementById("datatable");
    var tableData = new Array();
    if(dateTab.rows.length==1)
    {
        alert("未检测到购买信息,请检查!")
        return 0;
    }
    if(document.getElementById("u_userid").value=="")
    {
        alert("用户ID为空,请检查!")
        return 1;
    }
    for(var i=1; i<dateTab.rows.length;i++){
       tableData.push(GetRowData(dateTab.rows[i]));
    }
   $.ajax({
        type: 'POST',
        url: '/goods',
        data: JSON.stringify(tableData),
        contentType: 'application/json',
        success: function(data){
            console.log(data)
            document.getElementById("settle").disabled=true;
        },
        error: function(jqXHR){console.log(jqXHR)},
    })
}
//获取推荐信息模块
//send：userid
//receive:good_name,good_price,position(保留)
function inquireinfo(){
    var userid=document.getElementById("u_userid").value;
    if (userid=="")
    {
        alert("用户ID为空,请检查!")
        return 0;
    }
    var obj = document.getElementById("filter"); //定位id
    var index = obj.selectedIndex; // 选中索引
    var kind = obj.options[index].text; // 选中文本
    if(kind=="Routine recommendation")
    {
        var data={
        "user_id":userid,
        "flag":"1"
        }
    }
    else{
        if(kind=="Seasonal Recommendation")
        {
            var data={
            "user_id":userid,
            "flag":"2"
            }
        }
        else{
            if(kind=="Hot recommendation")
            {
                var data={
                "user_id":userid,
                "flag":"3"
                }
            }
            else
            {
                if(kind=="Personalized recommendation")
                var data={
                "user_id":userid,
                "flag":"0"
                }
            }
        }
    }
   $.ajax({
        type: 'POST',
        url: '/recom',
        data: JSON.stringify(data),
        contentType: 'application/json',
        success: function(data){
            if(data=="error1")
            {
                alert("信息不足无法获得个性化推荐！")
                return 0;
            }
            var arr=data.split(",");
            var num=arr.length;
            var str=""
            var col1=1;
            var col3=1;
            var col2=1;
            for(var i=0;i<arr.length;i++){
                if(i%3==0)
                {
                    if(arr[i]!="")
                    {
                        document.getElementById("showdata").rows[col1].cells[1].innerHTML=arr[i];
                        col1=col1+1;
                    }
                }
                else
                {
                    if(i%3==1&&arr[i]!="")
                    {
                            document.getElementById("showdata").rows[col2].cells[2].innerHTML=arr[i];
                            col2=col2+1;
                    }
                    else
                    {
                        if(arr[i]!="")
                        {
                            document.getElementById("showdata").rows[col3].cells[3].innerHTML=arr[i];
                            col3=col3+1;
                        }
                    }
                }
            }
        },
        error: function(jqXHR){console.log(jqXHR)},
    })
}