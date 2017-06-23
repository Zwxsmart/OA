package com.cs.action;

import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.cs.bean.Edu;
import com.cs.bean.Emp;
import com.cs.bean.EmpLeave;
import com.cs.bean.Exp;
import com.cs.commom.bean.ControllerResult;
import com.cs.commom.bean.Pager4EasyUI;
import com.cs.service.EduService;
import com.opensymphony.xwork2.ActionSupport;

public class EduAction extends ActionSupport implements ServletRequestAware {

	private static final long serialVersionUID = -7057822154627764207L;
	
	private EduService eduService;
	private Edu edu;
	private List<Edu> rows;
	private String id;
	private long total;
	public ControllerResult result;
	public HttpServletRequest req;
	private String empId;
	private HttpSession session;
	
	public String getEmpId() {
		return empId;
	}

	public void setEmpId(String empId) {
		this.empId = empId;
	}

	public ControllerResult getResult() {
		return result;
	}
	
	@Override
	public void setServletRequest(HttpServletRequest req) {
		this.req = req;
	}
	
	public void setEduService(EduService eduService) {
		this.eduService = eduService;
	}

	public Edu getEdu() {
		return edu;
	}

	public void setEdu(Edu edu) {
		this.edu = edu;
	}

	public List<Edu> getRows() {
		return rows;
	}

	public void setId(String id) {
		this.id = id;
	}

	public long getTotal() {
		return total;
	}

	public void setTotal(long total) {
		this.total = total;
	}
	
	/**
	 * ��תҳ��
	 * @return
	 */
	public String skipPage() {
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		String actionName = EduAction.class.getName();
		System.out.println(emp.getRoleId());
		System.out.println(actionName + ".skipPage");
		boolean a = eduService.queryPrevillige(emp.getRoleId(), actionName + ".skipPage");
		System.out.println(a + "aaaaaaaaaaaaaaaaaaaaa");
		if (eduService.queryPrevillige(emp.getRoleId(), actionName + ".skipPage")) {
			return "skip";
		} else {
			return "NoPrevillige";
		}
	}

	/**
	 * ���Ա����������
	 */
	public String save() {
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		String actionName = EduAction.class.getName();
		if (eduService.queryPrevillige(emp.getRoleId(), actionName + ".save")) {
			edu.setEmpId(empId);
			eduService.save(edu);
			result = ControllerResult.getSuccessResult("��ӳɹ�");
		}else {
			result = ControllerResult.getFailResult("Ȩ�޲���");
		}
		return "save";
	}

	/**
	 * ��ѯԱ����������
	 */
	public String queryAll() {
		String pageNoStr = req.getParameter("page");
		String pageSizeStr = req.getParameter("rows");
		Pager4EasyUI<Edu> pager = new Pager4EasyUI<Edu>();
		if (pageNoStr != null) {
			pager.setPageNo(Integer.valueOf(pageNoStr));
			pager.setPageSize(Integer.valueOf(pageSizeStr));
		}
		pager = eduService.queryByPager("Edu", pager, "");
		pager.setTotal(eduService.count("Edu",""));
		rows = pager.getRows();
		total = pager.getTotal();
		return "all";
	}
	
	/**
	 * �޸�Ա����������
	 */
	public String update() {
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		String actionName = EduAction.class.getName();
		if (eduService.queryPrevillige(emp.getRoleId(), actionName + ".update")) {
			edu.setEduId(edu.getEduId());
			edu.setEmpId(empId);
			eduService.update(edu);
			result = ControllerResult.getSuccessResult("�޸ĳɹ�");
		}else {
			result = ControllerResult.getFailResult("Ȩ�޲���");
		}
		return "update";
	}
	
	/**
	 * ɾ��Ա����������
	 * @return
	 */
	public String deleteById() {
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		String actionName = EduAction.class.getName();
		if (eduService.queryPrevillige(emp.getRoleId(), actionName + ".deleteById")) {
			edu = new Edu();
			edu.setEduId(id);
			edu.setEmpId(empId);
			eduService.delete(edu);
			result = ControllerResult.getSuccessResult("ɾ���ɹ�");
		}else {
			result = ControllerResult.getFailResult("Ȩ�޲���");
		}
		return "delete";
		
	}
	
	/**
	 * ģ����ѯ
	 */
	public String blurredAllQuery(){
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		String actionName = EduAction.class.getName();
		if (eduService.queryPrevillige(emp.getRoleId(), actionName + ".blurredAllQuery")) {
			String pageNoStr = req.getParameter("page");
	        String pageSizeStr = req.getParameter("rows");
	        String value= req.getParameter("value1");
	        String name= req.getParameter("name1");
	        System.out.println("value :" + value +", name: "+ name);
	        Pager4EasyUI<Edu> pager = new Pager4EasyUI<Edu>();
	        if (pageNoStr != null) {
	            pager.setPageNo(Integer.valueOf(pageNoStr));
	            pager.setPageSize(Integer.valueOf(pageSizeStr));
	        }
	        pager = eduService.blurredAllQueryPager("Edu", pager, value, name);
	        rows = pager.getRows();
	        total = pager.getTotal();
		}else {

		}
		return "blurredAllQuery";
		
	}
	
	/**
	 * Ա��Ȩ��
	 */
	
	/**
	 * ���˽�������ҳ��
	 */
	
	public String empEduPage() {
		return "empEduPage";
	}
	
	/**
	 * ���˽�������
	 */
	public String empEdu() {
		session = req.getSession();
		String pageNoStr = req.getParameter("page");
		String pageSizeStr = req.getParameter("rows");
		Pager4EasyUI<Edu> pager = new Pager4EasyUI<Edu>();
		if (pageNoStr != null) {
			pager.setPageNo(Integer.valueOf(pageNoStr));
			pager.setPageSize(Integer.valueOf(pageSizeStr));
		}
		Emp emp = (Emp) session.getAttribute("emp");
		String a = emp.getEmpId();
		System.out.println(a + "mmmmmmmmmmmmmm");
		pager = eduService.queryByPager("Edu where empId = '"+a+"'", pager, "");
		pager.setTotal(eduService.count("Edu",""));
		rows = pager.getRows();
		total = pager.getTotal();
		return "empEdu";
	}
	
	/**
	 * ���ָ��Ա����������
	 */
	public String saveEdu() {
		session = req.getSession();
		Emp emp = (Emp) session.getAttribute("emp");
		String a = emp.getEmpId();
		System.out.println(a + "aaaaaaaaaaaaaaaaaaaa");
		edu.setEmpId(a);
		eduService.save(edu);
		result = ControllerResult.getSuccessResult("��ӳɹ�");
		return "saveEdu";
	}

}
