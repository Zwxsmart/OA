package com.cs.bean;

import java.util.Date;
import java.util.Set;

import org.apache.struts2.json.annotations.JSON;

/**
 * 学生bean类, 学生表的属性
 * @author 张文星
 *
 */
public class Stu {
	private String stuId; //学生编号
	private String stuNo; //学号学号
	private String name; //名字
	private String pwd; //密码
	private String idCard; //身份证号码
	private String phone; // 手机号码
	private String qq; //QQ
	private String weChat; //微信
	private String school; //毕业学校
	private int age; //年龄
	private Date birthday; //生日
	private String gender; // 性别
	private String address; //家庭住址
	private String nation; //籍贯
	private String resIdence; //户口性质
	private String gradeId; //班级编号
	private String roomId; //宿舍编号
	private String parentName; //家长姓名
	private String parentPhone; //家长电话
	private Date startDay; //入学时间
	private	String empId; //招生老师
	private String des; //介绍
	private int status; //状态
	private String stuStatus; //学生状态
	private String role; // 班干部角色
	
	private Emp emp; // 多个学生对应一个招生老师
	private Grade grade;//一个学生对应一个班级
	private Set<Score> scores;//一个学生对应多个成绩
	private Room room;//一个学生对应一个宿舍
	private Room room1;
	private Set<StuLeave> stuLeaves;//一个学生对应多个请假记录
	private Set<StuFeedback> stuFeedback;//一个学生对应多个反馈记录
	private Set<Job> jobs;//一个学生对应多个就业信息
	private Set<Talk> talks;//一个学生对应多条谈心记录
	private Set<StuChecking> stuChecking; //一个学生对应多条考勤记录
	private Set<Income> incomes;//一个学生对应多个缴费记录
	
	public Set<Income> getIncomes() {
		return incomes;
	}
	public void setIncomes(Set<Income> incomes) {
		this.incomes = incomes;
	}
	
	public String getStuId() {
		return stuId;
	}
	public void setStuId(String stuId) {
		this.stuId = stuId;
	}
	public String getStuNo() {
		return stuNo;
	}
	public void setStuNo(String stuNo) {
		this.stuNo = stuNo;
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
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
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
	public String getSchool() {
		return school;
	}
	public void setSchool(String school) {
		this.school = school;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getNation() {
		return nation;
	}
	public void setNation(String nation) {
		this.nation = nation;
	}
	public String getResIdence() {
		return resIdence;
	}
	public void setResIdence(String resIdence) {
		this.resIdence = resIdence;
	}
	public String getGradeId() {
		return gradeId;
	}
	public void setGradeId(String gradeId) {
		this.gradeId = gradeId;
	}
	public String getRoomId() {
		return roomId;
	}
	public void setRoomId(String roomId) {
		this.roomId = roomId;
	}
	public String getParentName() {
		return parentName;
	}
	public void setParentName(String parentName) {
		this.parentName = parentName;
	}
	public String getParentPhone() {
		return parentPhone;
	}
	public void setParentPhone(String parentPhone) {
		this.parentPhone = parentPhone;
	}
	public Date getStartDay() {
		return startDay;
	}
	public void setStartDay(Date startDay) {
		this.startDay = startDay;
	}
	public String getEmpId() {
		return empId;
	}
	public void setEmpId(String empId) {
		this.empId = empId;
	}
	public String getDes() {
		return des;
	}
	public void setDes(String des) {
		this.des = des;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getStuStatus() {
		return stuStatus;
	}
	public void setStuStatus(String stuStatus) {
		this.stuStatus = stuStatus;
	}
	
	public Grade getGrade() {
		return grade;
	}

	public void setGrade(Grade grade) {
		this.grade = grade;
	}
	@JSON(serialize=false)
	public Set<Score> getScores() {
		return scores;
	}
	public void setScores(Set<Score> scores) {
		this.scores = scores;
	}
	public Room getRoom() {
		return room;
	}
	public void setRoom(Room room) {
		this.room = room;
	}
	public Room getRoom1() {
		return room1;
	}
	public void setRoom1(Room room1) {
		this.room1 = room1;
	}
	@JSON(serialize=false)
	public Set<StuLeave> getStuLeaves() {
		return stuLeaves;
	}
	public void setStuLeaves(Set<StuLeave> stuLeaves) {
		this.stuLeaves = stuLeaves;
	}
	
	@JSON(serialize=false)
	public Set<StuFeedback> getStuFeedback() {
		return stuFeedback;
	}
	public void setStuFeedback(Set<StuFeedback> stuFeedback) {
		this.stuFeedback = stuFeedback;
	}
	
	@JSON(serialize=false)
	public Set<Job> getJobs() {
		return jobs;
	}
	public void setJobs(Set<Job> jobs) {
		this.jobs = jobs;
	}
	
	@JSON(serialize=false)
	public Set<Talk> getTalks() {
		return talks;
	}
	public void setTalks(Set<Talk> talks) {
		this.talks = talks;
	}
	@JSON(serialize=false)
	public Set<StuChecking> getStuChecking() {
		return stuChecking;
	}
	public void setStuChecking(Set<StuChecking> stuChecking) {
		this.stuChecking = stuChecking;
	}
	public Emp getEmp() {
		return emp;
	}
	public void setEmp(Emp emp) {
		this.emp = emp;
	}
	

}
