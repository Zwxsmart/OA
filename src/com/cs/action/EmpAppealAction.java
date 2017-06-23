package com.cs.action;

import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.cs.bean.Emp;
import com.cs.bean.EmpAppeal;
import com.cs.commom.bean.ControllerResult;
import com.cs.commom.bean.Pager4EasyUI;
import com.cs.service.EmpAppealService;
import com.opensymphony.xwork2.ActionSupport;


public class EmpAppealAction extends ActionSupport implements ServletRequestAware {
	
	
	private static final long serialVersionUID = -5887180074817146721L;
	
	private EmpAppealService empAppealService;
	private long total;
	private EmpAppeal empAppeal;
	private List<EmpAppeal> rows;
	private String id;
	public ControllerResult result;
	public HttpServletRequest req;
	
	public EmpAppeal getEmpAppeal() {
		return empAppeal;
	}

	public void setEmpAppeal(EmpAppeal empAppeal) {
		this.empAppeal = empAppeal;
	}

	@Override
	public void setServletRequest(HttpServletRequest req) {	
		this.req = req;
	}
	
	public long getTotal() {
		return total;
	}

	public List<EmpAppeal> getRows() {
		return rows;
	}

	public ControllerResult getResult() {
		return result;
	}

	public void setEmpAppealService(EmpAppealService empAppealService) {
		this.empAppealService = empAppealService;
	}

	public void setId(String id) {
		this.id = id;
	}


	/**
	 * 主页跳转到考勤申诉页面
	 * @return
	 */
	public String skipPage() {
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		String actionName = EmpAppealAction.class.getName();
		if (empAppealService.queryPrevillige(emp.getRoleId(), actionName + ".skipPage")) {
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
	 * 添加考勤申诉信息
	 */
	public String save() {
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		String actionName = EmpAppealAction.class.getName();
		if (empAppealService.queryPrevillige(emp.getRoleId(), actionName + ".save")) {
			empAppeal.setStatus(1);
			empAppealService.save(empAppeal);
			result = ControllerResult.getSuccessResult("添加成功");
		}else {
			result = ControllerResult.getFailResult("权限不足");
		}
		return "save";
	}
	
	/**
	 * 分页查询所有考勤申诉信息
	 */
	public String queryAll() {
		String pageNoStr = req.getParameter("page");
        String pageSizeStr = req.getParameter("rows");
        Pager4EasyUI<EmpAppeal> pager = new Pager4EasyUI<EmpAppeal>();
        if (pageNoStr != null) {
            pager.setPageNo(Integer.valueOf(pageNoStr));
            pager.setPageSize(Integer.valueOf(pageSizeStr));
        }
        pager = empAppealService.queryByPager("EmpAppeal", pager, "");
        pager.setTotal(empAppealService.count("EmpAppeal",""));
        rows = pager.getRows();
        total = pager.getTotal();
        return "all";
	}
	
	/**
	 * 查询单个考勤申诉信息详情
	 */
	public String queryById(String id){
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		String actionName = EmpAppealAction.class.getName();
		if (empAppealService.queryPrevillige(emp.getRoleId(), actionName + ".queryById")) {
			EmpAppeal EmpAppeal = empAppealService.queryById(EmpAppeal.class, id);
			System.out.println(EmpAppeal);
		}else {

		}
		return "id";
	
	}
	
	/**
	 * 修改考勤申诉信息
	 */
	public String update() {
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		String actionName = EmpAppealAction.class.getName();
		if (empAppealService.queryPrevillige(emp.getRoleId(), actionName + ".update")) {
			empAppealService.update(empAppeal);
			result = ControllerResult.getSuccessResult("修改成功");
		}else {
			result = ControllerResult.getFailResult("权限不足");
		}
		return "update";
	}

	/**
	 * 禁用
	 * @return
	 */
	public String empAppealDisable(){ 
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		String actionName = EmpAppealAction.class.getName();
		if (empAppealService.queryPrevillige(emp.getRoleId(), actionName + ".empAppealDisable")) {
			empAppealService.updateStatus("EmpAppeal","appealId",0, id);
		}else {
			
		}
		return "disable";
		
	}
	
	/**
	 * 启用
	 * @return
	 */
	public String empAppealActivate(){
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		String actionName = EmpAppealAction.class.getName();
		if (empAppealService.queryPrevillige(emp.getRoleId(), actionName + ".empAppealActivate")) {
			empAppealService.updateStatus("EmpAppeal","appealId",1, id);
		}else {

		}
		return "activate";
		
	}
	
	
	/**
	 * 教务部主任 王怡 跳转到员工考勤申述页面
	 */
	public String eadskipPage() {
        return "eadskippager";
	}
}
