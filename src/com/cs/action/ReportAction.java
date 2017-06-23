package com.cs.action;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.cs.bean.Emp;
import com.cs.bean.Report;
import com.cs.commom.bean.ControllerResult;
import com.cs.commom.bean.Pager4EasyUI;
import com.cs.service.ReportService;
import com.opensymphony.xwork2.ActionSupport;

public class ReportAction extends ActionSupport implements ServletRequestAware {

	private static final long serialVersionUID = 6005798293903213352L;
	
	public HttpServletRequest req;
	public ControllerResult result;
	private ReportService reportService;
	private String id;
	private List<Report> rows;
	private long total;
	private Report report;
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

	public Report getReport() {
		return report;
	}

	public void setReport(Report report) {
		this.report = report;
	}

	public ControllerResult getResult() {
		return result;
	}

	public List<Report> getRows() {
		return rows;
	}

	public long getTotal() {
		return total;
	}

	public void setReportService(ReportService reportService) {
		this.reportService = reportService;
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
		String actionName = ReportAction.class.getName();
		if (reportService.queryPrevillige(emp.getRoleId(), actionName + ".skipPage")) {
			return "skip";
		}else {
			return "NoPrevillige";
		}
	   
	}

	/**
	 * ��ӹ�����־��
	 */
	public String save() {
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		String actionName = ReportAction.class.getName();
		if (reportService.queryPrevillige(emp.getRoleId(), actionName + ".save")) {
			report.setEmpId(empId);
			report.setStatus(1);
			reportService.save(report);
			result = ControllerResult.getSuccessResult("��ӳɹ�");
		}else {
			result = ControllerResult.getFailResult("Ȩ�޲���");
		}
		return "save";
	}

	/**
	 * ��ѯ������־��
	 */
	public String queryAll() {
		String pageNoStr = req.getParameter("page");
		String pageSizeStr = req.getParameter("rows");
		Pager4EasyUI<Report> pager = new Pager4EasyUI<Report>();
		if (pageNoStr != null) {
			pager.setPageNo(Integer.valueOf(pageNoStr));
			pager.setPageSize(Integer.valueOf(pageSizeStr));
		}
		pager = reportService.queryByPager("Report", pager, "");
		pager.setTotal(reportService.count("Report",""));
		rows = pager.getRows();
		total = pager.getTotal();
		return "all";
	}
	
	/**
	 * �޸Ĺ�����־��
	 */
	public String update() {
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		String actionName = ReportAction.class.getName();
		if (reportService.queryPrevillige(emp.getRoleId(), actionName + ".update")) {
			report.setReportId(report.getReportId());
			Emp emps = (Emp)req.getSession().getAttribute("emp");
			report.setEmpId(emps.getEmpId());
			Calendar c = Calendar.getInstance();
			Date nowTime = c.getTime();
			report.setReportDay(nowTime);
			reportService.update(report);
			result = ControllerResult.getSuccessResult("�޸ĳɹ�");
		}else {
			result = ControllerResult.getFailResult("Ȩ�޲���");
		}
		return "update";
	}

	/**
	 * ����
	 * @return
	 */
	public String reportDisable(){ 
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		String actionName = ReportAction.class.getName();
		if (reportService.queryPrevillige(emp.getRoleId(), actionName + ".reportDisable")) {
			reportService.updateStatus("Report","reportId",0, id);
		}else {

		}
		return "disable";
		
	}
	
	/**
	 * ����
	 * @return
	 */
	public String reportActivate(){
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		String actionName = ReportAction.class.getName();
		if (reportService.queryPrevillige(emp.getRoleId(), actionName + ".reportActivate")) {
			reportService.updateStatus("Report","reportId",1, id);
		}else {

		}
		return "activate";
		
	}
	
	//ģ����ѯ
	public String blurredAllQuery(){
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		String actionName = ReportAction.class.getName();
		if (reportService.queryPrevillige(emp.getRoleId(), actionName + ".blurredAllQuery")) {
			String pageNoStr = req.getParameter("page");
	        String pageSizeStr = req.getParameter("rows");
	        String value= req.getParameter("value1");
	        String name= req.getParameter("name1");
	        System.out.println("value :" + value +", name: "+ name);
	        Pager4EasyUI<Report> pager = new Pager4EasyUI<Report>();
	        if (pageNoStr != null) {
	            pager.setPageNo(Integer.valueOf(pageNoStr));
	            pager.setPageSize(Integer.valueOf(pageSizeStr));
	        }
	        pager = reportService.blurredAllQueryPager("Report", pager, value, name);
	        rows = pager.getRows();
	        total = pager.getTotal();
		} else {

		}
		return "blurredAll";
		
	}
	
