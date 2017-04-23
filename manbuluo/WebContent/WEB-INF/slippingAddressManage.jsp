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
<title>收货地址管理</title>



<style type="text/css">
	td {
		border-bottom:1px solid #b0b0b0;
		border-left:1px solid #b0b0b0;
		padding: 0.9em;
		
	}
	a{
		text-decoration: none;
	}
	table {
		text-align:center;
	}
	.first {
		border-left: 0;
	
	}
	input {
		border: none;
		text-align:center;
	}
</style>





	
<script language="JavaScript" type="text/javascript">  
//|------------------------------------------------------------------------------------  
//|  
//| 说明：JS弹出全屏遮盖的对话框(弹出层后面有遮盖效果，兼容主流浏览器)  
//|       实现了在最大化、拖动改变窗口大小和拖动滚动条时都可居中显示。  
//|  
//| 注意：主要使用EV_modeAlert和EV_closeAlert这两个函数行了；  
//|       (EV_modeAlert-弹出对话框，EV_closeAlert-关闭对话框)；  
//|       注意：使用时，请在body标签内(不要在其它元素内)写一div，  
//|       再给这div赋一id属性，如：id="myMsgBox"，  
//|       然后就可以调用EV_modeAlert('myMsgBox')来显示了。  
//|       还有，请给你这div设置css：display:none让它在开始时不显示。  
//|  
//| 作者：E旺，QQ：407542585，Blog：http://blog.csdn.net/envon123，(新手)  
//|  
//|------------------------------------------------------------------------------------  
//|  
//用来记录要显示的DIV的ID值  
var EV_MsgBox_ID=""; //重要  
  
//弹出对话窗口(msgID-要显示的div的id)  
function EV_modeAlert(msgID){  
    //创建大大的背景框  
    var bgObj=document.createElement("div");  
    bgObj.setAttribute('id','EV_bgModeAlertDiv');  
    document.body.appendChild(bgObj);  
    //背景框满窗口显示  
    EV_Show_bgDiv();  
    //把要显示的div居中显示  
    EV_MsgBox_ID=msgID;  
    EV_Show_msgDiv();  
}  
  
//关闭对话窗口  
function EV_closeAlert(){  
    var msgObj=document.getElementById(EV_MsgBox_ID);  
    var bgObj=document.getElementById("EV_bgModeAlertDiv");  
    msgObj.style.display="none";  
    document.body.removeChild(bgObj);  
    EV_MsgBox_ID="";  
}  
  
//窗口大小改变时更正显示大小和位置  
window.onresize=function(){  
    if (EV_MsgBox_ID.length>0){  
        EV_Show_bgDiv();  
        EV_Show_msgDiv();  
    }  
}  
  
//窗口滚动条拖动时更正显示大小和位置  
window.onscroll=function(){  
    if (EV_MsgBox_ID.length>0){  
        EV_Show_bgDiv();  
        EV_Show_msgDiv();  
    }  
}  
  
//把要显示的div居中显示  
function EV_Show_msgDiv(){  
    var msgObj   = document.getElementById(EV_MsgBox_ID);  
    msgObj.style.display  = "block";  
    var msgWidth = msgObj.scrollWidth;  
//    var msgHeight= msgObj.scrollHeight;  
    var msgHeight= "500";  
    var bgTop=EV_myScrollTop();  
    var bgLeft=EV_myScrollLeft();  
    var bgWidth=EV_myClientWidth();  
    var bgHeight=EV_myClientHeight();  
    var msgTop=bgTop+Math.round((bgHeight-msgHeight)/2);  
    var msgLeft=bgLeft+Math.round((bgWidth-msgWidth)/2);  
    msgObj.style.position = "absolute";  
    msgObj.style.top      = msgTop+"px";  
    msgObj.style.left     = msgLeft+"px";  
    msgObj.style.height    = msgHeight + "px";
    msgObj.style.zIndex   = "10001";  
      
}  
//背景框满窗口显示  
function EV_Show_bgDiv(){  
    var bgObj=document.getElementById("EV_bgModeAlertDiv");  
    var bgWidth=EV_myClientWidth();  
    var bgHeight=EV_myClientHeight(); 
    var bgTop=EV_myScrollTop();  
    var bgLeft=EV_myScrollLeft();  
    bgObj.style.position   = "absolute";  
    bgObj.style.top        = bgTop+"px";  
    bgObj.style.left       = bgLeft+"px";  
    bgObj.style.width      = bgWidth + "px";  
    bgObj.style.height     = bgHeight + "px";  
    bgObj.style.zIndex     = "10000";  
    bgObj.style.background = "#777";  
    bgObj.style.filter     = "progid:DXImageTransform.Microsoft.Alpha(style=0,opacity=60,finishOpacity=60);";  
    bgObj.style.opacity    = "0.6";  
}  
//网页被卷去的上高度  
function EV_myScrollTop(){  
    var n=window.pageYOffset   
    || document.documentElement.scrollTop   
    || document.body.scrollTop || 0;  
    return n;  
}  
//网页被卷去的左宽度  
function EV_myScrollLeft(){  
    var n=window.pageXOffset   
    || document.documentElement.scrollLeft   
    || document.body.scrollLeft || 0;  
    return n;  
}  
//网页可见区域宽  
function EV_myClientWidth(){  
    var n=document.documentElement.clientWidth   
    || document.body.clientWidth || 0;  
    return n;  
}  
//网页可见区域高  
function EV_myClientHeight(){  
    var n=document.documentElement.clientHeight   
    || document.body.clientHeight || 0;  
    return n;  
}  
</script>  

