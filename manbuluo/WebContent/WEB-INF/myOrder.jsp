<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
<title>我的订单</title>
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
				<p>公告： 此网站仅为测试！</p>	
			</div>	
			<ul class="header-in">
					<s:if test="#session.existAccount == null">
						<li><a href="indexAction_login.action">登录</a></li>|
						<li><a href="indexAction_register.action">  注册</a></li>|
					</s:if>
						
					<s:else>
						<li><a href="indexAction_index.action">首页</a></li>
						<li><a href="#">欢迎：<s:property value="#session.existAccount.username"/></a> </li>|
						<li><a href="accountAction_exit.action">退出</a></li>|
					</s:else>
				<li ><a href="contact.html" ><s:property value="#nv"/> 联系我们</a></li>
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
			<div class="container" style="width: 90%;margin-top:50px;">
			<div style="margin-bottom:20px;margin-top:-10px;">
				<span style="color:red;font-size:15px;"><h4>所有订单</h4></span>
			</div>
			<s:if test="myOrder != null">
			<s:iterator var="orderInfo" value="myOrder">
			<div style="margin-top:15px">
				<table width="100%" border="0" cellspacing="0" style=" border-collapse:collapse;border: 1px solid rgb(227, 235, 237);" >
				  <tr class="bottomRow" style="border:1px solid #f1f1f1;height:40px;background-color:#f1f1f1 ">
				    <td class="title_1" colspan="2" style="text-align: left;padding-left: 10px;">
				    	<label>
				    		<span>
				    			<input type="checkbox" disabled="disabled" style="cursor: default;">
				    		</span>
				    		
				    		<span><s:date name="#orderInfo.addTime" format="yyyy-MM-dd" /></span>
				    	</label>
				    	<span style="margin-left: 20px;">订单号:<s:property value="#orderInfo.orderNumber"/> </span>
				    </td>
				    <td style="text-align: center;">单价</td>
				    
				    <td style="text-align: center;">数量</td>
				    <td style="text-align: center;">实付金额</td>
				    <td style="text-align: center;">订单状态</td>
				  </tr>
				  <tbody>
				 	<s:iterator var="detail" value="#orderInfo.orderDetails" status="status">

				  	<tr>
				  		<td colspan="2" style="padding: 10px;border-bottom: 1px solid #f1f1f1;">
				  			<image src="<s:property value="#detail.image"/>" style="width:80px;height: 80px;">
				  			<span style="padding-left: 30px;"><a target="_blank" href="indexAction_jumpProductDetail.action?pid=<s:property value="#detail.productId"/>"><s:property value="#detail.name"/></a></span>
				  			<input type="hidden" value="<s:property value="#detail.productId"/>">
				  		</td>
				  		 
				  		<td style="padding: 10px;padding-left: 0; text-align: center;border-left:1px solid #f1f1f1;border-bottom: 1px solid #f1f1f1;">$<s:property value="#detail.present_price"/></td>
				  		<td style="padding: 10px; text-align: center;border-left:1px solid #f1f1f1;border-bottom: 1px solid #f1f1f1;"><s:property value="#detail.quantity"/></td>
				  		<s:if test="#status.index==0">
				  		<td style="padding: 10px; text-align: center;border-left:1px solid #f1f1f1;"><s:property value="#orderInfo.totalAmount"/></td>
				  		</s:if>
				  		<s:else>
				  			<td style="padding: 10px; text-align: center;border-left:1px solid #f1f1f1;"></td>
				  		</s:else>
				  		<s:if test="#status.index==0">
					  		<s:if test="#orderInfo.orderStatus == 0">
					  			<td style="padding: 10px; text-align: center;border-left:1px solid #f1f1f1;">未支付</td>
					  		</s:if>
					  		<s:elseif test="#orderInfo.orderStatus == 1">
					  			<td style="padding: 10px; text-align: center;border-left:1px solid #f1f1f1;">已支付</td>
					  		</s:elseif>
					  		<s:elseif test="#orderInfo.orderStatus == 2">
					  			<td style="padding: 10px; text-align: center;border-left:1px solid #f1f1f1;">未收货</td>
					  		</s:elseif>
					  		<s:elseif test="#orderInfo.orderStatus == 3">
					  			<td style="padding: 10px; text-align: center;border-left:1px solid #f1f1f1;">已收货</td>
					  		</s:elseif>
				  		</s:if>
				  		<s:else>
					  			<td style="padding: 10px; text-align: center;border-left:1px solid #f1f1f1;"></td>
					  	</s:else>
				  	</tr>
				  	</s:iterator>
				  </tbody>
				  </table>
				  
				  </div>
		</s:iterator>
		</s:if>
		<s:else>
			<div style="height:300px;border:1px solid #f1f1f1;margin-bottom: 50px;background-color: #f1f1f1; border-radius:50px;justify-content:center;align-items:center;display:-webkit-flex;">
				<div">
					<span>
						<h4><s:property value="message"/></h4>
					</span>
				</div>
			</div>
			</s:else>
			</div>
			
			
				

		</div>

		<div class="footer">
			<p class="footer-class">Copyright &copy; 2015.Company name All rights reserved.More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></p>
			
				<a href="#home" class="scroll to-Top" >  GO TO TOP!</a>
		<div class="clearfix"> </div>
		</div>
	</div>

	<!---->
</body>
</html>