package com.cs.action;

import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.cs.bean.Emp;
import com.cs.bean.EmpCheckingInfo;
import com.cs.commom.bean.ControllerResult;
import com.cs.commom.bean.Pager4EasyUI;
import com.cs.service.EmpCheckingInfoService;
import com.opensymphony.xwork2.ActionSupport;


public class EmpCheckingInfoAction extends ActionSupport implements ServletRequestAware {
	
	private static final long serialVersionUID = -6049237513981625959L;
	
	private EmpCheckingInfoService empCheckingInfoService;
	private long total;
	private EmpCheckingInfo empCheckingInfo;
	private List<EmpCheckingInfo> rows;
	private String id;
	public ControllerResult result;
	public HttpServletRequest req;
	
	public ControllerResult getResult() {
		return result;
	}
	
	@Override
	public void setServletRequest(HttpServletRequest req) {
		this.req = req;
	}
	
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}

	public EmpCheckingInfo getEmpCheckingInfo() {
		return empCheckingInfo;
	}

	public void setEmpCheckingInfo(EmpCheckingInfo empCheckingInfo) {
		this.empCheckingInfo = empCheckingInfo;
	}

	public long getTotal() {
		return total;
	}


	public List<EmpCheckingInfo> getRows() {
		return rows;
	}
	
	public void setEmpCheckingInfoService(EmpCheckingInfoService empCheckingInfoService) {
		this.empCheckingInfoService = empCheckingInfoService;
	}
	
	
	/**
	 * ��ҳ��ת������ҳ��
	 * @return
	 */
	public String skipPage() {
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		String actionName = EmpCheckingInfoAction.class.getName();
		if (empCheckingInfoService.queryPrevillige(emp.getRoleId(), actionName + ".skipPage")) {
			return "skip";
		}else {
			return "NoPrevillige";
		}
	        
	}
	
	/**
	 * ��ӿ�����Ϣ
	 */
	public String save() {
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		String actionName = EmpCheckingInfoAction.class.getName();
		if (empCheckingInfoService.queryPrevillige(emp.getRoleId(), actionName + ".save")) {
			empCheckingInfoService.save(empCheckingInfo);
			result = ControllerResult.getSuccessResult("��ӳɹ�");
		}else {
			result = ControllerResult.getFailResult("Ȩ�޲���");
		}
		return "save";
	}
	
	/**
	 * ��ҳ��ѯ���п�����Ϣ
	 */
	public String queryAll() {
		String pageNoStr = req.getParameter("page");
        String pageSizeStr = req.getParameter("rows");
        Pager4EasyUI<EmpCheckingInfo> pager = new Pager4EasyUI<EmpCheckingInfo>();
        if (pageNoStr != null) {
            pager.setPageNo(Integer.valueOf(pageNoStr));
            pager.setPageSize(Integer.valueOf(pageSizeStr));
        }
        pager = empCheckingInfoService.queryByPager("EmpCheckingInfo", pager, "");
        pager.setTotal(empCheckingInfoService.count("EmpCheckingInfo",""));
        rows = pager.getRows();
        total = pager.getTotal();
        return "all";
	}
	
	/**
	 * ��ѯ����������Ϣ����
	 */
	public String queryById(String id){
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		String actionName = EmpCheckingInfoAction.class.getName();
		if (empCheckingInfoService.queryPrevillige(emp.getRoleId(), actionName + ".queryById")) {
			EmpCheckingInfo EmpCheckingInfo = empCheckingInfoService.queryById(EmpCheckingInfo.class, id);
			System.out.println(EmpCheckingInfo);
		}else {

		}
		return "id";
		
	}
	
	/**
	 * �޸Ŀ�����Ϣ
	 */
	public String update() {
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		String actionName = EmpCheckingInfoAction.class.getName();
		if (empCheckingInfoService.queryPrevillige(emp.getRoleId(), actionName + ".update")) {
			empCheckingInfoService.update(empCheckingInfo);
			result = ControllerResult.getSuccessResult("�޸ĳɹ�");
		}else {
			result = ControllerResult.getFailResult("Ȩ�޲���");
		}
		return "update";
	}

	/**
	 * ɾ��������Ϣ
	 */
	public String deleteById() {
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		String actionName = EmpCheckingInfoAction.class.getName();
		if (empCheckingInfoService.queryPrevillige(emp.getRoleId(), actionName + ".deleteById")) {
			empCheckingInfo = new EmpCheckingInfo();
			empCheckingInfo.setCheckingInfoId(id);
			empCheckingInfoService.delete(empCheckingInfo);
			result = ControllerResult.getSuccessResult("�޸ĳɹ�");
		}else {
			result = ControllerResult.getFailResult("Ȩ�޲���");
		}
		return "delete";
	}

}
