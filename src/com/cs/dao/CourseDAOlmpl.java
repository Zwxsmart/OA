package com.cs.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import com.cs.bean.Course;
import com.cs.commom.bean.Pager4EasyUI;

public class CourseDAOlmpl extends AbstractBaseDAO<Course> implements CourseDAO {
	@Override
	public Pager4EasyUI<Course> blurredAllQueryPager(String string, Pager4EasyUI<Course> pager, String value,
			String name) {
		Session session = this.getSessionFactory().getCurrentSession();
		if (name.equals("name")) {			
			System.out.println(name);
			Criteria c = session.createCriteria(Course.class).add(Restrictions.like("name", "%" + value + "%"));
			@SuppressWarnings("unchecked")
			List<Course> list = (List<Course>) c.list();
			pager.setRows(list);
		}else{
			System.out.println("value值是："+value);
			Query query=session.createSQLQuery("SELECT *from t_course where term ="+value);
			@SuppressWarnings("unchecked")
			List<Course> list=(List<Course>)query.list();
			pager.setRows(list);
		}
		return pager;
	}

	// 模糊查询后的数据进行分页
	@Override
	public long blurredAllQueryCount(String string, Pager4EasyUI<Course> pager, String value, String name) {
		Session session = this.getSessionFactory().getCurrentSession();
		if (name.equals("name")) {
			Criteria c = session.createCriteria(Course.class).add(Restrictions.like("name", "%" + value + "%"));
			@SuppressWarnings("unchecked")
			List<Course> list = (List<Course>) c.list();
			return list.size();
		} else{
			System.out.println("value :" + value + ", name: " + name);
			Criteria c = session.createCriteria(Course.class).add(Restrictions.like(name, "%" + value+ "%"));
			@SuppressWarnings("unchecked")
			List<Course> list = (List<Course>) c.list();
			System.out.println("size:" + list.size());
			return list.size();
		}
	}

	@Override
	public Pager4EasyUI<Course> termSerach(String string, Pager4EasyUI<Course> pager, String term) {
		Session session = this.getSessionFactory().getCurrentSession();
		Query query=session.createQuery("from Course course where course.term="+term);
		@SuppressWarnings("unchecked")
		List<Course> list=(List<Course>)query.list();
		pager.setRows(list);
		return pager;
	}
}
