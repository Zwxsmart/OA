package com.cs.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.cs.bean.Emp;
import com.cs.bean.Income;
import com.cs.bean.Stu;
import com.cs.bean.User;
import com.cs.commom.Constants;
import com.cs.commom.bean.ControllerResult;
import com.cs.commom.bean.Pager4EasyUI;
import com.cs.service.IncomeService;
import com.cs.service.PrevilligeSerivce;
import com.cs.service.StuIntentionService;
import com.opensymphony.xwork2.ActionSupport;

/**
 * �г���������ѧ��Action
 * 
 * @author ����
 *
 */
public class StuIntentionAction extends ActionSupport implements ServletRequestAware {

	private static final long serialVersionUID = 4124704445790732902L;

	private StuIntentionService stuIntentionService;
	private IncomeService incomeService;

	private Stu stu;
	private String stuStatus;
	private String incomeId;
	private String stuId;
	private long total;
	private List<Stu> rows;
	private ControllerResult result;
	private String id;
	private double d;

	private HttpServletRequest req;

	private PrevilligeSerivce preService;
	
	public void setPreService(PrevilligeSerivce preService) {
		this.preService = preService;
	}
	@Override
	public void setServletRequest(HttpServletRequest req) {
		this.req = req;
	}

	public void setStuIntentionService(StuIntentionService stuIntentionService) {
		this.stuIntentionService = stuIntentionService;
	}

	public void setIncomeService(IncomeService incomeService) {
		this.incomeService = incomeService;
	}

	public Stu getStu() {
		return stu;
	}

	public long getTotal() {
		return total;
	}

	public void setTotal(long total) {
		this.total = total;
	}

	public void setStu(Stu stu) {
		this.stu = stu;
	}

	public List<Stu> getRows() {
		return rows;
	}

	public ControllerResult getResult() {
		return result;
	}

	public String getStuStatus() {
		return stuStatus;
	}

	public void setStuStatus(String stuStatus) {
		this.stuStatus = stuStatus;
	}

	public String getIncomeId() {
		return incomeId;
	}

	public void setIncomeId(String incomeId) {
		this.incomeId = incomeId;
	}

	public String getStuId() {
		return stuId;
	}

	public void setStuId(String stuId) {
		this.stuId = stuId;
	}

	public void setId(String id) {
		this.id = id;
	}

	/**
	 * ��ҳ��ת��userҳ��
	 * 
	 * @return
	 */
	public String skipPage() {
		Emp emp = (Emp)(req).getSession().getAttribute("emp");//��ȡ�˵�½id����
		if(stuIntentionService.queryPrevillige(emp.getRoleId(), StuIntentionAction.class.getName() + ".skipPage")){
			return "skip";
		}else{
			return "NoPrevillige";
		}
	}

	/**
	 * �������ѧ��
	 */
	public String save() {
		 Emp emp = (Emp)(req).getSession().getAttribute("emp");//��ȡ�˵�½id����
		if(stuIntentionService.queryPrevillige(emp.getRoleId(), StuIntentionAction.class.getName() + ".save")){
			stu.setEmpId(emp.getEmpId());
			stu.setStuStatus("intention");
			stu.setStatus(1);
			stuIntentionService.save(stu);
			result = ControllerResult.getSuccessResult("��ӳɹ�");
			
		}else{
			result = ControllerResult.getFailResult("Ȩ�޲���");
		}
		return "save";
	}


