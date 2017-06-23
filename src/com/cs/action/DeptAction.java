package com.cs.action;

import java.util.List;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.cs.bean.Dept;
import com.cs.bean.Emp;
import com.cs.bean.EmpDept;
import com.cs.commom.bean.ControllerResult;
import com.cs.commom.bean.Pager4EasyUI;
import com.cs.service.DeptService;
import com.opensymphony.xwork2.ActionSupport;

public class DeptAction extends ActionSupport implements ServletRequestAware{
	
	private static final long serialVersionUID = -193703670800050101L;
	
	private DeptService deptService;
	private Dept dept;
	private List<EmpDept> rows;
	private long total;
	private String id;
	public ControllerResult result;
	public HttpServletRequest req;
	private EmpDept ed;
	private String empId;
	
	
	
	
	public String getEmpId() {
		return empId;
	}

	public void setEmpId(String empId) {
		this.empId = empId;
	}

	public EmpDept getEd() {
		return ed;
	}

	public void setEd(EmpDept ed) {
		this.ed = ed;
	}

	public ControllerResult getResult() {
		return result;
	}
	
	@Override
	public void setServletRequest(HttpServletRequest req) {
		this.req = req;
	}


	public void setDeptService(DeptService deptService) {
		this.deptService = deptService;
	}

	public Dept getDept() {
		return dept;
	}

	public void setDept(Dept dept) {
		this.dept = dept;
	}

	
	public List<EmpDept> getRows() {
		return rows;
	}

	public long getTotal() {
		return total;
	}

	public void setTotal(long total) {
		this.total = total;
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
		String actionName = DeptAction.class.getName();
		if (deptService.queryPrevillige(emp.getRoleId(), actionName + ".skipPage")) {
			return "skip";
		}else {
			return "NoPrevillige";
		}
	   
	}
	
	/**
	 * 招生部主任跳转页面
	 * @return
	 */
	public String admissionsSkipPage() {
	   return "admissionsSkip";
	}

	/**
	 * 添加部门
	 */
	public String add() {
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		String actionName = DeptAction.class.getName();
		if (deptService.queryPrevillige(emp.getRoleId(), actionName + ".add")) {
			System.out.println(dept.getName() + "aaaaaaaaaaaaaaa");
			boolean a = deptService.queryByName("t_dept", dept.getName());
			System.out.println(a + "11111111111");
			if (!deptService.queryByName("t_dept", dept.getName())) {
				if (empId != null && !empId.trim().equals("")) {
					dept.setEmpId(empId);
				}
				dept.setStatus(1);
				deptService.save(dept);
				result = ControllerResult.getSuccessResult("添加成功");
			} else {
				result = ControllerResult.getSuccessResult("部门已存在");
			}
			
			
		}else {
			result = ControllerResult.getFailResult("权限不足");
		}
		return "save";
	}

	/**
	 * 查询所有的部门
	 */
	public String queryAll() {
		String pageNoStr = req.getParameter("page");
		String pageSizeStr = req.getParameter("rows");
		Pager4EasyUI<EmpDept> pager = new Pager4EasyUI<EmpDept>();
		if (pageNoStr != null) {
			pager.setPageNo(Integer.valueOf(pageNoStr));
			pager.setPageSize(Integer.valueOf(pageSizeStr));
		}
		pager = deptService.queryByPager(pager);
		pager.setTotal(deptService.count("Dept",""));
		rows = pager.getRows();
		total = pager.getTotal();
		return "all";
	}
	
	/**
	 * 修改部门
	 */
	public String update() {
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		String actionName = DeptAction.class.getName();
		if (deptService.queryPrevillige(emp.getRoleId(), actionName + ".update")) {
			dept.setDepId(dept.getDepId());
			dept.setEmpId(dept.getEmpId());
			deptService.update(dept);
			result = ControllerResult.getSuccessResult("修改成功");
		}else {
			result = ControllerResult.getFailResult("权限不足");
		}
		return "update";
	}
	
	
	/**
	 * 测试
	 */
	public String query() {
		dept = deptService.queryById(Dept.class, "拜拜");
		System.out.println(dept.getName());
		return "query";
	}
	

	/**
	 * 禁用
	 * @return
	 */
	public String depDisable(){ 
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		String actionName = DeptAction.class.getName();
		if (deptService.queryPrevillige(emp.getRoleId(), actionName + ".depDisable")) {
			deptService.updateStatus("Dept","depId",0, id);
			
		}else {
		}
		return "disable";
		
	}
	
	/**
	 * 启用
	 * @return
	 */
	public String depActivate(){
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		String actionName = DeptAction.class.getName();
		if (deptService.queryPrevillige(emp.getRoleId(), actionName + ".depActivate")) {
			deptService.updateStatus("Dept","depId",1, id);
			
		}else {
		}
		return "activate";
		
	}
	
	
	/**
	 * 教务主任 王怡 跳转到查看部门信息
	 */
	public String eadskipPage(){
		return "eadskippage";
	}
}
