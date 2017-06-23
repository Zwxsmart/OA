package com.cs.action;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.cs.bean.Emp;
import com.cs.commom.bean.ControllerResult;
import com.cs.service.PrevilligeSerivce;

/**
 * 权限action
 * @author 张文星
 *
 */
public class AuthorityAction implements ServletRequestAware{
	private PrevilligeSerivce preService;
	private HttpServletRequest req;
	private ControllerResult result;
	private String methodName;
	
	@Override
	public void setServletRequest(HttpServletRequest req) {
		this.req = req;
	}

	public void setMethodName(String methodName) {
		this.methodName = methodName;
	}

	public void setPreService(PrevilligeSerivce preService) {
		this.preService = preService;
	}

	public ControllerResult getResult() {
		return result;
	}
	
	public String authority() {
		Emp emp = (Emp)req.getSession().getAttribute("emp");//获取此登陆id对象
		String roleId = emp.getRoleId();
		if (preService.queryPrevillige(roleId, methodName)) {
			result = ControllerResult.getSuccessResult("拥有权限");
		} else {
			result = ControllerResult.getFailResult("权限不足");
		}
		return "authority";
	}

}
