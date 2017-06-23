package com.cs.dao;


/**
 * 查询权限dao
 * @author  张文星
 */
public interface PrevilligeDAO {
	public boolean queryPrevillige(String roleId,String actionName);

	public boolean queryRole(String methodName, String roleId);
}
