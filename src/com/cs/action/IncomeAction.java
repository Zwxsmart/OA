package com.cs.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.cs.bean.Emp;
import com.cs.bean.Income;
import com.cs.bean.User;
import com.cs.commom.bean.ControllerResult;
import com.cs.commom.bean.Pager4EasyUI;
import com.cs.service.IncomeService;
import com.opensymphony.xwork2.ActionSupport;

public class IncomeAction extends ActionSupport implements ServletRequestAware {

	private static final long serialVersionUID = -1512560130158675888L;

	private IncomeService incomeService;// service
	private Income income;// bean
	private List<Income> rows;
	private ControllerResult result;
	private long total;
	private HttpServletRequest req;

	private String incomeTypeId;
	private String empId;
	private String stuId;
	
	private List<Map<String,String>> incomes;
	
	public List<Map<String, String>> getIncomes() {
		return incomes;
	}

	public String getStuId() {
		return stuId;
	}

	public void setStuId(String stuId) {
		this.stuId = stuId;
	}

	public String getEmpId() {
		return empId;
	}

	public void setEmpId(String empId) {
		this.empId = empId;
	}

	@Override
	public void setServletRequest(HttpServletRequest req) {
		this.req = req;
	}

	public Income getIncome() {
		return income;
	}

	public void setIncome(Income income) {
		this.income = income;
	}

	public long getTotal() {
		return total;
	}

	public void setTotal(long total) {
		this.total = total;
	}

	public String getIncomeTypeId() {
		return incomeTypeId;
	}

	public void setIncomeTypeId(String incomeTypeId) {
		this.incomeTypeId = incomeTypeId;
	}

	public List<Income> getRows() {
		return rows;
	}

	public ControllerResult getResult() {
		return result;
	}

	public void setIncomeService(IncomeService incomeService) {
		this.incomeService = incomeService;
	}

	// 页面跳转
	public String incomePage() {
		Emp emp = (Emp) (req).getSession().getAttribute("emp");// 获取此登陆id对象
		if (incomeService.queryPrevillige(emp.getRoleId(), IncomeAction.class.getName() + ".incomePage")) {
			return "income";
		} else {
			result = ControllerResult.getSuccessResult("权限不足");
			return "NoPrevillige";
		}
	}

	// 添加
	public String save() {
		Emp emp = (Emp) (req).getSession().getAttribute("emp");
		if (incomeService.queryPrevillige(emp.getRoleId(), StuIntentionAction.class.getName() + ".update")) {
			income.setEmpId(empId);
			income.setIncomeTypeId(incomeTypeId);
			income.setStuId(stuId);
			incomeService.save(income);
			result = ControllerResult.getSuccessResult("添加成功");
		} else {
			result = ControllerResult.getSuccessResult("权限不足");
		}
		return "save";
	}

	// 分页查询
	public String queryAll() {
		Emp emp = (Emp) (req).getSession().getAttribute("emp");
		if (incomeService.queryPrevillige(emp.getRoleId(), StuIntentionAction.class.getName() + ".update")) {
			String pageNoStr = req.getParameter("page");
			String pageSizeStr = req.getParameter("rows");
			Pager4EasyUI<Income> pager = new Pager4EasyUI<Income>();
			if (pageNoStr != null) {
				pager.setPageNo(Integer.valueOf(pageNoStr));
				pager.setPageSize(Integer.valueOf(pageSizeStr));
			}
			pager = incomeService.queryByPager("Income", pager, "");
			pager.setTotal(incomeService.count("Income", ""));
			rows = pager.getRows();
			total = pager.getTotal();
		} else {
			result = ControllerResult.getSuccessResult("权限不足");
		}
		return "all";
	}

	// 用id查询
	public String queryById(String id) {
		Emp emp = (Emp) (req).getSession().getAttribute("emp");
		if (incomeService.queryPrevillige(emp.getRoleId(), StuIntentionAction.class.getName() + ".update")) {
			Income income = incomeService.queryById(User.class, id);
			System.out.println(income);

		} else {
			result = ControllerResult.getSuccessResult("权限不足");
		}
		return "id";
	}

	// 更新信息
	public String update() {
		Emp emp = (Emp) (req).getSession().getAttribute("emp");
		if (incomeService.queryPrevillige(emp.getRoleId(), StuIntentionAction.class.getName() + ".update")) {
			income.setIncomeId(income.getIncomeId());
			income.setIncomeTypeId(income.getIncomeTypeId());
			income.setEmpId(income.getEmpId());
			income.setStuId(income.getStuId());
			incomeService.update(income);
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
		if (incomeService.queryPrevillige(emp.getRoleId(), StuIntentionAction.class.getName() + ".update")) {
			String pageNoStr = req.getParameter("page");
			String pageSizeStr = req.getParameter("rows");
			String value = req.getParameter("value1");
			String name = req.getParameter("name1");
			System.out.println("value :" + value + ", name: " + name);
			Pager4EasyUI<Income> pager = new Pager4EasyUI<Income>();
			if (pageNoStr != null) {
				pager.setPageNo(Integer.valueOf(pageNoStr));
				pager.setPageSize(Integer.valueOf(pageSizeStr));
			}
			pager = incomeService.blurredAllQueryPager("Income", pager, value, name);
			rows = pager.getRows();
			total = pager.getTotal();
		} else {
			result = ControllerResult.getSuccessResult("权限不足");
		}
		return "blurredAllQuery";
	}
	
	/**
	 * 跳转到收入图表页面
	 */
	public String incomebiaoge(){
		return "incomebiaoge";
	}
	
	public String getChartsPie(){
		System.out.println("进入到数据表格");
		incomes =incomeService.payQueryTypeName();
		return "getChartsPie";
	}
}