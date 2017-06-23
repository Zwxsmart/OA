package com.cs.bean;

import java.util.Set;

/**
 * 学生宿舍JavaBean
 * @author 温鑫
 *
 */

public class Room {

	private String roomId; // 宿舍编号
	private String name; // 名称
	private String stuId; // 宿舍长编号
	private String quantity; // 宿舍最大人数
	private int status; // 状态，默认为可用
	
	private Set<Stu> stus;
	private Stu stu;
	
	private Set<Check> checks;	// 多次巡查
	
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
