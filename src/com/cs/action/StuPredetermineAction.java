package com.cs.action;

import java.util.List;
import java.util.Set;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.cs.bean.Emp;
import com.cs.bean.Income;
import com.cs.bean.Stu;
import com.cs.bean.User;
import com.cs.commom.Constants;
import com.cs.commom.bean.ControllerResult;
import com.cs.commom.bean.Pager4EasyUI;
import com.cs.service.EmpService;
import com.cs.service.IncomeService;
import com.cs.service.StuPredetermineService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

/**
 * �г�����Ԥ��ѧ��Action
 * @author ����
 *
 */
public class StuPredetermineAction extends ActionSupport implements ServletRequestAware {
	
	private static final long serialVersionUID = 4124704445790732902L;

	private StuPredetermineService stuPredetermineService;
	private IncomeService incomeService;
	private Stu stu;
	private long total;
	private List<Stu> rows;
	private ControllerResult result;
	private String id;
	private HttpServletRequest req;
	private double d;
	private Income income;
	private EmpService empService;
	

	public void setEmpService(EmpService empService) {
		this.empService = empService;
	}
	
	@Override
	public void setServletRequest(HttpServletRequest req) {
		this.req = req;
	}
	


	public void setStuPredetermineService(StuPredetermineService stuPredetermineService) {
		this.stuPredetermineService = stuPredetermineService;
	}


	public void setIncomeService(IncomeService incomeService) {
		this.incomeService = incomeService;
	}



	public Income getIncome() {
		return income;
	}


