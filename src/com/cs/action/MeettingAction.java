package com.cs.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.cs.bean.Emp;
import com.cs.bean.Meetting;
import com.cs.commom.bean.ComboBox4EasyUI;
import com.cs.commom.bean.ControllerResult;
import com.cs.commom.bean.Pager4EasyUI;
import com.cs.service.MeettingService;
import com.opensymphony.xwork2.ActionSupport;

public class MeettingAction extends ActionSupport implements ServletRequestAware {

	private static final long serialVersionUID = -3676637554924940009L;

	private MeettingService meettingService;
	private List<ComboBox4EasyUI> comboBoxEasyUIs;
	private Meetting meetting;
	private List<Meetting> rows;
	private long total;
	private ControllerResult result;
	private HttpServletRequest req;
	private String id;
	private String empId;
	private String empName;
	
	private Emp emp;

	public String getEmpId() {
		emp = (Emp) req.getSession().getAttribute("emp");// ��ȡ�˵�½id����
		return empId;
	}

	public void setEmpId(String empId) {
		this.empId = empId;
	}

	@Override
	public void setServletRequest(HttpServletRequest req) {
		this.req = req;
	}

	public void setMeettingService(MeettingService meettingService) {
		this.meettingService = meettingService;
	}

	public List<ComboBox4EasyUI> getComboBoxEasyUIs() {
		emp = (Emp) req.getSession().getAttribute("emp");// ��ȡ�˵�½id����
		return comboBoxEasyUIs;
	}

	public Meetting getMeetting() {
		emp = (Emp) req.getSession().getAttribute("emp");// ��ȡ�˵�½id����
		return meetting;
	}

	public void setMeetting(Meetting meetting) {
		this.meetting = meetting;
	}

	public long getTotal() {
		emp = (Emp) req.getSession().getAttribute("emp");// ��ȡ�˵�½id����
		return total;
	}

	public ControllerResult getResult() {
		emp = (Emp) req.getSession().getAttribute("emp");// ��ȡ�˵�½id����
		return result;
	}

