<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
<title>创建订单</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/myCart.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/test.css" rel="stylesheet" type="text/css" media="all" />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/jquery.min.js"></script>

<!-- Custom Theme files -->
<!--theme-style-->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />	
<!--//theme-style-->
<meta http-equiv="charset" content="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Mihstore Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!--fonts-->
<!-- <link href='http://fonts.useso.com/css?family=Cabin:400,500,600,700' rel='stylesheet' type='text/css'> -->
<!--//fonts-->
<!--//slider-script-->


<script language="JavaScript" type="text/javascript">  
//|------------------------------------------------------------------------------------  
//|  
//| 说明：JS弹出全屏遮盖的对话框(弹出层后面有遮盖效果，兼容主流浏览器)  
//|       实现了在最大化、拖动改变窗口大小和拖动滚动条时都可居中显示。  
//|  
//| 注意：主要使用EV_modeAlert和EV_closeAlert这两个函数行了；  
//|       (EV_modeAlert-弹出对话框，EV_closeAlert-关闭对话框)；  
//|       注意：使用时，请在body标签内(不要在其它元素内)写一div，  
//|       再给这div赋一id属性，如：id="myMsgBox"，  
//|       然后就可以调用EV_modeAlert('myMsgBox')来显示了。  
//|       还有，请给你这div设置css：display:none让它在开始时不显示。  
//|  
//| 作者：E旺，QQ：407542585，Blog：http://blog.csdn.net/envon123，(新手)  
//|  
//|------------------------------------------------------------------------------------  
//|  
//用来记录要显示的DIV的ID值  
var EV_MsgBox_ID=""; //重要  
  
//弹出对话窗口(msgID-要显示的div的id)  
function EV_modeAlert(msgID){  
    //创建大大的背景框  
    var bgObj=document.createElement("div");  
    bgObj.setAttribute('id','EV_bgModeAlertDiv');  
    document.body.appendChild(bgObj);  
    //背景框满窗口显示  
    EV_Show_bgDiv();  
    //把要显示的div居中显示  
    EV_MsgBox_ID=msgID;  
    EV_Show_msgDiv();  
}  
  
//关闭对话窗口  
function EV_closeAlert(){  
    var msgObj=document.getElementById(EV_MsgBox_ID);  
    var bgObj=document.getElementById("EV_bgModeAlertDiv");  
    msgObj.style.display="none";  
    document.body.removeChild(bgObj);  
    EV_MsgBox_ID="";  
}  
  
//窗口大小改变时更正显示大小和位置  
window.onresize=function(){  
    if (EV_MsgBox_ID.length>0){  
        EV_Show_bgDiv();  
        EV_Show_msgDiv();  
    }  
}  
  
//窗口滚动条拖动时更正显示大小和位置  
window.onscroll=function(){  
    if (EV_MsgBox_ID.length>0){  
        EV_Show_bgDiv();  
        EV_Show_msgDiv();  
    }  
}  
  
