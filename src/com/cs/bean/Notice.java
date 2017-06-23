package com.cs.bean;

import java.util.Date;
/**
 * 公告栏bean
 * @author Administrator
 *
 */
public class Notice {
	private String noticeId;	//公告编号
	private String name;	//公告辩题
	private String des;	//公告详情
	private String typeId;	//公告类型
	private Date noticeDay;//发布时间
	private String empId;//发布人
	private int status;
	private String empName;
	
	private NoticeType noticeType;//一个公告栏对应一个类型
	private Emp emps;//一个人对应多条公告
	
	
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
