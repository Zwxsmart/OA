package com.cs.service;

public interface PrevilligeSerivce {
	public boolean queryPrevillige(String roleId,String actionName);
	// �鿴�Ƿ���Ȩ��
	public boolean queryRole(String methodName, String roleId);
}
