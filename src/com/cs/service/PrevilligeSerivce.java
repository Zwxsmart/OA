package com.cs.service;

public interface PrevilligeSerivce {
	public boolean queryPrevillige(String roleId,String actionName);
	// 查看是否有权限
	public boolean queryRole(String methodName, String roleId);
}
