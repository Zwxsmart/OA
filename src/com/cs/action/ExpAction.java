package com.cs.action;

import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.cs.bean.Emp;
import com.cs.bean.Exp;
import com.cs.bean.Report;
import com.cs.commom.bean.ControllerResult;
import com.cs.commom.bean.Pager4EasyUI;
import com.cs.service.ExpService;
import com.opensymphony.xwork2.ActionSupport;

public class ExpAction extends ActionSupport implements ServletRequestAware{
	
	private static final long serialVersionUID = -536961491155148576L;
	
	private ExpService expService;
	private Exp exp;
	private long total;
	private List<Exp> rows;
	private String id;
	public ControllerResult result;
	public HttpServletRequest req;
	private String empId;
	
	public String getEmpId() {
		return empId;
	}

	public void setEmpId(String empId) {
		this.empId = empId;
	}

	public ControllerResult getResult() {
		return result;
	}
	
	@Override
	public void setServletRequest(HttpServletRequest req) {
		this.req = req;
	}
	
	public void setExpService(ExpService expService) {
		this.expService = expService;
	}


	public Exp getExp() {
		return exp;
	}

	public void setExp(Exp exp) {
		this.exp = exp;
	}

	public List<Exp> getRows() {
		return rows;
	}

	public long getTotal() {
		return total;
	}

	public void setId(String id) {
		this.id = id;
	}

	
	/**
	 * 跳转页面
	 * @return
	 */
	public String skipPage() {
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		String actionName = ExpAction.class.getName();
		if (expService.queryPrevillige(emp.getRoleId(), actionName + ".skipPage")) {
			 return "skip";
		}else {
			return "NoPrevillige";
		}
	      
	}

	/**
	 * 添加员工经历
	 * @return
	 */
	public String save() {
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		String actionName = ExpAction.class.getName();
		if (expService.queryPrevillige(emp.getRoleId(), actionName + ".save")) {
			exp.setEmpId(empId);
			expService.save(exp);
			result = ControllerResult.getSuccessResult("添加成功");
		}else {
			result = ControllerResult.getFailResult("权限不足");
		}
		return "save";
	}
	
	/**
	 * 查询所有的员工经历
	 */
	public String queryAll() {
		String pageNoStr = req.getParameter("page");
		String pageSizeStr = req.getParameter("rows");
		Pager4EasyUI<Exp> pager = new Pager4EasyUI<Exp>();
		if (pageNoStr != null) {
			pager.setPageNo(Integer.valueOf(pageNoStr));
			pager.setPageSize(Integer.valueOf(pageSizeStr));
		}
		pager = expService.queryByPager("Exp", pager, "");
		pager.setTotal(expService.count("Exp",""));
		rows = pager.getRows();
		total = pager.getTotal();
		return "all";
	}
	
	
	/**
	 * 编辑员工经历
	 * @return
	 */
	public String update() {
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		String actionName = ExpAction.class.getName();
		if (expService.queryPrevillige(emp.getRoleId(), actionName + ".update")) {
			exp.setExpId(exp.getExpId());
			exp.setEmpId(empId);
			expService.update(exp);
			result = ControllerResult.getSuccessResult("编辑成功");
		}else {
			result = ControllerResult.getFailResult("权限不足");
		}
		return "update";
	}
	
	/**
	 * 删除员工经历
	 * @return
	 */
	public String deleteById() {
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		String actionName = ExpAction.class.getName();
		if (expService.queryPrevillige(emp.getRoleId(), actionName + ".deleteById")) {
			exp = new Exp();
			exp.setExpId(id);
			exp.setEmpId(empId);
			expService.delete(exp);
			result = ControllerResult.getSuccessResult("删除成功");
		}else {
			result = ControllerResult.getFailResult("权限不足");
		}
		return "delete";
		
	}
	
	/**
	 * 员工权限
	 */
	/**
	 * 员工个人工作经历模块页面
	 */
	public String empExpPage() {
		return "empExpPage";
	}
	
	/**
	 * 员工个人工作经历
	 */
	public String empExp() {
		String pageNoStr = req.getParameter("page");
		String pageSizeStr = req.getParameter("rows");
		Pager4EasyUI<Exp> pager = new Pager4EasyUI<Exp>();
		if (pageNoStr != null) {
			pager.setPageNo(Integer.valueOf(pageNoStr));
			pager.setPageSize(Integer.valueOf(pageSizeStr));
		}
		Emp emp = (Emp) req.getSession().getAttribute("emp");
		String a = emp.getEmpId();
		pager = expService.queryByPager("Exp where empId = '"+a+"'", pager, "");
		pager.setTotal(expService.count("Exp where empId = '"+a+"'",""));
		rows = pager.getRows();
		total = pager.getTotal();
		return "empExp";
	}
	
	public String saveExp() {
		Emp emp = (Emp) req.getSession().getAttribute("emp");
		exp.setEmpId(emp.getEmpId());
		expService.save(exp);
		result = ControllerResult.getSuccessResult("添加成功");
		return "saveExp";
	}
	
	
	//模糊查询
	public String blurredAllQuery(){
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		String actionName = ExpAction.class.getName();
		if (expService.queryPrevillige(emp.getRoleId(), actionName + ".blurredAllQuery")) {
			String pageNoStr = req.getParameter("page");
	        String pageSizeStr = req.getParameter("rows");
	        String value= req.getParameter("value1");
	        String name= req.getParameter("name1");
	        System.out.println("value :" + value +", name: "+ name);
	        Pager4EasyUI<Exp> pager = new Pager4EasyUI<Exp>();
	        if (pageNoStr != null) {
	            pager.setPageNo(Integer.valueOf(pageNoStr));
	            pager.setPageSize(Integer.valueOf(pageSizeStr));
	        }
	        pager = expService.blurredAllQueryPager("Emp", pager, value, name);
	        rows = pager.getRows();
	        total = pager.getTotal();
		}else {

		}
		return "blurredAll";
		
	}
		
		public String serachTime(){
			Emp emp = (Emp)req.getSession().getAttribute("emp");
			String actionName = ExpAction.class.getName();
			if (expService.queryPrevillige(emp.getRoleId(), actionName + ".serachTime")) {
				String startDay=req.getParameter("startDay");
				String endDay=req.getParameter("endDay");
				String pageNoStr = req.getParameter("page");
		        String pageSizeStr = req.getParameter("rows");
		        System.out.println("开始时间为："+startDay+"结束时间为："+endDay);
		        Pager4EasyUI<Exp> pager = new Pager4EasyUI<Exp>();
		        if (pageNoStr != null) {
		            pager.setPageNo(Integer.valueOf(pageNoStr));
		            pager.setPageSize(Integer.valueOf(pageSizeStr));
		          }
		        pager = expService.queryByDay(pager, startDay, endDay, "Exp", "startDay");
		        pager.setTotal(expService.count("Exp", ""));
		        rows = pager.getRows();
		        total = pager.getTotal();
			}else {

			}
			return "serachTime";
		}

}
