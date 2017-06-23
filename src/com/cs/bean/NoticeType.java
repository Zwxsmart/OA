package com.cs.bean;

import java.util.Set;

public class NoticeType {
	private String noticeTypeId;//公告类型编号
	private String name;//名称
	private String des;//描述
	private int status;//状态，默认可用
	private Set<Notice> notices;//一个类型对应多个公告
	
	
	public String getNoticeTypeId() {
		return noticeTypeId;
	}
	public void setNoticeTypeId(String noticeTypeId) {
		this.noticeTypeId = noticeTypeId;
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
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public Set<Notice> getNotices() {
		return notices;
	}
	public void setNotices(Set<Notice> notices) {
		this.notices = notices;
	}
	
	
}