	public void setIncome(Income income) {
		this.income = income;
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

	public void setId(String id) {
		this.id = id;
	}

	/**
	 * ��ҳ��ת��userҳ��
	 * @return
	 */
	public String skipPage() {
		Emp emp = (Emp)(req).getSession().getAttribute("emp");//��ȡ�˵�½id����
		if(stuPredetermineService.queryPrevillige(emp.getRoleId(), StuPredetermineAction.class.getName() + ".skipPage")){
	        return "skip";
		}else{
			return "NoPrevillige";
		}
	}
	
	/**
	 * ���Ԥ��ѧ�� , �˷���Ϊͨ��---------------------------------------------------
	 */
	public String save() {
		Emp emp = (Emp)(req).getSession().getAttribute("emp");//��ȡ�˵�½id����
		if(stuPredetermineService.queryPrevillige(emp.getRoleId(), StuPredetermineAction.class.getName() + ".save")){
			stu.setEmpId(emp.getEmpId());
			stu.setStuStatus("predetermine");
			stu.setStatus(1);
			stuPredetermineService.save(stu);
			String money = req.getParameter("money");
			System.out.println(money);
			if (money != null) {
				d = Double.valueOf(money);
			}
			Income income = new Income();
			income.setIncomeTypeId("63897017560f440dbc8abdf050a3192f");//���Ԥ������id
			income.setStuId(stu.getStuId());
			income.setEmpId(emp.getEmpId());
			income.setIncomeDay(Constants.CURRENT_TIME);
			income.setDes("�ɷ�");
			income.setIncome(d);
			incomeService.save(income);
			result = ControllerResult.getSuccessResult("��ӳɹ�");
			
		}else{
			result = ControllerResult.getFailResult("Ȩ�޲���");
		}
		return "save";
	}
	
	
	/**
	 * ��ҳ��ѯ����Ԥ��ѧ��, �˷���Ϊͨ��---------------------------------------------------
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
			sql = " where status =1 and stuStatus='predetermine' and empId = '"+ emp.getEmpId()+ "' order by startDay desc";
		} else if (emp.getRoleName().equals("�ϰ�") || emp.getRoleName().equals("����������")) {
			sql=" where status =1 and stuStatus='predetermine' order by startDay desc";
		}
	    pager = stuPredetermineService.queryByPager("Stu", pager,sql);
	    pager.setTotal(stuPredetermineService.count("Stu",sql));
	    rows = pager.getRows();
	    total = pager.getTotal();
	    return "Assign";
	}
	
	
	/**
	 * ����id��ѯѧ��
	 */
	public String queryById(String id){
		Emp emp = (Emp)(req).getSession().getAttribute("emp");//��ȡ�˵�½id����
		if(stuPredetermineService.queryPrevillige(emp.getRoleId(), StuPredetermineAction.class.getName() + ".queryById")){
			Stu stu = stuPredetermineService.queryById(User.class, id);
			System.out.println(stu);
			
		}else{
			result = ControllerResult.getFailResult("Ȩ�޲���");
		}
		return "id";
	}
	
	/**
	 * �޸�Ԥ��ѧ��, �˷���Ϊͨ��---------------------------------------------------
	 */
	public String update() {
		Emp emp = (Emp)(req).getSession().getAttribute("emp");//��ȡ�˵�½id����
		if(stuPredetermineService.queryPrevillige(emp.getRoleId(), StuPredetermineAction.class.getName() + ".update")){
			stu.setEmpId(emp.getEmpId());
			stu.setStuStatus("predetermine");
			stu.setStatus(1);
			stuPredetermineService.update(stu);
			result = ControllerResult.getSuccessResult("�޸ĳɹ�");
			
		}else{
			result = ControllerResult.getFailResult("Ȩ�޲���");
		}
		return "update";
	}
	
	
	//��ѯ���н���Ԥ��ѧ��
	public String queryStu(){
		String pageNoStr = req.getParameter("page");
        String pageSizeStr = req.getParameter("rows");
        Pager4EasyUI<Stu> pager = new Pager4EasyUI<Stu>();
        if (pageNoStr != null) {
            pager.setPageNo(Integer.valueOf(pageNoStr));
            pager.setPageSize(Integer.valueOf(pageSizeStr));
        }
        Emp emp = (Emp)(req).getSession().getAttribute("emp");//��ȡ�˵�½id����
		if(stuPredetermineService.queryPrevillige(emp.getRoleId(), StuPredetermineAction.class.getName() + ".queryStu")){
	        pager = stuPredetermineService.queryFreezeByPager("Stu", pager);
	        pager.setTotal(stuPredetermineService.freezeCount("Stu"));
	        rows = pager.getRows();
	        total = pager.getTotal();
			
		}else{
			result = ControllerResult.getFailResult("Ȩ�޲���");
		}
		return "freezeAll";
	}
	
	//��ѯ��������Ԥ��ѧ��
	public String queryStu1(){
		String pageNoStr = req.getParameter("page");
        String pageSizeStr = req.getParameter("rows");
        Pager4EasyUI<Stu> pager = new Pager4EasyUI<Stu>();
        if (pageNoStr != null) {
            pager.setPageNo(Integer.valueOf(pageNoStr));
            pager.setPageSize(Integer.valueOf(pageSizeStr));
        }
        Emp emp = (Emp)(req).getSession().getAttribute("emp");//��ȡ�˵�½id����
		if(stuPredetermineService.queryPrevillige(emp.getRoleId(), StuPredetermineAction.class.getName() + ".queryStu1")){
	        pager = stuPredetermineService.queryFreezeByPager1("Stu", pager);
	        pager.setTotal(stuPredetermineService.freezeCount1("Stu"));
	        rows = pager.getRows();
	        total = pager.getTotal();
			
		}else{
			result = ControllerResult.getFailResult("Ȩ�޲���");
		}
		return "freezeAll1";
	}
	
	//ģ����ѯ
	public String blurredAllQuery(){
		String pageNoStr = req.getParameter("page");
        String pageSizeStr = req.getParameter("rows");
        String value= req.getParameter("value1");
        String name= req.getParameter("name1");
        Pager4EasyUI<Stu> pager = new Pager4EasyUI<Stu>();
        if (pageNoStr != null) {
            pager.setPageNo(Integer.valueOf(pageNoStr));
            pager.setPageSize(Integer.valueOf(pageSizeStr));
        }
        Emp emp = (Emp)(req).getSession().getAttribute("emp");//��ȡ�˵�½id����
		if(stuPredetermineService.queryPrevillige(emp.getRoleId(), StuPredetermineAction.class.getName() + ".blurredAllQuery")){
	        pager = stuPredetermineService.blurredAllQueryPager("Stu", pager, value, name);
	        pager.setTotal(stuPredetermineService.blurredAllQueryCount("Stu", pager, value, name));
	        rows = pager.getRows();
	        total = pager.getTotal();
			
		}else{
			result = ControllerResult.getFailResult("Ȩ�޲���");
		}
		return "blurredAll";
	}
	
	/**
	 * ����
	 * @return
	 */
	public String roleDisable(){ 
		Emp emp = (Emp)(req).getSession().getAttribute("emp");//��ȡ�˵�½id����
		if(stuPredetermineService.queryPrevillige(emp.getRoleId(), StuPredetermineAction.class.getName() + ".roleDisable")){
			stuPredetermineService.updateStatus("Stu","stuId",0, id);
			
		}else{
			result = ControllerResult.getFailResult("Ȩ�޲���");
		}
		return "disable";
	}
	
	/**
	 * ����
	 * @return
	 */
	public String roleActivate(){
		Emp emp = (Emp)(req).getSession().getAttribute("emp");//��ȡ�˵�½id����
		if(stuPredetermineService.queryPrevillige(emp.getRoleId(), StuPredetermineAction.class.getName() + ".roleActivate")){
			stuPredetermineService.updateStatus("Stu","stuId",1, id);
			
		}else{
			result = ControllerResult.getFailResult("Ȩ�޲���");
		}
		return "activate";
	}
	
	
	/**
	 * תΪ��ʽѧ��
	 */
	public String changePredetermine(){
		Emp emp = (Emp)(req).getSession().getAttribute("emp");//��ȡ�˵�½id����
		if(stuPredetermineService.queryPrevillige(emp.getRoleId(), StuPredetermineAction.class.getName() + ".changePredetermine")){
			String id = req.getParameter("id");
			String money = req.getParameter("money");
			if (money != null) {
				d = Double.valueOf(money);
			}
			Income income = new Income();
			income.setIncomeTypeId("c9bbedcb5511478aa2064eda741c61e0");//Ԥ��ת��ʽ����id
			income.setStuId(id);
			income.setEmpId(emp.getEmpId());
			income.setIncome(d);
			income.setIncomeDay(Constants.CURRENT_TIME);
			income.setDes("�ɷ�");
			incomeService.save(income);
			stuPredetermineService.updatePredetermine("Stu","official", id);
			result = ControllerResult.getSuccessResult("ת��ʽ�ɹ�");
			
		}else{
			result = ControllerResult.getFailResult("Ȩ�޲���");
		}
		return "change";
	}
}
