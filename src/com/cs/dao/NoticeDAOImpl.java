package com.cs.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;

import com.cs.bean.Course;
import com.cs.bean.Notice;
import com.cs.bean.Progress;
import com.cs.commom.bean.Pager4EasyUI;

public class NoticeDAOImpl extends AbstractBaseDAO<Notice> implements NoticeDAO{

	@SuppressWarnings("unchecked")
	@Override
	public Pager4EasyUI<Notice> blurredAllQueryPager(String string, Pager4EasyUI<Notice> pager, String value,
			String name) {
		Session session = this.getSessionFactory().getCurrentSession();
		if(name.equals("name")){
			System.out.println(name);
			
			Criteria c = session.createCriteria(Notice.class).add(Restrictions.like(name, "%"+value+"%"));
			List<Notice> list=(List<Notice>)c.list();
			pager.setRows(list);
			pager.setTotal(list.size());
			
		}else if(name.equals("noticeTypeName")){
			
			Criteria c = session.createCriteria(Notice.class);
			Criteria empCriteria = c.createCriteria("noticeType");
			empCriteria.add(Restrictions.like("name", "%"+value+"%"));
			List<Notice> list=(List<Notice>)c.list();
			pager.setRows(list);
			pager.setTotal(list.size());
			
		}else if(name.equals("empsName")){
			Criteria c = session.createCriteria(Notice.class);
			Criteria empCriteria = c.createCriteria("emps");
			empCriteria.add(Restrictions.like("name", "%"+value+"%"));
			List<Notice> list=(List<Notice>)c.list();
			pager.setRows(list);
			pager.setTotal(list.size());
		}
		return pager;
	}
	//根据时间查询标题
		@SuppressWarnings("unchecked")
		@Override
		public Notice queryNewNotice() {		
			Session session = this.getSessionFactory().getCurrentSession();
			Query query = session.createQuery("from Notice order by noticeDay desc");
			query.setFirstResult(0);
			query.setMaxResults(1);
			Notice notices = (Notice)query.uniqueResult();
			
			return notices;
		}

}
