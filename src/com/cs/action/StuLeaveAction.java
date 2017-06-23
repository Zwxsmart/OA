package com.cs.action;

import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.cs.bean.Emp;
import com.cs.bean.Job;
import com.cs.bean.Meetting;
import com.cs.bean.Stu;
import com.cs.bean.StuFeedback;
import com.cs.bean.StuLeave;
import com.cs.commom.bean.ControllerResult;
import com.cs.commom.bean.Pager4EasyUI;
import com.cs.service.StuLeaveService;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 学生请假Action
 * @author 张文星
 *
 */
public class StuLeaveAction extends ActionSupport implements ServletRequestAware {
	
	private static final long serialVersionUID = -7433491681110583231L;

	private StuLeaveService stuLeaveService;
	
	private long total;
	private StuLeave stuLeave;
	private List<StuLeave> rows;
	private ControllerResult result;
	private String id;
	private HttpServletRequest req;
	
	@Override
	public void setServletRequest(HttpServletRequest req) {
		this.req = req;
	}
	public void setStuLeaveService(StuLeaveService stuLeaveService) {
		this.stuLeaveService = stuLeaveService;
	}
	public long getTotal() {
		return total;
	}
	public StuLeave getStuLeave() {
		return stuLeave;
	}
	public void setStuLeave(StuLeave stuLeave) {
		this.stuLeave = stuLeave;
	}
	public List<StuLeave> getRows() {
		return rows;
	}
	public ControllerResult getResult() {
		return result;
	}
	public String getId() {
		return id;
	}
	
	/**
	 * 跳转页面
	 * @return
	 */
	public String skipPage() {
		Emp emp = (Emp)(req).getSession().getAttribute("emp");//获取此登陆id对象
		if(stuLeaveService.queryPrevillige(emp.getRoleId(), StuLeaveAction.class.getName() + ".skipPage")){
			return "skip";
		}else{
			return "NoPrevillige";
		}
	}

	/**
	 * 添加请假信息
	 */
	public String save() {
		Emp emp = (Emp)(req).getSession().getAttribute("emp");//获取此登陆id对象
		if(stuLeaveService.queryPrevillige(emp.getRoleId(), StuLeaveAction.class.getName() + ".save")){
			stuLeave.setStatus(1);
			stuLeaveService.save(stuLeave);
			result = ControllerResult.getSuccessResult("添加成功");
		}else{
			result = ControllerResult.getSuccessResult("权限不足");
		}
		return "save";
	}

	/**
	 * 查询所有请假信息
	 */
	public String queryAll() {
		Emp emp = (Emp)(req).getSession().getAttribute("emp");//获取此登陆id对象
		if(stuLeaveService.queryPrevillige(emp.getRoleId(), StuLeaveAction.class.getName() + ".queryAll")){
			String pageNoStr = req.getParameter("page");
			String pageSizeStr = req.getParameter("rows");
			String sql ="";
			Pager4EasyUI<StuLeave> pager = new Pager4EasyUI<StuLeave>();
			if (pageNoStr != null) {
				pager.setPageNo(Integer.valueOf(pageNoStr));
				pager.setPageSize(Integer.valueOf(pageSizeStr));
			}
			//超级管理员，行政部主任，班主任，任课老师，辅导老师  可以查看请假进行通过
			if (emp.getRoleName().equals("任课老师")) {
				sql = " where status =1";
			} else if (emp.getRoleName().equals("班主任")) {
				sql=" where status =1 and  firlevel != 0 ";
			}
			pager = stuLeaveService.queryByPager("StuLeave", pager, sql);
			pager.setTotal(stuLeaveService.count("StuLeave"," where status=1"));
			rows = pager.getRows();
			total = pager.getTotal();
		}else{
			
		}
		return "all";
	}
	
	/**
	 * 查询所有被冻结反馈记录
	 */
	public String queryFreezeAll(){
		Emp emp = (Emp)(req).getSession().getAttribute("emp");//获取此登陆id对象
		if(stuLeaveService.queryPrevillige(emp.getRoleId(), StuLeaveAction.class.getName() + ".queryFreezeAll")){
			String pageNoStr = req.getParameter("page");
			String pageSizeStr = req.getParameter("rows");
			Pager4EasyUI<StuLeave> pager = new Pager4EasyUI<StuLeave>();
			if (pageNoStr != null) {
				pager.setPageNo(Integer.valueOf(pageNoStr));
				pager.setPageSize(Integer.valueOf(pageSizeStr));
			}
			pager = stuLeaveService.queryByPager("StuLeave", pager, " where status =0 order by leaveDay desc");
			pager.setTotal(stuLeaveService.count("StuLeave",""));
			rows = pager.getRows();
			total = pager.getTotal();
		}else{
			
		}
		return "freezeAll";
	}
	
	/**
	 * 修改成绩信息
	 */
	public String update() {
		Emp emp = (Emp)(req).getSession().getAttribute("emp");//获取此登陆id对象
		if(stuLeaveService.queryPrevillige(emp.getRoleId(), StuLeaveAction.class.getName() + ".update")){
			stuLeave.setStatus(1);
			stuLeaveService.update(stuLeave);
			result = ControllerResult.getSuccessResult("修改成功");
		}else{
			result = ControllerResult.getSuccessResult("权限不足");
		}
		return "update";
	}
	
