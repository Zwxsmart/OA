package com.cs.action;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.cs.bean.CheckInfo;
import com.cs.bean.Emp;
import com.cs.bean.EmpChecking;
import com.cs.bean.EmpCheckingInfo;
import com.cs.commom.bean.ControllerResult;
import com.cs.commom.bean.Pager4EasyUI;
import com.cs.service.EmpCheckingInfoService;
import com.cs.service.EmpCheckingService;
import com.opensymphony.xwork2.ActionSupport;


public class EmpCheckingAction extends ActionSupport implements ServletRequestAware {
	
	
	private static final long serialVersionUID = -5887180074817146721L;
	
	private EmpCheckingService empCheckingService;
	private long total;
	private EmpChecking empChecking;
	private List<EmpChecking> rows;
	private List<EmpChecking> checkinfo;
	private List<CheckInfo> lists;
	private String id;
	public ControllerResult result;
	public HttpServletRequest req;
	
	private EmpCheckingInfo empCheckingInfo;
	private EmpCheckingInfoService empCheckingInfoService;
	private List<EmpCheckingInfo> infoList;
	
	
	public List<EmpCheckingInfo> getInfoList() {
		return infoList;
	}
	
	

	public List<CheckInfo> getLists() {
		return lists;
	}



	public void setLists(List<CheckInfo> lists) {
		this.lists = lists;
	}



	public List<EmpChecking> getCheckinfo() {
		return checkinfo;
	}



	public void setEmpCheckingInfoService(EmpCheckingInfoService empCheckingInfoService) {
		this.empCheckingInfoService = empCheckingInfoService;
	}

	public EmpCheckingInfo getEmpCheckingInfo() {
		return empCheckingInfo;
	}

	public void setEmpCheckingInfo(EmpCheckingInfo empCheckingInfo) {
		this.empCheckingInfo = empCheckingInfo;
	}

	public ControllerResult getResult() {
		return result;
	}
	
	@Override
	public void setServletRequest(HttpServletRequest req) {
		this.req = req;
	}
	
	public EmpChecking getEmpChecking() {
		return empChecking;
	}

	public void setEmpChecking(EmpChecking empChecking) {
		this.empChecking = empChecking;
	}

	public long getTotal() {
		return total;
	}

	public List<EmpChecking> getRows() {
		return rows;
	}

	public void setEmpCheckingService(EmpCheckingService empCheckingService) {
		this.empCheckingService = empCheckingService;
	}
	
	public void setId(String id) {
		this.id = id;
	}

	/**
	 * 主页跳转到考勤页面
	 * @return
	 */
	public String skipPage() {
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		String actionName = EmpCheckingAction.class.getName();
		if (empCheckingService.queryPrevillige(emp.getRoleId(), actionName + ".skipPage")) {
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
	 * 添加考勤信息
	 */
	public String save() {
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		String actionName = EmpCheckingAction.class.getName();
		if (empCheckingService.queryPrevillige(emp.getRoleId(), actionName + ".save")) {
			empCheckingService.save(empChecking);
			result = ControllerResult.getSuccessResult("添加成功");
		}else {
			result = ControllerResult.getFailResult("权限不足");
		}
		return "save";
	}
	
	/**
	 * 分页查询所有考勤信息
	 */
	public String queryAll() {
		String pageNoStr = req.getParameter("page");
        String pageSizeStr = req.getParameter("rows");
        Pager4EasyUI<EmpChecking> pager = new Pager4EasyUI<EmpChecking>();
        if (pageNoStr != null) {
            pager.setPageNo(Integer.valueOf(pageNoStr));
            pager.setPageSize(Integer.valueOf(pageSizeStr));
        }
        pager = empCheckingService.queryByPager("EmpChecking", pager, "");
        pager.setTotal(empCheckingService.count("EmpChecking",""));
        rows = pager.getRows();
        total = pager.getTotal();
        return "all";
	}
	
	/**
	 * 查询单个考勤信息详情
	 */
	public String queryById(String id){
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		String actionName = EmpCheckingAction.class.getName();
		if (empCheckingService.queryPrevillige(emp.getRoleId(), actionName + ".queryById")) {
			EmpChecking EmpChecking = empCheckingService.queryById(EmpChecking.class, id);
			System.out.println(EmpChecking);
		}else {

		}
		return "id";
		
	}
	
	/**
	 * 修改考勤信息
	 */
	public String update() {
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		String actionName = EmpCheckingAction.class.getName();
		if (empCheckingService.queryPrevillige(emp.getRoleId(), actionName + ".update")) {
			empCheckingService.update(empChecking);
			result = ControllerResult.getSuccessResult("修改成功");
		}else {
			result = ControllerResult.getFailResult("权限不足");
		}
		return "update";
	}
	
	/**
	 * 删除考勤信息
	 */
	public String deleteById() {
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		String actionName = EmpCheckingAction.class.getName();
		if (empCheckingService.queryPrevillige(emp.getRoleId(), actionName + ".deleteById")) {
			empChecking = new EmpChecking();
			empChecking.setCheckingId(id);
			empCheckingService.delete(empChecking);
			result = ControllerResult.getSuccessResult("修改成功");
		}else {
			result = ControllerResult.getFailResult("权限不足");
		}
		return "update";
	}

	
	/**
	 * 教务主任 王怡 跳转到员工考勤页面
	 */
	public String eadskipPage(){
		return "eadskippage";
	}
	
	

	/**
	 * 	按照部门查询该部门所有员工的考勤信息。 
	 * @throws IOException 
	 */
	public String empChecking() throws IOException{
		Emp emp = (Emp)(req).getSession().getAttribute("emp");//获取此登陆id对象
//		if(empCheckingService.queryPrevillige(emp.getRoleId(), StuCheckingAction.class.getName() + ".empChecking")){
			String depId=req.getParameter("depId");
			String year = req.getParameter("year");
			String month = req.getParameter("month");
			String startMonth = year + "-" + month + "-" + "1";
	  		String endMonth= year + "-" + month + "-" + "31" ;
	  		System.out.println(startMonth + ", " + endMonth);
	  		System.out.println(depId + "aaaaaaaaaaaaaaaaaaaaaaaaaaaa");
	  		checkinfo = empCheckingService.queryByMonth(depId,startMonth, endMonth);
	  		infoList = empCheckingInfoService.query();
	  		String a = null;
	  		for (EmpCheckingInfo s : infoList) {
				System.out.println(s.toString() + "ccccccccccccccccc");
				a = s.getCheckingTime();
			}
	  		
		return "empChecking";
	}


}
