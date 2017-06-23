package com.cs.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.cs.bean.Emp;
import com.cs.bean.StuChecking;
import com.cs.commom.bean.ControllerResult;
import com.cs.service.StuCheckingService;
import com.opensymphony.xwork2.ActionSupport;
/**
 * 学生考勤Action
 * @author 张文星
 *
 */
public class StuCheckingAction extends ActionSupport implements ServletRequestAware {
	
	private static final long serialVersionUID = -7433491681110583231L;

	private StuCheckingService stuCheckingService;
	
	private long total;
	private StuChecking stuStuChecking;
	private List<StuChecking> rows;
	private ControllerResult result;
	private String id;
	private HttpServletRequest req;
	private String gradeId;
	private HttpSession session;
	private List<StuChecking> stuList; 
	
	@Override
	public void setServletRequest(HttpServletRequest req) {
		this.req = req;
	}
	
	public List<StuChecking> getStuList() {
		return stuList;
	}
	
	public void setStuCheckingService(StuCheckingService stuCheckingService) {
		this.stuCheckingService = stuCheckingService;
	}
	public long getTotal() {
		return total;
	}
	public StuChecking getStuChecking() {
		return stuStuChecking;
	}
	public void setStuChecking(StuChecking stuStuChecking) {
		this.stuStuChecking = stuStuChecking;
	}
	public List<StuChecking> getRows() {
		return rows;
	}
	public ControllerResult getResult() {
		return result;
	}
	public String getId() {
		return id;
	}
	public String getGradeId() {
		return gradeId;
	}
	public void setGradeId(String gradeId) {
		this.gradeId = gradeId;
	}
	/**
	 * 跳转页面
	 * @return
	 */
	public String skipPage() {
		Emp emp = (Emp)(req).getSession().getAttribute("emp");//获取此登陆id对象
		if(stuCheckingService.queryPrevillige(emp.getRoleId(), StuCheckingAction.class.getName() + ".skipPage")){
			return "skip";
		}else{
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
		Emp emp = (Emp)(req).getSession().getAttribute("emp");//获取此登陆id对象
		if(stuCheckingService.queryPrevillige(emp.getRoleId(), StuCheckingAction.class.getName() + ".save")){
			stuCheckingService.save(stuStuChecking);
			result = ControllerResult.getSuccessResult("添加成功");
		}else{
			result = ControllerResult.getSuccessResult("权限不足");
		}
		return "save";
	}

	/**
	 * 查询所有考勤信息
	 */
	public String queryAll() {
		Emp emp = (Emp)(req).getSession().getAttribute("emp");//获取此登陆id对象
		if(stuCheckingService.queryPrevillige(emp.getRoleId(), StuCheckingAction.class.getName() + ".queryAll")){
			String gradeId=req.getParameter("gradeId");
			List<StuChecking> stuList = stuCheckingService.queryAll(gradeId);
			for(StuChecking s:stuList){
				System.out.println(s.toString());
			}
			req.getSession().setAttribute("stuChecking",stuList);
		}else{
		}
		return "all";
	}
	
	/**
	 * 修改考勤信息
	 */
	public String update() {
		Emp emp = (Emp)(req).getSession().getAttribute("emp");//获取此登陆id对象
		if(stuCheckingService.queryPrevillige(emp.getRoleId(), StuCheckingAction.class.getName() + ".update")){
			stuCheckingService.update(stuStuChecking);
			result = ControllerResult.getSuccessResult("修改成功");
		}else{
			result = ControllerResult.getSuccessResult("权限不足");
		}
		return "update";
	}
	
	
	/**
	 * 修改学生考勤状态
	 */
	public String updateFreeze() {
		Emp emp = (Emp)(req).getSession().getAttribute("emp");//获取此登陆id对象
		if(stuCheckingService.queryPrevillige(emp.getRoleId(), StuCheckingAction.class.getName() + ".updateFreeze")){
			int status = 0;
			String id = req.getParameter("talkId");
			String statusStr = req.getParameter("status");
			if(statusStr != null && !statusStr.equals("")){
				status = Integer.valueOf(statusStr);
			}
			stuCheckingService.updateStatus("Talk", "talkId", status, id);
		}else{
			
		}
		return "updateFreeze";
	}
	
	/**
	 * 	按照班级查询该班中所有学生的考勤信息。 
	 * @throws IOException 
	 */
	public String stuChecking() throws IOException{
		Emp emp = (Emp)(req).getSession().getAttribute("emp");//获取此登陆id对象
		if(stuCheckingService.queryPrevillige(emp.getRoleId(), StuCheckingAction.class.getName() + ".stuChecking")){
			String gradeId=req.getParameter("gradeId");
			String year = req.getParameter("year");
			String month = req.getParameter("month");
			String startMonth = year + "-" + month + "-" + "1";
	  		String endMonth= year + "-" + month + "-" + "31" ;
	  		System.out.println(startMonth + ", " + endMonth);
			stuList = stuCheckingService.queryByMonth(gradeId,startMonth, endMonth);
			for(StuChecking s : stuList){
				System.out.println(s.toString());
			}
			
		}else{
			
		}
		return "stuChecking";
	}
	public String skipPages() {
			return "skips";
	}
	public String queryAlls() {
			String gradeId=req.getParameter("gradeId");
			List<StuChecking> stuList = stuCheckingService.queryAll(gradeId);
			for(StuChecking s:stuList){
				System.out.println(s.toString());
			}
			req.getSession().setAttribute("stuChecking",stuList);
		return "alls";
	}

}