	/**
	 * ��ҳ��ѯ��������ѧ��
	 */
	public String queryAssign() {
			Emp emp = (Emp)(req).getSession().getAttribute("emp");//��ȡ�˵�½id����
			String pageNoStr = req.getParameter("page");
		    String pageSizeStr = req.getParameter("rows");
		    String sql = "";
		    Pager4EasyUI<Stu> pager = new Pager4EasyUI<Stu>();
		    if (pageNoStr != null) {
		        pager.setPageNo(Integer.valueOf(pageNoStr));
		        pager.setPageSize(Integer.valueOf(pageSizeStr));
		    }
		    if (emp.getRoleName().equals("������ʦ") || emp.getRoleName().equals("��������") || emp.getRoleName().equals("����������") || emp.getRoleName().equals("������") || emp.getRoleName().equals("�ο���ʦ")
					 || emp.getRoleName().equals("������ʦ") || emp.getRoleName().equals("���ڲ�����")
					|| emp.getRoleName().equals("��������")) {
	      	// ״̬����ͨ�� , ѧ��״̬Ϊ����, empIdΪ�˵�½id����������ѧ��, ����ʱ�䵹��
				sql = " where status =1 and stuStatus='intention' and empId = '"+ emp.getEmpId()+ "' order by startDay desc";
			} else if (emp.getRoleName().equals("�ϰ�") || emp.getRoleName().equals("����������")) {
				sql=" where status =1 and stuStatus='intention' order by startDay desc";
			}
		    pager = stuIntentionService.queryByPager("Stu", pager,sql);
		    pager.setTotal(stuIntentionService.count("Stu",sql));
		    System.out.println(pager.toString());
		    rows = pager.getRows();
		    total = pager.getTotal();
		    return "Assign";
	}
	
	
	/**
	 * ����id��ѯѧ��
	 */
	public String queryById(String id) {
		Emp emp = (Emp)(req).getSession().getAttribute("emp");//��ȡ�˵�½id����
		if(stuIntentionService.queryPrevillige(emp.getRoleId(), StuIntentionAction.class.getName() + ".queryById")){
			Stu stu = stuIntentionService.queryById(User.class, id);
			System.out.println(stu);
			
		}else{
			result = ControllerResult.getFailResult("Ȩ�޲���");
		}
		return "id";
	}

	/**
	 * �޸�����ѧ��
	 */
	public String update() {
		Emp emp = (Emp)(req).getSession().getAttribute("emp");//��ȡ�˵�½id����
		if(stuIntentionService.queryPrevillige(emp.getRoleId(), StuIntentionAction.class.getName() + ".update")){
			stu.setEmpId(emp.getEmpId());
			stu.setStuStatus("intention");
			stu.setStatus(1);
			stuIntentionService.update(stu);
			result = ControllerResult.getSuccessResult("�޸ĳɹ�");
		}else{
			result = ControllerResult.getFailResult("Ȩ�޲���");
		}
		return "update";
	}

	// ��ѯ���н�������ѧ��
	public String queryStu() {
		
		Emp emp = (Emp)(req).getSession().getAttribute("emp");//��ȡ�˵�½id����
		if(stuIntentionService.queryPrevillige(emp.getRoleId(), StuIntentionAction.class.getName() + ".queryStu")){
			String pageNoStr = req.getParameter("page");
			String pageSizeStr = req.getParameter("rows");
			Pager4EasyUI<Stu> pager = new Pager4EasyUI<Stu>();
			if (pageNoStr != null) {
				pager.setPageNo(Integer.valueOf(pageNoStr));
				pager.setPageSize(Integer.valueOf(pageSizeStr));
			}
			pager = stuIntentionService.queryFreezeByPager("Stu", pager);
			pager.setTotal(stuIntentionService.freezeCount("Stu"));
			rows = pager.getRows();
			total = pager.getTotal();
			
		}else{
			result = ControllerResult.getFailResult("Ȩ�޲���");
		}
		return "freezeAll";
	}

	// ��ѯ������������ѧ��
	public String queryStu1() {
		Emp emp = (Emp)(req).getSession().getAttribute("emp");//��ȡ�˵�½id����
		if(stuIntentionService.queryPrevillige(emp.getRoleId(), StuIntentionAction.class.getName() + ".queryStu1")){
			String pageNoStr = req.getParameter("page");
			String pageSizeStr = req.getParameter("rows");
			Pager4EasyUI<Stu> pager = new Pager4EasyUI<Stu>();
			if (pageNoStr != null) {
				pager.setPageNo(Integer.valueOf(pageNoStr));
				pager.setPageSize(Integer.valueOf(pageSizeStr));
			}
			
			pager = stuIntentionService.queryFreezeByPager1("Stu", pager);
			pager.setTotal(stuIntentionService.freezeCount1("Stu"));
			rows = pager.getRows();
			total = pager.getTotal();
			
		}else{
			result = ControllerResult.getFailResult("Ȩ�޲���");
		}
		return "freezeAll1";
	}

