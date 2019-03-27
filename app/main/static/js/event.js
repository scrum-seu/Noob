var totalRow1=0;
function getGoodsInfo() {
    const jsContainer = document.getElementById('container');
    $.ajax({
        type: 'POST',
        url: '/goods_info',
        success: function (data) {
            if(data!=-1)
            {
                document.getElementById("settle").disabled=false;
                var tablenum=document.getElementById("datatable").rows.length;
                for (var i=1; i <tablenum; i++)
                {
                    document.getElementById("datatable").rows[i].cells[1].innerHTML="";
                    document.getElementById("datatable").rows[i].cells[2].innerHTML="";
                    document.getElementById("datatable").rows[i].cells[3].innerHTML="";
                    document.getElementById("datatable").rows[i].cells[4].innerHTML="";
                    document.getElementById("datatable").rows[i].cells[5].innerHTML="";
                }
                console.log(data);
                arr=data.split(";");
                console.log(arr.length);
                var totalPrice=0;
                for(var i=0; i<arr.length-1; i++)
                {
                    arrtemp=arr[i].split(",");
                    document.getElementById("datatable").rows[i+1].cells[1].innerHTML=arrtemp[0];
                    document.getElementById("datatable").rows[i+1].cells[2].innerHTML=arrtemp[1];
                    document.getElementById("datatable").rows[i+1].cells[3].innerHTML=arrtemp[2];
                    document.getElementById("datatable").rows[i+1].cells[4].innerHTML=arrtemp[3];
                    document.getElementById("datatable").rows[i+1].cells[5].innerHTML=arrtemp[4];
                    totalPrice=totalPrice+parseInt(arrtemp[2])*parseInt(arrtemp[3]);
                    totalRow1=totalRow1+1;
                }
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
            }
            else{
                console.log(data)
            }
        },error: function(jqXHR){console.log(jqXHR)}
    });
}

//提取指定行的数据，JSON格式
function GetRowData(row){
    var rowData = {};
    name="user_id";
    var value1=document.getElementById("userid").innerText;
    rowData[name] = value1;
    for(var j=1;j<6; j++){
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
       if(j==5){
            name="category_id";
            var value = row.cells[j].innerHTML;
            rowData[name] = value;
        }
    }
    name="purchase_date";
    var value1=document.getElementById("purtime").innerText;
    rowData[name] = value1;
    return rowData;
}

function NewGetTableData(){
    var dateTab=document.getElementById("datatable");
    var tableData = new Array();
    if(dateTab.rows.length==1)
    {
        alert("未检测到购买信息,请检查!")
        return 0;
    }
    if(document.getElementById("userid").innerText=="")
    {
        alert("用户ID为空,请检查!")
        return 1;
    }
    for(var i=1; i<totalRow1+1;i++){
        tableData.push(GetRowData(dateTab.rows[i]));
    }
    console.log(tableData)
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

