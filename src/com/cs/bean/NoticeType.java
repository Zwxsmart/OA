package com.cs.bean;

import java.util.Set;

public class NoticeType {
	private String noticeTypeId;//�������ͱ��
	private String name;//����
	private String des;//����
	private int status;//״̬��Ĭ�Ͽ���
	private Set<Notice> notices;//һ�����Ͷ�Ӧ�������
	
	
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
