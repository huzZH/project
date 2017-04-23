<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"  %>
<!DOCTYPE html>
<html>
<head>
<title>会员注册</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/jquery.min.js"></script>
<script src="js/regist.js"></script>
<!-- Custom Theme files -->
<!--theme-style-->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />	
<!--//theme-style-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Mihstore Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />

<style>
.errorClass{
	color: red;
}
</style>
</head>
<body> 
<!--header-->
	<div class="container">
		
		<!---->
		<div class="header-top" style="padding:0.5em 1em;">
			<div class="logo">
				<a href="indexAction_index.action"><img src="images/logo.png" alt="" ></a>
			</div>
				<div class="clearfix"> </div>
		</div>
		<div class="content" style="padding-left:0px;padding-right:0px;">
			<div class="container">
					<div class="account-in register-top col-lg-6" style="">
							<h2>注册：</h2>
							<div class=" account-top register">
								<form id="registerForm" action="accountAction_register.action" method="post">
									<label class="errorClass" id="usernameError"><s:fielderror fieldName="username"/></label>
									
								
								<div> 	
									<input class="text" id="username" name="username" type="text" placeholder="请输入Email / 手机号"> 
								</div>
								<label class="errorClass" id="passwordError"><s:fielderror fieldName="password"/></label>
								<div> 
									
									<input class="text" id="password" name="password" type="password" placeholder="请输入密码">
								</div>				
									<input type="submit" value="立 即 注 册" style="margin-left:0em;"> 
								</form>
							</div>
						
					</div>	
					<div class="container col-lg-6 showimage" style="padding-right:0px;padding-top:80px;">
					<img src="images/anime.jpg" alt="图片未加载" style="width:400px;">
				</div>
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