/*time:2019-3-3
  author:lishuo
  function:add table for purchase_info and get systime
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
    document.getElementById("systime").value = currentdate;
}
//设置多个表格可编辑
function EditTables(){
    for(var i=0;i<arguments.length;i++){
       SetTableCanEdit(arguments[i]);
    }
}

//设置表格是可编辑的
function SetTableCanEdit(table){
    for(var i=1; i<table.rows.length;i++){
       SetRowCanEdit(table.rows[i]);
}
}

function SetRowCanEdit(row){
    for(var j=0;j<row.cells.length; j++){

       //如果当前单元格指定了编辑类型，则表示允许编辑
       //默认只有数量可编辑
       if(j==2)
       {
           var editType = row.cells[j].getAttribute("EditType");
           if(!editType){
            //如果当前单元格没有指定，则查看当前列是否指定
            editType = row.parentNode.rows[0].cells[j].getAttribute("EditType");
           }
           if(editType){
            row.cells[j].onclick = function (){
             EditCell(this);
            }
           }
       }
    }

}

//设置指定单元格可编辑
function EditCell(element, editType){

var editType = element.getAttribute("EditType");
    if(!editType){
       //如果当前单元格没有指定，则查看当前列是否指定
       editType = element.parentNode.parentNode.rows[0].cells[element.cellIndex].getAttribute("EditType");
    }

    switch(editType){
       case "TextBox":
        CreateTextBox(element, element.innerHTML);
        break;
       case "DropDownList":
        CreateDropDownList(element);
        break;
       default:
        break;
    }
}

//为单元格创建可编辑输入框
function CreateTextBox(element, value){
//检查编辑状态，如果已经是编辑状态，跳过
var editState = element.getAttribute("EditState");
    if(editState != "true"){
       //创建文本框
       var textBox = document.createElement("INPUT");
       textBox.type = "text";
       textBox.className="EditCell_TextBox";


       //设置文本框当前值
       if(!value){
        value = element.getAttribute("Value");
       }
       textBox.value = value;

       //设置文本框的失去焦点事件
       textBox.onblur = function (){
        CancelEditCell(this.parentNode, this.value);
       }
       //向当前单元格添加文本框
       ClearChild(element);
       element.appendChild(textBox);
       textBox.focus();
       textBox.select();

       //改变状态变量
       element.setAttribute("EditState", "true");
       element.parentNode.parentNode.setAttribute("CurrentRow", element.parentNode.rowIndex);
    }

}


//为单元格创建选择框
function CreateDropDownList(element, value){
//检查编辑状态，如果已经是编辑状态，跳过
var editState = element.getAttribute("EditState");
    if(editState != "true"){
       //创建下接框
       var downList = document.createElement("Select");
       downList.className="EditCell_DropDownList";

       //添加列表项
       var items = element.getAttribute("DataItems");
       if(!items){
        items = element.parentNode.parentNode.rows[0].cells[element.cellIndex].getAttribute("DataItems");
       }

       if(items){
        items = eval("[" + items + "]");
        for(var i=0; i<items.length; i++){
         var oOption = document.createElement("OPTION");
         oOption.text = items[i].text;
         oOption.value = items[i].value;
         downList.options.add(oOption);
        }
       }

       //设置列表当前值
       if(!value){
        value = element.getAttribute("Value");
       }
       downList.value = value;

       //设置创建下接框的失去焦点事件
       downList.onblur = function (){
        CancelEditCell(this.parentNode, this.value, this.options[this.selectedIndex].text);
       }

       //向当前单元格添加创建下接框
       ClearChild(element);
       element.appendChild(downList);
       downList.focus();

       //记录状态的改变
       element.setAttribute("EditState", "true");
       element.parentNode.parentNode.setAttribute("LastEditRow", element.parentNode.rowIndex);
    }
}


//取消单元格编辑状态
function CancelEditCell(element, value, text){
    element.setAttribute("Value", value);
    if(text){
       element.innerHTML = text;
    }else{
       element.innerHTML = value;
    }
    element.setAttribute("EditState", "false");

    //检查是否有公式计算
    CheckExpression(element.parentNode);
}

//清空指定对象的所有字节点
function ClearChild(element){
    element.innerHTML = "";
}

//添加行同时为商品和单价字段赋值
function AddRow(table, index){
    var obj = document.getElementById("telUserName"); //定位id
    var index = obj.selectedIndex; // 选中索引
    var text = obj.options[index].text; // 选中文本
    if(text=="")
    {
        alert("请选中商品：")
        return 0;
    }
    if(document.getElementById("userid").value=="")
    {
        alert("用户不存在,请检查:")
        return 1;
    }
    var lastRow = table.rows[table.rows.length-1];
    var newRow = lastRow.cloneNode(true);
    //计算新增加行的序号，需要引入jquery 的jar包
    var startIndex = $.inArray(lastRow,table.rows);
    var endIndex = table.rows;
     table.tBodies[0].appendChild(newRow);
    var arr2=text.split(":");
    newRow.cells[0].innerHTML=arr2[0];
    //数量默认为1
    newRow.cells[1].innerHTML=arr2[1];
    newRow.cells[2].innerHTML="1";
    newRow.cells[3].innerHTML=arr2[2];
    SetRowCanEdit(newRow);
    return newRow;
}

//提取指定行的数据，JSON格式
function GetRowData(row){
var rowData = {};
name="user_id";
var value1=document.getElementById("userid").value;
rowData[name] = value1;
for(var j=0;j<row.cells.length; j++){
   if(j==1)
   {
   }
   if(j==0)
   {
       name = row.parentNode.rows[0].cells[j].getAttribute("Name");
       if(name){
        var value = row.cells[j].getAttribute("Value");
        if(!value){
         value = row.cells[j].innerHTML;
        }

        rowData[name] = value;
        }
   }
   if(j==2)
   {
        name = row.parentNode.rows[0].cells[j].getAttribute("Name");
        if(name){
        var value = row.cells[j].innerHTML;


        rowData[name] = value;
        }
   }
   if(j==3)
   {
        name = row.parentNode.rows[0].cells[j].getAttribute("Name");
        if(name){
            var count1=parseFloat(row.cells[2].innerHTML);
            var price1=parseFloat(row.cells[j].innerHTML);
            var total1=count1*price1;
            var value=total1.toString();

        rowData[name] = value;
        }
   }
}
name="purchase_date";
var value1=document.getElementById("systime").value;
rowData[name] = value1;
return rowData;

}
function deleteRow()
{
    var tab = document.getElementById("tabProduct") ;
    //表格行数
    var rows = tab.rows.length ;
    for(i=1;i<rows;i++)
        document.getElementById('tabProduct').deleteRow(1);
}
//检查当前数据行中需要运行的字段
function CheckExpression(row){
for(var j=0;j<row.cells.length; j++){
   expn = row.parentNode.rows[0].cells[j].getAttribute("Expression");
   //如指定了公式则要求计算
   if(expn){
	var result = Expression(row,expn);
	var format = row.parentNode.rows[0].cells[j].getAttribute("Format");
	if(format){
	 //如指定了格式，进行字值格式化
	 row.cells[j].innerHTML = formatNumber(Expression(row,expn), format);
	}else{
	 row.cells[j].innerHTML = Expression(row,expn);
	}
   }

}
}

//计算需要运算的字段
function Expression(row, expn){
var rowData = GetRowData(row);
//循环代值计算
for(var j=0;j<row.cells.length; j++){
   name = row.parentNode.rows[0].cells[j].getAttribute("Name");
   if(name){
	var reg = new RegExp(name, "i");
	expn = expn.replace(reg, rowData[name].replace(/\,/g, ""));
   }
}
return eval(expn);
}

function formatNumber(num,pattern){
var strarr = num?num.toString().split('.'):['0'];
var fmtarr = pattern?pattern.split('.'):[''];
var retstr='';

// 整数部分
var str = strarr[0];
var fmt = fmtarr[0];
var i = str.length-1;
var comma = false;
for(var f=fmt.length-1;f>=0;f--){
	switch(fmt.substr(f,1)){
	  case '#':
		if(i>=0 ) retstr = str.substr(i--,1) + retstr;
		break;
	  case '0':
		if(i>=0) retstr = str.substr(i--,1) + retstr;
		else retstr = '0' + retstr;
		break;
	  case ',':
		comma = true;
		retstr=','+retstr;
		break;
	}
}
if(i>=0){
	if(comma){
	  var l = str.length;
	  for(;i>=0;i--){
		retstr = str.substr(i,1) + retstr;
		if(i>0 && ((l-i)%3)==0) retstr = ',' + retstr;
	  }
	}
	else retstr = str.substr(0,i+1) + retstr;
}

retstr = retstr+'.';
// 处理小数部分
str=strarr.length>1?strarr[1]:'';
fmt=fmtarr.length>1?fmtarr[1]:'';
i=0;
for(var f=0;f<fmt.length;f++){
	switch(fmt.substr(f,1)){
	  case '#':
		if(i<str.length) retstr+=str.substr(i++,1);
		break;
	  case '0':
		if(i<str.length) retstr+= str.substr(i++,1);
		else retstr+='0';
		break;
	}
}
return retstr.replace(/^,+/,'').replace(/\.$/,'');
}