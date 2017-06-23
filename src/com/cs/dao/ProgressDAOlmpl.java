package com.cs.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import com.cs.bean.Emp;
import com.cs.bean.Grade;
import com.cs.bean.Meetting;
import com.cs.bean.Progress;
import com.cs.commom.bean.Pager4EasyUI;

public class ProgressDAOlmpl extends AbstractBaseDAO<Progress> implements ProgressDAO {

	@Override
	public Pager4EasyUI<Progress> blurredAllQueryPager(String string, Pager4EasyUI<Progress> pager, String value,
			String name) {
		Session session = this.getSessionFactory().getCurrentSession();
		if (name.equals("empName")) {
			System.out.println("nameÖµÎª£º"+name);
			Criteria progressCriteria = session.createCriteria(Progress.class);
        	Criteria empCriteria = progressCriteria.createCriteria("emp");
        	empCriteria.add(Restrictions.like("name", "%"+value+"%"));
        	@SuppressWarnings("unchecked")
			List<Progress> list = (List<Progress>)progressCriteria.list();
			pager.setRows(list);
		} else {
			Criteria progressCriteria = session.createCriteria(Progress.class);
        	Criteria gradeCriteria = progressCriteria.createCriteria("grade");
        	gradeCriteria.add(Restrictions.like("name", "%"+value+"%"));
        	@SuppressWarnings("unchecked")
			List<Progress> list = (List<Progress>)progressCriteria.list();
			pager.setRows(list);
		}
		return pager;
	}

	@Override
	public long blurredAllQueryCount(String string, Pager4EasyUI<Progress> pager, String value, String name) {
		Session session = this.getSessionFactory().getCurrentSession();
		if (name.equals("empId")) {
			Criteria c = session.createCriteria(Progress.class).add(Restrictions.like("empId", "%" + value + "%"));
			@SuppressWarnings("unchecked")
			List<Progress> list = (List<Progress>) c.list();
			return list.size();
		} else {
			System.out.println("value :" + value + ", name: " + name);
			Criteria c = session.createCriteria(Progress.class).add(Restrictions.like("gradeId", "%" + value + "%"));
			@SuppressWarnings("unchecked")
			List<Progress> list = (List<Progress>) c.list();
			System.out.println("size:" + list.size());
			return list.size();
		}
	}
}
