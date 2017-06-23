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
        	// 根据bean类增加like查询, name为bean中属性, value为用户在搜索框的值 
        	Criteria c = session.createCriteria(Role.class).add(Restrictions.like(name, "%"+value+"%"));
        	@SuppressWarnings("unchecked")
			List<Role> list = (List<Role>)c.list();
			pager.setRows(list);
			pager.setTotal(list.size());
		}
		return pager;
}


}
