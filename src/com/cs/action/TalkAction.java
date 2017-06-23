package com.cs.action;

import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.cs.bean.Emp;
import com.cs.bean.Room;
import com.cs.bean.Talk;
import com.cs.commom.bean.ControllerResult;
import com.cs.commom.bean.Pager4EasyUI;
import com.cs.service.TalkService;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 学生谈心Action
 * @author 张文星
 *
 */
public class TalkAction extends ActionSupport implements ServletRequestAware {
	
	private static final long serialVersionUID = -7433491681110583231L;

	private TalkService talkService;
	
	private long total;
	private Talk talk;
	private List<Talk> rows;
	private ControllerResult result;
	private String id;
	private HttpServletRequest req;
	
	@Override
	public void setServletRequest(HttpServletRequest req) {
		this.req = req;
	}
	public void setTalkService(TalkService talkService) {
		this.talkService = talkService;
	}
	public long getTotal() {
		return total;
	}
	public Talk getTalk() {
		return talk;
	}
	public void setTalk(Talk talk) {
		this.talk = talk;
	}
	public List<Talk> getRows() {
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
		if(talkService.queryPrevillige(emp.getRoleId(), TalkAction.class.getName() + ".skipPage")){
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
	 * 添加谈心信息
	 */
	public String save() {
		Emp emp = (Emp)(req).getSession().getAttribute("emp");//获取此登陆id对象
		if(talkService.queryPrevillige(emp.getRoleId(), TalkAction.class.getName() + ".save")){
			talk.setStatus(1);
			talkService.save(talk);
			result = ControllerResult.getSuccessResult("添加成功");
		}else{
			result = ControllerResult.getSuccessResult("权限不足");
		}
		return "save";
	}

	/**
	 * 查询所有谈心
	 */
	public String queryAll() {
		Emp emp = (Emp)(req).getSession().getAttribute("emp");//获取此登陆id对象
		if(talkService.queryPrevillige(emp.getRoleId(), TalkAction.class.getName() + ".queryAll")){
			String pageNoStr = req.getParameter("page");
			String pageSizeStr = req.getParameter("rows");
			Pager4EasyUI<Talk> pager = new Pager4EasyUI<Talk>();
			if (pageNoStr != null) {
				pager.setPageNo(Integer.valueOf(pageNoStr));
				pager.setPageSize(Integer.valueOf(pageSizeStr));
			}
			pager = talkService.queryByPager("Talk", pager, " where status =1");
			pager.setTotal(talkService.count("Talk",""));
			rows = pager.getRows();
			total = pager.getTotal();
		}else{
			
		}
		return "all";
	}
	
	/**
	 * 查询所有被冻结谈心
	 */
	public String queryFreezeAll(){
		Emp emp = (Emp)(req).getSession().getAttribute("emp");//获取此登陆id对象
		if(talkService.queryPrevillige(emp.getRoleId(), TalkAction.class.getName() + ".queryFreezeAll")){
			String pageNoStr = req.getParameter("page");
			String pageSizeStr = req.getParameter("rows");
			Pager4EasyUI<Talk> pager = new Pager4EasyUI<Talk>();
			if (pageNoStr != null) {
				pager.setPageNo(Integer.valueOf(pageNoStr));
				pager.setPageSize(Integer.valueOf(pageSizeStr));
			}
			pager = talkService.queryByPager("Talk", pager, " where status =0");
			pager.setTotal(talkService.count("Talk",""));
			rows = pager.getRows();
			total = pager.getTotal();
		}else{
			
		}
		return "freezeAll";
	}
	
	/**
	 * 修改谈心信息
	 */
	public String update() {
		Emp emp = (Emp)(req).getSession().getAttribute("emp");//获取此登陆id对象
		if(talkService.queryPrevillige(emp.getRoleId(), TalkAction.class.getName() + ".update")){
			talk.setStatus(1);
			talkService.update(talk);
			result = ControllerResult.getSuccessResult("修改成功");
		}else{
			result = ControllerResult.getSuccessResult("权限不足");
		}
		return "update";
	}
	
	/**
	 * 修改谈心管理状态
	 */
	public String updateFreeze() {
		Emp emp = (Emp)(req).getSession().getAttribute("emp");//获取此登陆id对象
		if(talkService.queryPrevillige(emp.getRoleId(), TalkAction.class.getName() + ".updateFreeze")){
			int status = 0;
			String id = req.getParameter("talkId");
			String statusStr = req.getParameter("status");
			if(statusStr != null && !statusStr.equals("")){
				status = Integer.valueOf(statusStr);
			}
			talkService.updateStatus("Talk", "talkId", status, id);
		}else{
			
		}
		return "updateFreeze";
	}
	
	/**
	 * 模糊查询
	 */
	public String blurredAllQuery(){
		Emp emp = (Emp)(req).getSession().getAttribute("emp");//获取此登陆id对象
		if(talkService.queryPrevillige(emp.getRoleId(), TalkAction.class.getName() + ".blurredAllQuery")){
			String pageNoStr = req.getParameter("page");
	        String pageSizeStr = req.getParameter("rows");
	        String value= req.getParameter("value1");
	        String name= req.getParameter("name1");
	        System.out.println("value :" + value +", name: "+ name);
	        Pager4EasyUI<Talk> pager = new Pager4EasyUI<Talk>();
	        if (pageNoStr != null) {
	            pager.setPageNo(Integer.valueOf(pageNoStr));
	            pager.setPageSize(Integer.valueOf(pageSizeStr));
	        }
	        pager = talkService.blurredAllQueryPager("Talk", pager, value, name);
	        rows = pager.getRows();
	        total = pager.getTotal();
		}else{
			
		}
		return "blurredAllQuery";
	}
	
	public String skipPages() {
			return "skips";
	}
	public String queryAlls() {
			String pageNoStr = req.getParameter("page");
			String pageSizeStr = req.getParameter("rows");
			Pager4EasyUI<Talk> pager = new Pager4EasyUI<Talk>();
			if (pageNoStr != null) {
				pager.setPageNo(Integer.valueOf(pageNoStr));
				pager.setPageSize(Integer.valueOf(pageSizeStr));
			}
			pager = talkService.queryByPager("Talk", pager, " where status =1");
			pager.setTotal(talkService.count("Talk",""));
			rows = pager.getRows();
			total = pager.getTotal();
		return "alls";
	}

}
