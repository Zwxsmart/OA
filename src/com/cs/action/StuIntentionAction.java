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
 * 市场管理意向学生Action
 * 
 * @author 温鑫
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
	 * 主页跳转到user页面
	 * 
	 * @return
	 */
	public String skipPage() {
		Emp emp = (Emp)(req).getSession().getAttribute("emp");//获取此登陆id对象
		if(stuIntentionService.queryPrevillige(emp.getRoleId(), StuIntentionAction.class.getName() + ".skipPage")){
			return "skip";
		}else{
			return "NoPrevillige";
		}
	}

	/**
	 * 添加意向学生
	 */
	public String save() {
		 Emp emp = (Emp)(req).getSession().getAttribute("emp");//获取此登陆id对象
		if(stuIntentionService.queryPrevillige(emp.getRoleId(), StuIntentionAction.class.getName() + ".save")){
			stu.setEmpId(emp.getEmpId());
			stu.setStuStatus("intention");
			stu.setStatus(1);
			stuIntentionService.save(stu);
			result = ControllerResult.getSuccessResult("添加成功");
			
		}else{
			result = ControllerResult.getFailResult("权限不足");
		}
		return "save";
	}


	/**
	 * 分页查询所有意向学生
	 */
	public String queryAssign() {
			Emp emp = (Emp)(req).getSession().getAttribute("emp");//获取此登陆id对象
			String pageNoStr = req.getParameter("page");
		    String pageSizeStr = req.getParameter("rows");
		    String sql = "";
		    Pager4EasyUI<Stu> pager = new Pager4EasyUI<Stu>();
		    if (pageNoStr != null) {
		        pager.setPageNo(Integer.valueOf(pageNoStr));
		        pager.setPageSize(Integer.valueOf(pageSizeStr));
		    }
		    if (emp.getRoleName().equals("辅导老师") || emp.getRoleName().equals("教务部主任") || emp.getRoleName().equals("行政部主任") || emp.getRoleName().equals("班主任") || emp.getRoleName().equals("任课老师")
					 || emp.getRoleName().equals("招生老师") || emp.getRoleName().equals("后勤部主任")
					|| emp.getRoleName().equals("财务部主任")) {
	      	// 状态等于通过 , 学生状态为意向, empId为此登陆id的所有意向学生, 根据时间倒序
				sql = " where status =1 and stuStatus='intention' and empId = '"+ emp.getEmpId()+ "' order by startDay desc";
			} else if (emp.getRoleName().equals("老板") || emp.getRoleName().equals("招生部主任")) {
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
	 * 根据id查询学生
	 */
	public String queryById(String id) {
		Emp emp = (Emp)(req).getSession().getAttribute("emp");//获取此登陆id对象
		if(stuIntentionService.queryPrevillige(emp.getRoleId(), StuIntentionAction.class.getName() + ".queryById")){
			Stu stu = stuIntentionService.queryById(User.class, id);
			System.out.println(stu);
			
		}else{
			result = ControllerResult.getFailResult("权限不足");
		}
		return "id";
	}

	/**
	 * 修改意向学生
	 */
	public String update() {
		Emp emp = (Emp)(req).getSession().getAttribute("emp");//获取此登陆id对象
		if(stuIntentionService.queryPrevillige(emp.getRoleId(), StuIntentionAction.class.getName() + ".update")){
			stu.setEmpId(emp.getEmpId());
			stu.setStuStatus("intention");
			stu.setStatus(1);
			stuIntentionService.update(stu);
			result = ControllerResult.getSuccessResult("修改成功");
		}else{
			result = ControllerResult.getFailResult("权限不足");
		}
		return "update";
	}

	// 查询所有禁用意向学生
	public String queryStu() {
		
		Emp emp = (Emp)(req).getSession().getAttribute("emp");//获取此登陆id对象
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
			result = ControllerResult.getFailResult("权限不足");
		}
		return "freezeAll";
	}

	// 查询所有启用意向学生
	public String queryStu1() {
		Emp emp = (Emp)(req).getSession().getAttribute("emp");//获取此登陆id对象
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
			result = ControllerResult.getFailResult("权限不足");
		}
		return "freezeAll1";
	}

	// 模糊查询
	public String blurredAllQuery() {
		Emp emp = (Emp)(req).getSession().getAttribute("emp");//获取此登陆id对象
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
			result = ControllerResult.getFailResult("权限不足");
		}
		return "blurredAll";
	}

	/**
	 * 禁用
	 * 
	 * @return
	 */
	public String roleDisable() {
		Emp emp = (Emp)(req).getSession().getAttribute("emp");//获取此登陆id对象
		if(stuIntentionService.queryPrevillige(emp.getRoleId(), StuIntentionAction.class.getName() + ".roleDisable")){
			stuIntentionService.updateStatus("Stu", "stuId", 0, id);
			
		}else{
			result = ControllerResult.getFailResult("权限不足");
		}
		return "disable";
	}

	/**
	 * 启用
	 * 
	 * @return
	 */
	public String roleActivate() {
		Emp emp = (Emp)(req).getSession().getAttribute("emp");//获取此登陆id对象
		if(stuIntentionService.queryPrevillige(emp.getRoleId(), StuIntentionAction.class.getName() + ".roleActivate")){
			stuIntentionService.updateStatus("Stu", "stuId", 1, id);
			
		}else{
			result = ControllerResult.getFailResult("权限不足");
		}
		return "activate";
	}

	/**
	 * 转为预定学生
	 */
	public String changeIntention() {
		Emp emp = (Emp)(req).getSession().getAttribute("emp");//获取此登陆id对象
		if(stuIntentionService.queryPrevillige(emp.getRoleId(), StuIntentionAction.class.getName() + ".changeIntention")){
			 String id = req.getParameter("id");
			 String money = req.getParameter("money");
			 if (money != null) {
				 d = Double.valueOf(money);
			 }
			Income income = new Income();
			 income.setIncomeTypeId("ab5747b1e6e647cdbdb91fec062ca571");//意向转预定id
			 income.setStuId(id);
			 income.setEmpId(emp.getEmpId());
			 income.setIncomeDay(Constants.CURRENT_TIME);
			 income.setDes("缴费");
			 income.setIncome(d);
			 incomeService.save(income);
			stuIntentionService.updateIntention("Stu", "predetermine", id);
			result = ControllerResult.getSuccessResult("转预定成功");
			
		}else{
			result = ControllerResult.getFailResult("权限不足");
		}
		return "change";
	}
	
	/**
	 * 转为正式学生
	 */
	public String changePredetermine(){
		Emp emp = (Emp)(req).getSession().getAttribute("emp");//获取此登陆id对象
		if(stuIntentionService.queryPrevillige(emp.getRoleId(), StuIntentionAction.class.getName() + ".changePredetermine")){
			String id = req.getParameter("id");
			String money = req.getParameter("money");
			if (money != null) {
				d = Double.valueOf(money);
			}
			Income income = new Income();
			income.setIncomeTypeId("4028dae9597ddbd301597defbd5c0001");//意向转正式类型id
			income.setStuId(id);
			income.setEmpId(emp.getEmpId());
			income.setIncomeDay(Constants.CURRENT_TIME);
			income.setDes("缴费");
			income.setIncome(d);
			incomeService.save(income);
			stuIntentionService.updatePredetermine("Stu","official", id);
			result = ControllerResult.getSuccessResult("转正式成功");
			
		}else{
			result = ControllerResult.getFailResult("权限不足");
		}
		return "changePredetermine";
	}
}