	public String serachTime(){
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		String actionName = ReportAction.class.getName();
		if (reportService.queryPrevillige(emp.getRoleId(), actionName + ".serachTime")) {
			String startDay=req.getParameter("startDay");
			String endDay=req.getParameter("endDay");
			String pageNoStr = req.getParameter("page");
	        String pageSizeStr = req.getParameter("rows");
	        System.out.println("��ʼʱ��Ϊ��"+startDay+"����ʱ��Ϊ��"+endDay);
	        Pager4EasyUI<Report> pager = new Pager4EasyUI<Report>();
	        if (pageNoStr != null) {
	            pager.setPageNo(Integer.valueOf(pageNoStr));
	            pager.setPageSize(Integer.valueOf(pageSizeStr));
	        }
	        pager = reportService.queryByDay(pager, startDay, endDay, "Report", "reportDay");
	        System.out.println(pager+"aaaaaaaa");
	        pager.setTotal(reportService.count("Report", ""));
	        rows = pager.getRows();
	        total = pager.getTotal();
		} else {

		}
		return "serachTime";
		
	}
	
	
	// ��ѯ���н���
	public String queryFreeze() {
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		String actionName = ReportAction.class.getName();
		if (reportService.queryPrevillige(emp.getRoleId(), actionName + ".queryFreeze")) {
			String pageNoStr = req.getParameter("page");
			String pageSizeStr = req.getParameter("rows");
			Pager4EasyUI<Report> pager = new Pager4EasyUI<Report>();
			if (pageNoStr != null) {
				pager.setPageNo(Integer.valueOf(pageNoStr));
				pager.setPageSize(Integer.valueOf(pageSizeStr));
			}
			pager = reportService.queryFreezeByPager("Report", pager);
			pager.setTotal(reportService.freezeCount("Report"));
			rows = pager.getRows();
			total = pager.getTotal();
		}else {

		}
		return "freezeAll";
		
	}

	// ��ѯ��������
	public String queryFreeze1() {
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		String actionName = ReportAction.class.getName();
		if (reportService.queryPrevillige(emp.getRoleId(), actionName + ".queryFreeze1")) {
			String pageNoStr = req.getParameter("page");
			String pageSizeStr = req.getParameter("rows");
			Pager4EasyUI<Report> pager = new Pager4EasyUI<Report>();
			if (pageNoStr != null) {
				pager.setPageNo(Integer.valueOf(pageNoStr));
				pager.setPageSize(Integer.valueOf(pageSizeStr));
			}
			pager = reportService.queryFreezeByPager1("Report", pager);
			pager.setTotal(reportService.freezeCount1("Report"));
			rows = pager.getRows();
			total = pager.getTotal();
		}else {

		}
		return "freezeAll1";
		
	}
	
	/**
	 * Ա�����˹�����־��תҳ��
	 */
	public String empReportPage() {
		return "empReportPage";
	}
	
	/**
	 * Ա�����˹�����־
	 */
	public String empReport() {
		String pageNoStr = req.getParameter("page");
		String pageSizeStr = req.getParameter("rows");
		Pager4EasyUI<Report> pager = new Pager4EasyUI<Report>();
		if (pageNoStr != null) {
			pager.setPageNo(Integer.valueOf(pageNoStr));
			pager.setPageSize(Integer.valueOf(pageSizeStr));
		}
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		pager = reportService.queryByPager("Report where empId = '"+emp.getEmpId()+"'", pager, "");
		pager.setTotal(reportService.count("Report where empId = '"+emp.getEmpId()+"'",""));
		rows = pager.getRows();
		total = pager.getTotal();
		return "empReport";
	}
	
	/**
	 * Ա�����˹�����־���
	 */
	public String saveReport() {
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		Calendar c = Calendar.getInstance();
		Date nowTime = c.getTime();
		report.setReportDay(nowTime);
		report.setEmpId(emp.getEmpId());
		reportService.save(report);
		result = ControllerResult.getSuccessResult("��ӳɹ�");
		return "saveReport";
	}
}
