package com.cs.action;

import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.cs.bean.Check;
import com.cs.bean.Emp;
import com.cs.bean.EmpFeedBack;
import com.cs.commom.bean.ControllerResult;
import com.cs.commom.bean.Pager4EasyUI;
import com.cs.service.EmpFeedBackService;
import com.opensymphony.xwork2.ActionSupport;

public class EmpFeedBackAction extends ActionSupport implements ServletRequestAware {
	
	private static final long serialVersionUID = 9094327454900997885L;
	
	public HttpServletRequest req;
	private EmpFeedBackService empFeedBackService;
	private EmpFeedBack empFeedBack;
	private List<EmpFeedBack> rows;
	private long total;
	private String id;
	public ControllerResult result;
	private String empId;
	
	public String getEmpId() {
		return empId;
	}

	public void setEmpId(String empId) {
		this.empId = empId;
	}

	public List<EmpFeedBack> getRows() {
		return rows;
	}

	public long getTotal() {
		return total;
	}

	public ControllerResult getResult() {
		return result;
	}

	public void setId(String id) {
		this.id = id;
	}

	public EmpFeedBack getEmpFeedBack() {
		return empFeedBack;
	}

	public void setEmpFeedBack(EmpFeedBack empFeedBack) {
		this.empFeedBack = empFeedBack;
	}

	@Override
	public void setServletRequest(HttpServletRequest req) {
		this.req = req;
	}

	public void setEmpFeedBackService(EmpFeedBackService empFeedBackService) {
		this.empFeedBackService = empFeedBackService;
	}

	
	/**
	 * ��תҳ��
	 * @return
	 */
	public String skipPage() {
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		String actionName = EmpFeedBackAction.class.getName();
		if (empFeedBackService.queryPrevillige(emp.getRoleId(), actionName + ".skipPage")) {
			  return "skip";
		}else {
			return "NoPrevillige";
		}
	 
	}

	/**
	 * ���Ա������
	 */
	public String save() {
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		String actionName = EmpFeedBackAction.class.getName();
		if (empFeedBackService.queryPrevillige(emp.getRoleId(), actionName + ".save")) {
			empFeedBack.setEmpId(empId);
			empFeedBack.setStatus(1);
			empFeedBackService.save(empFeedBack);
			result = ControllerResult.getSuccessResult("��ӳɹ�");
		}else {
			result = ControllerResult.getFailResult("Ȩ�޲���");
		}
		return "save";
	}

	/**
	 * ��ѯ���е�Ա������
	 */
	public String queryAll() {
		String pageNoStr = req.getParameter("page");
		String pageSizeStr = req.getParameter("rows");
		Pager4EasyUI<EmpFeedBack> pager = new Pager4EasyUI<EmpFeedBack>();
		if (pageNoStr != null) {
			pager.setPageNo(Integer.valueOf(pageNoStr));
			pager.setPageSize(Integer.valueOf(pageSizeStr));
		}
		pager = empFeedBackService.queryByPager("EmpFeedBack", pager, "");
		pager.setTotal(empFeedBackService.count("EmpFeedBack",""));
		rows = pager.getRows();
		total = pager.getTotal();
		return "all";
	}
	
