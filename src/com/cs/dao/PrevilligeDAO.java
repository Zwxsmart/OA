package com.cs.dao;


/**
 * ��ѯȨ��dao
 * @author  ������
 */
public interface PrevilligeDAO {
	public boolean queryPrevillige(String roleId,String actionName);

	public boolean queryRole(String methodName, String roleId);
}
