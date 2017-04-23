<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>用户登录</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/jquery.min.js"></script>
<script src="js/login.js"></script>
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

<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>

<link href="css/megamenu.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="js/megamenu.js"></script>
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
		<div class="header-top">
			<div class="logo">
				<a href="indexAction_index.action"><img src="images/logo.png" alt="" ></a>
			</div>
		
				<div class="clearfix"> </div>
		</div>
		
	
		<div class="content">
		<div class="account-in">
							<h2>用户登录：</h2>
							<div class="col-md-6 account-top">
								<form id="registerForm" action="accountAction_login.action" method="post">
									<label class="errorClass" id="usernameError"><s:property value="errorMessage"/></label>
								<div> 	
									<input class="text" id="username" name="username" type="text" placeholder="请输入Email / 手机号" value="<s:property value="name"/>"> 
								</div>
								<label class="errorClass" id="passwordError"></label>
								<div> 
									<input class="text" id="password" name="password" type="password" placeholder="请输入密码">
								</div>				
									<input type="submit" value="立 即  登 录" style="margin-left:0em;"> 
								</form>
							</div>
							<div class="col-md-6 left-account ">
								<a href="single.html"><img class="img-responsive " src="images/ac.jpg" alt=""></a>
								<div class="five-in">
								<h1>25% </h1><span>discount</span>
								</div>
								<a href="indexAction_register" class="create">创建账号</a>
								<div class="clearfix"> </div>
							</div>
						<div class="clearfix"> </div>
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