//把要显示的div居中显示  
function EV_Show_msgDiv(){  
    var msgObj   = document.getElementById(EV_MsgBox_ID);  
    msgObj.style.display  = "block";  
    var msgWidth = msgObj.scrollWidth;  
//    var msgHeight= msgObj.scrollHeight;  
    var msgHeight= "500";  
    var bgTop=EV_myScrollTop();  
    var bgLeft=EV_myScrollLeft();  
    var bgWidth=EV_myClientWidth();  
    var bgHeight=EV_myClientHeight();  
    var msgTop=bgTop+Math.round((bgHeight-msgHeight)/2);  
    var msgLeft=bgLeft+Math.round((bgWidth-msgWidth)/2);  
    msgObj.style.position = "absolute";  
    msgObj.style.top      = msgTop+"px";  
    msgObj.style.left     = msgLeft+"px";  
    msgObj.style.height    = msgHeight + "px";
    msgObj.style.zIndex   = "10001";  
      
}  
//背景框满窗口显示  
function EV_Show_bgDiv(){  
    var bgObj=document.getElementById("EV_bgModeAlertDiv");  
    var bgWidth=EV_myClientWidth();  
    var bgHeight=EV_myClientHeight(); 
    var bgTop=EV_myScrollTop();  
    var bgLeft=EV_myScrollLeft();  
    bgObj.style.position   = "absolute";  
    bgObj.style.top        = bgTop+"px";  
    bgObj.style.left       = bgLeft+"px";  
    bgObj.style.width      = bgWidth + "px";  
    bgObj.style.height     = bgHeight + "px";  
    bgObj.style.zIndex     = "10000";  
    bgObj.style.background = "#777";  
    bgObj.style.filter     = "progid:DXImageTransform.Microsoft.Alpha(style=0,opacity=60,finishOpacity=60);";  
    bgObj.style.opacity    = "0.6";  
}  
//网页被卷去的上高度  
function EV_myScrollTop(){  
    var n=window.pageYOffset   
    || document.documentElement.scrollTop   
    || document.body.scrollTop || 0;  
    return n;  
}  
//网页被卷去的左宽度  
function EV_myScrollLeft(){  
    var n=window.pageXOffset   
    || document.documentElement.scrollLeft   
    || document.body.scrollLeft || 0;  
    return n;  
}  
//网页可见区域宽  
function EV_myClientWidth(){  
    var n=document.documentElement.clientWidth   
    || document.body.clientWidth || 0;  
    return n;  
}  
//网页可见区域高  
function EV_myClientHeight(){  
    var n=document.documentElement.clientHeight   
    || document.body.clientHeight || 0;  
    return n;  
}  
</script>  




<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
<script type="text/javascript">
					jQuery(document).ready(function($) {
						$(".scroll").click(function(event){		
							event.preventDefault();
							$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
						});
					});
				</script>
				<!-- start menu -->
<link href="css/megamenu.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="js/megamenu.js"></script>
<script>$(document).ready(function(){$(".megamenu").megamenu();});</script>		

