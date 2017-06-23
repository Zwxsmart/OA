package com.cs.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.cs.bean.Emp;
import com.cs.bean.SalaryInfo;
import com.cs.commom.bean.ControllerResult;
import com.cs.commom.bean.Pager4EasyUI;
import com.cs.service.SalaryInfoService;
import com.opensymphony.xwork2.ActionSupport;

public class SalaryInfoAction extends ActionSupport implements ServletRequestAware {

	private static final long serialVersionUID = -1512560130158675888L;

	private SalaryInfoService salaryInfoService;// service

	private SalaryInfo salaryInfo;// bean

	private List<SalaryInfo> rows;

	private ControllerResult result;

	private long total;

	private HttpServletRequest req;

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

	public void setSalaryInfoService(SalaryInfoService salaryInfoService) {
		this.salaryInfoService = salaryInfoService;
	}

	public SalaryInfo getSalaryInfo() {
		return salaryInfo;
	}

	public void setSalaryInfo(SalaryInfo salaryInfo) {
		this.salaryInfo = salaryInfo;
	}

	public long getTotal() {
		return total;
	}

	public void setTotal(long total) {
		this.total = total;
	}

	public List<SalaryInfo> getRows() {
		return rows;
	}

	public ControllerResult getResult() {
		return result;
	}

	public String salaryInfoPage() {
		Emp emp = (Emp) (req).getSession().getAttribute("emp");
		if (salaryInfoService.queryPrevillige(emp.getRoleId(), SalaryInfoAction.class.getName() + ".salaryInfoPage")) {
			return "salaryInfo";
		} else {
			return "NoPrevillige";
		}
	}

	/**
	 * ����������
	 * 
	 * @return
	 */

	public String admissionsSkipPage() {
		return "admissionsSkip";
	}

	public String save() {
		Emp emp = (Emp) (req).getSession().getAttribute("emp");
		if (salaryInfoService.queryPrevillige(emp.getRoleId(), SalaryInfoAction.class.getName() + ".save")) {
			salaryInfo.setEmpId(empId);
			salaryInfoService.save(salaryInfo);
			result = ControllerResult.getSuccessResult("��ӳɹ�");
		} else {
			result = ControllerResult.getSuccessResult("Ȩ�޲���");
		}
		return "save";
	}

	public String queryAll() {
		Emp emp = (Emp) (req).getSession().getAttribute("emp");
		if (salaryInfoService.queryPrevillige(emp.getRoleId(), SalaryInfoAction.class.getName() + ".save")) {
			System.out.println("���ڲ������еĹ�����Ϣ");
			String pageNoStr = req.getParameter("page");
			String pageSizeStr = req.getParameter("rows");
			Pager4EasyUI<SalaryInfo> pager = new Pager4EasyUI<SalaryInfo>();
			if (pageNoStr != null) {
				pager.setPageNo(Integer.valueOf(pageNoStr));
				pager.setPageSize(Integer.valueOf(pageSizeStr));
			}
			pager = salaryInfoService.queryByPager("SalaryInfo", pager, "");
			pager.setTotal(salaryInfoService.count("SalaryInfo", ""));
			rows = pager.getRows();
			total = pager.getTotal();
		} else {
			result = ControllerResult.getSuccessResult("Ȩ�޲���");
		}
		return "all";
	}

	// public String queryById(String id) {
	// Emp emp = (Emp) (req).getSession().getAttribute("emp");
	// SalaryInfo salaryInfo = salaryInfoService.queryById(SalaryInfo.class,
	// id);
	// System.out.println(salaryInfo);
	// return "id";
	// }

	public String update() {
		Emp emp = (Emp) (req).getSession().getAttribute("emp");
		if (salaryInfoService.queryPrevillige(emp.getRoleId(), SalaryInfoAction.class.getName() + ".save")) {
			salaryInfo.setEmpId(salaryInfo.getEmpId());
			salaryInfo.setEmpId(empId);
			salaryInfoService.update(salaryInfo);
			result = ControllerResult.getSuccessResult("�޸ĳɹ�");
		} else {
			result = ControllerResult.getSuccessResult("Ȩ�޲���");
		}
		return "update";
	}
}