<script type="text/javascript">


	$(function() {
		
		$('.add').each(function(){
			$(this).click(function(){
				EV_modeAlert('envon');
			});
		});
		
		
		
		
		$('.update').each(function(){
			$(this).click(function(){
				var id = $(this).attr('id');
				var number = id.substring(id.length-1);
				var consignee = $('.consignee' + number).val();
				var region = $('.region' + number).val();
				var detailAddress = $('.detailAddress' + number).val();
				var postCode = $('.postCode' + number).val();
				var mobil = $('.mobil' + number).val();
				var idValue = $('.id' + number).val();
				
				$('input[name=consignee]').val(consignee);
				$('input[name=region]').val(region);
				$('input[name=detailAddress]').val(detailAddress);
				$('input[name=postCode]').val(postCode);
				$('input[name=mobil]').val(mobil);
				$('input[name=id]').val(idValue);
				
				EV_modeAlert('envon');
			});
		});
		
		
		$('.delete').each(function() {
			$(this).click(function() {
				var id = $(this).attr('id');
				var number = id.substring(id.length-1);
				var Value = $('.id' + number).val();
				var result;
				$.ajax({
					url:"accountAction_deleteSlippingAddress.action",
					data:{idValue:Value},
					type:"post",
					dataType:"json",
					async:false,
					cache:false,
					success:function(data) {
						result = data;
						alert(data.message + "!");
						if(number == 0) {
							$('.contentAddress').remove();
							$('.showAddress').show();
						}
					},
					error:function(data){
						alert(data);
					}
				});
				if(result) {
					$('.tr' + number).remove();
				}
				
			});
		});
		
		$(addressForm).submit(function() {
			
			$.ajax({
				url:"accountAction_updateSlippingAddress.action",
				data:{formData:$('.addressForm').serialize()},
				type:"post",
				dataType:"json",
				async:false,
				cache:false,
				/* beforeSend:function() {
					alert("发送数据前。。。。")
				}, */
				success:function(data){
					EV_closeAlert();
				},
				error:function(data){
					alert(data);
					location.href = "indexAction_login.action";
					EV_closeAlert();
				}
			});
/* 			return false; */
			
		});
		
	})
		
	
	function cancelSubmit() {
		if(confirm("确认关闭吗？此操作不可恢复！")) {
			EV_closeAlert();
		}
	}

