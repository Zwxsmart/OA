package com.cs.action;

import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.cs.bean.DRECommom;
import com.cs.bean.Emp;
import com.cs.bean.EmpCheckingInfo;
import com.cs.bean.EmpLeave;
import com.cs.bean.EmpLeaveInfo;
import com.cs.bean.Goods;
import com.cs.commom.Constants;
import com.cs.commom.bean.ControllerResult;
import com.cs.commom.bean.Pager4EasyUI;
import com.cs.service.EmpLeaveService;
import com.opensymphony.xwork2.ActionSupport;

public class EmpLeaveAction extends ActionSupport implements ServletRequestAware {

	private static final long serialVersionUID = -1884705230278423697L;
	
	public HttpServletRequest req;
	public ControllerResult result;
	private List<EmpLeaveInfo> rows;
	private long total;
	private String id;
	private EmpLeave empLeave;
	private EmpLeaveService empLeaveService;
	private String empId;
	
	public String getEmpId() {
		return empId;
	}

	public void setEmpId(String empId) {
		this.empId = empId;
	}

	@Override
	public void setServletRequest(HttpServletRequest req) {
		this.req = req;
	}
	
	public void setEmpLeaveService(EmpLeaveService empLeaveService) {
		this.empLeaveService = empLeaveService;
	}

	public EmpLeave getEmpLeave() {
		return empLeave;
	}

	public void setEmpLeave(EmpLeave empLeave) {
		this.empLeave = empLeave;
	}

	public ControllerResult getResult() {
		return result;
	}

	

	public List<EmpLeaveInfo> getRows() {
		return rows;
	}

	public long getTotal() {
		return total;
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
		String actionName = EmpLeaveAction.class.getName();
		if (empLeaveService.queryPrevillige(emp.getRoleId(), actionName + ".skipPage")) {
			return "skip";
		}else {
			return "NoPrevillige";
		}
	   
	}

	
	/**
	 * ����������
	 * @return
	 */
	public String admissionsSkipPage() {
	        return "admissionsSkip";
	}
	/**
	 * ���Ա�����
	 */
	public String save() {
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		String actionName = EmpLeaveAction.class.getName();
		if (empLeaveService.queryPrevillige(emp.getRoleId(), actionName + ".save")) {
			empLeave.setEmpId(emp.getEmpId());
			empLeave.setLeaveDay(Constants.CURRENT_TIME);
			empLeave.setStatus(1);
			empLeaveService.save(empLeave);
			result = ControllerResult.getSuccessResult("��ӳɹ�");
		}else {
			result = ControllerResult.getFailResult("Ȩ�޲���");
		}
		return "save";
	}

	/**
	 * ��ѯ���е�Ա�����
	 */
	public String queryAll() {
		String pageNoStr = req.getParameter("page");
		String pageSizeStr = req.getParameter("rows");
		Pager4EasyUI<EmpLeaveInfo> pager = new Pager4EasyUI<EmpLeaveInfo>();
		if (pageNoStr != null) {
			pager.setPageNo(Integer.valueOf(pageNoStr));
			pager.setPageSize(Integer.valueOf(pageSizeStr));
		}
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		String sql = null;
		System.out.println(emp.getRoleName());
		if (emp.getRoleName().equals("����������")) {
			sql = "select l.*, e.`name`, datediff(l.endtime,l.starttime) as a from t_empleave l , t_emp e, t_dept d where e.empid = l.empid and d.depid = e.depid and e.depid = '"+emp.getDepId()+"' and e.empid != '"+emp.getEmpId()+"' and l.status = 1";
			
		} else if (emp.getRoleName().equals("�ϰ�")) {
			sql = "select l.*, e.`name`, datediff(l.endtime,l.starttime) as a from t_empleave l , t_emp e where e.empid = l.empid and l.firstlevel = 2";
		}
		
		pager = empLeaveService.queryPager(pager,sql);
		rows = pager.getRows();
		total = pager.getTotal();
		return "all";
	}
	