	/**
	 * �޸�����Ա������
	 */
	public String update() {
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		String actionName = EmpFeedBackAction.class.getName();
		if (empFeedBackService.queryPrevillige(emp.getRoleId(), actionName + ".update")) {
			Emp emps = (Emp)req.getSession().getAttribute("emp");
			empFeedBack.setEmpId(emps.getEmpId());
			empFeedBack.setFeedBackId(empFeedBack.getFeedBackId());
			empFeedBackService.update(empFeedBack);
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
		String actionName = EmpFeedBackAction.class.getName();
		if (empFeedBackService.queryPrevillige(emp.getRoleId(), actionName + ".blurredAllQuery")) {
			String pageNoStr = req.getParameter("page");
	        String pageSizeStr = req.getParameter("rows");
	        String value= req.getParameter("value1");
	        String name= req.getParameter("name1");
	        System.out.println("value :" + value +", name: "+ name);
	        Pager4EasyUI<EmpFeedBack> pager = new Pager4EasyUI<EmpFeedBack>();
	        if (pageNoStr != null) {
	            pager.setPageNo(Integer.valueOf(pageNoStr));
	            pager.setPageSize(Integer.valueOf(pageSizeStr));
	        }
	        pager = empFeedBackService.blurredAllQueryPager("EmpFeedBack", pager, value, name);
	        rows = pager.getRows();
	        total = pager.getTotal();
		}else {

		}
		return "blurredAllQuery";
		
	}
	
	// ʱ��β�ѯ
	public String serachTime(){
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		String actionName = EmpFeedBackAction.class.getName();
		if (empFeedBackService.queryPrevillige(emp.getRoleId(), actionName + ".serachTime")) {
			String pageNoStr = req.getParameter("page");
	        String pageSizeStr = req.getParameter("rows");
			String beginTime=req.getParameter("beginTime");
			String endTime=req.getParameter("endTime");
			System.out.println("��ʼʱ��"+beginTime+"����ʱ�䣺"+endTime);
			Pager4EasyUI<EmpFeedBack> pager = new Pager4EasyUI<EmpFeedBack>();
		    if (pageNoStr != null) {
		    	pager.setPageNo(Integer.valueOf(pageNoStr));
		        pager.setPageSize(Integer.valueOf(pageSizeStr));
		    }
			pager=empFeedBackService.queryByDay(pager,beginTime,endTime, "EmpFeedBack", "feedBackDay");
			System.out.println(pager.toString());
			pager.setTotal(empFeedBackService.count("EmpFeedBack", ""));
			rows = pager.getRows();
			total = pager.getTotal();
		}else {

		}
		return "serachtime";
		
	}
	
	/**
	 * ����
	 * @return
	 */
	public String empFeedBackDisable(){ 
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		String actionName = EmpFeedBackAction.class.getName();
		if (empFeedBackService.queryPrevillige(emp.getRoleId(), actionName + ".empFeedBackDisable")) {
			empFeedBackService.updateStatus("EmpFeedBack","feedBackId",0, id);
		}else {

		}
		return "disable";
		
	}
	
	/**
	 * ����
	 * @return
	 */
	public String empFeedBackActivate(){
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		String actionName = EmpFeedBackAction.class.getName();
		if (empFeedBackService.queryPrevillige(emp.getRoleId(), actionName + ".empFeedBackActivate")) {
			empFeedBackService.updateStatus("EmpFeedBack","feedBackId",1, id);
		}else {

		}
		return "activate";
		
	}
	
	/**
	 * Ա�����˷�����תҳ��
	 */
	public String empFeedBackPage() {
		return "empFeedBackPage";
	}
	
	/**
	 * Ա�����˷���
	 */
	public String empFeedBack() {
		String pageNoStr = req.getParameter("page");
		String pageSizeStr = req.getParameter("rows");
		Pager4EasyUI<EmpFeedBack> pager = new Pager4EasyUI<EmpFeedBack>();
		if (pageNoStr != null) {
			pager.setPageNo(Integer.valueOf(pageNoStr));
			pager.setPageSize(Integer.valueOf(pageSizeStr));
		}
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		pager = empFeedBackService.queryByPager("EmpFeedBack where empId = '"+emp.getEmpId()+"'", pager, "");
		pager.setTotal(empFeedBackService.count("EmpFeedBack where empId = '"+emp.getEmpId()+"'",""));
		rows = pager.getRows();
		total = pager.getTotal();
		return "empFeedBack";
	}
	
	/**
	 * Ա���������
	 * @return
	 */
	public String saveEmpFeedBack() {
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		empFeedBack.setEmpId(emp.getEmpId());
		empFeedBackService.save(empFeedBack);
		result = ControllerResult.getSuccessResult("��ӳɹ�");
		return "saveEmpFeedBack";
	}
	
}
