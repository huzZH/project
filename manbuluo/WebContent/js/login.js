$(function(){
	/**
	 * 得到所有的错误信息，循环遍历之，调用showError()方法来判断是否显示错误信息
	 */
	$(".errorClass").each(function(){
		var value = $(this).find("span").text();
		if(!value){
			$(this).find("ul").css('display','none');
		}
		
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
	
	$("#registerForm").submit(function(){
		var bool = true;
		$(".text").each(function(){
			var id = $(this).attr("id");//获取当前输入框的ID
			var funName = "validate" + id.substring(0,1).toUpperCase() + id.substring(1) + "()";
			if(!eval(funName)){
				bool = false;
			}
		});
		return bool;
	});
})
	/*
	 * 换一张验证码
	 */
function changeVerify(){
	$("#captchaImage").attr("src", "/verifyCode?a=" + new Date().getTime());
	
}
	
	

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
//登录名校验
function validateUsername(){
	/**
	 * 1、非空校验
	 * 2、长度校验
	 * 3、异步校验
	 */
	var id = "username";
	var value = $("#" + id).val().trim();
	if(!value){
		$("#" + id + "Error").text("用户名不能为空！");
		showError($("#" + id + "Error"));
		return false;
	}
	if(value.length <3 || value.length > 20){
		$("#" + id + "Error").text("用户名长度在3~20之间！");
		showError($("#" + id + "Error"));
		return false;
	}
	if(value.length == 11){
		if(!(/^1(3|4|5|7|8)\d{9}$/.test(value))){ 
			$("#" + id + "Error").text("手机号错误,请重填！");
			showError($("#" + id + "Error"));
			return false;
		}
	}else if(!/^(\w)+(\.\w+)*@(\w)+((\.\w{2,3}){1,3})$/.test(value)){
		$("#" + id + "Error").text("Email格式不正确！");
		showError($("#" + id + "Error"));
		return false;
	}
	return true;
}

function validatePassword(){
	var id = "password";
	var value = $("#" + id).val().trim();
	if(!value){
		$("#" + id + "Error").text("密码不能为空！");
		showError($("#" + id + "Error"));
		return false;
	}
	if(value.length <6 || value.length > 20){
		$("#" + id + "Error").text("密码长度在6~20之间！");
		showError($("#" + id + "Error"));
		return false;
	}
	
	
	var reg = new RegExp(/^(?![^a-zA-Z]+$)(?!\D+$)/);
    if (!reg.test(value)){
    	$("#" + id + "Error").text("密码必须包含数字和字母！");
		showError($("#" + id + "Error"));
		return false;
    }
       
	return true;
}

function validateRePassword(){
	var id = "rePassword";
	var value = $("#" + id).val().trim();
	if(!value){
		$("#" + id + "Error").text("确认密码不能为空！");
		showError($("#" + id + "Error"));
		return false;
	}
	if(value!=$("#password").val()){
		$("#" + id + "Error").text("密码不一致！");
		showError($("#" + id + "Error"));
		false;
	}
	return true;
}

function validateEmail(){
	var id = "email";
	var value = $("#" + id).val().trim();
	if(!value){
		$("#" + id + "Error").text("Email不能为空！");
		showError($("#" + id + "Error"));
		return false;
	}
	if(!/^(\w)+(\.\w+)*@(\w)+((\.\w{2,3}){1,3})$/.test(value)){
		$("#" + id + "Error").text("Email格式不正确！");
		showError($("#" + id + "Error"));
		false;
	}
	return true;
}

function validateUserName(){
	var id = "userName";
	var value = $("#" + id).val().trim();
	if(!value){
		$("#" + id + "Error").text("姓名不能为空！");
		showError($("#" + id + "Error"));
		return false;
	}
	
	return true;
}
function validatePhone(){
	var id = "phone";
	var value = $("#" + id).val().trim();
	if(!value){
		$("#" + id + "Error").text("联系方式不能为空！");
		showError($("#" + id + "Error"));
		return false;
	}if(value.length != 11){
		$("#" + id + "Error").text("长度错误！");
		showError($("#" + id + "Error"));
		return false;
	}
	
	return true;
}



function validateAddress(){
	var id = "address";
	var value = $("#" + id).val().trim();
	if(!value){
		$("#" + id + "Error").text("地址不能为空！");
		showError($("#" + id + "Error"));
		return false;
	}
	
	return true;
}

function validateCaptcha(){
	var id = "captcha";
	var value = $("#" + id).val().trim();
	if(!value){
		$("#" + id + "Error").text("验证码不能为空！");
		showError($("#" + id + "Error"));
		return false;
	}
	if(value.length != 4){
		$("#" + id + "Error").text("验证码错误！");
		showError($("#" + id + "Error"));
		return false;
	}
	return true;
}



