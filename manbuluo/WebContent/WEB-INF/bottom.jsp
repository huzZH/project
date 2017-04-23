<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
					<li><a href="#">欢迎：<s:property value="#session.existAccount.username"/></a> </li>|
					<li><a href="accountAction_exit.action">退出</a></li>|
				</s:else>
				
				
				<li ><a href="contact.html" ><s:property value="#nv"/> 联系我们</a></li>
			</ul>
				<div class="clearfix"> </div>
		</div>
		<!---->
		<div class="header-top">
			<div class="logo">
				<a href="indexAction_index.action" target="_blank"><img src="images/logo.png" alt="" ></a>
			</div>
				<div class="clearfix"> </div>
		</div>
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
						<h6 >购物车:
						<s:if test="cartNull == null">
							<span class="item" >3 items</span>
							<span class="rate">70$</span>
						</s:if>
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
        <div class="copyrights">Collect from <a href="http://www.cssmoban.com/" >网页模板</a></div>
		<div class="page">  </div>