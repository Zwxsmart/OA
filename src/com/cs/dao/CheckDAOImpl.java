package com.cs.dao;

import java.sql.Timestamp;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import com.cs.bean.Check;
import com.cs.commom.bean.Pager4EasyUI;

public class CheckDAOImpl extends AbstractBaseDAO<Check> implements CheckDAO {

	@Override
	public Pager4EasyUI<Check> blurredAllQueryPager(String string, Pager4EasyUI<Check> pager, String value,
			String name) {
			Session session = this.getSessionFactory().getCurrentSession();
			if(name.equals("gradee")){
	        	Criteria checkCriteria = session.createCriteria(Check.class);
				Criteria gradeeCriteria = checkCriteria.createCriteria("grade");
				gradeeCriteria.add(Restrictions.like("name", "%"+value+"%"));
	        	@SuppressWarnings("unchecked")
				List<Check> list = (List<Check>)checkCriteria.list();
				pager.setRows(list);
				pager.setTotal(list.size());
			}else if(name.equals("roomm")){
				Criteria checkCriteria = session.createCriteria(Check.class);
				Criteria roommCriteria = checkCriteria.createCriteria("room");
				roommCriteria.add(Restrictions.like("name", "%"+value+"%"));
				@SuppressWarnings("unchecked")
				List<Check> list = (List<Check>)checkCriteria.list();
				pager.setRows(list);
				pager.setTotal(list.size());
			}else if(name.equals("empp")){
				Criteria checkCriteria = session.createCriteria(Check.class);
				Criteria emppCriteria = checkCriteria.createCriteria("emp");
				emppCriteria.add(Restrictions.like("name", "%"+value+"%"));
				@SuppressWarnings("unchecked")
				List<Check> list = (List<Check>)checkCriteria.list();
				pager.setRows(list);
				pager.setTotal(list.size());
		}
		return pager;
	}

}
