package com.cs.bean;

import java.util.Date;

/**
 * ѧ����ҵ��
 * @author ������
 *
 */
public class Job {
	private String jobId;//�������
	private String stuId;//ѧ�����
	private String company;//��˾����
	private String jobTitle;//ְλ
	private double salary;//��н
	private String welfare;//��������
	private String address;//��˾��ַ
	private String comPhone;//��˾��ϵ��ʽ
	private Date hireDay;//��ְʱ��
	private int status;// ״̬��Ĭ��Ϊ����״̬
	private Stu stu;//һ����ҵ��Ϣ��Ӧһ��ѧ��
	public String getJobId() {
		return jobId;
	}
	public void setJobId(String jobId) {
		this.jobId = jobId;
	}
	public String getStuId() {
		return stuId;
	}
	public void setStuId(String stuId) {
		this.stuId = stuId;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getJobTitle() {
		return jobTitle;
	}
	public void setJobTitle(String jobTitle) {
		this.jobTitle = jobTitle;
	}
	public double getSalary() {
		return salary;
	}
	public void setSalary(double salary) {
		this.salary = salary;
	}
	public String getWelfare() {
		return welfare;
	}
	public void setWelfare(String welfare) {
		this.welfare = welfare;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getComPhone() {
		return comPhone;
	}
	public void setComPhone(String comPhone) {
		this.comPhone = comPhone;
	}
	public Date getHireDay() {
		return hireDay;
	}
	public void setHireDay(Date hireDay) {
		this.hireDay = hireDay;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "Job [jobId=" + jobId + ", stuId=" + stuId + ", company=" + company + ", jobTitle=" + jobTitle
				+ ", salary=" + salary + ", welfare=" + welfare + ", address=" + address + ", comPhone=" + comPhone
				+ ", hireDay=" + hireDay + ", status=" + status + "]";
	}
	public Stu getStu() {
		return stu;
	}
	public void setStu(Stu stu) {
		this.stu = stu;
	}
	
}
