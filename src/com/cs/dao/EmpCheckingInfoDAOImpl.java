package com.cs.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import com.cs.bean.EmpChecking;
import com.cs.bean.EmpCheckingInfo;
import com.cs.commom.bean.Pager4EasyUI;

public class EmpCheckingInfoDAOImpl extends AbstractBaseDAO<EmpCheckingInfo> implements EmpCheckingInfoDAO{

	@Override
	public Pager4EasyUI<EmpCheckingInfo> blurredAllQueryPager(String string, Pager4EasyUI<EmpCheckingInfo> pager,
			String value, String name) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<EmpCheckingInfo> query() {
		Session session = this.getSessionFactory().getCurrentSession();
		Query query = session.createQuery("from EmpCheckingInfo");
		List<EmpCheckingInfo> list = query.list();
		return list;
	}

}
