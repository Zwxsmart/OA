package com.cs.action;

import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.cs.bean.Course;
import com.cs.bean.Emp;
import com.cs.bean.Notice;
import com.cs.commom.bean.ControllerResult;
import com.cs.commom.bean.Pager4EasyUI;
import com.cs.service.NoticeService;
import com.opensymphony.xwork2.ActionSupport;

public class NoticeAction extends ActionSupport implements ServletRequestAware {

	private static final long serialVersionUID = -6146224651719766862L;

	private HttpServletRequest req;
	private NoticeService noticeService;
	private Notice notice;
	private long total;
	private List<Notice> rows;
	private ControllerResult result;
	private String id;
	private String typeId;
	private String empId;

	public String getEmpId() {
		return empId;
	}

	public void setEmpId(String empId) {
		this.empId = empId;
	}

	public String getTypeId() {
		return typeId;
	}

	public void setTypeId(String typeId) {
		this.typeId = typeId;
	}

	public Notice getNotice() {
		return notice;
	}

	public void setNotice(Notice notice) {
		this.notice = notice;
	}

	@Override
	public void setServletRequest(HttpServletRequest req) {
		this.req = req;
	}

	public void setNoticeService(NoticeService noticeService) {
		this.noticeService = noticeService;
	}

	public long getTotal() {
		return total;
	}

	public List<Notice> getRows() {
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
	 * 公告栏跳转页面
	 * 
	 * @return
	 */
	public String skipPage() {
		Emp emp = (Emp) req.getSession().getAttribute("emp");
		String actionName = NoticeAction.class.getName();
		if (noticeService.queryPrevillige(emp.getRoleId(), actionName + ".skipPage")) {
			return "skip";
		} else {
			return "NoPrevillige";
		}

	}

	/**
	 * 招生部主任跳转页面
	 * 
	 * @return
	 */
	public String admissionsSkipPage() {
		return "admissionsSkip";
	}

	/**
	 * 添加公告栏
	 * 
	 * @return
	 */
	public String save() {
		System.out.println(notice.getName() + "添加添加添加添加");
		System.out.println(typeId + "ididididiid");
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		notice.setTypeId(typeId);
		notice.setEmpId(emp.getEmpId());
		notice.setStatus(1);
		noticeService.save(notice);
		result = ControllerResult.getSuccessResult("添加成功");
		return "save";
	}

	/**
	 * 查询所有的公告栏信息
	 * 
	 * @return
	 */
	public String queryAll() {
		String pageNoStr = req.getParameter("page");
		String pageSizeStr = req.getParameter("rows");
		Pager4EasyUI<Notice> pager = new Pager4EasyUI<Notice>();
		if (pageNoStr != null) {
			pager.setPageNo(Integer.valueOf(pageNoStr));
			pager.setPageSize(Integer.valueOf(pageSizeStr));
		}
		pager = noticeService.queryByPager("Notice", pager, "");
		pager.setTotal(noticeService.count("Notice", ""));
		rows = pager.getRows();
		total = pager.getTotal();
		return "all";
	}

	/**
	 * 修改公告栏消息
	 * 
	 * @return
	 */
	public String update() {
		Emp emp = (Emp) req.getSession().getAttribute("emp");
		String actionName = NoticeAction.class.getName();
		if (noticeService.queryPrevillige(emp.getRoleId(), actionName + ".update")) {
			String typeId = req.getParameter("typeId");
			notice.setNoticeId(notice.getNoticeId());
			notice.setTypeId(typeId);
			notice.setEmpId(emp.getEmpId());
			noticeService.update(notice);
			result = ControllerResult.getSuccessResult("修改成功");
		} else {
			result = ControllerResult.getFailResult("权限不足");
		}
		return "update";

	}

	/**
	 * 禁用
	 * 
	 * @return
	 */
	public String noticeDisable() {
		Emp emp = (Emp) req.getSession().getAttribute("emp");
		String actionName = NoticeAction.class.getName();
		if (noticeService.queryPrevillige(emp.getRoleId(), actionName + ".noticeDisable")) {
			noticeService.updateStatus("Notice", "noticeId", 0, id);
		} else {
		}
		return "disable";
	}

	/**
	 * 启用
	 * 
	 * @return
	 */
	public String noticeActivate() {
		Emp emp = (Emp) req.getSession().getAttribute("emp");
		String actionName = NoticeAction.class.getName();
		if (noticeService.queryPrevillige(emp.getRoleId(), actionName + ".noticeActivate")) {
			noticeService.updateStatus("Notice", "noticeId", 1, id);
		} else {
		}
		return "activate";
	}

	/**
	 * 模糊查询
	 */
	public String bulurredAllQuery() {
		Emp emp = (Emp) req.getSession().getAttribute("emp");
		String actionName = NoticeAction.class.getName();
		if (noticeService.queryPrevillige(emp.getRoleId(), actionName + ".bulurredAllQuery")) {

			String pageNoStr = req.getParameter("page");
			String pageSizeStr = req.getParameter("rows");
			String value = req.getParameter("value1");
			String name = req.getParameter("name1");
			System.out.println("value :" + value + ", name :" + name);
			Pager4EasyUI<Notice> pager = new Pager4EasyUI<Notice>();
			if (pageNoStr != null) {
				pager.setPageNo(Integer.valueOf(pageNoStr));
				pager.setPageSize(Integer.valueOf(pageSizeStr));
			}
			pager = noticeService.blurredAllQueryPager("Notice", pager, value, name);
			rows = pager.getRows();
			total = pager.getTotal();
		} else {

		}
		return "blurredAllQuery";
	}

	/**
	 * 个人公告信息跳转页面
	 */
	public String empNoticePage() {
		return "empNoticePage";
	}

	/**
	 * 个人公告信息
	 */
	public String empNotice() {
		String pageNoStr = req.getParameter("page");
		String pageSizeStr = req.getParameter("rows");
		Pager4EasyUI<Notice> pager = new Pager4EasyUI<Notice>();
		if (pageNoStr != null) {
			pager.setPageNo(Integer.valueOf(pageNoStr));
			pager.setPageSize(Integer.valueOf(pageSizeStr));
		}
		Emp emp = (Emp) req.getSession().getAttribute("emp");
		pager = noticeService.queryByPager("Notice where empId = '"+emp.getEmpId()+"'", pager, "");
		pager.setTotal(noticeService.count("Notice where empId = '"+emp.getEmpId()+"'", ""));
		rows = pager.getRows();
		total = pager.getTotal();
		return "empNotice";
	}

}