<script>
	$(function() {
		
//		$.find("input[name='radio']:checked");
		/* var send;
		var contact;
		var slipAddress = $("input[name='address']:checked").val(); */
		/*  $('.send').html();
		$('.contact').html(); */
		
		
		
		$(':radio').click(function() {
			var label = $("input[name='slipaddress']:checked").next();
			var value = $(label).html();
			var a = value.split("&nbsp;&nbsp;&nbsp;&nbsp;");
			var first = a[0] + "&nbsp;&nbsp;" + a[1];
			var second = a[2] + "&nbsp;&nbsp;&nbsp;&nbsp;" + a[3];
			$('#send').html(first);
			$('#contact').html(second);
			$("input[name='address']").val(first);
			$("input[name='consignee']").val(a[2]);
			$("input[name='mobil']").val(a[3]);
			
			
			var bank = $("input[name='pd_FrpId']:checked").val();
			$('#pd_FrpId').val(bank);
			
		});
		
		var bank = $("input[name='pd_FrpId']:checked").val();
		$('#pd_FrpId').val(bank);
		
		var label = $("input[name='slipaddress']:checked").next();
		if(label.length != 0) {
			var value = $(label).html();
			var a = value.split("&nbsp;&nbsp;&nbsp;&nbsp;");
			var first = a[0] + "&nbsp;&nbsp;" + a[1];
			var second = a[2] + "&nbsp;&nbsp;&nbsp;&nbsp;" + a[3];
			$('#send').html(first);
			$('#contact').html(second);
			$("input[name='address']").val(first);
			$("input[name='consignee']").val(a[2]);
			$("input[name='mobil']").val(a[3]);
		}
		
		
//		$('#send').html("安徽省合肥市经济技术开发区1688号")
		
		$(addressForm).submit(function() {
			alert("进来了")
			$.ajax({
				url:"orderAction_addSlippingAddress.action",
				data:{formData:$('.addressForm').serialize()},
				type:"post",
				dataType:"json",
				async:false,
				cache:false,
				/* beforeSend:function() {
					alert("发送数据前。。。。")
				}, */
				success:function(data){
					var send = data.region + "    " + data.detailAddress;
					var contact = data.consignee + "    " + data.mobil;
					 $('#send').html(send);
					 $('#contact').html(contact);
					var address = data.region + data.detailAddress + "      (" + data.consignee + " 收)      " + data.mobil; 
					var html = "<li style='line-height: 24px;padding-left: 75px;    border: 1px solid #fff;'><div><input name='slipaddress' checked='checked' type='radio'><label style='line-height: 24px;'>" + address + "</label></div></li>";
					$('.showAddress').before(html);
					$("input[name='address']").val(data.region + data.detailAddress );
					$("input[name='consignee']").val(data.consignee);
					$("input[name='mobil']").val(data.mobil);
					EV_closeAlert();
				},
				error:function(){
					alert("失败！！！");
				}
			});
			return false;
			
		});
		
		
		
		
		
		
		var total=0;      
		var integral=0;   
		
		var point;      
		var price;     
		var number;    
		var subtotal;  

		var myTableTr=document.getElementById("shopping").getElementsByTagName("tr"); 
		if(myTableTr.length>0){
		for(var i=2;i<myTableTr.length;i++){
		    if(myTableTr[i].getElementsByTagName("td").length>2){ 
			point=myTableTr[i].getElementsByTagName("td")[2].innerHTML; 
			price=myTableTr[i].getElementsByTagName("td")[3].innerHTML;
			number=myTableTr[i].getElementsByTagName("td")[4].innerHTML;
			integral+=point*number;
			total+=price*number;
			}
		}
		$('.total').html(total);
		document.getElementById("total").innerHTML=total;
		document.getElementById("integral").innerHTML=integral;
		
		}
	})

	
	function cancelSubmit() {
		if(confirm("确认关闭吗？此操作不可恢复！")) {
			EV_closeAlert();
		}
	}
	
	function submitOrder() {
		
		document.orderform.action = "orderAction_submitOrder.action";
		document.orderform.submit();
	}
</script>
<style type="text/css">

#menu {
	border-color:red;
	border: 1px solid #ccc;
	/* height:100px; */
	
}

#menu li { 
float:left; /* 往左浮动 */
list-style: none;
padding:0;
margin-top:20px;
display: block;

}
</style>



