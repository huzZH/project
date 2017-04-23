<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
<title>我的购物车</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/myCart.css" rel="stylesheet" type="text/css" media="all" />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/jquery.min.js"></script>
<script src="js/myCart2.js"></script>
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


<script>
/* 	
	$(function() {
		
		$('.cartNull').css('display', '');
	}); */
	
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
		<!---->
		<!-- <div class="header-top">
			<div class="logo">
				<a href="indexAction_index.action"><img src="images/logo.png" alt="" ></a>
			</div>
				<div class="clearfix"> </div>
		</div> -->
		<div class="header-bottom">
				<div class="top-nav">
				
			  <ul class="megamenu skyblue">
			  	<s:iterator var="anime" value="animeNav">
				      <li class="active grid"><a target="_blank" href="productAction_findByCid.action?arId=<s:property value="#anime.id"/>&page=1"><s:property value="#anime.name"/></a>
					    <div class="megapanel">
						<div class="row">
						<s:iterator var="animeName" value="#anime.animeNames">
							<s:if test="#animeName != null">
							<div class="col1">
								<div class="h_nav">
								
									<ul>
										
										<li><a href="productAction_findByANid.action?anId=<s:property value="#animeName.id"/>&page=1"><s:property value="#animeName.name"/></a></li>
										
										
									</ul>	
								</div>							
							</div>
							</s:if>
						</s:iterator>
						  </div>
						</div>
					</li>
				
				</s:iterator>
				
				
								

			  </ul> 
				</div>
					<div class="cart icon1 sub-icon1">
						<h6 >购物车:
						<%-- <s:if test="cartNull == null">
							<span class="item" >3 items</span>
							<span class="rate">70$</span>
						</s:if> --%>
						<li><a href="#" ><img alt="" src="images/cat.png"> </a>
						
						<ul class="sub-icon1 list">
						 <!--  <h3>Recently added items(3)</h3> -->
						  <div class="shopping_cart">
						  
						  	<s:iterator var="cartInfo" value="cartInfos" status="status">
						  		<input class="cartInfoId<s:property value="#status.index"/>" type="hidden" value="<s:property value="#cartInfo.id"/>">
							  <div class="cart_box">
							   	 <div class="message<s:property value="#status.index"/>">
							   	        <div class="clo alert-close<s:property value="#status.index"/>"></div>
										<div class="list_img"><img src="<s:property value="#cartInfo.productImage"/>" class="img-responsive" alt=""></div>
										<div class="list_desc"><h4><a target="_blank" href="indexAction_jumpProductDetail.action?pid=<s:property value="#cartInfo.productId"/>"><s:property value="#cartInfo.productName"/></a></h4>
										
										<a href="#" class="offer">单价：$<s:property value="#cartInfo.unitPrice"/></a>
										</div>
		                              <div class="clearfix"></div>
	                              </div>
	                            </div>
	                            
	                        </s:iterator>
	                            
	                           <s:if test="cartNull != null">
	                           	<div class="cart_box">
							   	 <div class="message">
							   	     &nbsp;&nbsp;&nbsp;&nbsp;<s:property value="cartNull"/>
		                              <div class="clearfix"></div>
	                              </div>
	                            </div>
	                           </s:if>
															
	                        </div>
							  <div class="check_button"><a href="cartAction_myCart?cid=<s:property value="cartInfos[0].cartId"/>">我的购物车</a></div>
					      <div class="clearfix"></div>
						</ul>
					</li>
</h6>
						
					</div>
			<div class="clearfix"> </div>
		</div>
		<div class="page"> </div>
		
	<div class="content">
		<s:if test="carts[0].cartInfos!= null">
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
					<s:property value="#status"/>
					<s:iterator var="cartInfo" value="carts[0].cartInfos" status="status">
						<tr>
					   		<td>&nbsp;</td>
					   </tr>
					   <tr id="product<s:property value="#status.index + 1"/>" style="margin-top: 5px;">
					   		<input type="hidden" class="product<s:property value="#status.index + 1"/>" value="<s:property value="#cartInfo.id"/>">
						    <td class="cart_td_1"><input name="cartCheckBox" type="checkbox" value="product<s:property value="#status.index + 1"/>" onclick="selectSingle()" /></td>
						    <td class="cart_td_2"><img src="<s:property value="#cartInfo.productImage"/>" alt="shopping" style="width:80px;height: 80px;"/></td>
						    <td class="cart_td_3"><a target="_blank" href="indexAction_jumpProductDetail.action?pid=<s:property value="#cartInfo.productId"/>"><s:property value="#cartInfo.productName"/></a><br />
						        颜色：棕色 尺码：37<br />
						        保障：<img src="images/taobao_icon_01.jpg" alt="icon" /></td>
						    <td class="cart_td_4">5</td>
						    <td class="cart_td_5"><s:property value="#cartInfo.unitPrice"/></td>
						    <td class="cart_td_6"><img src="images/taobao_minus.jpg" alt="minus" onclick="changeNum('num_<s:property value="#status.index + 1"/>','minus')" class="hand"/> <input id="num_<s:property value="#status.index + 1"/>" type="text"  value="<s:property value="#cartInfo.quantity"/>" class="num_input quantity<s:property value="#status.index + 1"/>" readonly="readonly"/> <img src="images/taobao_adding.jpg" alt="add" onclick="changeNum('num_<s:property value="#status.index + 1"/>','add')"  class="hand"/></td>
						    <td class="cart_td_7"></td>
						    <td class="cart_td_8"><a href="javascript:deleteRow('product<s:property value="#status.index + 1"/>','<s:property value="#cartInfo.id"/>');">删除</a></td>
					   </tr>
					   
					  </s:iterator> 
					    <tr class="bottomRow">
						    <td  colspan="3"><a href="javascript:deleteSelectRow()"><img src="images/taobao_del.jpg" alt="delete"/></a></td>
						    <td colspan="5" class="shopend">商品总价（不含运费）：<label id="total" class="yellow"></label> 元<br />
						    	可获积分 <label class="yellow" id="integral"></label> 点<br />
						    <input name=" " type="image" src="images/taobao_subtn.jpg" onclick="submitCart();"/>
						    </td>
				  		</tr>
					   
				  
				</table>
				</form>
			</div>
			</s:if>
			<div class="cartNull">
					<div style="margin-left: 0px;padding-left: 100px;"><a href="indexAction_index.action">
						<img alt="" src="images/cartNull.png"></a>
					</div>
				</div>
			<s:else>
				<div >
					<div style="margin-left: 0px;padding-left: 100px;"><a href="indexAction_index.action">
						<img alt="" src="images/cartNull.png"></a>
					</div>
				</div>
			</s:else>
				
			
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