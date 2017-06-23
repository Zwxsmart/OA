package com.cs.action;

import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.cs.bean.Check;
import com.cs.bean.Emp;
import com.cs.bean.Role;
import com.cs.commom.bean.ControllerResult;
import com.cs.commom.bean.Pager4EasyUI;
import com.cs.service.DeptService;
import com.cs.service.RoleService;
import com.opensymphony.xwork2.ActionSupport;

public class RoleAction extends ActionSupport implements ServletRequestAware {
	

	private static final long serialVersionUID = 2535009301664014023L;

	private RoleService roleService;
	private DeptService deptService;
	
	private long total;
	private Role role;
	private List<Role> rows;
	private String id;
	public ControllerResult result;
	public HttpServletRequest req;
	
	public ControllerResult getResult() {
		return result;
	}
	
	
	
	public void setDeptService(DeptService deptService) {
		this.deptService = deptService;
	}



	@Override
	public void setServletRequest(HttpServletRequest req) {
		this.req = req;
	}
	
	public void setRoleService(RoleService roleService) {
		this.roleService = roleService;
	}
	public long getTotal() {
		return total;
	}
	public void setTotal(long total) {
		this.total = total;
	}
	public Role getRole() {
		return role;
	}
	public void setRole(Role role) {
		this.role = role;
	}
	public List<Role> getRows() {
		return rows;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	/**
	 * ��תҳ��
	 * @return
	 */
	public String skipPage() {
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		String actionName = RoleAction.class.getName();
		if (roleService.queryPrevillige(emp.getRoleId(), actionName + ".skipPage")) {
			  return "skip";
		} else {
			return "NoPrevillige";
		}
	 
	}

	/**
	 * ���Ա����ɫ
	 */
	public String add() {
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		String actionName = RoleAction.class.getName();
		if (roleService.queryPrevillige(emp.getRoleId(), actionName + ".add")) {
			if (!deptService.queryByName("t_role", role.getName())) {
				role.setStatus(1);
				roleService.save(role);
				result = ControllerResult.getSuccessResult("��ӳɹ�");
			} else {
				result = ControllerResult.getSuccessResult("��ɫ�Ѵ���");
			}
		}else {
			result = ControllerResult.getFailResult("Ȩ�޲���");
		}
		return "save";
	}

	/**
	 * ��ѯ���е�Ա����ɫ
	 */
	public String queryAll() {
		String pageNoStr = req.getParameter("page");
		String pageSizeStr = req.getParameter("rows");
		Pager4EasyUI<Role> pager = new Pager4EasyUI<Role>();
		if (pageNoStr != null) {
			pager.setPageNo(Integer.valueOf(pageNoStr));
			pager.setPageSize(Integer.valueOf(pageSizeStr));
		}
		pager = roleService.queryByPager("Role where name != '�ϰ�'", pager, "");
		pager.setTotal(roleService.count("Role where name != '�ϰ�'",""));
		rows = pager.getRows();
		total = pager.getTotal();
		return "all";
	}
	
	/**
	 * �޸Ľ�ɫ
	 */
	public String update() {
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		String actionName = RoleAction.class.getName();
		if (roleService.queryPrevillige(emp.getRoleId(), actionName + ".update")) {
			roleService.update(role);
			result = ControllerResult.getSuccessResult("�޸ĳɹ�");
		}else {
			result = ControllerResult.getFailResult("Ȩ�޲���");
		}
		return "update";
	}
	
	/**
	 * ģ����ѯ
	 */
	public String blurredAllQuery(){
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		String actionName = RoleAction.class.getName();
		if (roleService.queryPrevillige(emp.getRoleId(), actionName + ".blurredAllQuery")) {
			String pageNoStr = req.getParameter("page");
	        String pageSizeStr = req.getParameter("rows");
	        String value= req.getParameter("value1");
	        String name= req.getParameter("name1");
	        System.out.println("value :" + value +", name: "+ name);
	        Pager4EasyUI<Role> pager = new Pager4EasyUI<Role>();
	        if (pageNoStr != null) {
	            pager.setPageNo(Integer.valueOf(pageNoStr));
	            pager.setPageSize(Integer.valueOf(pageSizeStr));
	        }
	        pager = roleService.blurredAllQueryPager("Role", pager, value, name);
	        rows = pager.getRows();
	        total = pager.getTotal();
		}else {

		}
		return "blurredAllQuery";
		
	}
	
	/**
	 * ����
	 * @return
	 */
	public String roleDisable(){ 
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		String actionName = RoleAction.class.getName();
		if (roleService.queryPrevillige(emp.getRoleId(), actionName + ".roleDisable")) {
			roleService.updateStatus("Role","roleId",0, id);
		}else {

		}
		return "disable";
		
	}
	
	/**
	 * ����
	 * @return
	 */
	public String roleActivate(){
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		String actionName = RoleAction.class.getName();
		if (roleService.queryPrevillige(emp.getRoleId(), actionName + ".roleActivate")) {
			roleService.updateStatus("Role","roleId",1, id);
		}else {

		}
		return "activate";
		
	}

}
