package com.cs.dao;


import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import com.cs.bean.Check;
import com.cs.bean.Grade;
import com.cs.bean.Role;
import com.cs.commom.bean.Pager4EasyUI;

public class RoleDAOImpl extends AbstractBaseDAO<Role> implements RoleDAO {

	@Override
	public Pager4EasyUI<Role> blurredAllQueryPager(String string, Pager4EasyUI<Role> pager, String value, String name) {
		Session session = this.getSessionFactory().getCurrentSession();
		if(name.equals("name")){
        	// ����bean������like��ѯ, nameΪbean������, valueΪ�û����������ֵ 
        	Criteria c = session.createCriteria(Role.class).add(Restrictions.like(name, "%"+value+"%"));
        	@SuppressWarnings("unchecked")
			List<Role> list = (List<Role>)c.list();
			pager.setRows(list);
			pager.setTotal(list.size());
		}
		return pager;
}


}
