package com.cs.action;

import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.cs.bean.Emp;
import com.cs.bean.NoticeType;
import com.cs.commom.bean.ControllerResult;
import com.cs.commom.bean.Pager4EasyUI;
import com.cs.service.NoticeTypeService;
import com.opensymphony.xwork2.ActionSupport;

public class NoticeTypeAction extends ActionSupport implements ServletRequestAware{
	
	private static final long serialVersionUID = 3952194684032884530L;
	private HttpServletRequest req;
	private NoticeTypeService noticeTypeService;
	private NoticeType noticeType;
	private long total;
	private List<NoticeType> rows;
	private ControllerResult result;
	private String id;
	
	public NoticeType getNoticeType() {
		return noticeType;
	}

	public void setNoticeType(NoticeType noticeType) {
		this.noticeType = noticeType;
	}

	@Override
	public void setServletRequest(HttpServletRequest req) {
		this.req = req;
	}

	public void setNoticeTypeService(NoticeTypeService noticeTypeService) {
		this.noticeTypeService = noticeTypeService;
	}

	public long getTotal() {
		return total;
	}

	public List<NoticeType> getRows() {
		return rows;
	}

	public ControllerResult getResult() {
		return result;
	}

	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}

	/**
	 * 跳转页面
	 * @return
	 */
	public String skipPage(){
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		String actionName = NoticeTypeAction.class.getName();
		if(noticeTypeService.queryPrevillige(emp.getRoleId(), actionName + ".skipPage")) {
			return "skip";
		}else{
			return "NoPrevillige";
		}
	}
	/**
	 * 添加公告
	 * @return
	 */
	public String save(){
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		String actionName = NoticeTypeAction.class.getName();
		if(noticeTypeService.queryPrevillige(emp.getRoleId(), actionName + ".save")){
			noticeType.setStatus(1);
			noticeTypeService.save(noticeType);
			result = ControllerResult.getSuccessResult("添加成功");
		}else{
			result = ControllerResult.getFailResult("权限不足");
		}
		return "save";
	}
	/**
	 * 查询所有的公告
	 * @return
	 */
	public String queryAll(){
		String pageNoStr = req.getParameter("page");
		String pageSizeStr = req.getParameter("rows");
		Pager4EasyUI<NoticeType> pager = new Pager4EasyUI<NoticeType>();
		if(pageNoStr != null){
			pager.setPageNo(Integer.valueOf(pageNoStr));
			pager.setPageSize(Integer.valueOf(pageSizeStr));
		}
		pager = noticeTypeService.queryByPager("NoticeType", pager, "");
		pager.setTotal(noticeTypeService.count("NoticeType",""));
		rows = pager.getRows();
		total = pager.getTotal();
		return "all";
	}
	
	public String update(){
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		String actionName = NoticeTypeAction.class.getName();
		if(noticeTypeService.queryPrevillige(emp.getRoleId(), actionName + ".update")){
			noticeTypeService.update(noticeType);
			result = ControllerResult.getSuccessResult("编辑成功");
		}else{
			result = ControllerResult.getFailResult("权限不足");
		}
		return "update";
	}
	
	/**
	 * 禁用
	 * @return
	 */
	public String noticeDisable(){
		System.out.println("bbbbbbbbbbbbbbbbbbbbb禁用");
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		String actionName = NoticeTypeAction.class.getName();
		if(noticeTypeService.queryPrevillige(emp.getRoleId(), actionName + ".noticeDisable")){
			noticeTypeService.updateStatus("NoticeType","noticeTypeId",0,id);
		}else{
		}
		return "disable";
	}
	/**
	 * 启用
	 * @return
	 */
	public String noticeActivate(){
			System.out.println("aaaaaaaaaaaaaaaaaaa启用	");
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		String actionName = NoticeTypeAction.class.getName();
		if(noticeTypeService.queryPrevillige(emp.getRoleId(), actionName + ".noticeActivate")) {
			noticeTypeService.updateStatus("NoticeType","noticeTypeId",1,id);
		}else{
		}
		return "activate";
	}
}