	public List<Meetting> getRows() {
		emp = (Emp) req.getSession().getAttribute("emp");// ��ȡ�˵�½id����
		return rows;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getEmpName() {
		emp = (Emp) req.getSession().getAttribute("emp");// ��ȡ�˵�½id����
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	/**
	 * ����������
	 * 
	 * @return
	 */
	public String admissionsSkipPage() {
		emp = (Emp) req.getSession().getAttribute("emp");// ��ȡ�˵�½id����
		return "admissionsSkip";
	}

	// *************************************************
	/**
	 * ��ҳ��ѯ���е����ֿ�
	 * 
	 * @return
	 */
	public String meettingQueryAll() {
		emp = (Emp) req.getSession().getAttribute("emp");// ��ȡ�˵�½id����
		System.out.println("���ڲ�ѯ���пγ�");
		String pageNoStr = req.getParameter("page");
		String pageSizeStr = req.getParameter("rows");
		Pager4EasyUI<Meetting> pager = new Pager4EasyUI<Meetting>();
		if (pageNoStr != null) {
			pager.setPageNo(Integer.valueOf(pageNoStr));
			pager.setPageSize(Integer.valueOf(pageSizeStr));
		}
		pager = meettingService.queryByPager("Meetting", pager, "");
		pager.setTotal(meettingService.count("Meetting", ""));
		rows = pager.getRows();
		total = pager.getTotal();
		return "all";
	}

	/**
	 * ��ת�����ֻ�ҳ��
	 * 
	 * @return
	 */
	public String meettingSkipPage() {
		emp = (Emp) req.getSession().getAttribute("emp");// ��ȡ�˵�½id����
		if (meettingService.queryPrevillige(emp.getRoleId(),
				MeettingAction.class.getName() + ".meettingSkipPage")) {
			return "skipMeetting";
		} else {
			return "NoPrevillige";
		}

	}

	/**
	 * ����µ����ֻ�
	 * 
	 * @return
	 */
	public String addMeetting() {
		emp = (Emp) req.getSession().getAttribute("emp");// ��ȡ�˵�½id����
		System.out.println("��������µ����ֻ�");
		System.out.println(meetting.toString());
		if (meettingService.queryPrevillige(emp.getRoleId(), MeettingAction.class.getName() + ".addMeetting")) {
			meetting.setStatus(1);
			meettingService.save(meetting);
			result = ControllerResult.getSuccessResult("������ֻ�ɹ�");
		} else {
			result = ControllerResult.getFailResult("Ȩ�޲���");
		}
		return "addmeetting";
	}

	/**
	 * �������ֻ���Ϣ
	 */
	public String updateMeetting() {
		emp = (Emp) req.getSession().getAttribute("emp");// ��ȡ�˵�½id����
		System.out.println(empId);
		if (meettingService.queryPrevillige(emp.getRoleId(), MeettingAction.class.getName() + ".updateMeetting")) {
			meetting.setEmpId(empId);
			meetting.setMeettingId(meetting.getMeettingId());
			meettingService.update(meetting);
			result = ControllerResult.getSuccessResult("�������ֻ�ɹ�");
		} else {
			result = ControllerResult.getFailResult("Ȩ�޲���");
		}
		return "updatemeetting";
	}

	/**
	 * ɾ�����е����ֻ���Ϣ
	 * 
	 * @return
	 */
	public String deleteMeetting() {
		emp = (Emp) req.getSession().getAttribute("emp");// ��ȡ�˵�½id����
		if (meettingService.queryPrevillige(emp.getRoleId(), MeettingAction.class.getName() + ".deleteMeetting")) {
			Meetting m = new Meetting();
			m.setMeettingId(id);
			meettingService.delete(m);
		} else {
			result = ControllerResult.getFailResult("Ȩ�޲���");
		}
		return "deletemeetting";
	}

	/**
	 * ģ����ѯ
	 */
	public String blurredAllQuery() {
		emp = (Emp) req.getSession().getAttribute("emp");// ��ȡ�˵�½id����
		String pageNoStr = req.getParameter("page");
		String pageSizeStr = req.getParameter("rows");
		String value = req.getParameter("value1");
		String name = req.getParameter("name1");
		System.out.println("value :" + value + ", name: " + name);
		Pager4EasyUI<Meetting> pager = new Pager4EasyUI<Meetting>();
		if (pageNoStr != null) {
			pager.setPageNo(Integer.valueOf(pageNoStr));
			pager.setPageSize(Integer.valueOf(pageSizeStr));
		}
		pager = meettingService.blurredAllQueryPager("Emp", pager, value, name);
		pager.setTotal(meettingService.blurredAllQueryCount("Meetting", pager, value, name));
		rows = pager.getRows();
		total = pager.getTotal();
		return "blurredAllQuery";
	}

	public String serachTime() {
		emp = (Emp) req.getSession().getAttribute("emp");// ��ȡ�˵�½id����
		String pageNoStr = req.getParameter("page");
		String pageSizeStr = req.getParameter("rows");
		String beginTime = req.getParameter("beginTime");
		String endTime = req.getParameter("endTime");
		System.out.println("��ʼʱ��" + beginTime + "����ʱ�䣺" + endTime);
		Pager4EasyUI<Meetting> pager = new Pager4EasyUI<Meetting>();
		if (pageNoStr != null) {
			pager.setPageNo(Integer.valueOf(pageNoStr));
			pager.setPageSize(Integer.valueOf(pageSizeStr));
		}
		pager = meettingService.queryByDay(pager, beginTime, endTime, "Meetting", "meettingDay");
		System.out.println(pager.toString());
		pager.setTotal(meettingService.count("Meetting", ""));
		rows = pager.getRows();
		total = pager.getTotal();
		return "serachtime";
	}

	/**
	 * ����
	 * 
	 * @return
	 */
	public String meettingDisable() {
		emp = (Emp) req.getSession().getAttribute("emp");// ��ȡ�˵�½id����
		if (meettingService.queryPrevillige(emp.getRoleId(), MeettingAction.class.getName() + ".meettingDisable")) {
			meettingService.updateStatus("Meetting", "meettingId", 0, id);
		} else {
			result = ControllerResult.getFailResult("Ȩ�޲���");
		}
		return "disable";
	}

	/**
	 * ����
	 * 
	 * @return
	 */
	public String meettingActivate() {
		emp = (Emp) req.getSession().getAttribute("emp");// ��ȡ�˵�½id����
		if (meettingService.queryPrevillige(emp.getRoleId(),
				MeettingAction.class.getName() + ".meettingActivate")) {
			meettingService.updateStatus("Meetting", "meettingId", 1, id);
		} else {
			result = ControllerResult.getFailResult("Ȩ�޲���");
		}
		return "activate";
	}
}
