package com.cs.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.cs.bean.Emp;
import com.cs.bean.IncomeType;
import com.cs.bean.User;
import com.cs.commom.bean.ControllerResult;
import com.cs.commom.bean.Pager4EasyUI;
import com.cs.service.IncomeTypeService;
import com.opensymphony.xwork2.ActionSupport;

public class IncomeTypeAction extends ActionSupport implements ServletRequestAware {

	private static final long serialVersionUID = -1512560130158675888L;

	private IncomeTypeService incomeTypeService;// service

	private IncomeType incomeType;// bean

	private List<IncomeType> rows;

	private ControllerResult result;

	private String id;

	private long total;

	private HttpServletRequest req;

	@Override
	public void setServletRequest(HttpServletRequest req) {
		this.req = req;
	}

	public void setincomeTypeService(IncomeTypeService incomeTypeService) {
		this.incomeTypeService = incomeTypeService;
	}

	public IncomeType getIncomeType() {
		return incomeType;
	}

	public void setIncomeType(IncomeType incomeType) {
		this.incomeType = incomeType;
	}

	public long getTotal() {
		return total;
	}

	public void setTotal(long total) {
		this.total = total;
	}

	public List<IncomeType> getRows() {
		return rows;
	}

	public void setId(String id) {
		this.id = id;
	}

	public ControllerResult getResult() {
		return result;
	}

	public String incomeTypePage() {
		Emp emp = (Emp) (req).getSession().getAttribute("emp");
		if (incomeTypeService.queryPrevillige(emp.getRoleId(), IncomeTypeAction.class.getName() + ".incomeTypePage")) {
			return "incomeType";
		} else {
			return "NoPrevillige";
		}
	}

	public String save() {
		Emp emp = (Emp) (req).getSession().getAttribute("emp");
		if (incomeTypeService.queryPrevillige(emp.getRoleId(), IncomeTypeAction.class.getName() + ".save")) {
			incomeTypeService.save(incomeType);
			incomeType.setStatus(1);//添加状态默认为启用
			result = ControllerResult.getSuccessResult("添加成功");
		} else {
			result = ControllerResult.getSuccessResult("权限不足");
		}
		return "save";
	}

	public String queryAll() {
		Emp emp = (Emp) (req).getSession().getAttribute("emp");
		if (incomeTypeService.queryPrevillige(emp.getRoleId(), IncomeTypeAction.class.getName() + ".save")) {
			String pageNoStr = req.getParameter("page");
			String pageSizeStr = req.getParameter("rows");
			Pager4EasyUI<IncomeType> pager = new Pager4EasyUI<IncomeType>();
			String sql = "";
			if (pageNoStr != null) {
				pager.setPageNo(Integer.valueOf(pageNoStr));
				pager.setPageSize(Integer.valueOf(pageSizeStr));
			}
			pager = incomeTypeService.queryByPager("IncomeType", pager, sql);
			pager.setTotal(incomeTypeService.count("IncomeType", sql));
			rows = pager.getRows();
			total = pager.getTotal();
		} else {
			result = ControllerResult.getSuccessResult("权限不足");
		}
		return "all";
	}

	public String queryById(String id) {
		Emp emp = (Emp) (req).getSession().getAttribute("emp");
		if (incomeTypeService.queryPrevillige(emp.getRoleId(), IncomeTypeAction.class.getName() + ".save")) {
			IncomeType incomeType = incomeTypeService.queryById(User.class, id);
			System.out.println(incomeType);
		} else {
			result = ControllerResult.getSuccessResult("权限不足");
		}
		return "id";
	}

	public String update() {
		Emp emp = (Emp) (req).getSession().getAttribute("emp");
		if (incomeTypeService.queryPrevillige(emp.getRoleId(), IncomeTypeAction.class.getName() + ".incomeTypePage")) {
			incomeTypeService.update(incomeType);
			result = ControllerResult.getSuccessResult("修改成功");
		} else {
			result = ControllerResult.getSuccessResult("权限不足");
		}
		return "update";
	}

	/**
	 * 禁用
	 * 
	 * @return
	 */
	public String incomeTypeDisable() {
		Emp emp = (Emp) (req).getSession().getAttribute("emp");// 获取此登陆id对象
		if (incomeTypeService.queryPrevillige(emp.getRoleId(), IncomeTypeAction.class.getName() + ".incomeDisable")) {
			incomeTypeService.updateStatus("IncomeType", "incomeTypeId", 0, id);
		} else {
			result = ControllerResult.getSuccessResult("权限不足");
		}
		return "disable";
	}

	/**
	 * 启用
	 * 
	 * @return
	 */
	public String incomeTypeActivate() {
		Emp emp = (Emp) (req).getSession().getAttribute("emp");// 获取此登陆id对象
		if (incomeTypeService.queryPrevillige(emp.getRoleId(),
				IncomeTypeAction.class.getName() + ".incomeTypeActivate")) {
			incomeTypeService.updateStatus("IncomeType", "incomeTypeId", 1, id);
		} else {
			result = ControllerResult.getSuccessResult("权限不足");
		}
		return "activate";
	}
}