</head>
<body> 
<!--header-->
	<div class="container">
		<div class="header" id="home">	
			<div class="header-para">
				<p>公告： <span>此网站仅为测试！</span></p>	
			</div>	
			<ul class="header-in">
					<s:if test="#session.existAccount == null">
						<li><a href="indexAction_login.action">登录</a></li>|
						<li><a href="indexAction_register.action">  注册</a></li>|
					</s:if>
						
					<s:else>
						<li><a href="indexAction_index.action">首页</a></li>
						<li><a target="_blank"  href="accountAction_findMember.action">欢迎：<s:property value="#session.existAccount.username"/></a> </li><span style="color: #ababab;margin-left: -4px;margin-right: -4px;">|</span>
						<li><a target="_blank"  href="orderAction_myOrder.action" ><s:property value="#nv"/> 我的订单</a></li><span style="color: #ababab;margin-left: -4px;margin-right: -4px;">|</span>
						<li><a href="accountAction_exit.action">退出</a></li><span style="color: #ababab;margin-left: -4px;margin-right: -4px;">|</span>
					</s:else>
				<li ><a target="_blank" href="contact.html" ><s:property value="#nv"/> 联系我们</a></li>
			</ul>
			<div class="clearfix"> </div>
		</div>


		<div class="page"> </div>
		
	<div class="content">
			
			<div class="container addConfim" style="width: 90%;">
				<form>
					<h4 style="color:red;border-bottom: 2px solid #f1f1f1;">确认收货地址</h4><br/>
					
					<ul class="showAddress">
					
						<s:if test="slipAddress != null">
							<s:iterator var="address" value="slipAddress" status="status">
								<%-- <input type="hidden" value="<s:property value="#address.region"/> + '  ' +<s:property value="#address.datailAddress"/> "/>
								<input type="hidden" value="<s:property value="#address.consignee"/> + '    ' + <s:property value="#address.mobil"/>"/> --%>
									<li  style="line-height: 24px;     padding-left: 75px;    border: 1px solid #fff;">
										<div>
											<s:if test="#status.index == 0">
												<input name="slipaddress" checked="checked" type="radio">
											</s:if>
											<s:else>
												<input name="slipaddress" type="radio">
											</s:else>
											<label style="line-height: 24px;"><s:property value="#address.region"/>&nbsp;&nbsp;&nbsp;&nbsp;<s:property value="#address.detailAddress"/>&nbsp;&nbsp;&nbsp;&nbsp;(<s:property value="#address.consignee"/>收)&nbsp;&nbsp;&nbsp;&nbsp;<s:property value="#address.mobil"/></label>
										</div>
									
									</li>
								
							</s:iterator>
						</s:if>
					</ul>
					<div style="margin-top:5px;">
						<a href="#" onclick="EV_modeAlert('envon')" style="background: url(images/newAddress.png) no-repeat 0 -1px #fff;width:90px;height:25px;display: inline-block;margin-left: 103px;"></a>
					</div>
				</form>
				
			</div>
			
			<div class="content">
				<div class="container addConfim" style="width: 90%;">
					<h4 style="color:red;border-bottom: 2px solid #f1f1f1;">选择银行</h4><br/>
				</div>
				<div class="container addConfim" style="width: 90%;">
					
					<div style="float:left;margin-bottom:15px;">
						<input type="radio" name="pd_FrpId" value="ICBC-NET-B2C" checked="checked"/>工商银行
						<img src="${pageContext.request.contextPath}/bank_img/icbc.bmp" align="middle"/>&nbsp;&nbsp;&nbsp;&nbsp;
					</div>
					<div style="float:left; margin-bottom:15px;">
						<input type="radio" name="pd_FrpId" value="BOC-NET-B2C"/>中国银行
						<img src="${pageContext.request.contextPath}/bank_img/bc.bmp" align="middle"/>&nbsp;&nbsp;&nbsp;&nbsp;
					</div>
					<div style="float:left;margin-bottom:15px;">
						<input type="radio" name="pd_FrpId" value="ABC-NET-B2C"/>农业银行
						<img src="${pageContext.request.contextPath}/bank_img/abc.bmp" align="middle"/>
					</div>
					<br/>
					<div style="clear: both;float:left;margin-bottom:15px;">
						<input type="radio" name="pd_FrpId" value="BOCO-NET-B2C"/>交通银行
						<img src="${pageContext.request.contextPath}/bank_img/bcc.bmp" align="middle"/>&nbsp;&nbsp;&nbsp;&nbsp;
					</div>
					<div style="float:left;margin-bottom:15px;">
						<input type="radio" name="pd_FrpId" value="PINGANBANK-NET"/>平安银行
						<img src="${pageContext.request.contextPath}/bank_img/pingan.bmp" align="middle"/>&nbsp;&nbsp;&nbsp;&nbsp;
					</div>
					<div style="float:left;margin-bottom:15px;">
						<input type="radio" name="pd_FrpId" value="CCB-NET-B2C"/>建设银行
						<img src="${pageContext.request.contextPath}/bank_img/ccb.bmp" align="middle"/>
					</div>
					<br/>
					<div style="clear: both;float:left;margin-bottom:15px;">
						<input type="radio" name="pd_FrpId" value="CEB-NET-B2C"/>光大银行
						<img src="${pageContext.request.contextPath}/bank_img/guangda.bmp" align="middle"/>&nbsp;&nbsp;&nbsp;&nbsp;
					</div>
					<div style="float:left;margin-bottom:15px;">
						<input type="radio" name="pd_FrpId" value="CMBCHINA-NET-B2C"/>招商银行
						<img src="${pageContext.request.contextPath}/bank_img/cmb.bmp" align="middle"/>
					</div>
					
				</div>
			</div>
			
			
			<div id="envon" style=" width:700px; background-color:#FFFFFF; border-radius:10px; border:1px solid #000000; padding:20px; overflow:hidden; display:none;">  
			
        <!-- <a href="javascript:EV_closeAlert()">关闭</a>   -->
        <div style='text-align:center;'>
        <div style='margin:0 auto;text-align: right;'>
        	<button style="margin-top:10px;color:white;background: red;border-radius:50px;width:30px;height:30px;border:0;outline:none" onclick="EV_closeAlert()">X</button>
        </div>
        <div style='margin:0 auto;'>
        	<h4 style="font-size:30px;padding-left: 55px;">新增收货地址</h4>
        </div>
	<div style='margin:0 auto;'>
		<form name="addressForm" class="addressForm" method="post">
			
			<div style="margin-top:20px; ">
				<span style="width:75px;text-align: center;display:inline-block;font-size: 18px;">地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;区</span>
				<input name="region" type="text" style='border-radius:5px;width:200px;height:30px;outline:0px;border:1px solid #CCCCCC;' placeholder="请输入您的所在地区">
			</div>

			<div style="margin-top:20px;">
				<span style="width:75px;text-align: center;display:inline-block;font-size: 18px;">详细地址</span>
				<input name="detailAddress" type="text" style='border-radius:5px;width:200px;height:30px;outline:0px;border:1px solid #CCCCCC;' placeholder="请输入您的详细地址">
			</div>
			<div style="margin-top:20px;">
				<span style="width:75px;text-align: center;display:inline-block;font-size: 18px;">邮政编号</span>
				<input name="postCode" type="text" style='border-radius:5px;width:200px;height:30px;outline:0px;border:1px solid #CCCCCC;' placeholder="请输入您的邮政编号">
			</div>
			<div style="margin-top:20px;">
				<span style="width:75px;text-align: center;display:inline-block;font-size: 18px;">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名</span>
				<input name="consignee" type="text" style='border-radius:5px;width:200px;height:30px;outline:0px;border:1px solid #CCCCCC;' placeholder="请输入您的姓名">
			</div>
			<div style="margin-top:20px;">
				<span style="width:75px;text-align: center;display:inline-block;font-size: 18px;">手&nbsp;&nbsp;机&nbsp;&nbsp;号</span>
				<input name="mobil" type="text" style='border-radius:5px;width:200px;height:30px;outline:0px;border:1px solid #CCCCCC;' placeholder="请输入您的手机号">
			</div>
			
			<div style="margin-top: 20px;"><!-- onclick="submitAddressForm();" -->
				<input class="cancelButton" type="button" value='取消' onclick="cancelSubmit();" style='cursor:pointer; border-radius:5px;background:#31B0D5;color:white;width:120px;height:40px;border:0px;font-size:15px;outline:0px;'/>
				<input class="submitButton" type="submit" value='提交'  style='cursor:pointer;border-radius:5px;background:#31B0D5;color:white;width:120px;height:40px;border:0px;font-size:15px;outline:0px;margin-left:15px;'/></div>
		</form>
	</div>
