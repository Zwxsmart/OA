package com.cs.dao;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;

public class PrevilligeDAOImpl extends HibernateDaoSupport implements PrevilligeDAO {

	@Override
	public boolean queryPrevillige(String roleId, String actionName) {
		Session session = this.getSessionFactory().getCurrentSession();
		Query query = session.createSQLQuery("select rp.id, rp.preid, rp.roleid from t_role role, t_previllige pre, t_role_pre rp where role.roleid = rp.roleid and pre.id = rp.preid and pre.name = '"+ actionName +"' and rp.roleid = '"+ roleId +"'");
		System.out.println(query.list().size());
		if(query.list().size() >0){
			return true;
		}
		return false;
	}

	@Override
	public boolean queryRole(String methodName, String roleId) {
		// TODO Auto-generated method stub
		return false;
	}

}
