package com.cs.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.cs.bean.Emp;
import com.cs.bean.Salary;
import com.cs.bean.SalaryInfo;
import com.cs.bean.User;
import com.cs.commom.bean.ControllerResult;
import com.cs.commom.bean.Pager4EasyUI;
import com.cs.service.SalaryInfoService;
import com.cs.service.SalaryService;
import com.opensymphony.xwork2.ActionSupport;

public class SalaryAction extends ActionSupport implements ServletRequestAware {

	private static final long serialVersionUID = -1512560130158675888L;

	private SalaryService salaryService;
	private Salary salary;
	private long total;
	private List<Salary> rows;
	private ControllerResult result;
	private HttpServletRequest req;
	int a;

	private String salaryId;

	private String empId;

	public String getEmpId() {
		return empId;
	}

	public void setEmpId(String empId) {
		this.empId = empId;
	}

	public String getSalaryId() {
		return salaryId;
	}

	public void setSalaryId(String salaryId) {
		this.salaryId = salaryId;
	}

	@Override
	public void setServletRequest(HttpServletRequest req) {
		this.req = req;
	}

	public void setSalaryService(SalaryService salaryService) {
		this.salaryService = salaryService;
	}

	public Salary getSalary() {
		return salary;
	}

	public long getTotal() {
		return total;
	}

	public void setTotal(long total) {
		this.total = total;
	}

	public void setSalary(Salary salary) {
		this.salary = salary;
	}
	public List<Salary> getRows() {
		return rows;
	}

	public ControllerResult getResult() {
		return result;
	}

	public String salaryPage() {
		Emp emp = (Emp) (req).getSession().getAttribute("emp");
		if (salaryService.queryPrevillige(emp.getRoleId(), SalaryAction.class.getName() + ".salaryPage")) {
			return "salary";
		} else {
			return "NoPrevillige";
		}
	}

	/**
	 * 招生部主任
	 * 
	 * @return
	 */
	public String admissionsSkipPage() {
		return "admissionsSkip";
	}

	/**
	 * 添加基本工资
	 */
	public String save() {
		Emp emp = (Emp) (req).getSession().getAttribute("emp");
		if (salaryService.queryPrevillige(emp.getRoleId(), SalaryAction.class.getName() + ".save")) {
			salary.setEmpId(empId);
			salary.setTotalSalary(salaryService.querysalary(empId)+salary.getExtraSalary() - salary.getSubSalary());
			salaryService.save(salary);
			result = ControllerResult.getSuccessResult("添加成功");
			return "save";
		} else {
			result = ControllerResult.getSuccessResult("权限不足");
			return "NoPrevillige";
		}
	}

	/**
	 * 分页查询所有工资信息
	 */
	public String queryAll() {
		Emp emp = (Emp) (req).getSession().getAttribute("emp");
		if (salaryService.queryPrevillige(emp.getRoleId(), SalaryAction.class.getName() + ".save")) {
			String pageNoStr = req.getParameter("page");
			String pageSizeStr = req.getParameter("rows");
			Pager4EasyUI<Salary> pager = new Pager4EasyUI<Salary>();
			if (pageNoStr != null) {
				pager.setPageNo(Integer.valueOf(pageNoStr));
				pager.setPageSize(Integer.valueOf(pageSizeStr));
			}
			pager = salaryService.queryByPager("Salary", pager, "");
			pager.setTotal(salaryService.count("Salary", ""));
			rows = pager.getRows();
			total = pager.getTotal();
		} else {
			result = ControllerResult.getSuccessResult("权限不足");
		}
		return "all";
	}

	public String queryById(String id) {
		Emp emp = (Emp) (req).getSession().getAttribute("emp");
		if (salaryService.queryPrevillige(emp.getRoleId(), SalaryAction.class.getName() + ".save")) {
			Salary salary = salaryService.queryById(User.class, id);
			System.out.println(salary);
		} else {
			result = ControllerResult.getSuccessResult("权限不足");
		}
		return "id";
	}

	/**
	 * 修改工资详情
	 */
	public String update() {
		Emp emp = (Emp) (req).getSession().getAttribute("emp");
		if (salaryService.queryPrevillige(emp.getRoleId(), SalaryAction.class.getName() + ".save")) {
			salary.setSalaryId(salary.getSalaryId());
			salary.setEmpId(salary.getEmpId());
			salaryService.update(salary);
			result = ControllerResult.getSuccessResult("修改成功");
		} else {
			result = ControllerResult.getSuccessResult("权限不足");
		}
		return "update";
	}

	/**
	 * 模糊查询
	 */
	public String blurredAllQuery() {
		Emp emp = (Emp) (req).getSession().getAttribute("emp");
		if (salaryService.queryPrevillige(emp.getRoleId(), SalaryAction.class.getName() + ".save")) {
			String pageNoStr = req.getParameter("page");
			String pageSizeStr = req.getParameter("rows");
			String value = req.getParameter("value1");
			String name = req.getParameter("name1");
			System.out.println("value :" + value + ", name: " + name);
			Pager4EasyUI<Salary> pager = new Pager4EasyUI<Salary>();
			if (pageNoStr != null) {
				pager.setPageNo(Integer.valueOf(pageNoStr));
				pager.setPageSize(Integer.valueOf(pageSizeStr));
			}
			pager = salaryService.blurredAllQueryPager("Salary", pager, value, name);
			rows = pager.getRows();
			total = pager.getTotal();
		} else {
			result = ControllerResult.getSuccessResult("权限不足");
		}
		return "blurredAllQuery";
	}


	

	// 时间段查询
	// public String serachTime(){
	// Emp emp = (Emp) (req).getSession().getAttribute("emp");
	// String pageNoStr = req.getParameter("page");
	// String pageSizeStr = req.getParameter("rows");
	// String beginTime=req.getParameter("beginTime");
	// String endTime=req.getParameter("endTime");
	// System.out.println("开始时间"+beginTime+"结束时间："+endTime);
	// Pager4EasyUI<Salary> pager = new Pager4EasyUI<Salary>();
	// if (pageNoStr != null) {
	// pager.setPageNo(Integer.valueOf(pageNoStr));
	// pager.setPageSize(Integer.valueOf(pageSizeStr));
	// }
	// pager=salaryService.queryByDay(pager,beginTime,endTime, "Salary",
	// "buyDay");
	// System.out.println(pager.toString());
	// pager.setTotal(salaryService.count("Salary", ""));
	// rows = pager.getRows();
	// total = pager.getTotal();
	// return "serachtime";
	// }
}