	/**
	 * �޸�����Ա�����
	 */
	public String update() {
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		String actionName = EmpLeaveAction.class.getName();
		if (empLeaveService.queryPrevillige(emp.getRoleId(), actionName + ".update")) {
			empLeave.setLeaveId(empLeave.getLeaveId());
			empLeave.setEmpId(emp.getEmpId());
			empLeave.setLeaveDay(Constants.CURRENT_TIME);
			empLeaveService.update(empLeave);
			result = ControllerResult.getSuccessResult("�޸ĳɹ�");
		}else {
			result = ControllerResult.getFailResult("Ȩ�޲���");
		}
		return "update";
	}
	
//	/**
//	 * ģ����ѯ
//	 */
	public String blurredAllQuery(){
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		String actionName = EmpAction.class.getName();
		if (empLeaveService.queryPrevillige(emp.getRoleId(), actionName + ".blurredAllQuery")) {
			String pageNoStr = req.getParameter("page");
	        String pageSizeStr = req.getParameter("rows");
	        String value= req.getParameter("value1");
	        String name= req.getParameter("name1");
	        System.out.println("value :" + value +", name: "+ name);
	        Pager4EasyUI<EmpLeaveInfo> pager = new Pager4EasyUI<EmpLeaveInfo>();
	        if (pageNoStr != null) {
	            pager.setPageNo(Integer.valueOf(pageNoStr));
	            pager.setPageSize(Integer.valueOf(pageSizeStr));
	        }
	        pager = empLeaveService.queryPageAll("EmpLeaveInfo", pager, value, name);
	        rows = pager.getRows();
	        total = pager.getTotal();
		}else {

		}
		return "blurredAllQuery";
	}
	
	// ʱ��β�ѯ
	public String serachTime(){
		String pageNoStr = req.getParameter("page");
        String pageSizeStr = req.getParameter("rows");
		String beginTime=req.getParameter("beginTime");
		String endTime=req.getParameter("endTime");
		System.out.println("��ʼʱ��"+beginTime+"����ʱ�䣺"+endTime);
		Pager4EasyUI<EmpLeaveInfo> pager = new Pager4EasyUI<EmpLeaveInfo>();
	    if (pageNoStr != null) {
	    	pager.setPageNo(Integer.valueOf(pageNoStr));
	        pager.setPageSize(Integer.valueOf(pageSizeStr));
	    }
		pager=empLeaveService.queryByEmpLeaveDay(pager, beginTime, endTime, "EmpLeaveInfo");
		System.out.println(pager.toString());
		pager.setTotal(empLeaveService.count("EmpLeave", ""));
		rows = pager.getRows();
		total = pager.getTotal();
		return "serachtime";
	}
	
	/**
	 * ����
	 * @return
	 */
	public String empLeaveDisable(){ 
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		String actionName = EmpLeaveAction.class.getName();
		if (empLeaveService.queryPrevillige(emp.getRoleId(), actionName + ".empLeaveDisable")) {
			empLeaveService.updateStatus("EmpLeave","leaveId",0, id);
		}else {

		}
		return "disable";
		
	}
	
	/**
	 * ����
	 * @return
	 */
	public String empLeaveActivate(){
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		String actionName = EmpLeaveAction.class.getName();
		if (empLeaveService.queryPrevillige(emp.getRoleId(), actionName + ".empLeaveActivate")) {
			empLeaveService.updateStatus("EmpLeave","leaveId",1, id);
		}else {

		}
		return "activate";
		
	}
	
	/**
	 * Ա��������ٹ���ҳ����ת
	 */
	public String empLeavePage() {
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		String actionName = EmpLeaveAction.class.getName();
		if (empLeaveService.queryPrevillige(emp.getRoleId(), actionName + ".empLeavePage")) {
			return "empLeavePage";
		} else {
			return "NoPrevillige2";
		}
		
	}
	
