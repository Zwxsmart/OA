package com.cs.action;

import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.cs.bean.Emp;
import com.cs.bean.Job;
import com.cs.bean.Room;
import com.cs.bean.Talk;
import com.cs.commom.bean.ControllerResult;
import com.cs.commom.bean.Pager4EasyUI;
import com.cs.service.JobService;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 学生就业Action
 * @author 张文星
 *
 */
public class JobAction extends ActionSupport implements ServletRequestAware {
	
	private static final long serialVersionUID = -7433491681110583231L;

	private JobService jobService;
	
	private long total;
	private Job job;
	private List<Job> rows;
	private ControllerResult result;
	private String id;
	private HttpServletRequest req;
	
	@Override
	public void setServletRequest(HttpServletRequest req) {
		this.req = req;
	}
	public void setJobService(JobService jobService) {
		this.jobService = jobService;
	}
	public long getTotal() {
		return total;
	}
	public Job getJob() {
		return job;
	}
	public void setJob(Job Job) {
		this.job = Job;
	}
	public List<Job> getRows() {
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
		if(jobService.queryPrevillige(emp.getRoleId(), JobAction.class.getName() + ".skipPage")){
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
	 * 添加就业信息
	 */
	public String save() {
		Emp emp = (Emp)(req).getSession().getAttribute("emp");//获取此登陆id对象
		if(jobService.queryPrevillige(emp.getRoleId(), JobAction.class.getName() + ".save")){
			job.setStatus(1);
			jobService.save(job);
			result = ControllerResult.getSuccessResult("添加成功");
		}else{
			result = ControllerResult.getSuccessResult("权限不足");
		}
		return "save";
	}

	/**
	 * 查询所有成绩信息
	 */
	public String queryAll() {
		Emp emp = (Emp)(req).getSession().getAttribute("emp");//获取此登陆id对象
		if(jobService.queryPrevillige(emp.getRoleId(), JobAction.class.getName() + ".queryAll")){
			String pageNoStr = req.getParameter("page");
			String pageSizeStr = req.getParameter("rows");
			Pager4EasyUI<Job> pager = new Pager4EasyUI<Job>();
			if (pageNoStr != null) {
				pager.setPageNo(Integer.valueOf(pageNoStr));
				pager.setPageSize(Integer.valueOf(pageSizeStr));
			}
			pager = jobService.queryByPager("Job", pager, " where status =1");
			pager.setTotal(jobService.count("Job",""));
			rows = pager.getRows();
			total = pager.getTotal();
		}else{
			
		}
		return "all";
	}
	
	/**
	 * 查询所有被冻结就业
	 */
	public String queryFreezeAll(){
		Emp emp = (Emp)(req).getSession().getAttribute("emp");//获取此登陆id对象
		if(jobService.queryPrevillige(emp.getRoleId(), JobAction.class.getName() + ".queryFreezeAll")){
			String pageNoStr = req.getParameter("page");
			String pageSizeStr = req.getParameter("rows");
			Pager4EasyUI<Job> pager = new Pager4EasyUI<Job>();
			if (pageNoStr != null) {
				pager.setPageNo(Integer.valueOf(pageNoStr));
				pager.setPageSize(Integer.valueOf(pageSizeStr));
			}
			pager = jobService.queryByPager("Job", pager, " where status =0");
			pager.setTotal(jobService.count("Job",""));
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
		if(jobService.queryPrevillige(emp.getRoleId(), JobAction.class.getName() + ".update")){
			job.setStatus(1);
			jobService.update(job);
			result = ControllerResult.getSuccessResult("修改成功");
		}else{
			result = ControllerResult.getSuccessResult("权限不足");
		}
		return "update";
	}
	
	/**
	 * 修改就业管理状态
	 */
	public String updateFreeze() {
		Emp emp = (Emp)(req).getSession().getAttribute("emp");//获取此登陆id对象
		if(jobService.queryPrevillige(emp.getRoleId(), JobAction.class.getName() + ".updateFreeze")){
			int status = 0;
			String id = req.getParameter("jobId");
			String statusStr = req.getParameter("status");
			if(statusStr != null && !statusStr.equals("")){
				status = Integer.valueOf(statusStr);
			}
			jobService.updateStatus("Job", "jobId", status, id);
		}else{
			
		}
		return "updateFreeze";
	}
	
	/**
	 * 模糊查询
	 */
	public String blurredAllQuery(){
		Emp emp = (Emp)(req).getSession().getAttribute("emp");//获取此登陆id对象
		if(jobService.queryPrevillige(emp.getRoleId(), JobAction.class.getName() + ".blurredAllQuery")){
			String pageNoStr = req.getParameter("page");
	        String pageSizeStr = req.getParameter("rows");
	        String value= req.getParameter("value1");
	        String name= req.getParameter("name1");
	        System.out.println("value :" + value +", name: "+ name);
	        Pager4EasyUI<Job> pager = new Pager4EasyUI<Job>();
	        if (pageNoStr != null) {
	            pager.setPageNo(Integer.valueOf(pageNoStr));
	            pager.setPageSize(Integer.valueOf(pageSizeStr));
	        }
	        pager = jobService.blurredAllQueryPager("Job", pager, value, name);
	        rows = pager.getRows();
	        total = pager.getTotal();
		}else{
			
		}
		return "blurredAllQuery";
	}
	

}