	// ģ����ѯ
	public String blurredAllQuery() {
		Emp emp = (Emp)(req).getSession().getAttribute("emp");//��ȡ�˵�½id����
		if(stuIntentionService.queryPrevillige(emp.getRoleId(), StuIntentionAction.class.getName() + ".blurredAllQuery")){
			String pageNoStr = req.getParameter("page");
			String pageSizeStr = req.getParameter("rows");
			String value = req.getParameter("value1");
			String name = req.getParameter("name1");
			Pager4EasyUI<Stu> pager = new Pager4EasyUI<Stu>();
			if (pageNoStr != null) {
				pager.setPageNo(Integer.valueOf(pageNoStr));
				pager.setPageSize(Integer.valueOf(pageSizeStr));
			}
			pager = stuIntentionService.blurredAllQueryPager("Stu", pager, value, name);
			pager.setTotal(stuIntentionService.blurredAllQueryCount("Stu", pager, value, name));
			rows = pager.getRows();
			total = pager.getTotal();
			
		}else{
			result = ControllerResult.getFailResult("Ȩ�޲���");
		}
		return "blurredAll";
	}

	/**
	 * ����
	 * 
	 * @return
	 */
	public String roleDisable() {
		Emp emp = (Emp)(req).getSession().getAttribute("emp");//��ȡ�˵�½id����
		if(stuIntentionService.queryPrevillige(emp.getRoleId(), StuIntentionAction.class.getName() + ".roleDisable")){
			stuIntentionService.updateStatus("Stu", "stuId", 0, id);
			
		}else{
			result = ControllerResult.getFailResult("Ȩ�޲���");
		}
		return "disable";
	}

	/**
	 * ����
	 * 
	 * @return
	 */
	public String roleActivate() {
		Emp emp = (Emp)(req).getSession().getAttribute("emp");//��ȡ�˵�½id����
		if(stuIntentionService.queryPrevillige(emp.getRoleId(), StuIntentionAction.class.getName() + ".roleActivate")){
			stuIntentionService.updateStatus("Stu", "stuId", 1, id);
			
		}else{
			result = ControllerResult.getFailResult("Ȩ�޲���");
		}
		return "activate";
	}

	/**
	 * תΪԤ��ѧ��
	 */
	public String changeIntention() {
		Emp emp = (Emp)(req).getSession().getAttribute("emp");//��ȡ�˵�½id����
		if(stuIntentionService.queryPrevillige(emp.getRoleId(), StuIntentionAction.class.getName() + ".changeIntention")){
			 String id = req.getParameter("id");
			 String money = req.getParameter("money");
			 if (money != null) {
				 d = Double.valueOf(money);
			 }
			Income income = new Income();
			 income.setIncomeTypeId("ab5747b1e6e647cdbdb91fec062ca571");//����תԤ��id
			 income.setStuId(id);
			 income.setEmpId(emp.getEmpId());
			 income.setIncomeDay(Constants.CURRENT_TIME);
			 income.setDes("�ɷ�");
			 income.setIncome(d);
			 incomeService.save(income);
			stuIntentionService.updateIntention("Stu", "predetermine", id);
			result = ControllerResult.getSuccessResult("תԤ���ɹ�");
			
		}else{
			result = ControllerResult.getFailResult("Ȩ�޲���");
		}
		return "change";
	}
	
	/**
	 * תΪ��ʽѧ��
	 */
	public String changePredetermine(){
		Emp emp = (Emp)(req).getSession().getAttribute("emp");//��ȡ�˵�½id����
		if(stuIntentionService.queryPrevillige(emp.getRoleId(), StuIntentionAction.class.getName() + ".changePredetermine")){
			String id = req.getParameter("id");
			String money = req.getParameter("money");
			if (money != null) {
				d = Double.valueOf(money);
			}
			Income income = new Income();
			income.setIncomeTypeId("4028dae9597ddbd301597defbd5c0001");//����ת��ʽ����id
			income.setStuId(id);
			income.setEmpId(emp.getEmpId());
			income.setIncomeDay(Constants.CURRENT_TIME);
			income.setDes("�ɷ�");
			income.setIncome(d);
			incomeService.save(income);
			stuIntentionService.updatePredetermine("Stu","official", id);
			result = ControllerResult.getSuccessResult("ת��ʽ�ɹ�");
			
		}else{
			result = ControllerResult.getFailResult("Ȩ�޲���");
		}
		return "changePredetermine";
	}
}