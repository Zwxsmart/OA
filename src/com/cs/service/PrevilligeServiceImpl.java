package com.cs.service;

import com.cs.dao.PrevilligeDAO;
import com.cs.service.PrevilligeSerivce;

public class PrevilligeServiceImpl implements PrevilligeSerivce {

	private PrevilligeDAO preDAO; 
	
	public PrevilligeDAO getPreDAO() {
		return preDAO;
	}

	public void setPreDAO(PrevilligeDAO preDAO) {
		this.preDAO = preDAO;
	}

	@Override
	public boolean queryPrevillige(String roleId, String actionName) {
		return preDAO.queryPrevillige(roleId, actionName);
	}

	@Override
	public boolean queryRole(String methodName, String roleId) {
		return preDAO.queryRole(methodName, roleId);
	}

}
