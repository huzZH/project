<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags"  prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>商品列表</title>
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

div.pagination a.nextPage {
	width: 18px;
	padding: 0px;
	
	background: url("../images/common.gif") 0px -210px no-repeat;
}

/* div.pagination span.nextPage {
	width: 18px;
	cursor: default;
	border: 1px solid #cccccc;
	background: url("../images/common.gif") -30px -210px no-repeat;
} */

div.pagination a.lastPage {
	width: 18px;
	padding: 0px;
	background: url(../images/common.gif) -60px -210px no-repeat;
}

/* div.pagination span.lastPage {
	width: 18px;
	cursor: default;
	border: 1px solid #cccccc;
	background: url(../images/common.gif) -90px -210px no-repeat;
} */



</style>

	
</head>
<body> 
<!--header-->
	<div class="container">
		<%@ include file="top.jsp" %>
		<div class="content">

		<s:if test="number >0">
		
				<div class="content-bottom store">
					<s:if test="number >0">
					<h3>商品列表</h3>
					</s:if>
					
					<div class="bottom-grid">
					
						<s:if test="number >4">
							<s:iterator var="product" value="pageBean.list" begin="0" end="3">
								<div class="col-md-3 store-top">
									<div class="bottom-grid-top">
										<a href="indexAction_jumpProductDetail.action?pid=<s:property value="#product.id"/>" target="_blank"><img style="width: 175px;height:144px;" alt="图片未加载" class="img-responsive" src="<s:property value="#product.image"/>" alt="" >
										<div class="five">
										
										</div>
										<div class="pre">
											<p><s:property value="#product.name"/></p>
											<s:iterator var="productPrice" value="#product.productPrices" status="status" >
												<s:if test="#status.getIndex() == 0">
													<span>$<s:property value="#productPrice.present_price"/></span>
												</s:if>
											</s:iterator>
											<div class="clearfix"> </div>
										</div></a>
									</div>
								</div>
							</s:iterator>
						</s:if>
						<s:else>
							<s:iterator var="product" value="pageBean.list" begin="0">
								<div class="col-md-3 store-top">
									<div class="bottom-grid-top">
										<a href="indexAction_jumpProductDetail.action?pid=<s:property value="#product.id"/>" target="_blank"><img style="width: 175px;height:144px;" alt="图片未加载" class="img-responsive" src="<s:property value="#product.image"/>" alt="" >
										<div class="five">
										
										</div>
										<div class="pre">
											<p><s:property value="#product.name"/></p>
											
											
											<s:iterator var="productPrice" value="#product.productPrices" status="status" >
												<s:if test="#status.getIndex() == 0">
													<span>$<s:property value="#productPrice.present_price"/></span>
												</s:if>
											</s:iterator>
											
											
											<span>$<s:property value="#product.productPrices[0].present_price"/>   </span>
											<div class="clearfix"> </div>
										</div></a>
									</div>
								</div>
							</s:iterator>
						</s:else>
					<div class="clearfix"> </div>
				</div>
					
					
					<div class="bottom-grid">
						<s:if test="number >= 8">
							<s:iterator var="product" value="pageBean.list" begin="4" end="7">
								<div class="col-md-3 store-top">
									<div class="bottom-grid-top">
										<a href="indexAction_jumpProductDetail.action?pid=<s:property value="#product.id"/>" target="_blank"><img style="width: 175px;height:144px;" alt="图片未加载" class="img-responsive" src="<s:property value="#product.image"/>" alt="" >
										<div class="five">
										
										</div>
										<div class="pre">
											<p><s:property value="#product.name"/></p>
											
											
											<s:iterator var="productPrice" value="#product.productPrices" status="status" >
												<%-- <s:if test="#productPrice != null"> --%>
												<s:if test="#status.getIndex() == 0">
													<span>$<s:property value="#productPrice.present_price"/></span>
												</s:if>
											</s:iterator>
											
											
											<%-- <span>$<s:property value="#product.productPrices[0].present_price"/>   </span> --%>
											<div class="clearfix"> </div>
										</div></a>
									</div>
								</div>
							</s:iterator>
						</s:if>
						<s:else>
							<s:iterator var="product" value="pageBean.list" begin="4">
								<div class="col-md-3 store-top">
									<div class="bottom-grid-top">
										<a href="indexAction_jumpProductDetail.action?pid=<s:property value="#product.id"/>" target="_blank"><img style="width: 175px;height:144px;" alt="图片未加载" class="img-responsive" src="<s:property value="#product.image"/>" alt="" >
										<div class="five">
										
										</div>
										<div class="pre">
											<p><s:property value="#product.name"/></p>
											
											
											<s:iterator var="productPrice" value="#product.productPrices" status="status" >
												<%-- <s:if test="#productPrice != null"> --%>
												<s:if test="#status.getIndex() == 0">
													<span>$<s:property value="#productPrice.present_price"/></span>
												</s:if>
											</s:iterator>
											
											
											<%-- <span>$<s:property value="#product.productPrices[0].present_price"/>   </span> --%>
											<div class="clearfix"> </div>
										</div></a>
									</div>
								</div>
							</s:iterator>
						</s:else>
						<div class="clearfix"> </div>
					</div>
					
					
					<div class="bottom-grid">
						<s:iterator var="product" value="pageBean.list" begin="8">
							<div class="col-md-3 store-top">
								<div class="bottom-grid-top">
									<a href="indexAction_jumpProductDetail.action?pid=<s:property value="#product.id"/>" target="_blank"><img alt="图片未加载" style="width: 175px;height:144px;" class="img-responsive" src="<s:property value="#product.image"/>" alt="" >
									<div class="five">
									
									</div>
									<div class="pre">
										<p><s:property value="#product.name"/></p>
										<s:iterator var="productPrice" value="#product.productPrices" status="status" >
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
				
				
				
				<div class="content-bottom" style="height:50px;text-align: center;line-height: 50px;">
				<div class="pagination" style="margin:0 auto;">
					第  <s:property value="pageBean.page"/>/<s:property value="pageBean.totalPage"/>页
						<s:if test="pageBean.page != 1">
							<a href="${ pageContext.request.contextPath }/productAction_findByANid.action?anId=<s:property value="anId"/>&page=1" class="firstPage">&nbsp;</a>		
							<a href="${ pageContext.request.contextPath }/productAction_findByANid.action?anId=<s:property value="anId"/>&page=<s:property value="pageBean.page-1"/>" class="previousPage">上一页&nbsp;</a>	
						</s:if>	
						<s:iterator var="i" begin="1" end="pageBean.totalPage" step="1">
							<s:if test="pageBean.page==#i">
								<span style="border: 1px solid #ab864e; padding-left:5.4px;padding-right:5.4px;" class="currentPage"><s:property value="#i"/></span>
							</s:if>
							<s:else>
								<a  href="${ pageContext.request.contextPath }/productAction_findByANid.action?anId=<s:property value="anId"/>&page=<s:property value="#i"/>"><s:property value="#i"/></a>
							</s:else>
						</s:iterator>
							
						<s:if test="pageBean.page != pageBean.totalPage">
							<a class="nextPage" href="${ pageContext.request.contextPath }/productAction_findByANid.action?anId=<s:property value="anId"/>&page=<s:property value="pageBean.page+1"/>">下一页&nbsp;</a>
							<a class="lastPage" href="${ pageContext.request.contextPath }/productAction_findByANid.action?anId=<s:property value="anId"/>&page=<s:property value="pageBean.totalPage"/>">&nbsp;</a>
						</s:if>
				</div>
				</div>
				
				</s:if>
				<s:else>
					<div style="text-align: center;height:240px;line-height: 240px;">
						<div style="margin-top:100px;">
							<h4 style="color:red;">暂未查询到相关商品信息！</h4>
						</div>
						
					</div>
				</s:else>
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