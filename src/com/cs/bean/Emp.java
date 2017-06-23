package com.cs.bean;

import java.util.Date;
import java.util.Set;

import org.apache.struts2.json.annotations.JSON;


public class Emp {
	private String empId; //员工编号
	private String depId;
	private String roleId;
	private String name; //姓名
	private String pwd; //密码
	private String idCard; //身份证号
	private String nation; //籍贯
	private String gender; //性别
	private String fingerNo; //指纹编号
	private Date birthDay; //生日
	private String email; //邮箱
	private String phone; //手机号码
	private String qq; //QQ
	private String weChat; //微信号
	private String address; //家庭地址
	private String married; //是否结婚
	private String contactName; //联系人姓名
	private String contactPhone; //联系人手机号码
	private String college; //毕业学校
	private String major; //专业
	private String eduback; //学历
	private String bankName; //开户行名称
	private String accountName; //银行卡姓名
	private String accountNo; //银行卡账号
	private String alipay; //支付宝账号
	private Date hireDay; //入职时间
	private Date resignDay; //离职时间
	private int status; //状态
	private String roleName;
	private String depName;
	
	
	
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public String getDepName() {
		return depName;
	}
	public void setDepName(String depName) {
		this.depName = depName;
	}
	
	private Set<Stu> stus;//多个学生对应一个招生老师
	private Set<Talk> talks;//一个员工对应多条谈心记录
	private Set<Grade> grades ;
	private Dept dept;
	private Role role;
	
	private Set<GoodsApp> goodsApps; // 物品申购
	private Set<GoodsUse> goodsUses; // 物品领用
	private Set<Edu> edus;	// 员工教育背景
	private Set<Exp> exps;	// 员工工作经历
	private Set<Report> reports;	// 员工工作日志
	private Set<EmpLeave> empleaves;	// 员工请假
	private Set<EmpFeedBack> efbs;	// 员工反馈
	
	private Set<Duty> dutys;	// 员工值班
	private Set<Notice> noticess;//一个员工对应多条公告栏
	
	private Set<Pay> pay;//员工收入
	private Set<Income> income;//员工支出
	private Set<Salary> salary;//工资
	private Set<SalaryInfo> salaryInfo;//基本工资
	
	private Set<Progress> ps;
	
	public Set<Progress> getPs() {
		return ps;
	}
	public void setPs(Set<Progress> ps) {
		this.ps = ps;
	}
	@JSON(serialize=false)
	public Set<EmpFeedBack> getEfbs() {
		return efbs;
	}
	@JSON(serialize=false)
	public void setEfbs(Set<EmpFeedBack> efbs) {
		this.efbs = efbs;
	}
	@JSON(serialize=false)
	public Set<EmpLeave> getEmpleaves() {
		return empleaves;
	}
	@JSON(serialize=false)
	public void setEmpleaves(Set<EmpLeave> empleaves) {
		this.empleaves = empleaves;
	}
	@JSON(serialize=false)
	public Set<SalaryInfo> getSalaryInfo() {
		return salaryInfo;
	}
	@JSON(serialize=false)
	public void setSalaryInfo(Set<SalaryInfo> salaryInfo) {
		this.salaryInfo = salaryInfo;
	}
	@JSON(serialize=false)
	public Set<Salary> getSalary() {
		return salary;
	}
	@JSON(serialize=false)
	public void setSalary(Set<Salary> salary) {
		this.salary = salary;
	}
	@JSON(serialize=false)
	public Set<Income> getIncome() {
		return income;
	}
	@JSON(serialize=false)
	public void setIncome(Set<Income> income) {
		this.income = income;
	}
	@JSON(serialize=false)
	public Set<Pay> getPay() {
		return pay;
	}
	@JSON(serialize=false)
	public void setPay(Set<Pay> pay) {
		this.pay = pay;
	}
	@JSON(serialize=false)
	public Set<Notice> getNoticess() {
		return noticess;
	}
	@JSON(serialize=false)
	public void setNoticess(Set<Notice> noticess) {
		this.noticess = noticess;
	}
	private Set<Check> checks;	// 员工巡查
	@JSON(serialize=false)
	public Set<Check> getChecks() {
		return checks;
	}
	@JSON(serialize=false)
	public void setChecks(Set<Check> checks) {
		this.checks = checks;
	}
	@JSON(serialize=false)
	public Set<Duty> getDutys() {
		return dutys;
	}
	@JSON(serialize=false)
	public void setDutys(Set<Duty> dutys) {
		this.dutys = dutys;
	}
	@JSON(serialize=false)
	public Set<GoodsApp> getGoodsApps() {
		return goodsApps;
	}
	@JSON(serialize=false)
	public void setGoodsApps(Set<GoodsApp> goodsApps) {
		this.goodsApps = goodsApps;
	}
	
