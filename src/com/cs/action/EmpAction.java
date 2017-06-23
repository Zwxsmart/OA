package com.cs.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.cs.bean.DRECommom;
import com.cs.bean.Emp;
import com.cs.bean.Notice;
import com.cs.bean.NoticeType;
import com.cs.commom.EncryptUtil;
import com.cs.commom.bean.ControllerResult;
import com.cs.commom.bean.Pager4EasyUI;
import com.cs.service.EmpService;
import com.cs.service.NoticeServiceImpl;
import com.opensymphony.xwork2.ActionSupport;

public class EmpAction extends ActionSupport implements ServletRequestAware {


	private static final long serialVersionUID = -4820241217183786224L;
	
	private List<DRECommom> rows;
	private String email;
	private String pwd;
	private String name;
	private HttpSession session;
	
	private EmpService empService;
	private Emp emp;
	private NoticeType noticeType;
	private DRECommom dre;
	private String depIdJsp;
	private String roleIdJsp;
	
	private long total;
	private String id;
	public ControllerResult result;
	public HttpServletRequest req;
	private NoticeServiceImpl noticeService;
	private Notice notice;
	
	
	public Notice getNotice() {
		return notice;
	}

	public void setNotice(Notice notice) {
		this.notice = notice;
	}

	public HttpSession getSession() {
		return session;
	}

	public void setSession(HttpSession session) {
		this.session = session;
	}


	public void setNoticeService(NoticeServiceImpl noticeService) {
		this.noticeService = noticeService;
	}
	
	public String getDepIdJsp() {
		return depIdJsp;
	}

	public void setDepIdJsp(String depIdJsp) {
		this.depIdJsp = depIdJsp;
	}
	
	public String getRoleIdJsp() {
		return roleIdJsp;
	}

