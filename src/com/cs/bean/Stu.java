package com.cs.bean;

import java.util.Date;
import java.util.Set;

import org.apache.struts2.json.annotations.JSON;

/**
 * ѧ��bean��, ѧ���������
 * @author ������
 *
 */
public class Stu {
	private String stuId; //ѧ�����
	private String stuNo; //ѧ��ѧ��
	private String name; //����
	private String pwd; //����
	private String idCard; //���֤����
	private String phone; // �ֻ�����
	private String qq; //QQ
	private String weChat; //΢��
	private String school; //��ҵѧУ
	private int age; //����
	private Date birthday; //����
	private String gender; // �Ա�
	private String address; //��ͥסַ
	private String nation; //����
	private String resIdence; //��������
	private String gradeId; //�༶���
	private String roomId; //������
	private String parentName; //�ҳ�����
	private String parentPhone; //�ҳ��绰
	private Date startDay; //��ѧʱ��
	private	String empId; //������ʦ
	private String des; //����
	private int status; //״̬
	private String stuStatus; //ѧ��״̬
	private String role; // ��ɲ���ɫ
	
	private Emp emp; // ���ѧ����Ӧһ��������ʦ
	private Grade grade;//һ��ѧ����Ӧһ���༶
	private Set<Score> scores;//һ��ѧ����Ӧ����ɼ�
	private Room room;//һ��ѧ����Ӧһ������
	private Room room1;
	private Set<StuLeave> stuLeaves;//һ��ѧ����Ӧ�����ټ�¼
	private Set<StuFeedback> stuFeedback;//һ��ѧ����Ӧ���������¼
	private Set<Job> jobs;//һ��ѧ����Ӧ�����ҵ��Ϣ
	private Set<Talk> talks;//һ��ѧ����Ӧ����̸�ļ�¼
	private Set<StuChecking> stuChecking; //һ��ѧ����Ӧ�������ڼ�¼
	private Set<Income> incomes;//һ��ѧ����Ӧ����ɷѼ�¼
	
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
