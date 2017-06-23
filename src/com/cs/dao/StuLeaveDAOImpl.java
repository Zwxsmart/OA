package com.cs.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;

import com.cs.bean.StuLeave;
import com.cs.commom.bean.Pager4EasyUI;

/**
 * ѧ������DAOʵ��
 * @author ������
 *
 */
public class StuLeaveDAOImpl extends AbstractBaseDAO<StuLeave> implements StuLeaveDAO{

	@Override
	public Pager4EasyUI<StuLeave> blurredAllQueryPager(String string, Pager4EasyUI<StuLeave> pager, String value,
			String name) {
		Session session = this.getSessionFactory().getCurrentSession();
		if(name.equals("name")){
			System.out.println("���뵽���ֲ�ѯ");
        	Criteria talkCriteria = session.createCriteria(StuLeave.class);
        	Criteria stuCriteria = talkCriteria.createCriteria("stu");
        	stuCriteria.add(Restrictions.like(name, "%"+value+"%"));
        	@SuppressWarnings("unchecked")
			List<StuLeave> list = (List<StuLeave>)talkCriteria.list();
			pager.setRows(list);
			pager.setTotal(list.size());
		}
		return pager;
	}

	@Override
	public void stuPass(String sql) {
		 SessionFactory sessionFactory = super.getSessionFactory();
	  		Session session = sessionFactory.getCurrentSession();
	  		Query query = session.createQuery(sql);
	  		query.executeUpdate();
	}

}
