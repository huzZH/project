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
			alert("�������������Ǵ���0");
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
	
/*�Զ�������Ʒ���ܽ��ܹ���ʡ�Ľ��ͻ���*/
function productCount(){
	var total=0;      //��Ʒ����ܼ�
	var integral=0;   //�ɻ���Ʒ����
	
	var point;      //ÿһ����Ʒ�ĵ�Ʒ����
	var price;     //ÿһ����Ʒ�ĵ���
	var number;    //ÿһ����Ʒ������
	var subtotal;  //ÿһ����Ʒ��С��

     /*����IDΪshopping��������е�����*/
	var myTableTr=document.getElementById("shopping").getElementsByTagName("tr"); 
	if(myTableTr.length>0){
	for(var i=1;i<myTableTr.length;i++){/*��1��ʼ����һ�еı��ⲻ����*/
	    if(myTableTr[i].getElementsByTagName("td").length>2){ //���һ�в�����
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
	 for (var i=oInput.length-1;i>=0;i--){
	   if(oInput[i].checked==true){
		 Index=document.getElementById(oInput[i].value).rowIndex; /*��ȡѡ���е�������*/
		 document.getElementById("shopping").deleteRow(Index);
	     document.getElementById("shopping").deleteRow(Index-1);
	    }
	}
	productCount();
	}



function submitCart() {
	var oInput=document.getElementsByName("cartCheckBox");
	var flag = oInput.length;

	for (var i=oInput.length-1;i>=0;i--){
		   if(oInput[i].checked==true){
			 var value = oInput[i].value;
			 var number = value.substr(value.length -1 , 1);
			 
			 /*var inputValue = $("input[name = 'cartInfoId']").val();*/
			 
			 --flag;
		    }
		}
	if(oInput.length == flag){
		alert("请至少选择一件商品！")
		return false;
	}
	document.myform.action="orderAction_submitCart.action";
	document.myform.submit();
	 
}