	public void setRoleIdJsp(String roleIdJsp) {
		this.roleIdJsp = roleIdJsp;
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public DRECommom getDre() {
		return dre;
	}

	public void setDre(DRECommom dre) {
		this.dre = dre;
	}

	public ControllerResult getResult() {
		return result;
	}
	
	@Override
	public void setServletRequest(HttpServletRequest req) {
		this.req = req;
	}
	
	public void setId(String id) {
		this.id = id;
	}

	public void setEmpService(EmpService empService) {
		this.empService = empService;
	}

	public Emp getEmp() {
		return emp;
	}

	public void setEmp(Emp emp) {
		this.emp = emp;
	}

	public long getTotal() {
		return total;
	}

	public List<DRECommom> getRows() {
		return rows;
	}

	/**
	 * 跳转页面
	 * @return
	 */
	public String skipPage() {
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		String actionName = EmpAction.class.getName();
		System.out.println(emp.getRoleId());
		if (empService.queryPrevillige(emp.getRoleId(), actionName + ".skipPage")) {
			return "skip";
		}else {
			return "NoPrevillige";
		}
	}

	/**
	 * 招生部主任跳转页面
	 * @return
	 */
	public String admissionsSkipPage() {
	   return "admissionsSkip";
	}
	
	/**
	 * 添加员工
	 */
	public String save() {
		Emp emp1 = (Emp)req.getSession().getAttribute("emp");
		
		String actionName = EmpAction.class.getName();
		String depId = req.getParameter("depId");
		String roleId = req.getParameter("roleId");
		if (empService.queryPrevillige(emp1.getRoleId(), actionName + ".save")) {
			emp.setRoleId(roleId);
			emp.setDepId(depId);
			emp.setPwd(EncryptUtil.encrypt("123456"));
			emp.setStatus(1);
			empService.save(emp);
			result = ControllerResult.getSuccessResult("添加成功, 默认密码为123456");
		}else {
			result = ControllerResult.getFailResult("权限不足");
		}
		return "save";
	}

	/**
	 * 查询所有的员工
	 */
	public String queryAll() {
			String pageNoStr = req.getParameter("page");
			String pageSizeStr = req.getParameter("rows");
			Pager4EasyUI<DRECommom> pager = new Pager4EasyUI<DRECommom>();
			if (pageNoStr != null) {
				pager.setPageNo(Integer.valueOf(pageNoStr));
				pager.setPageSize(Integer.valueOf(pageSizeStr));
			}
			String sql = null;
			Emp emp = (Emp)req.getSession().getAttribute("emp");
			sql = "select e.empid,e.name,e.pwd,e.idcard,e.nation,e.gender,e.fingerno,e.birthday,e.email,e.phone,e.qq,e.wechat,e.address,e.married,e.contactname,e.contactphone,e.college,e.major,e.eduback,e.bankname,e.accountname,e.accountno,e.alipay,e.hireday,e.resignday,e.status,d.depid as id1, d.name as name1,r.roleid as id2,r.name as name2 from t_dept d, t_role r, t_emp e where e.depid = d.depid and e.roleid = r.roleid and e.empid != '"+emp.getEmpId()+"'";
			pager = empService.queryByPager(pager, sql);
			pager.setTotal(empService.count("Emp where empId != '"+emp.getEmpId()+"'",""));
			rows = pager.getRows();
			for (DRECommom d : rows) {
				System.out.println(d);
			}
			total = pager.getTotal();
			return "all";
	}
	
	/**
	 * 修改所有员工
	 */
	public String update() {
		Emp emp1 = (Emp)req.getSession().getAttribute("emp");
		String actionName = EmpAction.class.getName();
		String depId = req.getParameter("depId");
		String roleId = req.getParameter("roleId");
		System.out.println(emp.getPwd() + "pwdpwdpwd");
		if (empService.queryPrevillige(emp1.getRoleId(), actionName + ".update")) {
			emp.setRoleId(roleId);
			emp.setDepId(depId);
			emp.setEmpId(emp.getEmpId());
			empService.update(emp);
			result = ControllerResult.getSuccessResult("修改成功");
		} else {
			result = ControllerResult.getFailResult("权限不足");
		}
		return "update";
	}
	
	/**
	 * 禁用
	 * @return
	 */
	public String empDisable(){ 
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		String actionName = EmpAction.class.getName();
		if (empService.queryPrevillige(emp.getRoleId(), actionName + ".empDisable")) {
			empService.updateStatus("Emp","empId",0, id);
		}else {

		}
		return "disable";
		
	}
	
	/**
	 * 启用
	 * @return
	 */
	public String empActivate(){
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		String actionName = EmpAction.class.getName();
		if (empService.queryPrevillige(emp.getRoleId(), actionName + ".empActivate")) {
			empService.updateStatus("Emp","empId",1, id);
		}else {
			
		}
		return "activate";
	}
	
	/**
	 * 模糊查询
	 */
	public String blurredAllQuery(){
        Emp emp = (Emp)req.getSession().getAttribute("emp");
		String actionName = EmpAction.class.getName();
		if (empService.queryPrevillige(emp.getRoleId(), actionName + ".blurredAllQuery")) {
			String pageNoStr = req.getParameter("page");
	        String pageSizeStr = req.getParameter("rows");
	        String value= req.getParameter("value1");
	        String name= req.getParameter("name1");
	        System.out.println("value :" + value +", name: "+ name);
	        Pager4EasyUI<DRECommom> pager = new Pager4EasyUI<DRECommom>();
	        if (pageNoStr != null) {
	            pager.setPageNo(Integer.valueOf(pageNoStr));
	            pager.setPageSize(Integer.valueOf(pageSizeStr));
	        }
	        pager = empService.queryPageAll("DRECommom", pager, value, name);
	        rows = pager.getRows();
	        total = pager.getTotal();
		}else {

		}
		return "blurredAllQuery";
		
	}
	
	
	// 时间段查询
	public String serachTime(){
		    Emp emp = (Emp)req.getSession().getAttribute("emp");
			String actionName = EmpAction.class.getName();
			if (empService.queryPrevillige(emp.getRoleId(), actionName + ".serachTime")) {
				String pageNoStr = req.getParameter("page");
		        String pageSizeStr = req.getParameter("rows");
				String beginTime=req.getParameter("beginTime");
				String endTime=req.getParameter("endTime");
				System.out.println("开始时间"+beginTime+"结束时间："+endTime);
				Pager4EasyUI<DRECommom> pager = new Pager4EasyUI<DRECommom>();
			    if (pageNoStr != null) {
			    	pager.setPageNo(Integer.valueOf(pageNoStr));
			        pager.setPageSize(Integer.valueOf(pageSizeStr));
			    }
				pager=empService.queryByEmpDay(pager,beginTime,endTime, "DRECommom");
				pager.setTotal(empService.count("Emp", ""));
				rows = pager.getRows();
				total = pager.getTotal();
			}else {

			}
			return "serachtime";
		
	}
	
	/**
	 * 张文星, 根据条件查询所有员工
	 * @return
	 */
	public String termIdQueryAll(){
			Emp emp = (Emp)req.getSession().getAttribute("emp");
			String actionName = EmpAction.class.getName();
			if (empService.queryPrevillige(emp.getRoleId(), actionName + ".termIdQueryAll")) {
				String pageNoStr = req.getParameter("page");
				String pageSizeStr = req.getParameter("rows");
				Pager4EasyUI<DRECommom> pager = new Pager4EasyUI<DRECommom>();
				if (pageNoStr != null) {
					pager.setPageNo(Integer.valueOf(pageNoStr));
					pager.setPageSize(Integer.valueOf(pageSizeStr));
				}
				String sql = null;
				sql = "select e.empid,e.name,e.pwd,e.idcard,e.nation,e.gender,e.fingerno,e.birthday,e.email,e.phone,e.qq,e.wechat,e.address,e.married,e.contactname,e.contactphone,e.college,e.major,e.eduback,e.bankname,e.accountname,e.accountno,e.alipay,e.hireday,e.resignday,e.status,d.depid as id1, d.name as name1,r.roleid as id2,r.name as name2 from t_dept d, t_role r, t_emp e where e.depid = d.depid and e.roleid = r.roleid ";
				pager = empService.queryByPager(pager, sql);
				pager.setTotal(empService.count("Emp",""));
				rows = pager.getRows();
				total = pager.getTotal();
			}else {

			}
			return "termIdQueryAll";
	}
	
	
	/**
	 * 员工登陆页面
	 */
	public String loginPage() {
		System.out.println("ccccccccccccccccccccccccccc");
		return "loginPage";
	}

	/**
	 * 员工登陆操作
	 */
	public String login() {
		session = req.getSession();
		System.out.println(emp.getEmail());
		System.out.println(EncryptUtil.encrypt(emp.getPwd()));
		emp.setPwd(EncryptUtil.encrypt(emp.getPwd()));
		List<Emp> list = empService.queryEmailPwd(emp);
		notice = noticeService.queryNewNotice();
		if(notice != null){
			notice.setEmpName(notice.getEmps().getName());
			session.setAttribute("notice", notice);
		}
		
		for (Emp e : list) {
			if (e != null) {
				if (e.getStatus() == 1) {
					System.out.println(e.getRoleId());
					Emp emp = new Emp();
					emp.setPwd(e.getPwd());
					emp.setEmpId(e.getEmpId());
					emp.setName(e.getName());
					emp.setDepId(e.getDepId());
					emp.setRoleId(e.getRoleId());
					emp.setRoleName(e.getRole().getName());
					emp.setDepName(e.getDept().getName());
					emp.setPhone(e.getPhone());
					emp.setName(e.getName());
					session.setAttribute("emp", emp);
					return "adminLogin";
				} else {
					return "input";
				}  
			} else {
				return "input";
			}
		}
		return "input";
	}
	
	/**
	 * 安全退出session
	 * @return
	 */
	public String outSession() {
		session = req.getSession();
		if (session.getAttribute("emp") != null) {
			session.removeAttribute("emp");
		}
		return "out";
	}
	
	/**
	 * 修改密码
	 */
	public String updatePwd() {
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		String pwd = req.getParameter("pwd");
		String cPwd = req.getParameter("cPwd");
		pwd = EncryptUtil.encrypt(pwd);
		System.out.println(pwd + "pwd");
		System.out.println(cPwd + "cPwd");
		System.out.println(emp.getPwd() + "aaaaaaaaaaaaa");
		if (pwd != null && !pwd.equals("") && cPwd != null && !cPwd.equals("")) {
			if (pwd.equals(emp.getPwd())) {
				System.out.println("进去修改密码方法");
				empService.updatePwd("t_emp", "empid", emp.getEmpId(), EncryptUtil.encrypt(cPwd));
				session = req.getSession();
				if (session.getAttribute("emp") != null) {
					session.removeAttribute("emp");
				}


				result = ControllerResult.getFailResult("修改成功");
			
				
			} else {
				result = ControllerResult.getFailResult("旧密码错误");
			}
		}
		return "updatePwd";
	}
	
	/**
	 * 跳转个人信息页面
	 */
	public String empMessagePage() {
		System.out.println("进入到个人信息");
		Emp emp1 = (Emp)req.getSession().getAttribute("emp");
		Emp emp=empService.queryById(Emp.class, emp1.getEmpId());
		req.setAttribute("Emp",emp);
		return "messagePage";
	}
	
	/**
	 * 根据id查询
	 */
	public String empQueryByid() {
		System.out.println("进入到查询信息");
		String id=req.getParameter("empId");
		System.out.println(id);
		emp=empService.queryById(Emp.class, id);
		return "empqueryByid";
	}
	
	/**
	 * 根据id进行更新
	 */
	public String empUpdateByid(){
		System.out.println("进入到更新个人信息");
		String empId=req.getParameter("empId");
		String email=req.getParameter("email");
		String name=req.getParameter("name");
		String gender=req.getParameter("gender");
		String phone=req.getParameter("phone");
		String address=req.getParameter("address");
		System.out.println("前台传送过来的数据为："+empId+","+email);
		Emp e=new Emp();
		e.setEmpId(empId);
		e.setEmail(email);
		e.setName(name);
		e.setGender(gender);
		e.setAddress(address);
		e.setPhone(phone);
		empService.updateByid("Emp",e);
		result=ControllerResult.getSuccessResult("更新成功");	
		return "empupdatebyid";
	}
	
	/**
	 * 个人信息
	 */
	public String empMessage() {
		session = req.getSession();
		String pageNoStr = req.getParameter("page");
		String pageSizeStr = req.getParameter("rows");
		Pager4EasyUI<DRECommom> pager = new Pager4EasyUI<DRECommom>();
		if (pageNoStr != null) {
			pager.setPageNo(Integer.valueOf(pageNoStr));
			pager.setPageSize(Integer.valueOf(pageSizeStr));
		}
		Emp emp = (Emp) session.getAttribute("emp");
		String a = emp.getEmpId();
		pager = empService.queryByPager(pager, "select e.empid,e.name,e.pwd,e.idcard,e.nation,e.gender,e.fingerno,e.birthday,e.email,e.phone,e.qq,e.wechat,e.address,e.married,e.contactname,e.contactphone,e.college,e.major,e.eduback,e.bankname,e.accountname,e.accountno,e.alipay,e.hireday,e.resignday,e.status,d.depid as id1, d.name as name1,r.roleid as id2,r.name as name2 from t_dept d, t_role r, t_emp e where e.depid = d.depid and e.roleid = r.roleid and e.empid = '"+a+"'");
		pager.setTotal(empService.count("Emp", ""));
		rows = pager.getRows();
		return "message";
		
	}
	
	
	
	/**
	 * 个人工作经验
	 */
	/**
	 * 根据角色id去查找员工
	 */
	public String queryRoleAll() {
			String pageNoStr = req.getParameter("page");
			String pageSizeStr = req.getParameter("rows");
			String roleId = req.getParameter("id");
			System.out.println(roleId + "aaaaaaaaaaaaa");
			Pager4EasyUI<DRECommom> pager = new Pager4EasyUI<DRECommom>();
			if (pageNoStr != null) {
				pager.setPageNo(Integer.valueOf(pageNoStr));
				pager.setPageSize(Integer.valueOf(pageSizeStr));
			}
			pager = empService.queryByPager(pager, "select e.empid,e.name,e.pwd,e.idcard,e.nation,e.gender,e.fingerno,e.birthday,e.email,e.phone,e.qq,e.wechat,e.address,e.married,e.contactname,e.contactphone,e.college,e.major,e.eduback,e.bankname,e.accountname,e.accountno,e.alipay,e.hireday,e.resignday,e.status,d.depid as id1, d.name as name1,r.roleid as id2,r.name as name2 from t_dept d, t_role r, t_emp e where e.depid = d.depid and e.roleid = r.roleid and r.roleid = '"+roleId+"'");
			pager.setTotal(empService.count("Emp where roleid = '"+roleId+"'",""));
			rows = pager.getRows();
			for (DRECommom d : rows) {
				System.out.println(d);
			}
			total = pager.getTotal();
			return "queryRoleAll";
	}
	
	/**
	 * 根据部门查看员工
	 */
	public String queryDeptAll() {
			String pageNoStr = req.getParameter("page");
			String pageSizeStr = req.getParameter("rows");
			String deptId = req.getParameter("id");
			System.out.println(deptId + "aaaaaaaaaaaaa");
			Pager4EasyUI<DRECommom> pager = new Pager4EasyUI<DRECommom>();
			if (pageNoStr != null) {
				pager.setPageNo(Integer.valueOf(pageNoStr));
				pager.setPageSize(Integer.valueOf(pageSizeStr));
			}
			pager = empService.queryByPager(pager, "select e.empid,e.name,e.pwd,e.idcard,e.nation,e.gender,e.fingerno,e.birthday,e.email,e.phone,e.qq,e.wechat,e.address,e.married,e.contactname,e.contactphone,e.college,e.major,e.eduback,e.bankname,e.accountname,e.accountno,e.alipay,e.hireday,e.resignday,e.status,d.depid as id1, d.name as name1,r.roleid as id2,r.name as name2 from t_dept d, t_role r, t_emp e where e.depid = d.depid and e.roleid = r.roleid and d.depid = '"+deptId+"'");
			pager.setTotal(empService.count("Emp where depid = '"+deptId+"'",""));
			rows = pager.getRows();
			for (DRECommom d : rows) {
				System.out.println(d);
			}
			total = pager.getTotal();
			return "queryDeptAll";
	}
	
}
