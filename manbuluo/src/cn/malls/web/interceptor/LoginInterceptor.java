package cn.malls.web.interceptor;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class LoginInterceptor extends AbstractInterceptor{

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		// TODO Auto-generated method stub
		HttpSession session = ServletActionContext.getRequest().getSession();
		Object account = session.getAttribute("existAccount");
		if(account != null ) {
			return invocation.invoke();
		}else {
			ActionContext actionContext = invocation.getInvocationContext();
			actionContext.getValueStack().set("message", "Äú»¹Ã»ÓÐµÇÂ¼£¡");
			return Action.LOGIN;
		}
		
	}

}
