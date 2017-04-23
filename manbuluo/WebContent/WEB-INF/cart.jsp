<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
<title>Cart</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/myCart.css" rel="stylesheet" type="text/css" media="all" />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/jquery.min.js"></script>
<script src="js/myCart.js"></script>
<!-- Custom Theme files -->
<!--theme-style-->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />	
<!--//theme-style-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Mihstore Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!--fonts-->
<!-- <link href='http://fonts.useso.com/css?family=Cabin:400,500,600,700' rel='stylesheet' type='text/css'> -->
<!--//fonts-->
<!--//slider-script-->
<script>$(document).ready(function(c) {
	$('.alert-close').on('click', function(c){
		$('.message').fadeOut('slow', function(c){
	  		$('.message').remove();
		});
	});	  
});
</script>
<script>$(document).ready(function(c) {
	$('.alert-close1').on('click', function(c){
		$('.message1').fadeOut('slow', function(c){
	  		$('.message1').remove();
		});
	});	  
});
</script>
<script>$(document).ready(function(c) {
	$('.alert-close2').on('click', function(c){
		$('.message2').fadeOut('slow', function(c){
	  		$('.message2').remove();
		});
	});	  
});
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
		<%@ include file="top.jsp" %>
		<div class="page"> </div>
		
		<div class="content">
		
			<!-- <div class="container"> -->
			<div>
			<form action="" method="post" name="myform" >
			<table width="100%" border="0" cellspacing="0" cellpadding="0" id="shopping" class="myCartForm">
				 
				 
				  <tr class="bottomRow">
				    <td class="title_1"><input id="allCheckBox" type="checkbox" value="" onclick="selectAll()" />全选</td>
				    <td class="title_2" colspan="2">商品名称</td>
				    <td class="title_3">获积分</td>
				    <td class="title_4">单价（元）</td>
				    <td class="title_5">数量</td>
				    <td class="title_6">小计（元）</td>
				    <td class="title_7">操作</td>
				  </tr>
					
					<s:if test="cartInfo != null">
					   <tr id="product1" style="margin-top: 5px;">
					   		<input type="hidden" name="list[0].id" class="product<s:property value="#status.index + 1"/>" value="<s:property value="cartInfo.id"/>">
						    <td class="cart_td_1"><input name="cartCheckBox" type="checkbox" value="product1" onclick="selectSingle()" /></td>
						    <td class="cart_td_2"><img src="<s:property value="cartInfo.productImage"/>" alt="shopping" style="width:80px;height: 80px;"/></td>
						    <td class="cart_td_3"><a href="#"><s:property value="cartInfo.productName"/></a><br />
						        颜色：棕色 尺码：37<br />
						        保障：<img src="images/taobao_icon_01.jpg" alt="icon" /></td>
						    <td class="cart_td_4">5</td>
						    <td class="cart_td_5"><s:property value="cartInfo.unitPrice"/></td>
						    <td class="cart_td_6"><img src="images/taobao_minus.jpg" alt="minus" onclick="changeNum('num_1','minus')" class="hand"/> <input id="num_1" name="list[0].quantity" type="text"  value="<s:property value="cartInfo.quantity"/>" class="num_input" readonly="readonly"/> <img src="images/taobao_adding.jpg" alt="add" onclick="changeNum('num_1','add')"  class="hand"/></td>
						    <td class="cart_td_7"></td>
						    <td class="cart_td_8"><a href="javascript:deleteRow('product1','<s:property value="cartInfo.id"/>');">删除</a></td>
					   </tr>
					   
					    <tr class="bottomRow">
						    <td  colspan="3"><a href="javascript:deleteSelectRow()"><img src="images/taobao_del.jpg" alt="delete"/></a></td>
						    <td colspan="5" class="shopend">商品总价（不含运费）：<label id="total" class="yellow"></label> 元<br />
						    	可获积分 <label class="yellow" id="integral"></label> 点<br />
						    <input name=" " type="image" src="images/taobao_subtn.jpg" onclick="submitCart();"/>
						    </td>
				  		</tr>
					   
				  </s:if>
				  
				 
				
				  
				</table>
				</form>
			</div>
			
				<div class="cartNull"">
					<div style="margin-left: 0px;padding-left: 100px;"><a href="indexAction_index.action">
						<img alt="" src="images/cartNull.png"></a>
					</div>
				</div>
			
			<!-- <div class="check-out">
	    	    <h4 class="title">Shopping cart is empty</h4>
	    	    <p class="cart-out">You have no items in your shopping cart.<br>Click<a href="index.html"> here</a> to continue shopping</p>
	    	</div> -->

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