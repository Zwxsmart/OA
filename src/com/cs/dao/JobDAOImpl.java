package com.cs.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import com.cs.bean.Job;
import com.cs.commom.bean.Pager4EasyUI;

/**
 * 学生就业DAO实现
 * @author 张文星
 *
 */
public class JobDAOImpl extends AbstractBaseDAO<Job> implements JobDAO{

	@Override
	public Pager4EasyUI<Job> blurredAllQueryPager(String string, Pager4EasyUI<Job> pager, String value, String name) {
		Session session = this.getSessionFactory().getCurrentSession();
		if(name.equals("name")){
        	Criteria talkCriteria = session.createCriteria(Job.class);
        	Criteria stuCriteria = talkCriteria.createCriteria("stu");
        	stuCriteria.add(Restrictions.like(name, "%"+value+"%"));
        	@SuppressWarnings("unchecked")
			List<Job> list = (List<Job>)talkCriteria.list();
			pager.setRows(list);
			pager.setTotal(list.size());
		}else if(name.equals("comPhone")){
			Criteria c = session.createCriteria(Job.class).add(Restrictions.like(name, "%" + value + "%"));
			@SuppressWarnings("unchecked")
			List<Job> list = (List<Job>) c.list();
			pager.setRows(list);
			pager.setTotal(list.size());
		}
		return pager;
	}

}
