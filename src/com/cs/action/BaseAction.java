package com.cs.action;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.cs.commom.bean.ControllerResult;

public class BaseAction implements ServletRequestAware {
	
	public ControllerResult result;
	public ServletRequest req;
	
	public ControllerResult getResult() {
		return result;
	}
	
	@Override
	public void setServletRequest(HttpServletRequest req) {
		this.req = req;
	}

}
