package com.cs.action;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.cs.bean.CheckInfo;
import com.cs.bean.Emp;
import com.cs.bean.EmpChecking;
import com.cs.bean.EmpCheckingInfo;
import com.cs.commom.bean.ControllerResult;
import com.cs.commom.bean.Pager4EasyUI;
import com.cs.service.EmpCheckingInfoService;
import com.cs.service.EmpCheckingService;
import com.opensymphony.xwork2.ActionSupport;


public class EmpCheckingAction extends ActionSupport implements ServletRequestAware {
	
	
	private static final long serialVersionUID = -5887180074817146721L;
	
	private EmpCheckingService empCheckingService;
	private long total;
	private EmpChecking empChecking;
	private List<EmpChecking> rows;
	private List<EmpChecking> checkinfo;
	private List<CheckInfo> lists;
	private String id;
	public ControllerResult result;
	public HttpServletRequest req;
	
	private EmpCheckingInfo empCheckingInfo;
	private EmpCheckingInfoService empCheckingInfoService;
	private List<EmpCheckingInfo> infoList;
	
	
	public List<EmpCheckingInfo> getInfoList() {
		return infoList;
	}
	
	

	public List<CheckInfo> getLists() {
		return lists;
	}



	public void setLists(List<CheckInfo> lists) {
		this.lists = lists;
	}



	public List<EmpChecking> getCheckinfo() {
		return checkinfo;
	}



	public void setEmpCheckingInfoService(EmpCheckingInfoService empCheckingInfoService) {
		this.empCheckingInfoService = empCheckingInfoService;
	}

	public EmpCheckingInfo getEmpCheckingInfo() {
		return empCheckingInfo;
	}

	public void setEmpCheckingInfo(EmpCheckingInfo empCheckingInfo) {
		this.empCheckingInfo = empCheckingInfo;
	}

	public ControllerResult getResult() {
		return result;
	}
	
	@Override
	public void setServletRequest(HttpServletRequest req) {
		this.req = req;
	}
	
	public EmpChecking getEmpChecking() {
		return empChecking;
	}

	public void setEmpChecking(EmpChecking empChecking) {
		this.empChecking = empChecking;
	}

	public long getTotal() {
		return total;
	}

	public List<EmpChecking> getRows() {
		return rows;
	}

	public void setEmpCheckingService(EmpCheckingService empCheckingService) {
		this.empCheckingService = empCheckingService;
	}
	
	public void setId(String id) {
		this.id = id;
	}

	/**
	 * ��ҳ��ת������ҳ��
	 * @return
	 */
	public String skipPage() {
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		String actionName = EmpCheckingAction.class.getName();
		if (empCheckingService.queryPrevillige(emp.getRoleId(), actionName + ".skipPage")) {
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
	 * ��ӿ�����Ϣ
	 */
	public String save() {
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		String actionName = EmpCheckingAction.class.getName();
		if (empCheckingService.queryPrevillige(emp.getRoleId(), actionName + ".save")) {
			empCheckingService.save(empChecking);
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
        Pager4EasyUI<EmpChecking> pager = new Pager4EasyUI<EmpChecking>();
        if (pageNoStr != null) {
            pager.setPageNo(Integer.valueOf(pageNoStr));
            pager.setPageSize(Integer.valueOf(pageSizeStr));
        }
        pager = empCheckingService.queryByPager("EmpChecking", pager, "");
        pager.setTotal(empCheckingService.count("EmpChecking",""));
        rows = pager.getRows();
        total = pager.getTotal();
        return "all";
	}
	
	/**
	 * ��ѯ����������Ϣ����
	 */
	public String queryById(String id){
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		String actionName = EmpCheckingAction.class.getName();
		if (empCheckingService.queryPrevillige(emp.getRoleId(), actionName + ".queryById")) {
			EmpChecking EmpChecking = empCheckingService.queryById(EmpChecking.class, id);
			System.out.println(EmpChecking);
		}else {

		}
		return "id";
		
	}
	
	/**
	 * �޸Ŀ�����Ϣ
	 */
	public String update() {
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		String actionName = EmpCheckingAction.class.getName();
		if (empCheckingService.queryPrevillige(emp.getRoleId(), actionName + ".update")) {
			empCheckingService.update(empChecking);
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
		String actionName = EmpCheckingAction.class.getName();
		if (empCheckingService.queryPrevillige(emp.getRoleId(), actionName + ".deleteById")) {
			empChecking = new EmpChecking();
			empChecking.setCheckingId(id);
			empCheckingService.delete(empChecking);
			result = ControllerResult.getSuccessResult("�޸ĳɹ�");
		}else {
			result = ControllerResult.getFailResult("Ȩ�޲���");
		}
		return "update";
	}

	
	/**
	 * �������� ���� ��ת��Ա������ҳ��
	 */
	public String eadskipPage(){
		return "eadskippage";
	}
	
	

	/**
	 * 	���ղ��Ų�ѯ�ò�������Ա���Ŀ�����Ϣ�� 
	 * @throws IOException 
	 */
	public String empChecking() throws IOException{
		Emp emp = (Emp)(req).getSession().getAttribute("emp");//��ȡ�˵�½id����
//		if(empCheckingService.queryPrevillige(emp.getRoleId(), StuCheckingAction.class.getName() + ".empChecking")){
			String depId=req.getParameter("depId");
			String year = req.getParameter("year");
			String month = req.getParameter("month");
			String startMonth = year + "-" + month + "-" + "1";
	  		String endMonth= year + "-" + month + "-" + "31" ;
	  		System.out.println(startMonth + ", " + endMonth);
	  		System.out.println(depId + "aaaaaaaaaaaaaaaaaaaaaaaaaaaa");
	  		checkinfo = empCheckingService.queryByMonth(depId,startMonth, endMonth);
	  		infoList = empCheckingInfoService.query();
	  		String a = null;
	  		for (EmpCheckingInfo s : infoList) {
				System.out.println(s.toString() + "ccccccccccccccccc");
				a = s.getCheckingTime();
			}
	  		
		return "empChecking";
	}


}
