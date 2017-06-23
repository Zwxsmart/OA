package com.cs.bean;

import java.util.Date;
/**
 * ������bean
 * @author Administrator
 *
 */
public class Notice {
	private String noticeId;	//������
	private String name;	//�������
	private String des;	//��������
	private String typeId;	//��������
	private Date noticeDay;//����ʱ��
	private String empId;//������
	private int status;
	private String empName;
	
	private NoticeType noticeType;//һ����������Ӧһ������
	private Emp emps;//һ���˶�Ӧ��������
	
	
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public Emp getEmps() {
		return emps;
	}
	public void setEmps(Emp emps) {
		this.emps = emps;
	}
	public String getNoticeId() {
		return noticeId;
	}
	public void setNoticeId(String noticeId) {
		this.noticeId = noticeId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDes() {
		return des;
	}
	public void setDes(String des) {
		this.des = des;
	}
	public String getTypeId() {
		return typeId;
	}
	public void setTypeId(String typeId) {
		this.typeId = typeId;
	}
	public Date getNoticeDay() {
		return noticeDay;
	}
	public void setNoticeDay(Date noticeDay) {
		this.noticeDay = noticeDay;
	}
	public String getEmpId() {
		return empId;
	}
	public void setEmpId(String empId) {
		this.empId = empId;
	}
	public NoticeType getNoticeType() {
		return noticeType;
	}
	public void setNoticeType(NoticeType noticeType) {
		this.noticeType = noticeType;
	}
	@Override
	public String toString() {
		return "Notice [noticeId=" + noticeId + ", name=" + name + ", des=" + des + ", noticeDay=" + noticeDay
				+ ", status=" + status + "]";
	}
	public String getEmpName() {
		return empName;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
	}

}
