package com.cs.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import com.cs.bean.Duty;
import com.cs.commom.bean.Pager4EasyUI;

public class DutyDAOImpl extends AbstractBaseDAO<Duty> implements DutyDAO {

	@Override
	public Pager4EasyUI<Duty> blurredAllQueryPager(String string, Pager4EasyUI<Duty> pager, String value, String name) {
		Session session = this.getSessionFactory().getCurrentSession();
		if(name.equals("empp")){
			Criteria dutyCriteria = session.createCriteria(Duty.class);
			Criteria emppCriteria = dutyCriteria.createCriteria("emp1");
			emppCriteria.add(Restrictions.like("name", "%"+value+"%"));
			@SuppressWarnings("unchecked")
			List<Duty> list = (List<Duty>)dutyCriteria.list();
			pager.setRows(list);
			pager.setTotal(list.size());
		}
		return pager;
	}


}
