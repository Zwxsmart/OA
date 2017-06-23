package com.cs.action;

import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.cs.bean.Emp;
import com.cs.bean.Room;
import com.cs.bean.StuFeedback;
import com.cs.commom.bean.ControllerResult;
import com.cs.commom.bean.Pager4EasyUI;
import com.cs.service.StuFeedbackService;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 学生分数Action
 * @author 张文星
 *
 */
public class StuFeedbackAction extends ActionSupport implements ServletRequestAware {
	
	private static final long serialVersionUID = -7433491681110583231L;

	private StuFeedbackService stuFeedbackService;
	
	private long total;
	private StuFeedback stuStuFeedback;
	private List<StuFeedback> rows;
	private ControllerResult result;
	private String id;
	private HttpServletRequest req;
	
	@Override
	public void setServletRequest(HttpServletRequest req) {
		this.req = req;
	}
	public void setStuFeedbackService(StuFeedbackService stuFeedbackService) {
		this.stuFeedbackService = stuFeedbackService;
	}
	public long getTotal() {
		return total;
	}
	public StuFeedback getStuFeedback() {
		return stuStuFeedback;
	}
	public void setStuFeedback(StuFeedback stuStuFeedback) {
		this.stuStuFeedback = stuStuFeedback;
	}
	public List<StuFeedback> getRows() {
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
		if(stuFeedbackService.queryPrevillige(emp.getRoleId(), StuFeedbackAction.class.getName() + ".skipPage")){
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
	 * 添加反馈记录
	 */
	public String save() {
		Emp emp = (Emp)(req).getSession().getAttribute("emp");//获取此登陆id对象
		System.out.println(StuFeedbackAction.class.getName());
		if(stuFeedbackService.queryPrevillige(emp.getRoleId(), StuFeedbackAction.class.getName() + ".save")){
			stuStuFeedback.setStatus(1);
			stuFeedbackService.save(stuStuFeedback);
			result = ControllerResult.getSuccessResult("添加成功");
		}else{
			result = ControllerResult.getSuccessResult("权限不足");
		}
		return "save";
	}

	/**
	 * 查询所有反馈记录
	 */
	public String queryAll() {
		Emp emp = (Emp)(req).getSession().getAttribute("emp");//获取此登陆id对象
		if(stuFeedbackService.queryPrevillige(emp.getRoleId(), StuFeedbackAction.class.getName() + ".queryAll")){
			String pageNoStr = req.getParameter("page");
			String pageSizeStr = req.getParameter("rows");
			Pager4EasyUI<StuFeedback> pager = new Pager4EasyUI<StuFeedback>();
			if (pageNoStr != null) {
				pager.setPageNo(Integer.valueOf(pageNoStr));
				pager.setPageSize(Integer.valueOf(pageSizeStr));
			}
			pager = stuFeedbackService.queryByPager("StuFeedback", pager, " where status =1");
			pager.setTotal(stuFeedbackService.count("StuFeedback",""));
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
		if(stuFeedbackService.queryPrevillige(emp.getRoleId(), StuFeedbackAction.class.getName() + ".queryFreezeAll")){
			String pageNoStr = req.getParameter("page");
			String pageSizeStr = req.getParameter("rows");
			Pager4EasyUI<StuFeedback> pager = new Pager4EasyUI<StuFeedback>();
			if (pageNoStr != null) {
				pager.setPageNo(Integer.valueOf(pageNoStr));
				pager.setPageSize(Integer.valueOf(pageSizeStr));
			}
			pager = stuFeedbackService.queryByPager("StuFeedback", pager, " where status =0");
			pager.setTotal(stuFeedbackService.count("StuFeedback",""));
			rows = pager.getRows();
			total = pager.getTotal();
		}else{
			
		}
		return "freezeAll";
	}
	/**
	 * 修改反馈记录
	 */
	public String update() {
		Emp emp = (Emp)(req).getSession().getAttribute("emp");//获取此登陆id对象
		if(stuFeedbackService.queryPrevillige(emp.getRoleId(), StuFeedbackAction.class.getName() + ".update")){
			stuStuFeedback.setStatus(1);
			stuFeedbackService.update(stuStuFeedback);
			result = ControllerResult.getSuccessResult("修改成功");
		}else{
			result = ControllerResult.getSuccessResult("权限不足");
		}
		return "update";
	}
	
	/**
	 * 修改反馈状态
	 */
	public String updateFreeze() {
		System.out.println("进入");
		Emp emp = (Emp)(req).getSession().getAttribute("emp");//获取此登陆id对象
		if(stuFeedbackService.queryPrevillige(emp.getRoleId(), StuFeedbackAction.class.getName() + ".updateFreeze")){
			int status = 0;
			String id = req.getParameter("strId");
			String statusStr = req.getParameter("status");
			if(statusStr != null && !statusStr.equals("")){
				status = Integer.valueOf(statusStr);
			}
			stuFeedbackService.updateStatus("StuFeedback", "feedbackId", status, id);
		}else{
			
		}
		return "updateFreeze";
	}
	/**
	 * 模糊查询
	 */
	public String blurredAllQuery(){
		Emp emp = (Emp)(req).getSession().getAttribute("emp");//获取此登陆id对象
		if(stuFeedbackService.queryPrevillige(emp.getRoleId(), StuFeedbackAction.class.getName() + ".blurredAllQuery")){
			String pageNoStr = req.getParameter("page");
	        String pageSizeStr = req.getParameter("rows");
	        String value= req.getParameter("value1");
	        String name= req.getParameter("name1");
	        System.out.println("value :" + value +", name: "+ name);
	        Pager4EasyUI<StuFeedback> pager = new Pager4EasyUI<StuFeedback>();
	        if (pageNoStr != null) {
	            pager.setPageNo(Integer.valueOf(pageNoStr));
	            pager.setPageSize(Integer.valueOf(pageSizeStr));
	        }
	        pager = stuFeedbackService.blurredAllQueryPager("StuFeedback", pager, value, name);
	        rows = pager.getRows();
	        total = pager.getTotal();
		}else{
			
		}
		return "blurredAllQuery";
	}
	
	
	public String skipPages() {
			return "skips";
	}
	
	/**
	 * 添加反馈记录
	 */
	public String saves() {
		Emp emp = (Emp)(req).getSession().getAttribute("emp");//获取此登陆id对象
		System.out.println(StuFeedbackAction.class.getName());
		if(stuFeedbackService.queryPrevillige(emp.getRoleId(), StuFeedbackAction.class.getName() + ".save")){
			stuStuFeedback.setStatus(1);
			stuFeedbackService.save(stuStuFeedback);
			result = ControllerResult.getSuccessResult("添加成功");
		}else{
			result = ControllerResult.getSuccessResult("权限不足");
		}
		return "saves";
	}

	public String queryAlls() {
			String pageNoStr = req.getParameter("page");
			String pageSizeStr = req.getParameter("rows");
			Pager4EasyUI<StuFeedback> pager = new Pager4EasyUI<StuFeedback>();
			if (pageNoStr != null) {
				pager.setPageNo(Integer.valueOf(pageNoStr));
				pager.setPageSize(Integer.valueOf(pageSizeStr));
			}
			pager = stuFeedbackService.queryByPager("StuFeedback", pager, " where status =1");
			pager.setTotal(stuFeedbackService.count("StuFeedback",""));
			rows = pager.getRows();
			total = pager.getTotal();
		return "alls";
	}
}
