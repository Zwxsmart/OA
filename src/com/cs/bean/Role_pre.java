package com.cs.bean;

import java.util.Set;

/**
 * 权限表和职位表的关系表
 * @author 张文星
 *
 */
public class Role_pre {
	private String id;
	private String roleId;
	private String preId;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getRoleId() {
		return roleId;
	}
	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}
	public String getPreId() {
		return preId;
	}
	public void setPreId(String preId) {
		this.preId = preId;
	}
	
	
}