	@JSON(serialize=false)
	public Set<GoodsUse> getGoodsUses() {
		return goodsUses;
	}
	@JSON(serialize=false)
	public void setGoodsUses(Set<GoodsUse> goodsUses) {
		this.goodsUses = goodsUses;
	}
	
	@JSON(serialize=false)
	public Set<Edu> getEdus() {
		return edus;
	}
	@JSON(serialize=false)
	public void setEdus(Set<Edu> edus) {
		this.edus = edus;
	}
	
	@JSON(serialize=false)
	public Set<Exp> getExps() {
		return exps;
	}
	@JSON(serialize=false)
	public void setExps(Set<Exp> exps) {
		this.exps = exps;
	}
	
	@JSON(serialize=false)
	public Set<Report> getReports() {
		return reports;
	}
	@JSON(serialize=false)
	public void setReports(Set<Report> reports) {
		this.reports = reports;
	}
	public String getDepId() {
		return depId;
	}
	public void setDepId(String depId) {
		this.depId = depId;
	}
	public String getRoleId() {
		return roleId;
	}
	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}
	public Dept getDept() {
		return dept;
	}
	public void setDept(Dept dept) {
		this.dept = dept;
	}
	public Role getRole() {
		return role;
	}
	public void setRole(Role role) {
		this.role = role;
	}
	public String getEmpId() {
		return empId;
	}
	public void setEmpId(String empId) {
		this.empId = empId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getIdCard() {
		return idCard;
	}
	public void setIdCard(String idCard) {
		this.idCard = idCard;
	}
	public String getNation() {
		return nation;
	}
	public void setNation(String nation) {
		this.nation = nation;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getFingerNo() {
		return fingerNo;
	}
	public void setFingerNo(String fingerNo) {
		this.fingerNo = fingerNo;
	}
	public Date getBirthDay() {
		return birthDay;
	}
	public void setBirthDay(Date birthDay) {
		this.birthDay = birthDay;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getQq() {
		return qq;
	}
	public void setQq(String qq) {
		this.qq = qq;
	}
	public String getWeChat() {
		return weChat;
	}
	public void setWeChat(String weChat) {
		this.weChat = weChat;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getMarried() {
		return married;
	}
	public void setMarried(String married) {
		this.married = married;
	}
	public String getContactName() {
		return contactName;
	}
	public void setContactName(String contactName) {
		this.contactName = contactName;
	}
	public String getContactPhone() {
		return contactPhone;
	}
	public void setContactPhone(String contactPhone) {
		this.contactPhone = contactPhone;
	}
	public String getCollege() {
		return college;
	}
	public void setCollege(String college) {
		this.college = college;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public String getEduback() {
		return eduback;
	}
	public void setEduback(String eduback) {
		this.eduback = eduback;
	}
	public String getBankName() {
		return bankName;
	}
	public void setBankName(String bankName) {
		this.bankName = bankName;
	}
	public String getAccountName() {
		return accountName;
	}
	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}
	public String getAccountNo() {
		return accountNo;
	}
	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
	}
	public String getAlipay() {
		return alipay;
	}
	public void setAlipay(String alipay) {
		this.alipay = alipay;
	}
	public Date getHireDay() {
		return hireDay;
	}
	public void setHireDay(Date hireDay) {
		this.hireDay = hireDay;
	}
	public Date getResignDay() {
		return resignDay;
	}
	public void setResignDay(Date resignDay) {
		this.resignDay = resignDay;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public Set<Grade> getGrades() {
		return grades;
	}
	public void setGrades(Set<Grade> grades) {
		this.grades = grades;
	}
	public Set<Stu> getStus() {
		return stus;
	}
	public void setStus(Set<Stu> stus) {
		this.stus = stus;
	}
	
	public Set<Talk> getTalks() {
		return talks;
	}
	public void setTalks(Set<Talk> talks) {
		this.talks = talks;
	}

}