	/**
	 * Ա��������ٹ���(ҳ�治һ������ֻ��������һ���ǹ�����)
	 */
	public String empLeave() {
		Emp emp = (Emp)req.getSession().getAttribute("emp");
			String pageNoStr = req.getParameter("page");
			String pageSizeStr = req.getParameter("rows");
			Pager4EasyUI<EmpLeaveInfo> pager = new Pager4EasyUI<EmpLeaveInfo>();
			if (pageNoStr != null) {
				pager.setPageNo(Integer.valueOf(pageNoStr));
				pager.setPageSize(Integer.valueOf(pageSizeStr));
			}
			pager = empLeaveService.queryPager(pager, "select l.*, e.`name`, datediff(l.endtime,l.starttime) as a from t_empleave l , t_emp e, t_dept d where e.empid = l.empid and d.depid = e.depid and e.empid = '"+emp.getEmpId()+"'");
			pager.setTotal(empLeaveService.count("EmpLeave where empId = '"+emp.getEmpId()+"'",""));
			rows = pager.getRows();
			total = pager.getTotal();
			return "empLeave";
	}
	
	/**
	 * Ա�����������ٹ���(ҳ�治һ������ֻ��������һ���ǹ�����)
	 * @return
	 */
	public String saveEmpLeave() {
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		System.out.println(emp.getRoleName());
		if (emp.getRoleName().equals("����������") || emp.getRoleName().equals("��������") || emp.getRoleName().equals("����������")
				|| emp.getRoleName().equals("���ڲ�����") || emp.getRoleName().equals("��������")) {
			System.out.println("aaaaaaaaaaaaaaaa");
			empLeave.setLeaveDay(Constants.CURRENT_TIME);
			empLeave.setEmpId(emp.getEmpId());
			empLeave.setFirstLevel(2);
			empLeave.setStatus(1);
			empLeaveService.save(empLeave);
			result = ControllerResult.getSuccessResult("��ӳɹ�");
		} else {
			System.out.println("mmmmmmmmmmmmmmmmmmmmm");
			empLeave.setLeaveDay(Constants.CURRENT_TIME);
			empLeave.setEmpId(emp.getEmpId());
			empLeave.setStatus(1);
			empLeaveService.save(empLeave);
			result = ControllerResult.getSuccessResult("��ӳɹ�");
		}
		return "saveEmpLeave";
	}
	
	/**
	 * 3�����ϵ�ͨ��
	 */
	public String empBosLeaveUseDis() {
		String idStr = req.getParameter("id");
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		if (emp.getRoleName().equals("����������")) {
			empLeaveService.updateStatus("EmpLeave", "leaveId", 2, "firstlevel", idStr);
		} else if (emp.getRoleName().equals("�ϰ�")) {
			empLeaveService.updateStatus("EmpLeave", "leaveId", 2, "pass", idStr);
			empLeaveService.updateStatus("EmpLeave", "leaveId", 2, "secondlevel", idStr);
		}
		
		return "empBosLeaveUseDis";
	}
	
	/**
	 * 3���3��һ�µ�ͨ��
	 */
	public String empLeaveUseDis() {
		String idStr = req.getParameter("id");
		empLeaveService.updateStatus("EmpLeave", "leaveId", 2, "pass", idStr);
		empLeaveService.updateStatus("EmpLeave", "leaveId", 2, "firstlevel", idStr);
		empLeaveService.updateStatus("EmpLeave", "leaveId", 2, "secondlevel", idStr);
		return "empLeaveUseDis";
	}
	
	/**
	 * ����
	 */
	public String empLeaveAct() {
		String idStr = req.getParameter("id");
		empLeaveService.updateStatus("EmpLeave", "leaveId", 1, "firstlevel", idStr);
		return "empLeaveAct";
	}
	
}
