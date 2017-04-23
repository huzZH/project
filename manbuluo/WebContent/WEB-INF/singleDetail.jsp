<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title><s:property value="product.name"/></title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/product.css" rel="stylesheet" type="text/css" media="all" />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/jquery.min.js"></script>
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


<script type="text/javascript">

	$(function(){
		
		$('#increase').click(function(){
			var m = $('#quantity').val();
			m++;
			$('#quantity').val(m);
		})
		$('#decrease').click(function(){
			var m = $('#quantity').val();
			if(m == 1){
				$('#decrease').attr("disabled", true); 
				
			}else{
				m--;
				$('#quantity').val(m);
			}
		})
		
	})
</script>

<script type="text/javascript">
	function submitForm(){   
		/* $("cartForm").append(''); */
		
		document.cartForm.action="cartAction_addCart.action";
		document.cartForm.submit();
	};
	function submitSingle() {
		document.cartForm.action="orderAction_submitSingle.action";
		document.cartForm.submit();
	}
</script>
<link rel="stylesheet" href="css/etalage.css">
<script src="js/jquery.etalage.min.js"></script>
		<script>
			jQuery(document).ready(function($){

				$('#etalage').etalage({
					thumb_image_width: 300,
					thumb_image_height: 400,
					source_image_width: 900,
					source_image_height: 1200,
					show_hint: true,
					click_callback: function(image_anchor, instance_id){
						alert('Callback example:\nYou clicked on an image with the anchor: "'+image_anchor+'"\n(in Etalage instance: "'+instance_id+'")');
					}
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
</head>
<body> 
<!--header-->
	<div class="container">
	<%@ include file="top.jsp" %>
		<div class="page"></div>
		
		<div class="content">

			<div class="col-md-9">
			<div class="col-md-5 single-top">	
						<ul id="etalage">
							<li>
								<a href="optionallink.html">
									<img class="etalage_thumb_image img-responsive" src="<s:property value="product.image"/>" alt="" style="width: 360px;height: 480px;">
									<img class="etalage_source_image img-responsive" src="<s:property value="product.image"/>" alt="" style="width: 360px;height: 480px;">
								</a>
							</li>
						<li>
								<img class="etalage_thumb_image img-responsive" src="images/s2.jpg" alt="" >
								<img class="etalage_source_image img-responsive" src="images/s12.jpg" alt="" >
							</li>
							<li>
								<img class="etalage_thumb_image img-responsive" src="images/s3.jpg" alt=""  >
								<img class="etalage_source_image img-responsive" src="images/s13.jpg" alt="" >
							</li>
						    <li>
								<img class="etalage_thumb_image img-responsive" src="images/s4.jpg"  alt="" >
								<img class="etalage_source_image img-responsive" src="images/s14.jpg" alt="" >
							</li>
						</ul>

					</div>	
					<div class="col-md-7 single-top-in">
						<form name="cartForm" class="cartForm">
						<input type="hidden" name="productId" value="<s:property value="product.id"/>">
						<input type="hidden" name="productImage" value="<s:property value="product.image"/>">
						<div class="single-para">
							<h4 name="name"><s:property value="product.describe"/></h4>
							<input name="productName" type="hidden" value="<s:property value="product.name"/>">
							<div class="para-grid">
								
								<s:iterator var="productPrice" value="product.productPrices" status="status" >
											<s:if test="#status.getIndex() == 0">
												<span class="add-to" name="unitPrice">$<s:property value="#productPrice.present_price"/></span>
												<input type="hidden" name="unitPrice" value="<s:property value="#productPrice.present_price"/>">
											</s:if>
								</s:iterator>
								<a href="javascript:void(0)" onclick="submitForm()" class=" cart-to">加入<img alt="" src="images/cat.png"></a>					
								<div class="clearfix"></div>
							 </div>
							<h5><s:property value="product.number"/> 件库存</h5>
							
							<div class="available">
							<ul>
								
								<%-- <li class="qu"><span style="font-size: 1.2em;">数量:</span></li> --%>
								<li>
									<div><span style="font-size: 1.2em;">数量:</span>
										<span id="increase" class="increase"><img alt="" src="images/increase.png" ></span>
										<input id="quantity" class="quantity" name="quantity" value="1" maxlength="4" onpaste="return false;" type="text" readonly="readonly">
										<span id="decrease" class="decrease"><img alt="" src="images/decrease.png"></span>
									</div>
								</li>
							</ul>
						</div>
							
								<a href="javascript:void(0)" class="cart-an " onclick="submitSingle();">立即购买</a>
							<div class="share">
							<h4>Share Product :</h4>
							<ul class="share_nav">
								<li><a href="#"><img src="images/facebook.png" title="facebook"></a></li>
								<li><a href="#"><img src="images/twitter.png" title="Twiiter"></a></li>
								<li><a href="#"><img src="images/rss.png" title="Rss"></a></li>
								<li><a href="#"><img src="images/gpluse.png" title="Google+"></a></li>
				    		</ul>
						</div>
						</div>
						</form>
					</div>
				<div class="clearfix"> </div>
 			<ul id="flexiselDemo1">
 	
 			<s:iterator var="hotProduct" value="hotProducts">
 				<li><a href="indexAction_jumpProductDetail.action?pid=<s:property value="#hotProduct.id"/>" target="_blank"><img alt="图片未加载" src="<s:property value="#hotProduct.image"/>" style="width:164.59px;height:172px;" /></a><div class="grid-flex"><a href="indexAction_jumpProductDetail.action?pid=<s:property value="#hotProduct.id"/>" target="_blank"><s:property value="#hotProduct.name"/></a></div></li>
 			</s:iterator>
			
		<!-- 	<li><img src="images/pi1.jpg" /><div class="grid-flex"><a href="#">Amet</a><p>Rs 850</p></div></li>
			<li><img src="images/pi2.jpg" /><div class="grid-flex"><a href="#">Simple</a><p>Rs 850</p></div></li>
			<li><img src="images/pi3.jpg" /><div class="grid-flex"><a href="#">Text</a><p>Rs 850</p></div></li>
			<li><img src="images/pi4.jpg" /><div class="grid-flex"><a href="#">Sit</a><p>Rs 850</p></div></li> -->
		 </ul>
	    <script type="text/javascript">
		 $(window).load(function() {
			$("#flexiselDemo1").flexisel({
				visibleItems: 5,
				animationSpeed: 1000,
				autoPlay: true,
				autoPlaySpeed: 3000,    		
				pauseOnHover: true,
				enableResponsiveBreakpoints: true,
		    	responsiveBreakpoints: { 
		    		portrait: { 
		    			changePoint:480,
		    			visibleItems: 1
		    		}, 
		    		landscape: { 
		    			changePoint:640,
		    			visibleItems: 2
		    		},
		    		tablet: { 
		    			changePoint:768,
		    			visibleItems: 3
		    		}
		    	}
		    });
		    
		});
	</script>
	<script type="text/javascript" src="js/jquery.flexisel.js"></script>
<!---->

<!---->
			</div>
<div class="col-md-3 col-md">
			<div class=" possible-about">
					<h4>分类</h4>
					<s:iterator var="animeCategory" value="animeCategorys">
					
					
						<div class="tab1">
							<ul class="place">
								<li class="sort" style="text-align: center;"><a target="_blank" href="productAction_findByACid.action?acId=<s:property value="#animeCategory.id"/>&page=1"><s:property value="#animeCategory.name"/></a></li>
								<!-- <li class="by"><img src="images/do.png" alt=""></li> -->
									<div class="clearfix"> </div>
							</ul>
						</div>
						
						</s:iterator>
					</div>
					<div class="content-bottom-grid">
					<h3>Best Sellers</h3>
					<div class="latest-grid">
						<div class="news">
							<a href="single.html"><img class="img-responsive" src="images/si.jpg" title="name" alt=""></a>
						</div>
						<div class="news-in">
							<h6><a href="single.html">Product name here</a></h6>
							<p>Description Lorem ipsum </p>
							<ul>
								<li>Price: <span>$110</span> </li><b>|</b>
								<li>Country: <span>US</span></li>
							</ul>
						</div>
					<div class="clearfix"> </div>
				</div>
				<div class="latest-grid">
						<div class="news">
							<a href="single.html"><img class="img-responsive" src="images/si1.jpg" title="name" alt=""></a>
						</div>
						<div class="news-in">
							<h6><a href="single.html">Product name here</a></h6>
							<p>Description Lorem ipsum </p>
							<ul>
								<li>Price: <span>$110</span> </li><b>|</b>
								<li>Country: <span>US</span></li>
							</ul>
						</div>
					<div class="clearfix"> </div>
				</div>
				<div class="latest-grid">
						<div class="news">
							<a href="single.html"><img class="img-responsive" src="images/si.jpg" title="name" alt=""></a>
						</div>
						<div class="news-in">
							<h6><a href="single.html">Product name here</a></h6>
							<p>Description Lorem ipsum</p>
							<ul>
								<li>Price: <span>$110</span> </li><b>|</b>
								<li>Country: <span>US</span></li>
							</ul>
						</div>
					<div class="clearfix"> </div>
				</div>
				<div class="latest-grid">
						<div class="news">
							<a href="single.html"><img class="img-responsive" src="images/si1.jpg" title="name" alt=""></a>
						</div>
						<div class="news-in">
							<h6><a href="single.html">Product name here</a></h6>
							<p>Description Lorem ipsum </p>
							<ul>
								<li>Price: <span>$110</span> </li><b>|</b>
								<li>Country: <span>US</span></li>
							</ul>
						</div>
					<div class="clearfix"> </div>
				</div>
					</div>
				<!---->
				<!-- <div class="money">
					<h3>Payment Options</h3>
						<ul class="money-in">
						<li><a href="single.html"><img class="img-responsive" src="images/p1.png" title="name" alt=""></a></li>
						<li><a href="single.html"><img class="img-responsive" src="images/p2.png" title="name" alt=""></a></li>
						<li><a href="single.html"><img class="img-responsive" src="images/p3.png" title="name" alt=""></a></li>
						<li><a href="single.html"><img class="img-responsive" src="images/p4.png" title="name" alt=""></a></li>
						<li><a href="single.html"><img class="img-responsive" src="images/p5.png" title="name" alt=""></a></li>
						<li><a href="single.html"><img class="img-responsive" src="images/p6.png" title="name" alt=""></a></li>
						<li><a href="single.html"><img class="img-responsive" src="images/p1.png" title="name" alt=""></a></li>
						<li><a href="single.html"><img class="img-responsive" src="images/p4.png" title="name" alt=""></a></li>
						<li><a href="single.html"><img class="img-responsive" src="images/p2.png" title="name" alt=""></a></li>

						</ul>
					</div> -->
			</div>
			<div class="clearfix"> </div>
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