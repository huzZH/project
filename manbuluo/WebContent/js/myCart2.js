// JavaScript Document
$(function(){
	$('.cartNull').css('display','none');
	/*var list = $(".myCartForm table *").not('.bottomRow');
	if(list){
		$('.bottomRow').css('display','none');
		$('.cartNull').css('display','');
	}*/
	
})


/*�ı�������Ʒ������*/
function changeNum(numId,flag){/*numId��ʾ��Ӧ��Ʒ�������ı���ID��flag��ʾ�����ӻ��Ǽ�����Ʒ����*/
	var numId=document.getElementById(numId);
	if(flag=="minus"){/*������Ʒ����*/
		if(numId.value<=1){
			alert("宝贝数量必须是大于0");
			return false;
			}
		else{
			numId.value=parseInt(numId.value)-1;
			productCount();
			}
		}
	else{/*flagΪadd��������Ʒ����*/
		numId.value=parseInt(numId.value)+1;
		productCount();
		}
	}
	
/*自动计算商品的总金额、总共节省的金额和积分*/
function productCount(){
	var total=0;      //商品金额总计
	var integral=0;   //可获商品积分
	
	var point;      //每一行商品的单品积分
	var price;     //每一行商品的单价
	var number;    //每一行商品的数量
	var subtotal;  //每一行商品的小计

     /*访问ID为shopping表格中所有的行数*/
	var myTableTr=document.getElementById("shopping").getElementsByTagName("tr"); 
	if(myTableTr.length>0){
	for(var i=1;i<myTableTr.length;i++){/*从1开始，第一行的标题不计算*/
	    if(myTableTr[i].getElementsByTagName("td").length>2){ //最后一行不计算
		point=myTableTr[i].getElementsByTagName("td")[3].innerHTML; 
		price=myTableTr[i].getElementsByTagName("td")[4].innerHTML;
		number=myTableTr[i].getElementsByTagName("td")[5].getElementsByTagName("input")[0].value;
		integral+=point*number;
		total+=price*number;
		myTableTr[i].getElementsByTagName("td")[6].innerHTML=price*number;
		}
	}
	document.getElementById("total").innerHTML=total;
	document.getElementById("integral").innerHTML=integral;
	
	}
}
window.onload=productCount;

/*��ѡ��ȫѡ��ȫ��ѡЧ��*/
function selectAll(){
	var oInput=document.getElementsByName("cartCheckBox");
 for (var i=0;i<oInput.length;i++){
 	    oInput[i].checked=document.getElementById("allCheckBox").checked;
	}
}
	
/*���ݵ�����ѡ���ѡ�����ȷ��ȫѡ��ѡ���Ƿ�ѡ��*/
function selectSingle(){

	
	var k=0;
	var oInput=document.getElementsByName("cartCheckBox");
	 for (var i=0;i<oInput.length;i++){
	   if(oInput[i].checked==false){
		  k=1;
		  break;
	    }
	}
	if(k==0){
		document.getElementById("allCheckBox").checked=true;
		}
	else{
		document.getElementById("allCheckBox").checked=false;
		}
}

/*ɾ��������Ʒ*/
function deleteRow(rowId,cartInfoId){
	var Index=document.getElementById(rowId).rowIndex; //��ȡ��ǰ�е�������
	document.getElementById("shopping").deleteRow(Index);
	document.getElementById("shopping").deleteRow(Index-1);
	productCount();

//	var list = $(".myCartForm table *").not('.bottomRow');
	var list = $("tr").not('.bottomRow');
	if(list.length == 0){
		$('.bottomRow').css('display','none');
		$('.cartNull').css('display','');
	}
	
	$.ajax({
		url: "cartAction_deleteSingleCart.action",
		data:{cartInfoId:cartInfoId},
		type:"post",
		dataType:"json",
		async:false,
		cache:false ,
		success:function(result){
			alert(result.message);
		}
	});
	
	
}

/*ɾ��ѡ���е���Ʒ*/
function deleteSelectRow(){
	var oInput=document.getElementsByName("cartCheckBox");
	var Index;

	var str = "";
	 for (var i=oInput.length-1;i>=0;i--){
	   if(oInput[i].checked==true){
		 Index=document.getElementById(oInput[i].value).rowIndex; /*获取选中行的索引号*/
		 var value = oInput[i].value;
		 var number = value.substr(value.length -1 , 1);
		 var m = ".product" + number;
		 var cartInfoId = $(m).val();
		 
		 str = str + cartInfoId + ",";

		 document.getElementById("shopping").deleteRow(Index); 
	     document.getElementById("shopping").deleteRow(Index-1);
	    }
	}
	productCount();
	var list = $("tr").not('.bottomRow');
	if(list.length == 0){
		$('.bottomRow').css('display','none');
		$('.cartNull').css('display','');
	}
	
	
	
	$.ajax({
		url: "cartAction_deleteListCart.action",
		data:{listCartInfoId:str},
		type:"post",
		dataType:"json",
		async:false,
		cache:false ,
		success:function(result){
			
		}
	});
}

function submitCart() {
	var oInput=document.getElementsByName("cartCheckBox");
	var flag = oInput.length;
	
	var check = 0;
	for (var i=oInput.length-1;i>=0;i--){
		   if(oInput[i].checked==true){
			 var value = oInput[i].value;
			 var number = value.substr(value.length -1 , 1);
			 var product = ".product" + number;
			 var quantity = ".quantity" + number;
			 $(product).attr('name','list[' + check +'].id');
			 $(quantity).attr('name', 'list[' + check + '].quantity');
			 /*var inputValue = $("input[name = 'cartInfoId']").val();*/
			 var inputValue = $("input[name = 'quantity']").val();
			 --flag;
			 ++check;
		    }
		}
	if(oInput.length == flag){
		alert("请至少选择一件商品！")
		return false;
	}
	document.myform.action="orderAction_submitCart.action";
	document.myform.submit();
	 
}





