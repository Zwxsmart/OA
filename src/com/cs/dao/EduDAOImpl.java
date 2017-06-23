package com.cs.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import com.cs.bean.Edu;
import com.cs.commom.bean.Pager4EasyUI;

public class EduDAOImpl extends AbstractBaseDAO<Edu> implements EduDAO {


	@Override
	public Pager4EasyUI<Edu> blurredAllQueryPager(String string, Pager4EasyUI<Edu> pager, String value, String name) {
		Session session = this.getSessionFactory().getCurrentSession();
		if(name.equals("empp")){
			Criteria empLeaveCriteria = session.createCriteria(Edu.class);
        	Criteria emppCriteria = empLeaveCriteria.createCriteria("emp");
        	emppCriteria.add(Restrictions.like("name", "%"+value+"%"));
        	@SuppressWarnings("unchecked")
			List<Edu> list = (List<Edu>)empLeaveCriteria.list();
			pager.setRows(list);
			pager.setTotal(list.size());
		}
		return pager;
	}


}
