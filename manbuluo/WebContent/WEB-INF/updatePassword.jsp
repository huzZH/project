<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<script src="js/jquery.min.js"></script>
<script src="js/regist.js"></script>
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />	

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>密码修改</title>

<%-- <script type="text/javascript">
	
	$(function(){
		$('.errorClass').each(function(){
			showError($(this));
		});
		
		
		/**
		 * 输入框获取焦点时隐藏label错误信息
		 */
		$(".text").focus(function(){
			var labelId = $(this).attr("id") + "Error"; //获得label的ID
			$("#" + labelId).text("")//清空label中的信息
			
			showError($("#" + labelId));
		});
		/**
		 * 输入框失去焦点时校验
		 */
		$(".text").blur(function(){
			var id = $(this).attr("id");//获取当前输入框的ID
			var funName = "validate" + id.substring(0,1).toUpperCase() + id.substring(1) + "()";
			eval(funName);
		});
		
		
	})
	
	/**
 * 判断当前元素是否存在内容，存在则显示，不存在则隐藏
 * @param ele
 */
function showError(ele){
	var text = ele.text();//获取元素的内容
	if(!text){//如果没有内容
		ele.css("display","none"); //则隐藏元素
	}else{
		ele.css("display","");//显示错误信息
	}
}
	
	
	
	
	
	
</script> --%>
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
						<li style="display:inline;margin-right:15px;"><a href="accountAction_findMember.action" style=" text-decoration: none;">个人信息</a></li>
						<li style="display:inline;margin-right:15px;"><a href="accountAction_updatePassword.action" style=" text-decoration: none;color:red;">修改密码</a></li>
						<li style="display:inline;margin-right:15px;"><a href="#" style=" text-decoration: none;">消息通知</a></li>
						<li style="display:inline;margin-right:15px;"><a href="accountAction_slippingAddressManage.action" style=" text-decoration: none;">我的收货地址</a></li>
					</ul>
				</div>
					
				<div style="margin-top:20px;border: 1px solid #b0b0b0;border-radius: 5px; height:250px;align-items:center;display:-webkit-flex;">
					<div style="margin:14px;margin-top: -20px;">
						<div>
							<form method="post" id="submitUpdate" action="accountAction_submitUpdate.action">
								<label class="errorClass" id="oldPasswordError" style="margin-left: 100px;color: red;"><s:fielderror fieldName="oldPassword"/><s:property value="message"/></label>
								<div>
									<span>请输入旧密码</span><input name="oldPassword" id="oldPassword" class="text" type="password" style="border-radius: 10px; margin-left: 5px; border: 1px solid #D1D1D1; outline: none;padding: 0.4em 0.4em;">
								</div>
								<label class="errorClass" id="newPasswordError" style="margin-left: 100px;color: red;"><s:fielderror fieldName="newPassword"/></label>
								<div style="margin-top:10px;">
									<span>请输入新密码</span><input name="newPassword" id="newPassword" class="text" type="password"  style="border-radius: 10px; margin-left: 5px; border: 1px solid #D1D1D1; outline: none;padding: 0.4em 0.4em;">
								</div>
								<div style="margin-top: 15px;">
									<input type="button" style="margin-left: 15px; border-radius:5px;background: #31B0D5;width: 100px;height:30px;outline:none; border:none;color:white" value="取消"></input>
									<input type="submit" style="margin-left: 15px; border-radius:5px;background: #31B0D5;width: 100px;height:30px;outline:none; border:none;color:white" value="提交"></input>
								</div>
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