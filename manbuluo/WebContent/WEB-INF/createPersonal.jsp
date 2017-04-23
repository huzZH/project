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
				<p>The quick brown <span>fox jumps over a lazy dog. DJs flock by when MTV ax quiz prog.</span></p>	
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
		<div class="content" style="height:550px;">
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
					
						<%-- <span style="color:#616161;font-size:30px;"><s:property value="member.name"/></span>
						<p style="color:#b0b0b0;display:inline;"><s:property value="welcome"/> ~</p> --%>
						
						<div>
							<form action="accountAction_addPerInfo.action" method="post" >
							<input name="member.id" type="hidden" value="<s:property value="member.id"/>">
							<div style="margin-top: 8px;">
								<span>姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</span><input name="member.name" type="text" placeholder="请输入姓名" style="padding-left:5px;border-radius:5px;width:200px;height:30px;outline:0px;border:1px solid #CCCCCC;">
							</div>
							<div style="margin-top: 8px;">
								<span>性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</span><input name="member.sex"  type="text" placeholder="请输入性别" style="padding-left:5px;border-radius:5px;width:200px;height:30px;outline:0px;border:1px solid #CCCCCC;">
							</div>
							<div style="margin-top: 8px;">
								<span>年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;龄：</span><input name="member.age"  type="text" placeholder="请输入年龄" style="padding-left:5px;border-radius:5px;width:200px;height:30px;outline:0px;border:1px solid #CCCCCC;">
							</div>
							<div style="margin-top: 8px;">
								<span>出生年月：</span><input name="member.birthday"  type="text" placeholder="请输入出生年月" style="padding-left:5px;border-radius:5px;width:200px;height:30px;outline:0px;border:1px solid #CCCCCC;">
							</div>
							<div style="margin-top: 8px;">
								<span>手 &nbsp;机&nbsp; 号：</span><input name="member.mobil"  type="text" placeholder="请输入手机号" style="padding-left:5px;border-radius:5px;width:200px;height:30px;outline:0px;border:1px solid #CCCCCC;">
							
							</div>
							<div style="margin-top: 8px;">
								<span>邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱：</span><input name="member.email"  type="text" placeholder="请输入邮箱" style="padding-left:5px;border-radius:5px;width:200px;height:30px;outline:0px;border:1px solid #CCCCCC;">
							
							</div>
							<div style="margin-top: 8px;">
								<span>所在地区：</span><input name="member.region"  type="text" placeholder="请输入所在地区" style="padding-left:5px;border-radius:5px;width:200px;height:30px;outline:0px;border:1px solid #CCCCCC;">
							</div>
							<div style="margin-top: 8px;">
								<span>详细地址：</span><input name="member.detail_address"  type="text" placeholder="请输详细住址" style="padding-left:5px;border-radius:5px;width:200px;height:30px;outline:0px;border:1px solid #CCCCCC;">
							</div>
							
							<div style="margin-top: 20px;"><!-- onclick="submitAddressForm();" -->
								<input class="cancelButton" type="button" value='取消' onclick="cancelSubmit();" style='cursor:pointer; border-radius:5px;background:#31B0D5;color:white;width:120px;height:40px;border:0px;font-size:15px;outline:0px;'/>
								<input class="submitButton" type="submit" value='提交'  style='cursor:pointer;border-radius:5px;background:#31B0D5;color:white;width:120px;height:40px;border:0px;font-size:15px;outline:0px;margin-left:15px;'/></div>
							</form>
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