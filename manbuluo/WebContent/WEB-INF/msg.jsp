<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/jquery.min.js"></script>

<!--theme-style-->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />	

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>支付结果</title>
</head>
<body>
	
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
						<li><a href="#">欢迎：<s:property value="#session.existAccount.username"/></a> </li>|
						<li><a href="accountAction_exit.action">退出</a></li>|
					</s:else>
				<li ><a href="contact.html" ><s:property value="#nv"/> 联系我们</a></li>
			</ul>
			<div class="clearfix"> </div>
		</div>
		<div class="page"> </div>
		<div class="content" style="height:350px;justify-content:center;align-items:center;display:-webkit-flex;">
			<div style="text-align: center;color:red;">
				<h4>
					<s:actionmessage/>
					
				</h4>
			</div>
		
		</div>
	</div>
</body>
</html>