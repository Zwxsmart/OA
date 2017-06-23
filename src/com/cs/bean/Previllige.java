package com.cs.bean;
/**
 * 权限表
 * @author 张文星
 *
 */
public class Previllige {
	private String id;
	private String name;
	private String des;
	
	private Role_pre role_pre;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	public Role_pre getRole_pre() {
		return role_pre;
	}
	public void setRole_pre(Role_pre role_pre) {
		this.role_pre = role_pre;
	}
	
}
