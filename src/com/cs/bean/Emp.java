package com.cs.bean;

import java.util.Date;
import java.util.Set;

import org.apache.struts2.json.annotations.JSON;


public class Emp {
	private String empId; //Ա�����
	private String depId;
	private String roleId;
	private String name; //����
	private String pwd; //����
	private String idCard; //���֤��
	private String nation; //����
	private String gender; //�Ա�
	private String fingerNo; //ָ�Ʊ��
	private Date birthDay; //����
	private String email; //����
	private String phone; //�ֻ�����
	private String qq; //QQ
	private String weChat; //΢�ź�
	private String address; //��ͥ��ַ
	private String married; //�Ƿ���
	private String contactName; //��ϵ������
	private String contactPhone; //��ϵ���ֻ�����
	private String college; //��ҵѧУ
	private String major; //רҵ
	private String eduback; //ѧ��
	private String bankName; //����������
	private String accountName; //���п�����
	private String accountNo; //���п��˺�
	private String alipay; //֧�����˺�
	private Date hireDay; //��ְʱ��
	private Date resignDay; //��ְʱ��
	private int status; //״̬
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
	
	private Set<Stu> stus;//���ѧ����Ӧһ��������ʦ
	private Set<Talk> talks;//һ��Ա����Ӧ����̸�ļ�¼
	private Set<Grade> grades ;
	private Dept dept;
	private Role role;
	
	private Set<GoodsApp> goodsApps; // ��Ʒ�깺
	private Set<GoodsUse> goodsUses; // ��Ʒ����
	private Set<Edu> edus;	// Ա����������
	private Set<Exp> exps;	// Ա����������
	private Set<Report> reports;	// Ա��������־
	private Set<EmpLeave> empleaves;	// Ա�����
	private Set<EmpFeedBack> efbs;	// Ա������
	
	private Set<Duty> dutys;	// Ա��ֵ��
	private Set<Notice> noticess;//һ��Ա����Ӧ����������
	
	private Set<Pay> pay;//Ա������
	private Set<Income> income;//Ա��֧��
	private Set<Salary> salary;//����
	private Set<SalaryInfo> salaryInfo;//��������
	
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
	private Set<Check> checks;	// Ա��Ѳ��
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
