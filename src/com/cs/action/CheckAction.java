package com.cs.action;

import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.cs.bean.Check;
import com.cs.bean.Duty;
import com.cs.bean.Emp;
import com.cs.bean.Meetting;
import com.cs.bean.Room;
import com.cs.commom.bean.ControllerResult;
import com.cs.commom.bean.Pager4EasyUI;
import com.cs.service.CheckService;
import com.opensymphony.xwork2.ActionSupport;

public class CheckAction extends ActionSupport implements ServletRequestAware {

	private static final long serialVersionUID = 8943691532636572540L;
	
	public HttpServletRequest req;
	private CheckService checkService;
	public ControllerResult result;
	private List<Check> rows;
	private long total;
	private Check check;
	private String id;
	
	private String empId;
	private String gradeId;
	private String roomId;
	
	public String getEmpId() {
		return empId;
	}

	public void setEmpId(String empId) {
		this.empId = empId;
	}

	public String getGradeId() {
		return gradeId;
	}

	public void setGradeId(String gradeId) {
		this.gradeId = gradeId;
	}

	public String getRoomId() {
		return roomId;
	}

	public void setRoomId(String roomId) {
		this.roomId = roomId;
	}

	public void setCheckService(CheckService checkService) {
		this.checkService = checkService;
	}

	@Override
	public void setServletRequest(HttpServletRequest req) {
		this.req = req;
	}

	public Check getCheck() {
		return check;
	}

	public void setCheck(Check check) {
		this.check = check;
	}

	public ControllerResult getResult() {
		return result;
	}

	public List<Check> getRows() {
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
		String actionName = CheckAction.class.getName();
		if (checkService.queryPrevillige(emp.getRoleId(), actionName + ".skipPage")) {
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
	 * 添加巡查表
	 */
	public String save() {
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		String actionName = CheckAction.class.getName();
		if (checkService.queryPrevillige(emp.getRoleId(), actionName + ".save")) {
			check.setEmpId(empId);
			if (gradeId != null && !gradeId.trim().equals("")) {
				check.setGradeId(gradeId);
			}
			if (roomId != null && !roomId.trim().equals("")) {
				check.setRoomId(roomId);
			}
			checkService.save(check);
			result = ControllerResult.getSuccessResult("添加成功");
		}else {
			result = ControllerResult.getFailResult("权限不足");
		}
		return "save";
	}

	/**
	 * 查询巡查表
	 */
	public String queryAll() {
		String pageNoStr = req.getParameter("page");
		String pageSizeStr = req.getParameter("rows");
		Pager4EasyUI<Check> pager = new Pager4EasyUI<Check>();
		if (pageNoStr != null) {
			pager.setPageNo(Integer.valueOf(pageNoStr));
			pager.setPageSize(Integer.valueOf(pageSizeStr));
		}
		pager = checkService.queryByPager("Check", pager, "");
		pager.setTotal(checkService.count("Check",""));
		rows = pager.getRows();
		total = pager.getTotal();
		return "all";
	}
	
	/**
	 * 修改巡查表
	 */
	public String update() {
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		String actionName = CheckAction.class.getName();
		if (checkService.queryPrevillige(emp.getRoleId(), actionName + ".update")) {
			check.setCheckId(check.getCheckId());
			check.setEmpId(empId);
			check.setGradeId(gradeId);
			check.setRoomId(roomId);
			checkService.update(check);
			result = ControllerResult.getSuccessResult("修改成功");
		}else {
			result = ControllerResult.getFailResult("权限不足");
		}
		return "update";
	}
	
	/**
	 * 删除巡查表
	 */
	public String deleteById() {
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		String actionName = CheckAction.class.getName();
		if (checkService.queryPrevillige(emp.getRoleId(), actionName + ".deleteById")) {
			check = new Check();
			check.setCheckId(id);
			check.setEmpId(empId);
			check.setGradeId(gradeId);
			check.setRoomId(roomId);
			checkService.delete(check);
			result = ControllerResult.getSuccessResult("修改成功");
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
		String actionName = CheckAction.class.getName();
		if (checkService.queryPrevillige(emp.getRoleId(), actionName + ".blurredAllQuery")) {
			String pageNoStr = req.getParameter("page");
	        String pageSizeStr = req.getParameter("rows");
	        String value= req.getParameter("value1");
	        String name= req.getParameter("name1");
	        System.out.println("value :" + value +", name: "+ name);
	        Pager4EasyUI<Check> pager = new Pager4EasyUI<Check>();
	        if (pageNoStr != null) {
	            pager.setPageNo(Integer.valueOf(pageNoStr));
	            pager.setPageSize(Integer.valueOf(pageSizeStr));
	        }
	        pager = checkService.blurredAllQueryPager("Check", pager, value, name);
	        rows = pager.getRows();
	        total = pager.getTotal();
		} else {
			
		}
		return "blurredAllQuery";
		
	}
	
	/**
	 * 时间查询
	 * @return
	 */
	public String serachTime(){
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		String actionName = CheckAction.class.getName();
		if (checkService.queryPrevillige(emp.getRoleId(), actionName + ".serachTime")) {
			String pageNoStr = req.getParameter("page");
	        String pageSizeStr = req.getParameter("rows");
			String beginTime=req.getParameter("beginTime");
			String endTime=req.getParameter("endTime");
			System.out.println("开始时间"+beginTime+"结束时间："+endTime);
			Pager4EasyUI<Check> pager = new Pager4EasyUI<Check>();
		    if (pageNoStr != null) {
		    	pager.setPageNo(Integer.valueOf(pageNoStr));
		        pager.setPageSize(Integer.valueOf(pageSizeStr));
		    }
			pager=checkService.queryByDay(pager,beginTime,endTime, "Check", "checkTime");
			System.out.println(pager.toString());
			pager.setTotal(checkService.count("Check", ""));
			rows = pager.getRows();
			total = pager.getTotal();
		}	else {
		}
		return "serachtime";
		
	}
	
	/**
	 * 员工个人巡查管理页面跳转
	 */
	public String empCheckPage() {
		return "empCheckPage";
	}
	
	/**
	 * 员工个人巡查管理
	 */
	public String empCheck() {
		String pageNoStr = req.getParameter("page");
		String pageSizeStr = req.getParameter("rows");
		Pager4EasyUI<Check> pager = new Pager4EasyUI<Check>();
		if (pageNoStr != null) {
			pager.setPageNo(Integer.valueOf(pageNoStr));
			pager.setPageSize(Integer.valueOf(pageSizeStr));
		}
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		
		pager = checkService.queryByPager("Check where empId = '"+emp.getEmpId()+"' ", pager, "");
		pager.setTotal(checkService.count("Check where empId = '"+emp.getEmpId()+"' ",""));
		rows = pager.getRows();
		total = pager.getTotal();
		return "empCheck";
	}
	
	/**
	 * 员工个人巡查添加
	 */
	public String saveEmpCheck() {
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		check.setEmpId(emp.getEmpId());
		if (gradeId != null && !gradeId.trim().equals("")) {
			check.setGradeId(gradeId);
		}
		if (roomId != null && !roomId.trim().equals("")) {
			check.setRoomId(roomId);
		}
		checkService.save(check);
		result = ControllerResult.getSuccessResult("添加成功");
		return "save";
	}
	
	
	
	/**
	 * 教务主任 员工个人巡查管理页面跳转
	 */
	public String skipEadCheck() {
		return "skipeadcheck";
	}
}
