<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
<title>支付</title>
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
				<p>The quick brown <span>fox jumps over a lazy dog. DJs flock by when MTV ax quiz prog.</span></p>	
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
				      <li class="active grid"><a  href="index.html"><s:property value="#anime.name"/></a>
					    <div class="megapanel">
						<div class="row">
						<s:iterator var="animeName" value="#anime.animeNames">
							<s:if test="#animeName != null">
							<div class="col1">
								<div class="h_nav">
								
									<ul>
										
										<li><a href="store.html"><s:property value="#animeName.name"/></a></li>
										
										
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
						<h6 >Shopping cart:
						<span class="item">3 items</span>
						<span class="rate">70$</span>
						<li><a href="#" class="round"> </a>
						<ul class="sub-icon1 list">
						  <h3>Recently added items(3)</h3>
						  <div class="shopping_cart">
							  <div class="cart_box">
							   	 <div class="message">
							   	     <div class="alert-close"> </div> 
										<div class="list_img"><img src="images/si.jpg" class="img-responsive" alt=""></div>
										<div class="list_desc"><h4><a href="#">velit esse molestie</a></h4>
										
										<a href="#" class="offer">1 offer applied</a>
										</div>
		                              <div class="clearfix"></div>
	                              </div>
	                            </div>
	                           <div class="cart_box">
							   	 <div class="message1">
							   	     <div class="alert-close1"> </div> 
										<div class="list_img"><img src="images/si1.jpg" class="img-responsive" alt=""></div>
										<div class="list_desc"><h4><a href="#">velit esse molestie</a></h4>
										
										<a href="#" class="offer">1 offer applied</a>
										</div>
		                              <div class="clearfix"></div>
	                              </div>
	                            </div>
								<div class="cart_box">
							   	 <div class="message2">
							   	     <div class="alert-close2"> </div> 
										<div class="list_img"><img src="images/si.jpg" class="img-responsive" alt=""></div>
										<div class="list_desc"><h4><a href="#">velit esse molestie</a></h4>
										
										<a href="#" class="offer">1 offer applied</a>
										</div>
		                              <div class="clearfix"></div>
	                              </div>
	                            </div>
	                        </div>
							  <div class="check_button"><a href="cart.html">View Cart</a></div>
					      <div class="clearfix"></div>
						</ul>
					</li>
</h6>
						
					</div>
			<div class="clearfix"> </div>
		</div>
		<div class="page"> </div>
		
	<div class="content">
		
		
		
		
			<p>
							选择银行：<br/>
							<input type="radio" name="pd_FrpId" value="ICBC-NET-B2C" checked="checked"/>工商银行
							<img src="${pageContext.request.contextPath}/bank_img/icbc.bmp" align="middle"/>&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="pd_FrpId" value="BOC-NET-B2C"/>中国银行
							<img src="${pageContext.request.contextPath}/bank_img/bc.bmp" align="middle"/>&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="pd_FrpId" value="ABC-NET-B2C"/>农业银行
							<img src="${pageContext.request.contextPath}/bank_img/abc.bmp" align="middle"/>
							<br/>
							<input type="radio" name="pd_FrpId" value="BOCO-NET-B2C"/>交通银行
							<img src="${pageContext.request.contextPath}/bank_img/bcc.bmp" align="middle"/>&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="pd_FrpId" value="PINGANBANK-NET"/>平安银行
							<img src="${pageContext.request.contextPath}/bank_img/pingan.bmp" align="middle"/>&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="pd_FrpId" value="CCB-NET-B2C"/>建设银行
							<img src="${pageContext.request.contextPath}/bank_img/ccb.bmp" align="middle"/>
							<br/>
							<input type="radio" name="pd_FrpId" value="CEB-NET-B2C"/>光大银行
							<img src="${pageContext.request.contextPath}/bank_img/guangda.bmp" align="middle"/>&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="pd_FrpId" value="CMBCHINA-NET-B2C"/>招商银行
							<img src="${pageContext.request.contextPath}/bank_img/cmb.bmp" align="middle"/>
						</p>
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
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