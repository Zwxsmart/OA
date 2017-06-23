package com.cs.action;

import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.cs.bean.Check;
import com.cs.bean.Duty;
import com.cs.bean.Emp;
import com.cs.bean.Exp;
import com.cs.commom.bean.ControllerResult;
import com.cs.commom.bean.Pager4EasyUI;
import com.cs.service.DutyService;
import com.opensymphony.xwork2.ActionSupport;

public class DutyAction extends ActionSupport implements ServletRequestAware {

	private static final long serialVersionUID = -7826543438217382746L;
	
	private DutyService DutyService;
	private Duty duty;
	private List<Duty> rows;
	private String id;
	private long total;
	public ControllerResult result;
	public HttpServletRequest req;
	
	public ControllerResult getResult() {
		return result;
	}
	
	@Override
	public void setServletRequest(HttpServletRequest req) {
		this.req = req;
	}
	

	public void setDutyService(DutyService DutyService) {
		this.DutyService = DutyService;
	}

	public Duty getDuty() {
		return duty;
	}

	public void setDuty(Duty duty) {
		this.duty = duty;
	}

	public List<Duty> getRows() {
		return rows;
	}

	public void setId(String id) {
		this.id = id;
	}

	public long getTotal() {
		return total;
	}

	public void setTotal(long total) {
		this.total = total;
	}
	
	/**
	 * 跳转页面
	 * @return
	 */
	public String skipPage() {
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		String actionName = DutyAction.class.getName();
		if (DutyService.queryPrevillige(emp.getRoleId(), actionName + ".skipPage")) {
			 return "skip";
		}else {
			return "NoPrevillige";
		}
	  
	}

	/**
	 * 招生部主任
	 * @return
	 */
	public String admissionsSkipPage() {
	        return "admissionsSkip";
	}
	
	/**
	 * 添加值班表
	 */
	public String save() {
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		String actionName = DutyAction.class.getName();
		if (DutyService.queryPrevillige(emp.getRoleId(), actionName + ".save")) {
			DutyService.save(duty);
			result = ControllerResult.getSuccessResult("添加成功");
		}else {
			result = ControllerResult.getFailResult("权限不足");
		}
		return "save";
	}

	/**
	 * 查询值班表
	 */
	public String queryAll() {
		String pageNoStr = req.getParameter("page");
		String pageSizeStr = req.getParameter("rows");
		Pager4EasyUI<Duty> pager = new Pager4EasyUI<Duty>();
		if (pageNoStr != null) {
			pager.setPageNo(Integer.valueOf(pageNoStr));
			pager.setPageSize(Integer.valueOf(pageSizeStr));
		}
		pager = DutyService.queryByPager("Duty", pager, "");
		pager.setTotal(DutyService.count("Duty",""));
		rows = pager.getRows();
		total = pager.getTotal();
		return "all";
	}
	
	/**
	 * 修改值班表
	 */
	public String update() {
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		String actionName = DutyAction.class.getName();
		if (DutyService.queryPrevillige(emp.getRoleId(), actionName + ".update")) {
			DutyService.update(duty);
			result = ControllerResult.getSuccessResult("修改成功");
		}else {
			result = ControllerResult.getFailResult("权限不足");
		}
		return "update";
	}
	
	/**
	 * 删除值班表
	 * @return
	 */
	public String deleteById() {
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		String actionName = DutyAction.class.getName();
		if (DutyService.queryPrevillige(emp.getRoleId(), actionName + ".deleteById")) {
			duty = new Duty();
			duty.setDutyId(id);
			DutyService.delete(duty);
			result = ControllerResult.getSuccessResult("删除成功");
		}else {
			result = ControllerResult.getFailResult("权限不足");
		}
		return "delete";
		
	}

	/**
	 * 模糊查询
	 */
	public String blurredAllQuery(){
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		String actionName = DutyAction.class.getName();
		if (DutyService.queryPrevillige(emp.getRoleId(), actionName + ".blurredAllQuery")) {
			String pageNoStr = req.getParameter("page");
	        String pageSizeStr = req.getParameter("rows");
	        String value= req.getParameter("value1");
	        String name= req.getParameter("name1");
	        System.out.println("value :" + value +", name: "+ name);
	        Pager4EasyUI<Duty> pager = new Pager4EasyUI<Duty>();
	        if (pageNoStr != null) {
	            pager.setPageNo(Integer.valueOf(pageNoStr));
	            pager.setPageSize(Integer.valueOf(pageSizeStr));
	        }
	        pager = DutyService.blurredAllQueryPager("Duty", pager, value, name);
	        rows = pager.getRows();
	        total = pager.getTotal();
		}else {

		}
		return "blurredAllQuery";
		
	}
	
	
	/**
	 * 教务主任 跳转到员工请假页面
	 */
	public String skipEadDuty(){
		return "eadskipPage";
	}
	
}
