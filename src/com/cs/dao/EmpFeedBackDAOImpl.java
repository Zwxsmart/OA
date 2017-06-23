package com.cs.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import com.cs.bean.EmpFeedBack;
import com.cs.commom.bean.Pager4EasyUI;

public class EmpFeedBackDAOImpl extends AbstractBaseDAO<EmpFeedBack> implements EmpFeedBackDAO {

	@Override
	public Pager4EasyUI<EmpFeedBack> blurredAllQueryPager(String string, Pager4EasyUI<EmpFeedBack> pager, String value,
			String name) {
		Session session = this.getSessionFactory().getCurrentSession();
		if(name.equals("empp")){
			Criteria efbLeaveCriteria = session.createCriteria(EmpFeedBack.class);
        	Criteria emppCriteria = efbLeaveCriteria.createCriteria("emp");
        	emppCriteria.add(Restrictions.like("name", "%"+value+"%"));
        	@SuppressWarnings("unchecked")
			List<EmpFeedBack> list = (List<EmpFeedBack>)efbLeaveCriteria.list();
			pager.setRows(list);
			pager.setTotal(list.size());
		}
		return pager;
	}

}
