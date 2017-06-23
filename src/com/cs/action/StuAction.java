package com.cs.action;

import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.cs.bean.Emp;
import com.cs.bean.Income;
import com.cs.bean.Notice;
import com.cs.bean.Stu;
import com.cs.bean.User;
import com.cs.commom.EncryptUtil;
import com.cs.commom.bean.ControllerResult;
import com.cs.commom.bean.Pager4EasyUI;
import com.cs.dao.StuDAO;
import com.cs.service.IncomeService;
import com.cs.service.NoticeServiceImpl;
import com.cs.service.StuService;
import com.opensymphony.xwork2.ActionSupport;

/**
 * ѧ��Action
 * @author ������
 *
 */
public class StuAction extends ActionSupport implements ServletRequestAware {
	
	private static final long serialVersionUID = 4124704445790732902L;

	private StuService stuService;
	private IncomeService incomeService;
	
	private Stu stu;
	private long total;
	private List<Stu> rows;
	private ControllerResult result;
	private String id;
	private HttpServletRequest req;
	private String empId; // stu.jsp ������ʦ
	private HttpSession session;
	
	@Override
	public void setServletRequest(HttpServletRequest req) {
		this.req = req;
	}

	public void setStuService(StuService stuService) {
		this.stuService = stuService;
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

	public void setId(String id) {
		this.id = id;
	}
	public void setEmpId(String empId) {
		this.empId = empId;
	}
	
	public String getEmpId() {
		return empId;
	}
	/**
	 * ��ҳ��ת��userҳ��
	 * @return
	 */
	public String skipPage() {
		Emp emp = (Emp)req.getSession().getAttribute("emp");//��ȡ�˵�½id����
		if(stuService.queryPrevillige(emp.getRoleId(), StuIntentionAction.class.getName() + ".skipPage")){
			return "skip";
		}else{
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
	 * ѧ����½ҳ��
	 */
	public String loginPage() {
		return "loginPage";
	}
	
	/**
	 * ���ѧ��
	 */
	public String save() {
		Emp emp = (Emp)req.getSession().getAttribute("emp");//��ȡ�˵�½id����
		if(stuService.queryPrevillige(emp.getRoleId(), StuIntentionAction.class.getName() + ".save")){
			if(stu.getIdCard() != null && !stu.getIdCard().equals("")){
				stu.setPwd(EncryptUtil.encrypt(stu.getIdCard().substring(12,18)));// ����/֤��6λ��������
			}
			// ����������������
			//ȡ��ϵͳ��ǰʱ����ꡢ�¡��ղ���
			if(stu.getBirthday() != null && !stu.getBirthday().equals("")){
				Calendar cal = Calendar.getInstance(); 
		        int yearNow = cal.get(Calendar.YEAR); 
		        int monthNow = cal.get(Calendar.MONTH); 
		        int dayOfMonthNow = cal.get(Calendar.DAY_OF_MONTH); 
		        //����������Ϊ��������
		        cal.setTime(stu.getBirthday()); 
		        //ȡ���������ڵ��ꡢ�¡��ղ���  
		        int yearBirth = cal.get(Calendar.YEAR); 
		        int monthBirth = cal.get(Calendar.MONTH); 
		        int dayOfMonthBirth = cal.get(Calendar.DAY_OF_MONTH); 
		        //��ǰ����������������������������
		        int age = yearNow - yearBirth; 
		        //��ǰ�·���������ڵ��·���ȣ�����·�С�ڳ����·ݣ��������ϼ�1����ʾ������������
		        if (monthNow <= monthBirth) { 
		            //����·���ȣ��ڱȽ����ڣ������ǰ�գ�С�ڳ����գ�Ҳ��1����ʾ������������
		            if (monthNow == monthBirth) { 
		                if (dayOfMonthNow < dayOfMonthBirth) {
		                	age--; 
		                }
		            }else{ 
		                age--; 
		            } 
		        } 
		        stu.setAge(age);
			}
			//-----����������������
			stu.setStuStatus("official");
			stu.setStatus(1);
			if (empId != null && !empId.trim().equals("")) {
				stu.setEmpId(empId);
			}
			String moneyStr = req.getParameter("money");
			System.out.println(moneyStr);
			Double money = null;
			if(moneyStr != null && !moneyStr.equals("")){
				money = Double.valueOf(moneyStr);
			}
			stuService.save(stu);
			Income income = new Income();
			income.setIncomeTypeId("69c0871254804ce0a0ab26f2b28125ed");//�����ʽ����id
			income.setStuId(stu.getStuId());
			income.setEmpId(emp.getEmpId());
			income.setIncome(money);
			incomeService.save(income);
			result = ControllerResult.getSuccessResult("��ӳɹ�");
		}else{
			result = ControllerResult.getSuccessResult("Ȩ�޲���");
		}
		return "save";
	}
	
	/**
	 * ��ҳ��ѯ����ѧ��
	 */
	public String queryAll() {
		Emp emp = (Emp)req.getSession().getAttribute("emp");//��ȡ�˵�½id����
		if(stuService.queryPrevillige(emp.getRoleId(), StuAction.class.getName() + ".queryAll")){
			String pageNoStr = req.getParameter("page");
	        String pageSizeStr = req.getParameter("rows");
	        Pager4EasyUI<Stu> pager = new Pager4EasyUI<Stu>();
	        if (pageNoStr != null) {
	            pager.setPageNo(Integer.valueOf(pageNoStr));
	            pager.setPageSize(Integer.valueOf(pageSizeStr));
	        }
	        pager = stuService.queryByPager("Stu", pager, " where status =1 and stuStatus='official' order by startDay desc");
	        pager.setTotal(stuService.count("Stu",""));
	        rows = pager.getRows();
	        total = pager.getTotal();
		}else{
			
		}
        return "all";
	}
	
	/**
	 * ��ѯ����ѧ������
	 */
	public String queryById(String id){
		Emp emp = (Emp)req.getSession().getAttribute("emp");//��ȡ�˵�½id����
		if(stuService.queryPrevillige(emp.getRoleId(), StuAction.class.getName() + ".queryById")){
			Stu stu = stuService.queryById(User.class, id);
			System.out.println(stu);
		}else{
			
		}
		return "id";
	}
	
	/**
	 * �޸�ѧ��
	 */
	public String update() {
		Emp emp = (Emp)req.getSession().getAttribute("emp");//��ȡ�˵�½id����
		if(stuService.queryPrevillige(emp.getRoleId(), StuAction.class.getName() + ".update")){
			if(stu.getIdCard() != null && !stu.getIdCard().equals("")){
				stu.setPwd(EncryptUtil.encrypt(stu.getIdCard().substring(12,18)));// �������֤��6λ��������
			}
			// ����������������
			//ȡ��ϵͳ��ǰʱ����ꡢ�¡��ղ���
			if(stu.getBirthday() != null && !stu.getBirthday().equals("")){
				Calendar cal = Calendar.getInstance(); 
		        int yearNow = cal.get(Calendar.YEAR); 
		        int monthNow = cal.get(Calendar.MONTH); 
		        int dayOfMonthNow = cal.get(Calendar.DAY_OF_MONTH); 
		        //����������Ϊ��������
		        cal.setTime(stu.getBirthday()); 
		        //ȡ���������ڵ��ꡢ�¡��ղ���  
		        int yearBirth = cal.get(Calendar.YEAR); 
		        int monthBirth = cal.get(Calendar.MONTH); 
		        int dayOfMonthBirth = cal.get(Calendar.DAY_OF_MONTH); 
		        //��ǰ����������������������������
		        int age = yearNow - yearBirth; 
		        //��ǰ�·���������ڵ��·���ȣ�����·�С�ڳ����·ݣ��������ϼ�1����ʾ������������
		        if (monthNow <= monthBirth) { 
		            //����·���ȣ��ڱȽ����ڣ������ǰ�գ�С�ڳ����գ�Ҳ��1����ʾ������������
		            if (monthNow == monthBirth) { 
		                if (dayOfMonthNow < dayOfMonthBirth) {
		                	age--; 
		                }
		            }else{ 
		                age--; 
		            } 
		        } 
		        stu.setAge(age);
			}
			//-----����������������
				stu.setStatus(1);
			if (empId != null && !empId.trim().equals("")) {
				stu.setEmpId(empId);
			}
			stu.setStuStatus("official");
			stuService.update(stu);
			result = ControllerResult.getSuccessResult("�޸ĳɹ�");
		}else{
			result = ControllerResult.getSuccessResult("Ȩ�޲���");
		}
		return "update";
	}

	/**
	 * �޸�ѧ��״̬
	 */
	public String updateFreeze() {
		Emp emp = (Emp)req.getSession().getAttribute("emp");//��ȡ�˵�½id����
		if(stuService.queryPrevillige(emp.getRoleId(), StuAction.class.getName() + ".updateFreeze")){
			int status = 0;
			String id = req.getParameter("stuId");
			String statusStr = req.getParameter("status");
			if(statusStr != null && !statusStr.equals("")){
				status = Integer.valueOf(statusStr);
			}
			stuService.updateStatus("Stu", "stuId", status, id);
			result = ControllerResult.getSuccessResult("�޸ĳɹ�");
		}else{
			result = ControllerResult.getSuccessResult("Ȩ�޲���");
		}
		return "updateFreeze";
	}

	
	/**
	 * ��ѯ���б�����ѧ��
	 */
	public String queryFreezeAll(){
		Emp emp = (Emp)req.getSession().getAttribute("emp");//��ȡ�˵�½id����
		if(stuService.queryPrevillige(emp.getRoleId(), StuAction.class.getName() + ".queryFreezeAll")){
			String pageNoStr = req.getParameter("page");
	        String pageSizeStr = req.getParameter("rows");
	        Pager4EasyUI<Stu> pager = new Pager4EasyUI<Stu>();
	        if (pageNoStr != null) {
	            pager.setPageNo(Integer.valueOf(pageNoStr));
	            pager.setPageSize(Integer.valueOf(pageSizeStr));
	        }
	        pager = stuService.queryFreezeByPager("Stu", pager);
	        rows = pager.getRows();
	        total = pager.getTotal();
		}else{
			
		}
		return "freezeAll";
	}
	/**
	 * ģ����ѯ
	 */
	public String blurredAllQuery(){
		Emp emp = (Emp)req.getSession().getAttribute("emp");//��ȡ�˵�½id����
		if(stuService.queryPrevillige(emp.getRoleId(), StuAction.class.getName() + ".blurredAllQuery")){
			String pageNoStr = req.getParameter("page");
	        String pageSizeStr = req.getParameter("rows");
	        String value= req.getParameter("value1");
	        String name= req.getParameter("name1");
	        System.out.println("value :" + value +", name: "+ name);
	        Pager4EasyUI<Stu> pager = new Pager4EasyUI<Stu>();
	        if (pageNoStr != null) {
	            pager.setPageNo(Integer.valueOf(pageNoStr));
	            pager.setPageSize(Integer.valueOf(pageSizeStr));
	        }
	        pager = stuService.blurredAllQueryPager("Stu", pager, value, name);
	        rows = pager.getRows();
	        total = pager.getTotal();
		}else{
			
		}
		return "blurredAllQuery";
	}

	/**
	 * ����������ѯ����ѧ��
	 * @return
	 */
	public String termIdQueryAll(){
		Emp emp = (Emp)req.getSession().getAttribute("emp");//��ȡ�˵�½id����
		if(stuService.queryPrevillige(emp.getRoleId(), StuAction.class.getName() + ".termIdQueryAll")){
			String pageNoStr = req.getParameter("page");
	        String pageSizeStr = req.getParameter("rows");
	        int str = Integer.valueOf(req.getParameter("str"));
	        String sql ="";
	        Pager4EasyUI<Stu> pager = new Pager4EasyUI<Stu>();
	        if (pageNoStr != null) {
	            pager.setPageNo(Integer.valueOf(pageNoStr));
	            pager.setPageSize(Integer.valueOf(pageSizeStr));
	        }
	        if(str ==1){
	        	String who = req.getParameter("who");
				String termId = req.getParameter("termId");
	        	sql = "Stu where "+ who +"'"+termId+"' and status = 1  and stuStatus='official'";
	        	pager = stuService.queryByPager(sql, pager,"" );
	        }else if(str == 0){
	        	String who = req.getParameter("who");
				String termId = req.getParameter("termId");
				System.out.println(termId);
	        	sql = "select * from t_stu where ISNULL(" + who + ") and ISNULL("+who+")!='"+ termId +"' and status = 1  and stustatus='official'";
	        	pager = stuService.queryByPager1(sql, pager);
	        	System.out.println(pager);
	        }
	        rows = pager.getRows();
	        total = pager.getTotal();
		}else{
			
		}
		return "termIdQueryAll";
	}

//������֤
	public String login() {
		session = req.getSession();
		System.out.println(EncryptUtil.encrypt(stu.getPwd()));
		stu.setPwd(EncryptUtil.encrypt(stu.getPwd()));
		List<Stu> list = stuService.queryPhonePwd(stu);
		for (Stu e : list) {
			if (e != null) {
					Stu stu = new Stu();
					stu.setStuId(e.getStuId());
					stu.setName(e.getName());
					stu.setPhone(e.getPhone());
					stu.setPwd(e.getPwd());
					session.setAttribute("stu", stu);
					return "stuLogin";
			}
			return "input";
		}
		return "input";
	}
	
	//���ص���
	public String outSession() {
		session = req.getSession();
		if (session.getAttribute("stu") != null) {
			session.removeAttribute("stu");
		}
		return "out";
	}
	
	public String stuMessagePage() {
		Stu stu1 = (Stu) req.getSession().getAttribute("stu");
		Stu stu=stuService.queryById(Stu.class,stu1.getStuId());
		System.out.println("���뵽������Ϣ");
		req.setAttribute("Stu",stu);
		return "messagePage";
	}
	
	public String stuMessage() {
		System.out.println("���뵽������Ϣ�鿴");
		session = req.getSession();
//		String pageNoStr = req.getParameter("page");
//		String pageSizeStr = req.getParameter("rows");
//		Pager4EasyUI<Stu> pager = new Pager4EasyUI<Stu>();
//		if (pageNoStr != null) {
//			pager.setPageNo(Integer.valueOf(pageNoStr));
//			pager.setPageSize(Integer.valueOf(pageSizeStr));
//		}

//		String sql = "select * from t_stu where stuId='"+a+"'";
//		StuDAO stuDAO = null;
//    	List<Stu> list= stuDAO.queryByPager(sql);
//		pager.setTotal(stuService.count("Stu", ""));
//		rows = pager.getRows();
//		System.out.println(rows);
		String pageNoStr = req.getParameter("page");
        String pageSizeStr = req.getParameter("rows");
        Pager4EasyUI<Stu> pager = new Pager4EasyUI<Stu>();
        if (pageNoStr != null) {
            pager.setPageNo(Integer.valueOf(pageNoStr));
            pager.setPageSize(Integer.valueOf(pageSizeStr));
        }
		Stu stu = (Stu) session.getAttribute("stu");
		String a = stu.getStuId();
        pager = stuService.queryByPager("Stu", pager, " where status =1 and stuId='"+a+"' order by startDay desc");
        pager.setTotal(stuService.count("Stu",""));
        rows = pager.getRows();
        total = pager.getTotal();
		return "message";
	}
	public String queryAlls() {
			String pageNoStr = req.getParameter("page");
	        String pageSizeStr = req.getParameter("rows");
	        Pager4EasyUI<Stu> pager = new Pager4EasyUI<Stu>();
	        if (pageNoStr != null) {
	            pager.setPageNo(Integer.valueOf(pageNoStr));
	            pager.setPageSize(Integer.valueOf(pageSizeStr));
	        }
	        pager = stuService.queryByPager("Stu", pager, " where status = 1");
	        pager.setTotal(stuService.count("Stu",""));
	        rows = pager.getRows();
	        total = pager.getTotal();
        return "alls";
	}
}