</script>

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
		<div class="content" style="height:400px;height:auto">
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
						<li style="display:inline;margin-right:15px;"><a href="accountAction_updatePassword.action" style=" text-decoration: none;">修改密码</a></li>
						<li style="display:inline;margin-right:15px;"><a href="#" style=" text-decoration: none;">消息通知</a></li>
						<li style="display:inline;margin-right:15px;"><a href="accountAction_slippingAddressManage.action" style=" text-decoration: none;color:red;">我的收货地址</a></li>
					</ul>
				</div>
				<s:if test="slipAddress != null">
					<a href="javascript:void(0));"  class="add" style="text-decoration:none;">添加</a>
				</s:if>
				<div style="margin-top:20px; border: 1px solid #b0b0b0;border-radius: 5px; height:auto;align-items:center;display:-webkit-flex;justify-content:center;">
					<s:if test="slipAddress != null">
					
							
						
					<div class="contentAddress" style="margin:20px; border-radius: 5px; border: 1px solid #b0b0b0;">
						<div>
							<table>
								<tr>
								<td class="first">联系人</td>
									<td class="first">所在地区</td>
									<td class="first">详细地址</td>
									<td class="first">邮编</td>
									<td class="first">联系方式</td>
									<td colspan="2" class="first">操作</td>
								</tr>
								<s:iterator var="address" value="slipAddress" status="status">
									<tr class="tr<s:property value="#status.index"/>">
										<input class="id<s:property value="#status.index"/>" type="hidden" value="<s:property value="#address.id"/>">
										<td class="first"><input class="consignee<s:property value="#status.index"/>" value="<s:property value="#address.consignee"/>" readonly="readonly"/></td>
										<td><input class="region<s:property value="#status.index"/>" value="<s:property value="#address.region"/>" readonly="readonly"/></td>
										<td><input class="detailAddress<s:property value="#status.index"/>" value="<s:property value="#address.detailAddress"/>" readonly="readonly"></td>
										<td><input class="postCode<s:property value="#status.index"/>" value="<s:property value="#address.postCode"/>" readonly="readonly"/></td>
										<td><input class="mobil<s:property value="#status.index"/>" value="<s:property value="#address.mobil"/>" readonly="readonly"/></td>
										<td><a href="javascript:void(0));" id="update<s:property value="#status.index"/>" class="update" style="text-decoration:none;">修改</a></td>
										<td><a href="javascript:void(0));" id="delete<s:property value="#status.index"/>" class="delete" style="text-decoration:none;">删除</a></td>
									</tr>
								</s:iterator>
								<!-- <tr>
									<td class="first"><input class="consignee2" value="黄中正" readonly="readonly"/></td>
									<td><input class="region2" value="安徽省六安市寿县" readonly="readonly"/></td>
									<td><input class="detailAddress2" value="炎刘镇石埠李集" readonly="readonly"></td>
									<td><input class="postCode2" value="2322000" readonly="readonly"/></td>
									<td><input class="mobil2" value="18226601456" readonly="readonly"/></td>
									<td><a href="javascript:void(0));" id="update2" class="update" style="text-decoration:none;">修改</a></td>
									<td><a href="#" style="text-decoration:none;">删除</a></td>
								</tr>
								<tr>
									<td class="first"><input class="consignee3" value="黄中正" readonly="readonly"/></td>
									<td><input class="region3" value="安徽省六安市寿县" readonly="readonly"/></td>
									<td><input class="detailAddress3" value="炎刘镇石埠李集" readonly="readonly"></td>
									<td><input class="postCode3" value="2322000" readonly="readonly"/></td>
									<td><input class="mobil3" value="18226601456" readonly="readonly"/></td>
									<td><a href="javascript:void(0));" id="update3" class="update" style="text-decoration:none;">修改</a></td>
									<td><a href="#" style="text-decoration:none;">删除</a></td>
								</tr>
							
								
								<tr>
									<td class="first"><input class="consignee4" value="黄中" readonly="readonly"/></td>
									<td><input class="region4" value="安徽省六安市寿县" readonly="readonly"/></td>
									<td><input class="detailAddress4" value="炎刘镇石埠李集" readonly="readonly"></td>
									<td><input class="postCode4" value="2322000" readonly="readonly"/></td>
									<td><input class="mobil4" value="18226601456" readonly="readonly"/></td>
									<td><a href="javascript:void(0));" id="update4" class="update" style="text-decoration:none;">修改</a></td>
									<td><a href="#" style="text-decoration:none;">删除</a></td>
								</tr>
								<tr>
									<td class="first"><input class="consignee5" value="黄正" readonly="readonly"/></td>
									<td><input class="region5" value="安徽省六安市寿县" readonly="readonly"/></td>
									<td><input class="detailAddress5" value="炎刘镇石埠李集" readonly="readonly"></td>
									<td><input class="postCode5" value="2322000" readonly="readonly"/></td>
									<td><input class="mobil5" value="18226601456" readonly="readonly"/></td>
									<td><a href="javascript:void(0));" id="update5" class="update" style="text-decoration:none;">修改</a></td>
									<td><a href="#" style="text-decoration:none;">删除</a></td>
								</tr> -->
							</table>
						</div>
					</div>
					</s:if>
					<s:else>
						<div class="showAddress" style="margin:100px; border-radius: 5px; border: 1px solid #b0b0b0;width: 120px;height: 40px;background-color: rgb(76, 177, 202);align-items:center;display:-webkit-flex;justify-content:center;">
							<a href="javascript:void(0));"  class="add" style="text-decoration:none; font-size: 20px;color:white;">添&nbsp;&nbsp;加</a>
						</div>
						
					</s:else>
					<div class="showAddress" style="display:none;">
					<div  style=" margin:100px; border-radius: 5px; border: 1px solid #b0b0b0;width: 120px;height: 40px;background-color: rgb(76, 177, 202);align-items:center;display:-webkit-flex;justify-content:center;">
							<a href="javascript:void(0));"  class="add" style="text-decoration:none; font-size: 20px;color:white;">添&nbsp;&nbsp;加</a>
					</div>
					</div>
				</div>
				
			</div>
			
		
		</div>
		
		
		
		<div id="envon" style=" width:700px; background-color:#FFFFFF; border-radius:10px; border:1px solid #000000; padding:20px; overflow:hidden; display:none;">  
			
        <!-- <a href="javascript:EV_closeAlert()">关闭</a>   -->
        <div style='text-align:center;'>
        <div style='margin:0 auto;text-align: right;'>
        	<button style="margin-top:10px;color:white;background: red;border-radius:50px;width:30px;height:30px;border:0;outline:none" onclick="EV_closeAlert()">X</button>
        </div>
        <div style='margin:0 auto;'>
        	<h4 style="font-size:30px;padding-left: 55px;">修改收货地址</h4>
        </div>
	<div style='margin:0 auto;'>
		<form name="addressForm" class="addressForm" method="post">
			<input name="id" type="hidden" >
			<div style="margin-top:20px; ">
				<span style="width:75px;text-align: center;display:inline-block;font-size: 18px;">地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;区</span>
				<input name="region" type="text" style='border-radius:5px;width:200px;height:30px;outline:0px;border:1px solid #CCCCCC;' placeholder="请输入您的所在地区">
			</div>

			<div style="margin-top:20px;">
				<span style="width:75px;text-align: center;display:inline-block;font-size: 18px;">详细地址</span>
				<input name="detailAddress" type="text" style='border-radius:5px;width:200px;height:30px;outline:0px;border:1px solid #CCCCCC;' placeholder="请输入您的详细地址">
			</div>
			<div style="margin-top:20px;">
				<span style="width:75px;text-align: center;display:inline-block;font-size: 18px;">邮政编号</span>
				<input name="postCode" type="text" style='border-radius:5px;width:200px;height:30px;outline:0px;border:1px solid #CCCCCC;' placeholder="请输入您的邮政编号">
			</div>
			<div style="margin-top:20px;">
				<span style="width:75px;text-align: center;display:inline-block;font-size: 18px;">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名</span>
				<input name="consignee" type="text" style='border-radius:5px;width:200px;height:30px;outline:0px;border:1px solid #CCCCCC;' placeholder="请输入您的姓名">
			</div>
			<div style="margin-top:20px;">
				<span style="width:75px;text-align: center;display:inline-block;font-size: 18px;">手&nbsp;&nbsp;机&nbsp;&nbsp;号</span>
				<input name="mobil" type="text" style='border-radius:5px;width:200px;height:30px;outline:0px;border:1px solid #CCCCCC;' placeholder="请输入您的手机号">
			</div>
			
			<div style="margin-top: 20px;"><!-- onclick="submitAddressForm();" -->
				<input class="cancelButton" type="button" value='取消' onclick="cancelSubmit();" style='cursor:pointer; border-radius:5px;background:#31B0D5;color:white;width:120px;height:40px;border:0px;font-size:15px;outline:0px;'/>
				<input class="submitButton" type="submit" value='提交'  style='cursor:pointer;border-radius:5px;background:#31B0D5;color:white;width:120px;height:40px;border:0px;font-size:15px;outline:0px;margin-left:15px;'/></div>
		</form>
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