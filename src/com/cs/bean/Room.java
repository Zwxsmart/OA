package com.cs.bean;

import java.util.Set;

/**
 * ѧ������JavaBean
 * @author ����
 *
 */

public class Room {

	private String roomId; // ������
	private String name; // ����
	private String stuId; // ���᳤���
	private String quantity; // �����������
	private int status; // ״̬��Ĭ��Ϊ����
	
	private Set<Stu> stus;
	private Stu stu;
	
	private Set<Check> checks;	// ���Ѳ��
	
	public Set<Check> getChecks() {
		return checks;
	}
	public void setChecks(Set<Check> checks) {
		this.checks = checks;
	}
	public String getRoomId() {
		return roomId;
	}
	public void setRoomId(String roomId) {
		this.roomId = roomId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getStuId() {
		return stuId;
	}
	public void setStuId(String stuId) {
		this.stuId = stuId;
	}
	public String getQuantity() {
		return quantity;
	}
	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}
	
	public Set<Stu> getStus() {
		return stus;
	}
	public void setStus(Set<Stu> stus) {
		this.stus = stus;
	}
	public Stu getStu() {
		return stu;
	}
	public void setStu(Stu stu) {
		this.stu = stu;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}

}