</div>	 
    </div>  
			

			<div class="container" style="width: 90%;margin-top:50px;">
			<form method="post" name="orderform" >
			<table width="100%" border="0" cellspacing="0" style=" border-collapse:collapse" cellpadding="0" id="shopping" class="myCartForm">
				 <tr >
				 	<td colspan="3" style="padding-left: 8px;padding-bottom: 20px;"><span style="color:red;font-size:15px;"><h4>确认订单信息</h4></span></td>
				 	
				 </tr>
				 
				  <tr class="bottomRow" style="    border-bottom: 2px solid #f1f1f1;">
				    <td class="title_1">商品图片</td>
				    <td class="title_2">商品名称</td>
				    <td class="title_3">获积分</td>
				    <td class="title_4">单价（元）</td>
				    <td class="title_5">数量</td>
				    <td class="title_6">小计（元）</td>
				    
				  </tr>
					<s:property value="#status"/>
					<s:iterator var="cartInfo" value="cartInfoList" status="status">
						<tr>
					   		<td>&nbsp;</td>
					   </tr>
					   <tr id="product<s:property value="#status.index + 1"/>" style="margin-top: 5px;">
					   		<input type="hidden" class="product<s:property value="#status.index + 1"/>" value="<s:property value="#cartInfo.id"/>">
					   		<input type="hidden" name="cartInfoId" value="<s:property value="#cartInfo.id"/>">
					   		<input type="hidden" name="orderList[<s:property value="#status.index"/>].productId" value="<s:property value="#cartInfo.productId"/>">
					   		<input type="hidden" name="orderList[<s:property value="#status.index"/>].name" value="<s:property value="#cartInfo.productName"/>">
					   		<input type="hidden" name="orderList[<s:property value="#status.index"/>].image" value="<s:property value="#cartInfo.productImage"/>">
					   		<input type="hidden" name="orderList[<s:property value="#status.index"/>].quantity" value="<s:property value="#cartInfo.quantity"/>">
					   		<input type="hidden" name="orderList[<s:property value="#status.index"/>].present_price" value="<s:property value="#cartInfo.unitPrice"/>">
						    <td class="cart_td_2"><img src="<s:property value="#cartInfo.productImage"/>" alt="shopping" style="width:80px;height: 80px;"/></td>
						    <td class="cart_td_3" style="text-align: center;"><a target="_blank" href="indexAction_jumpProductDetail.action?pid=<s:property value="#cartInfo.productId"/>"><s:property value="#cartInfo.productName"/></a><br />
						        颜色：棕色 尺码：37<br />
						        保障：<img src="images/taobao_icon_01.jpg" alt="icon" /></td>
						    <td class="cart_td_4">5</td>
						    <td class="cart_td_5"><s:property value="#cartInfo.unitPrice"/></td>
						    <td class="cart_td_6"><s:property value="#cartInfo.quantity"/></td>
						    <td class="cart_td_7"><s:property value="#cartInfo.unitPrice * #cartInfo.quantity"/></td>
					   </tr>
					   
					  </s:iterator> 
				    <tr class="bottomRow">
					    <td  colspan="2"><!-- <a href="javascript:deleteSelectRow()"><img src="images/taobao_del.jpg" alt="delete"/></a> --></td>
					    <td colspan="6" class="shopend">商品总价：<label id="total" class="yellow"></label> 元<br />
					    	<!-- 可获积分 <label class="yellow" id="integral"></label> 点<br /> -->
					   
					    </td>
			  		</tr>
				  	
				  	<tr class="bottomRow" >
						    <td  colspan="2"><!-- <a href="javascript:deleteSelectRow()"><img src="images/taobao_del.jpg" alt="delete"/></a> --></td>
						    <td style="border:1px solid red;" colspan="5" class="shopend">实付款：<label class="total" class="yellow" style="color:#fe6400;font-size:13px;"></label> 元<br />
						    	寄送至： <label class="yellow" id="send" style="font-size:12px;line-height:20px;" id="send"></label><br />
						    			<input type="hidden" name="address">
						    			<input type="hidden" name="consignee">
						    			<input type="hidden" name="mobil">
						    			<input type="hidden" name="pd_FrpId" id="pd_FrpId">
						    	收货人： <label class="yellow" id="contact" style="font-size:12px;" id="contact"></label> <br />
						    <input name=" " type="image" src="images/taobao_subtn.jpg" onclick="submitOrder();" />
						    </td>
				  		</tr>
					   
				  
				</table>
				</form>
			</div>

		</div>
		<!---->
		<div class="footer">
			<p class="footer-class">Copyright &copy; 2015.Company name All rights reserved.More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></p>
			
				<a href="#home" class="scroll to-Top" >  GO TO TOP!</a>
		<div class="clearfix"> </div>
		</div>
	</div>

	<!---->
</body>
</html>