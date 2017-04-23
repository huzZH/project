package cn.malls.action;

import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.codehaus.jackson.map.ObjectMapper;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import cn.malls.bean.Account;
import cn.malls.bean.AnimeProduct;
import cn.malls.bean.CartInfo;
import cn.malls.bean.OrderDetail;
import cn.malls.bean.OrderInfo;
import cn.malls.bean.SlippingAddress;
import cn.malls.service.AccountService;
import cn.malls.service.AnimeProductService;
import cn.malls.service.CartInfoService;
import cn.malls.service.OrderService;
import cn.malls.service.SlippingAddressService;
import cn.malls.web.CommonConstant;
import cn.malls.web.CommonUtil;
import cn.malls.web.PaymentUtil;
@Controller
public class OrderAction extends ActionSupport implements ModelDriven<OrderInfo>{
	
	@Autowired
	private OrderService orderService;
	@Autowired
	private CartInfoService cartInfoService;
	@Autowired 
	private AccountService accountService;
	@Autowired
	private SlippingAddressService slippingAddressService;
	@Autowired
	private AnimeProductService animeProductService;
	
	private OrderInfo orderInfo = new OrderInfo();

	

	private SlippingAddress slipAddress;
	private List<OrderDetail> orderList;
	private List cartInfoId;
	private List<CartInfo> list;
	private String formData;
	private String productId;
	private String quantity;
	private String unitPrice;
	
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public String getQuantity() {
		return quantity;
	}
	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}

	public String getUnitPrice() {
		return unitPrice;
	}
	public void setUnitPrice(String unitPrice) {
		this.unitPrice = unitPrice;
	}

	//锟斤拷锟斤拷页锟芥传锟斤拷锟斤拷锟斤拷锟斤拷name
	private String pd_FrpId;
	
	// 锟斤拷锟斤拷晒锟斤拷锟斤拷锟斤拷要锟侥诧拷锟斤拷:
	private String r3_Amt;    //锟斤拷锟�
	private String r6_Order;	//锟斤拷锟斤拷锟斤拷

	
	@Override
	public OrderInfo getModel() {
		// TODO Auto-generated method stub
		return orderInfo;
	}

	public SlippingAddress getSlipAddress() {
		return slipAddress;
	}

	public void setSlipAddress(SlippingAddress slipAddress) {
		this.slipAddress = slipAddress;
	}

	public String getPd_FrpId() {
		return pd_FrpId;
	}

	public void setPd_FrpId(String pd_FrpId) {
		this.pd_FrpId = pd_FrpId;
	}

	public String getR3_Amt() {
		return r3_Amt;
	}

	public void setR3_Amt(String r3_Amt) {
		this.r3_Amt = r3_Amt;
	}

	public String getR6_Order() {
		return r6_Order;
	}

	public void setR6_Order(String r6_Order) {
		this.r6_Order = r6_Order;
	}

	public List getCartInfoId() {
		return cartInfoId;
	}
	public void setCartInfoId(List cartInfoId) {
		this.cartInfoId = cartInfoId;
	}
	public List<OrderDetail> getOrderList() {
		return orderList;
	}
	public void setOrderList(List<OrderDetail> orderList) {
		this.orderList = orderList;
	}
	public String getFormData() {
		return formData;
	}
	public void setFormData(String formData) {
		this.formData = formData;
	}
	public List<CartInfo> getList() {
		return list;
	}
	public void setList(List<CartInfo> list) {
		this.list = list;
	}

	/*
	 * 
	 */
	public String submitCart() throws Exception {
		List<CartInfo> cartInfoList = cartInfoService.getCartInfoList(list);
		for(int i = 0; i < cartInfoList.size(); i++) {
			for(int j = 0; j < list.size(); j++) {
				int m = list.get(j).getId();
				int n = cartInfoList.get(i).getId();
				if(list.get(j).getId().equals(cartInfoList.get(i).getId())) {
					cartInfoList.get(i).setQuantity(list.get(j).getQuantity());
				}
			}
		}
		Account account = accountService.findAccount((Account) ServletActionContext.getRequest().getSession().getAttribute("existAccount"));
		List<SlippingAddress> slipAddress = slippingAddressService.getSlipAddress(account.getId());
		ActionContext.getContext().getValueStack().set("slipAddress", slipAddress);
		ActionContext.getContext().getValueStack().set("cartInfoList", cartInfoList);
		return "createOrder";
	}
	
	public String submitSingle() throws Exception{
		//先将信息保存在购物车中，然后
		CartInfo cartInfo = new CartInfo();
		AnimeProduct product = animeProductService.getProductById(Integer.parseInt(productId));
		cartInfo.setProductId(product.getId());
		cartInfo.setProductName(product.getName());
		cartInfo.setProductImage(product.getImage());
		cartInfo.setUnitPrice(Double.parseDouble(unitPrice));
		cartInfo.setQuantity(Integer.parseInt(quantity));
		
		Account existAccount = (Account) ServletActionContext.getRequest().getSession().getAttribute("existAccount");
		if(existAccount == null){
			ActionContext.getContext().getValueStack().set("errorMessage", "请先登录！");
			return "input";
		}
		List<CartInfo> cartInfoList = new ArrayList<CartInfo>();
		Account account = accountService.findAccount(existAccount);
		cartInfoService.saveCartInfo(cartInfo, account.getId());
		cartInfoList.add(cartInfo);
		List<SlippingAddress> slipAddress = slippingAddressService.getSlipAddress(account.getId());
		ActionContext.getContext().getValueStack().set("slipAddress", slipAddress);
		ActionContext.getContext().getValueStack().set("cartInfoList", cartInfoList);
		return "createOrder";
	}
	
	public void addSlippingAddress() throws Exception {
		String data = URLDecoder.decode(formData,"UTF-8").toString();
		String[] split = data.split("&");
		Map map = new HashMap();
		for(int i = 0; i < split.length; i++) {
			String[] val = split[i].split("=");
			map.put(val[0], val[1]);
		}
		Account account = accountService.findAccount((Account) ServletActionContext.getRequest().getSession().getAttribute("existAccount"));
		
		SlippingAddress slippingAddress = new SlippingAddress();
		slippingAddress.setConsignee((String) map.get("consignee"));
		slippingAddress.setRegion((String) map.get("region"));
		slippingAddress.setDetailAddress((String) map.get("detailAddress"));
		slippingAddress.setPostCode((String) map.get("postCode"));
		slippingAddress.setMobil((String) map.get("mobil")); 
		slippingAddress.setAccountId(account.getId());
		
		System.out.println(map.get("consignee").toString());
		slippingAddressService.saveSlipAddress(slippingAddress);
		/*ServletActionContext.getResponse().getWriter().write("锟斤拷谁锟截ｏ拷");*/
		ObjectMapper mapper = new ObjectMapper();  
	    String jsonStr = mapper.writeValueAsString(slippingAddress);  
	    JSONObject obj = new JSONObject(jsonStr);  
	    ServletActionContext.getResponse().setCharacterEncoding("UTF-8");
	    ServletActionContext.getResponse().getWriter().write(obj.toString());

	}
	
	/**
	 * 锟结交锟斤拷锟斤拷
	 * @return
	 * @throws Exception 
	 */
	public String submitOrder() throws Exception {
		
		//保存订单
		Account account = accountService.findAccount((Account) ServletActionContext.getRequest().getSession().getAttribute("existAccount"));
		Double totalAmount = (double) 0;
		Set<OrderDetail> order = new HashSet<OrderDetail>();
		for(OrderDetail orderItem : orderList) {
			orderItem.setSubtotal(orderItem.getQuantity() * orderItem.getPresent_price());
			order.add(orderItem);
			orderItem.setOrderInfo(orderInfo);
			totalAmount = totalAmount + orderItem.getSubtotal();
		}
		orderInfo.setOrderDetails(order);
		orderInfo.setTotalAmount(totalAmount);
		orderInfo.setAddTime(new Date());
		HttpServletRequest request = ServletActionContext.getRequest();
		
	    orderInfo.setIP(request.getRemoteAddr());
	    orderInfo.setPayType(CommonConstant.getBank(pd_FrpId));
		orderInfo.setAccountId(account.getId());
		orderService.saveOrder(orderInfo);
		
		//删除对应的购物车商品
		cartInfoService.deleteListCart(cartInfoId);
		
		
		//支付
		String p0_Cmd = "Buy";
		String p1_MerId = "10001126856";
		String p2_Order = orderInfo.getOrderNumber().toString();
		String p3_Amt = "0.01";
		String p4_Cur = "CNY";
		String p5_Pid = "";
		String p6_Pcat = "";
		String p7_Pdesc = "";
		String p8_Url = "http://localhost:8080/orderAction_callBack.action";
		String p9_SAF = "";
		String pa_MP = "";
		String pr_NeedResponse = "1";
		String keyValue = "69cl522AV6q613Ii4W6u8K6XuW8vM1N6bFgyv769220IuYe9u37N4y7rI4Pl";
		String hmac = PaymentUtil.buildHmac(p0_Cmd, p1_MerId, p2_Order, p3_Amt,
				p4_Cur, p5_Pid, p6_Pcat, p7_Pdesc, p8_Url, p9_SAF, pa_MP,
				pd_FrpId, pr_NeedResponse, keyValue);

		StringBuffer sb = new StringBuffer(
				"https://www.yeepay.com/app-merchant-proxy/node?");
		sb.append("p0_Cmd=").append(p0_Cmd).append("&");
		sb.append("p1_MerId=").append(p1_MerId).append("&");
		sb.append("p2_Order=").append(p2_Order).append("&");
		sb.append("p3_Amt=").append(p3_Amt).append("&");
		sb.append("p4_Cur=").append(p4_Cur).append("&");
		sb.append("p5_Pid=").append(p5_Pid).append("&");
		sb.append("p6_Pcat=").append(p6_Pcat).append("&");
		sb.append("p7_Pdesc=").append(p7_Pdesc).append("&");
		sb.append("p8_Url=").append(p8_Url).append("&");
		sb.append("p9_SAF=").append(p9_SAF).append("&");
		sb.append("pa_MP=").append(pa_MP).append("&");
		sb.append("pd_FrpId=").append(pd_FrpId).append("&");
		sb.append("pr_NeedResponse=").append(pr_NeedResponse).append("&");
		sb.append("hmac=").append(hmac);
		System.out.println(sb.toString());
		HttpServletResponse response = ServletActionContext.getResponse();
		response.sendRedirect(sb.toString());
		
		
		return NONE;
	}
	
	/**
	 * 锟斤拷锟斤拷晒锟斤拷锟侥回碉拷锟斤拷锟斤拷
	 */
	public String callBack() {
		OrderInfo currOrder = orderService.findByOrderNumber(r6_Order);
		currOrder.setPayTime(new Date());
		currOrder.setOrderStatus((byte)1);// 锟睫改讹拷锟斤拷状态.
		orderService.update(currOrder);

		this.addActionMessage("订单付款成功!订单号:" + r6_Order + " 付款金额:" + r3_Amt);
		return "msg";
	}
	/**
	 * 我的订单
	 * @throws Exception 
	 */
	public String myOrder() throws Exception {
		Boolean existUser = CommonUtil.isExistUser(ServletActionContext.getRequest());
		if(!existUser) {
			return "login";
		}
		Account account = accountService.findAccount((Account) ServletActionContext.getRequest().getSession().getAttribute("existAccount"));
		List<OrderInfo> myOrder = orderService.findMyOrder(account.getId());
		if(myOrder == null) {
			ActionContext.getContext().getValueStack().set("message", "尚无订单！");
		}else {
			ActionContext.getContext().getValueStack().set("myOrder", myOrder);
			System.out.println(myOrder);
		}
		return "myOrder";
	}
	
}