	/**
	 * 修改学生请假管理状态
	 */
	public String updateFreeze() {
		Emp emp = (Emp)(req).getSession().getAttribute("emp");//获取此登陆id对象
		if(stuLeaveService.queryPrevillige(emp.getRoleId(), StuLeaveAction.class.getName() + ".updateFreeze")){
			int status = 0;
			String id = req.getParameter("leaveId");
			String statusStr = req.getParameter("status");
			if(statusStr != null && !statusStr.equals("")){
				status = Integer.valueOf(statusStr);
			}
			stuLeaveService.updateStatus("StuLeave", "leaveId", status, id);
		}else{
			
		}
		return "updateFreeze";
	}
	
	/**
	 * 模糊查询
	 * @return
	 */
	public String blurredAllQuery(){
		Emp emp = (Emp)(req).getSession().getAttribute("emp");//获取此登陆id对象
		if(stuLeaveService.queryPrevillige(emp.getRoleId(), StuLeaveAction.class.getName() + ".blurredAllQuery")){
			String pageNoStr = req.getParameter("page");
	        String pageSizeStr = req.getParameter("rows");
	        String value= req.getParameter("value1");
	        String name= req.getParameter("name1");
	        System.out.println("value :" + value +", name: "+ name);
	        Pager4EasyUI<StuLeave> pager = new Pager4EasyUI<StuLeave>();
	        if (pageNoStr != null) {
	            pager.setPageNo(Integer.valueOf(pageNoStr));
	            pager.setPageSize(Integer.valueOf(pageSizeStr));
	        }
	        pager = stuLeaveService.blurredAllQueryPager("StuLeave", pager, value, name);
	        rows = pager.getRows();
	        total = pager.getTotal();
		}else{
			
		}
		return "blurredAllQuery";
	}

	
	/**
	 * 时间段查询
	 * @return
	 */
	public String serachTime(){
		Emp emp = (Emp)(req).getSession().getAttribute("emp");//获取此登陆id对象
		if(stuLeaveService.queryPrevillige(emp.getRoleId(), StuLeaveAction.class.getName() + ".serachTime")){
			String pageNoStr = req.getParameter("page");
	        String pageSizeStr = req.getParameter("rows");
			String beginTime=req.getParameter("beginTime");
			String endTime=req.getParameter("endTime");
			System.out.println("开始时间"+beginTime+"结束时间："+endTime);
			Pager4EasyUI<StuLeave> pager = new Pager4EasyUI<StuLeave>();
		       if (pageNoStr != null) {
		           pager.setPageNo(Integer.valueOf(pageNoStr));
		           pager.setPageSize(Integer.valueOf(pageSizeStr));
		    }
			pager=stuLeaveService.queryByDay(pager,beginTime,endTime, "StuLeave", "leaveDay");
			System.out.println(pager.toString());
			rows = pager.getRows();
			total = pager.getTotal();
		}else{
			
		}
		return "serachtime";
	}
	
	/**
	 * 通过或驳回请假
	 */
	public String stuPass(){
		
		String str = req.getParameter("str");
		String id = req.getParameter("id");
		if(str.equals("stuPassTo1")){// 任课老师通过
			stuLeaveService.stuPass("update StuLeave set firlevel = 1 where leaveId = '"+ id +"'");
		}else if(str.equals("noStuPassTo1")){// 任课老师驳回
			stuLeaveService.stuPass("update StuLeave set firlevel = 2 where leaveId = '"+ id +"'");
		}else if(str.equals("stuPassTo2")){//班主任通过
			Integer stuPass = Integer.valueOf(req.getParameter("stuPassTo1"));
			if(stuPass == 1){
				stuLeaveService.stuPass("update StuLeave set secondLevel = 1, pass= 1 where leaveId = '"+ id +"'");
			}else if(stuPass == 2){
				stuLeaveService.stuPass("update StuLeave set secondLevel = 1, pass= 2 where leaveId = '"+ id +"'");
			}
		}else if(str.equals("noStuPassTo2")){//班主任驳回
			stuLeaveService.stuPass("update StuLeave set secondLevel = 2, pass = 2 where leaveId = '"+ id +"'");
		}
		return "stuPass";
	}
	
	public String skipPages() {
			return "skips";
	}
	public String saves() {
			Stu stu = (Stu)req.getSession().getAttribute("stu");
			stuLeave.setStuId(stu.getStuId());
			stuLeave.setStatus(1);
			stuLeaveService.save(stuLeave);
			result = ControllerResult.getSuccessResult("等待老师审批");
		return "saves";
	}
	public String queryAlls(){
		String pageNoStr = req.getParameter("page");
		String pageSizeStr = req.getParameter("rows");
		Pager4EasyUI<StuLeave> pager = new Pager4EasyUI<StuLeave>();
		if (pageNoStr != null) {
			pager.setPageNo(Integer.valueOf(pageNoStr));
			pager.setPageSize(Integer.valueOf(pageSizeStr));
		}
		pager = stuLeaveService.queryByPager("StuLeave", pager,"");
		pager.setTotal(stuLeaveService.count("StuLeave",""));
		rows = pager.getRows();
		total = pager.getTotal();
		return "alls";
	}
}
