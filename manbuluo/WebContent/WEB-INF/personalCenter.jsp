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
<title>个人中心</title>
</head>
<body>
	<h4>
		<s:actionmessage/>
	</h4>
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
						<li><a href="accountAction_findMember.action">欢迎：<s:property value="#session.existAccount.username"/></a> </li>|
						<li><a href="accountAction_exit.action">退出</a></li>|
					</s:else>
				<li ><a href="contact.html" ><s:property value="#nv"/> 联系我们</a></li>
			</ul>
			<div class="clearfix"> </div>
		</div>
		<div class="page"> </div>
		<div class="content" style="height:400px;">
			<div class="container" style="width: 90%;">
				<div style="border-bottom: 2px solid #f1f1f1;">
					<div style="float: left;color:red;">
						<h4 >个人中心</h4>
					</div>
					<div style="text-align: right;">
						<a href="indexAction_index.action" style="text-decoration: none;"><span >退出</span></a><br/>
					</div>
					
					
				</div>
				<div style="margin-top:20px;">
					<ul style="list-style:none;">
						<li style="display:inline;margin-right:15px;"><a href="accountAction_findMember.action" style=" text-decoration: none;color:red;">个人信息</a></li>
						<li style="display:inline;margin-right:15px;"><a href="accountAction_updatePassword.action" style=" text-decoration: none;">修改密码</a></li>
						<li style="display:inline;margin-right:15px;"><a href="#" style=" text-decoration: none;">消息通知</a></li>
						<li style="display:inline;margin-right:15px;"><a href="accountAction_slippingAddressManage.action" style=" text-decoration: none;">我的收货地址</a></li>
					</ul>
				</div>
					
				<div style="margin-top:20px;border: 1px solid #b0b0b0;border-radius: 5px;">
					<div style="margin:14px;">
						<span style="color:#616161;font-size:30px;"><s:property value="member.name"/></span>
						<p style="color:#b0b0b0;display:inline;"><s:property value="welcome"/> ~</p>
						
						<div>
							<div style="margin-top: 8px;">
								<span>姓名：</span><p style="display:inline;"><s:property value="member.name"/></p>
							</div>
							<div style="margin-top: 8px;">
								<span>性别：</span><p style="display:inline;"><s:property value="member.sex"/></p>
							</div>
							<div style="margin-top: 8px;">
								<span>年龄：</span><p style="display:inline;"><s:property value="member.age"/></p>
							</div>
							<div style="margin-top: 8px;">
								<span>生日：</span><p style="display:inline;"><s:property value="member.birthday"/></p>
							</div>
							<div style="margin-top: 8px;">
								<span>手机号：</span><p style="display:inline;"><s:property value="member.mobil"/></p>
							
							</div>
							<div style="margin-top: 8px;">
								<span>邮箱：</span><p style="display:inline;"><s:property value="member.email"/></p>
							
							</div>
							<div style="margin-top: 8px;">
								<span>住址：</span><p style="display:inline;"><s:property value="member.region"/><s:property value="member.detail_address"/></p>
							</div>
						</div>
					</div>
				</div>
				
			</div>
			
		
		</div>
		<div class="footer">
			<p class="footer-class">Copyright &copy; 2015.Company name All rights reserved.More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></p>
			
				<a href="#home" class="scroll to-Top" >  GO TO TOP!</a>
		<div class="clearfix"> </div>
		</div>
	</div>
</body>
</html>