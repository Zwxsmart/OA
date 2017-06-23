package com.cs.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import com.cs.bean.Exp;
import com.cs.bean.Stu;
import com.cs.commom.bean.Pager4EasyUI;

public class ExpDAOImpl extends AbstractBaseDAO<Exp> implements ExpDAO{

	@Override
	public Pager4EasyUI<Exp> blurredAllQueryPager(String string, Pager4EasyUI<Exp> pager, String value, String name) {
		Session session = this.getSessionFactory().getCurrentSession();
		if(name.equals("all")){
		}else if(name.equals("name")){
			Criteria stuCriteria = session.createCriteria(Exp.class);
        	Criteria empCriteria = stuCriteria.createCriteria("emp");
        	empCriteria.add(Restrictions.like("name", "%"+value+"%"));
        	@SuppressWarnings("unchecked")
			List<Exp> list = (List<Exp>)stuCriteria.list();
			pager.setRows(list);
			pager.setTotal(list.size());
		} else if(name.equals("company")){
			Criteria c = session.createCriteria(Exp.class).add(Restrictions.like(name, "%"+value+"%"));
        	@SuppressWarnings("unchecked")
			List<Exp> list = (List<Exp>)c.list();
			pager.setRows(list);
			pager.setTotal(list.size());
		} else if(name.equals("jobTitle")){
			Criteria c = session.createCriteria(Exp.class).add(Restrictions.like(name, "%"+value+"%"));
        	@SuppressWarnings("unchecked")
			List<Exp> list = (List<Exp>)c.list();
			pager.setRows(list);
			pager.setTotal(list.size());
		}
		return pager;
	}

}
