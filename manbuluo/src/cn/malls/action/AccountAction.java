package cn.malls.action;
import java.net.URLDecoder;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.json.JSONObject;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import cn.malls.bean.Account;
import cn.malls.bean.Member;
import cn.malls.bean.SlippingAddress;
import cn.malls.service.AccountService;
import cn.malls.service.SlippingAddressService;
import cn.malls.web.CommonUtil;
@Controller
public class AccountAction extends ActionSupport implements ModelDriven<Account>{
	
	private Account account = new Account();
	
	@Autowired
	private AccountService accountService;
	@Autowired
	private SlippingAddressService slipAddressService;
	
	private String loginname;
	private String oldPassword;
	private String newPassword;
	private String formData;
	private String idValue;
	

	

	@Override
	public Account getModel() {
		// TODO Auto-generated method stub
		return account;
	}
	public String getLoginname() {
		return loginname;
	}
	public void setLoginname(String loginname) {
		this.loginname = loginname;
	}
	
	public String getOldPassword() {
		return oldPassword;
	}
	public void setOldPassword(String oldPassword) {
		this.oldPassword = oldPassword;
	}
	public String getNewPassword() {
		return newPassword;
	}
	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}
	
	public String getFormData() {
		return formData;
	}
	public void setFormData(String formData) {
		this.formData = formData;
	}
	
	public String getIdValue() {
		return idValue;
	}
	public void setIdValue(String idValue) {
		this.idValue = idValue;
	}
	/*
	 * ע���˺�
	 */
	public String register() throws Exception{
		account.setMember(new Member());
		Account acc = new Account();
		acc.setUsername(account.getUsername());
		acc.setPassword(account.getPassword());
		accountService.createAccount(account);
		ServletActionContext.getRequest().getSession().setAttribute("existAccount", acc);
		return "index";
	}
	/*
	 * �첽У���û����Ƿ����
	 */
	public void ajaxUsername() throws Exception{
		System.out.println(loginname);
		Boolean bool = accountService.ajaxUsername(loginname);
		System.out.println(bool.toString());
		if(bool){
			ServletActionContext.getResponse().getWriter().write("false");
		}else{
			ServletActionContext.getResponse().getWriter().write("true");
		}
	}
	/*
	 * ��¼�˺�
	 */
	public String login() throws Exception{
		Account findAccount = accountService.findAccount(account);
		if(findAccount != null){
			ServletActionContext.getRequest().getSession().setAttribute("existAccount", account);
			return "index";
		}
		ActionContext.getContext().getValueStack().set("name", account.getUsername());
		ActionContext.getContext().getValueStack().set("errorMessage", "�˺Ż��������");
		return "loginFail";
	}
	/*
	 * �˳��˺�
	 */
	public String exit(){
//		ServletActionContext.getRequest().getSession().invalidate(); ����
		ServletActionContext.getRequest().getSession().removeAttribute("existAccount");
		return "login";
	}
	/**
	 * �����˻���Ϣ
	 * @throws Exception 
	 */ 
	public String findMember() throws Exception {
		Boolean existUser = CommonUtil.isExistUser(ServletActionContext.getRequest());
		if(existUser){
			int hours = new Date().getHours();
			String welcome = null;
			if(hours >= 5 && hours <= 9) {
				welcome = "���Ϻ�";
			}else if(hours > 9 && hours <= 13){
				welcome = "�����";
			}else if(hours > 13 && hours <= 17) {
				welcome = "�����";
			}else {
				welcome = "���Ϻ�";
			}
			ActionContext.getContext().getValueStack().set("welcome", welcome);
			
			Account account = accountService.findAccount((Account) ServletActionContext.getRequest().getSession().getAttribute("existAccount"));
			Member member = account.getMember();
			Byte complete = member.getComplete();
			if(complete.intValue() == 0){
				return "completePersonal";
			}
			String birthday = member.getBirthday();
			
			String newBirthday = birthday.substring(0, 4) + "-" + birthday.substring(4, 6) + "-" + birthday.substring(6, 8);
			member.setBirthday(newBirthday);
			ActionContext.getContext().getValueStack().set("member", member);
			
		}else {
			ActionContext.getContext().getValueStack().set("errorMessage", "���ȵ�¼��");
			return "login";
		}
		return "personal";
	}
	@Test
	public void test(){
		String birthday = "19941106";
		String newBirthday = birthday.substring(0, 4) + "-" + birthday.substring(4, 6) + "-" + birthday.substring(6, 8);
		System.out.println(newBirthday);
	}
	/**
	 * @Description ��ת��ȫ������Ϣ����
	 * @return
	 */
	public String createPersonal() {
		return "createPersonal";
	}
	/**
	 * @Description ��Ӹ�����Ϣ
	 * @return
	 * @throws Exception 
	 */
	public String addPerInfo() throws Exception {
		Boolean existUser = CommonUtil.isExistUser(ServletActionContext.getRequest());
		if(existUser){
			Account existAccount = accountService.findAccount((Account) ServletActionContext.getRequest().getSession().getAttribute("existAccount"));
			Member member = account.getMember();
			member.setId(existAccount.getMember().getId());
			member.setComplete((byte)1);
			accountService.addMember(member);
		}else {
			ActionContext.getContext().getValueStack().set("errorMessage", "���ȵ�¼��");
			return "login";
		}
		
		return "personal";
	}
	/**
	 * @Description ��ת�޸�����
	 */
	public String updatePassword() {
		
		return "updatePassword";
	}
	
	/**
	 * @Description �޸�����
	 * @throws Exception 
	 */
	public String submitUpdate() throws Exception {
		Account existAccount = (Account) ServletActionContext.getRequest().getSession().getAttribute("existAccount");
		Boolean bool = accountService.updatePassword(existAccount.getUsername(),oldPassword,newPassword);
		
		if(bool) {
			existAccount.setPassword(newPassword);
			ServletActionContext.getRequest().getSession().setAttribute("existAccount", existAccount);
			return "JumpPersonal";
		}else {
			ActionContext.getContext().getValueStack().set("message", "ԭ�������");
			return "updatePassword";
		}
		
	}
	/**
	 * @Description ��ת�ջ���ַ
	 * @throws Exception 
	 */
	public String slippingAddressManage() throws Exception {
		Account account = accountService.findAccount((Account) ServletActionContext.getRequest().getSession().getAttribute("existAccount"));
		
		List<SlippingAddress> slipAddress = slipAddressService.findSlipAddress(account.getId());
		ActionContext.getContext().getValueStack().set("slipAddress", slipAddress);
		return "slippingAddressManage";
	}
	/**
	 * @Description �޸��ջ���ַ
	 * @throws Exception 
	 */
	public void updateSlippingAddress() throws Exception {
		Boolean existUser = CommonUtil.isExistUser(ServletActionContext.getRequest());
		if(existUser) {
			SlippingAddress sa = null;
			String data = URLDecoder.decode(formData,"UTF-8").toString();
			String[] split = data.split("&");
			int i = 0;
			if(split[0].length() == 3){
				i = 1;
			}
			Map map = new HashMap();
			for(; i < split.length; i++) {
				String[] val = split[i].split("=");
				map.put(val[0], val[1]);
			}
			Account account = accountService.findAccount((Account) ServletActionContext.getRequest().getSession().getAttribute("existAccount"));
			if(split[0].length() > 3) {
				sa = slipAddressService.findSlipAddressById(Integer.parseInt((String) map.get("id")),account.getId());
				if(sa != null ) {
					sa.setConsignee((String)map.get("consignee"));
					sa.setRegion((String)map.get("region"));
					sa.setDetailAddress((String)map.get("detailAddress"));
					sa.setMobil((String)map.get("mobil"));
					sa.setPostCode((String)map.get("postCode"));
					slipAddressService.update(sa);
				}else{
					ServletActionContext.getResponse().setCharacterEncoding("UTF-8");
					ServletActionContext.getResponse().getWriter().write("�õ�ַ�����ڣ�");
				}
			}else{
				sa = new SlippingAddress();
				sa.setAccountId(account.getId());
				sa.setConsignee((String)map.get("consignee"));
				sa.setRegion((String)map.get("region"));
				sa.setDetailAddress((String)map.get("detailAddress"));
				sa.setMobil((String)map.get("mobil"));
				sa.setPostCode((String)map.get("postCode"));
				slipAddressService.saveSlipAddress(sa);
			}
		}else {
			ServletActionContext.getResponse().setCharacterEncoding("UTF-8");
			ServletActionContext.getResponse().getWriter().write("login");
//			ServletActionContext.getResponse().sendRedirect("indexAction_login.action");
			//return "login";
		}
		
	}
	/**
	 * @Description ɾ����ַ
	 * @throws Exception 
	 */
	public void deleteSlippingAddress() throws Exception {
		Account account = accountService.findAccount((Account) ServletActionContext.getRequest().getSession().getAttribute("existAccount"));
		JSONObject obj = null;
		String message = null;
		if(account == null) {
			ServletActionContext.getResponse().sendRedirect("indexAction_login.action");
		}else {
			SlippingAddress slipAddress = slipAddressService.findSlipAddressById(Integer.parseInt(idValue), account.getId());
			if(slipAddress != null) {
				slipAddressService.delete(slipAddress);
				message = "ɾ���ɹ�";
				obj = new JSONObject();
				obj.put("message", message);
				ServletActionContext.getResponse().setCharacterEncoding("UTF-8");
				ServletActionContext.getResponse().getWriter().write(obj.toString());
			}else{
				message = "�õ�ַ������";
				obj = new JSONObject();
				obj.put("message", message);
				ServletActionContext.getResponse().setCharacterEncoding("UTF-8");
				ServletActionContext.getResponse().getWriter().write(message.toString());
			}
		}
	}
}
