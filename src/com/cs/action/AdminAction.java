package com.cs.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.cs.bean.DRECommom;
import com.cs.bean.Emp;
import com.cs.service.EmpService;
import com.opensymphony.xwork2.ActionSupport;

public class AdminAction extends ActionSupport implements ServletRequestAware {
private static final long serialVersionUID = -4820241217183786224L;
	
	private EmpService empService;
	private Emp emp;
	private HttpSession session;


	public HttpServletRequest req;
	
	@Override
	public void setServletRequest(HttpServletRequest req) {
		this.req = req;
	}
	
	
	public void setEmpService(EmpService empService) {
		this.empService = empService;
	}

	public Emp getEmp() {
		return emp;
	}

	public void setEmp(Emp emp) {
		this.emp = emp;
	}
	
	/**
	 * 管理员登陆页面
	 * @return
	 */
	public String loginPage() {
		return "loginPage";
	}

	/**
	 * 员工登陆操作
	 */
	public String login() {
		session = req.getSession();
		List<Emp> list = empService.queryEmailPwd(emp);
		for (Emp e : list) {
			if (e != null) {
				Emp emp = new Emp();
				emp.setEmpId(e.getEmpId());
				emp.setName(e.getName());
				session.setAttribute("emp", emp);
				return "login";
			}
		}
		return "input";
	}
	/**
	 * 安全退出session
	 * @return
	 */
	public String outSession() {
		session = req.getSession();
		if (session.getAttribute("emp") != null) {
			session.removeAttribute("emp");
		}
		return "out";
	}
}
