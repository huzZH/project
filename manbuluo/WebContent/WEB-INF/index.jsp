<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<title>动漫周边商城</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
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

<script>

	$(function(){
		$('.clo').each(function(i) {
			var m = ".message" + i;
			var n = ".cartInfoId" + i;
			
			
			$(this).on('click', function() {
				var value = $(n).val();
				
				$.ajax({
					url:"cartAction_deleteSingleCart.action",
					data:{cartInfoId:value},
					type:"post",
					dataType:"json",
					success:function(data){
						alert(data.message);
					},
					fail:function(){
						alert("失败！"); 
					}
				});
				$(m).fadeOut('slow', function(c){
			  		$(m).remove();
			  		
				});
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

</head>
<body> 
<!--header-->
	<div class="container">

	<%@ include file="top.jsp" %>

		<div class="content">

			<div class="col-md-9">
			<div class="shoe">
				<img class="img-responsive" src="images/banner.jpg" alt="" >
				<div class="shop">
					<h4>SHOP <span>WOMEN</span></h4>
					<p>SHOES FALL 2014</p>
				</div>
			</div>
				<div class="content-bottom">
					<h3>热销商品</h3>
					
		
					<div class="bottom-grid">
						<s:iterator var="hotProduct" value="hotProduct1">
							<div class="col-md-4 shirt">
								<div class="bottom-grid-top">
									<a  href="indexAction_jumpProductDetail.action?pid=<s:property value="#hotProduct.id"/>" target="_blank"><img style="width: 175px;height:144px;" class="img-responsive" src="<s:property value="#hotProduct.image"/>" alt="" >
									<%-- <div class="five">
										<h6 >-<s:property value="#hotProduct.discount *100"/>%</h6>
									</div> --%>
									<div class="pre">
										<p><s:property value="#hotProduct.name"/></p>
										
										<s:iterator var="productPrice" value="#hotProduct.productPrices" status="status" >
											<%-- <s:if test="#productPrice != null"> --%>
											<s:if test="#status.getIndex() == 0">
												<span>$<s:property value="#productPrice.present_price"/></span>
											</s:if>
										</s:iterator>
										
										<div class="clearfix"> </div>
									</div></a>
									
									
								</div> 
							</div>
						</s:iterator>
						<div class="clearfix"> </div>
		
					</div>
					
					
					
					
					<div class="bottom-grid">
						<s:iterator var="hotProduct" value="hotProduct2">
							<div class="col-md-4 shirt">
								<div class="bottom-grid-top">
									<a  href="indexAction_jumpProductDetail.action?pid=<s:property value="#hotProduct.id"/>" target="_blank"><img alt="图片未加载" style="width: 175px;height:144px;" class="img-responsive" src="<s:property value="#hotProduct.image"/>" alt="" >
									<!-- <div class="five">
										<h6 >-50%</h6>
									</div> -->
									<div class="pre">
										<p><s:property value="#hotProduct.name"/></p>
										<s:iterator var="productPrice" value="#hotProduct.productPrices" status="status" >
											<%-- <s:if test="#productPrice != null"> --%>
											<s:if test="#status.getIndex() == 0">
												<span>$<s:property value="#productPrice.present_price"/></span>
											</s:if>
										</s:iterator>
										<div class="clearfix"> </div>
									</div></a>
									
									
								</div>
							</div>
						</s:iterator>
						<div class="clearfix"> </div>
		
					</div>
		
				</div>
	
	
	
	
	
	<div class="content-bottom">
					<h3>最新商品</h3>
					
		
					<div class="bottom-grid">
						<s:iterator var="newProduct" value="newProduct1">
							<div class="col-md-4 shirt">
								<div class="bottom-grid-top">
									<a  href="indexAction_jumpProductDetail.action?pid=<s:property value="#newProduct.id"/>"><img alt="图片未加载" style="width: 175px;height:144px;" class="img-responsive" src="<s:property value="#newProduct.image"/>" alt="" >
									<%-- <div class="five">
										<h6 >-<s:property value="#hotProduct.discount *100"/>%</h6>
									</div> --%>
									<div class="pre">
										<p><s:property value="#newProduct.name"/></p>
										
										
										<%-- <s:iterator var="productPrice" value="#hotProduct.productPrices" status="status" >
											<s:if test="#productPrice != null">
											<s:if test="#status.getIndex() == 0">
												<span>$<s:property value="#productPrice.present_price"/></span>
											</s:if>
										</s:iterator> --%>
										
										
										<s:iterator var="productPrice" value="#newProduct.productPrices" status="status">
											<s:if test="#status.getIndex() == 0">
												<span>$<s:property value="#productPrice.present_price"/></span>
											</s:if>
										</s:iterator>
										<div class="clearfix"> </div>
									</div></a>
									
									
								</div> 
							</div>
						</s:iterator>
						<div class="clearfix"> </div>
		
					</div>
					
					
					
					
					<div class="bottom-grid">
						<s:iterator var="newProduct" value="newProduct2">
							<div class="col-md-4 shirt">
								<div class="bottom-grid-top">
									<a href="indexAction_jumpProductDetail.action?pid=<s:property value="#newProduct.id"/>"><img style="width: 175px;height:144px;" class="img-responsive" src="<s:property value="#newProduct.image"/>" alt="" >
									<!-- <div class="five">
										<h6 >-50%</h6>
									</div> -->
									<div class="pre">
										<p><s:property value="#newProduct.name"/></p>
										<s:iterator var="productPrice" value="#newProduct.productPrices" status="status">
											<s:if test="#status.getIndex() == 0">
												<span>$<s:property value="#productPrice.present_price"/></span>
											</s:if>
										</s:iterator>
										<div class="clearfix"> </div>
									</div></a>
									
									
								</div>
							</div>
						</s:iterator>
						<div class="clearfix"> </div>
		
					</div>
		
				</div>
	
	
	
	
	
	
	
	
	
			
			</div>

			<div class="col-md-3 col-md">
			<div class=" possible-about">
					<h4>分类</h4>
					<s:iterator var="animeCategory" value="animeCategorys">
					
					
						<div class="tab1">
							<ul class="place">
								
								<%-- <li class="sort">Sort by <span>price</span></li> --%>
								<li class="sort" style="text-align: center;"><a href="productAction_findByACid.action?acId=<s:property value="#animeCategory.id"/>&page=1"><s:property value="#animeCategory.name"/></a></li>
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
	</div>
	<!---->
</body>
</html>