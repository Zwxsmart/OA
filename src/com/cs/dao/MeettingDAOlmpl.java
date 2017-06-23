package com.cs.dao;

import java.sql.Timestamp;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import com.cs.bean.Meetting;
import com.cs.commom.bean.Pager4EasyUI;

public class MeettingDAOlmpl extends AbstractBaseDAO<Meetting> implements MeettingDAO{

	@Override
	public Pager4EasyUI<Meetting> blurredAllQueryPager(String string, Pager4EasyUI<Meetting> pager, String value,
			String name) {
		Session session = this.getSessionFactory().getCurrentSession();
		if(name.equals("all")){
			
        }else {
        	// 根据bean类增加like查询, name为bean中属性, value为用户在搜索框的值 
        	Criteria meettingCriteria = session.createCriteria(Meetting.class);
        	Criteria empCriteria = meettingCriteria.createCriteria("emp");
        	empCriteria.add(Restrictions.like(name, "%"+value+"%"));
        	@SuppressWarnings("unchecked")
			List<Meetting> list = (List<Meetting>)meettingCriteria.list();
			pager.setRows(list);
		}
		return pager;
	}

	@Override
	public long blurredAllQueryCount(String string, Pager4EasyUI<Meetting> pager, String value, String name) {
		Session session = this.getSessionFactory().getCurrentSession();
		if (name.equals("all")) {
			return 1;
		} else {
			Criteria meettingCriteria = session.createCriteria(Meetting.class);
        	Criteria empCriteria = session.createCriteria("emp");
        	empCriteria.add(Restrictions.like(name, "%"+value+"%"));
        	@SuppressWarnings("unchecked")
			List<Meetting> list = (List<Meetting>)meettingCriteria.list();
			System.out.println("size:" + list.size());
			return list.size();
        }
	}

	@Override
	public Pager4EasyUI<Meetting> serachDate(String beginTime, String endTime,Pager4EasyUI<Meetting> pager) {
		Session session = this.getSessionFactory().getCurrentSession();
		Timestamp beginDate=Timestamp.valueOf(beginTime);
		Timestamp endDate=Timestamp.valueOf(endTime);
		System.out.println("开始时间"+beginDate+"结束时间："+endDate);
		String hql="from Meetting m where m.meettingday<:"+endDate+" and m.meettingday >=:"+beginDate;
		Query query=session.createQuery(hql);
		if(beginDate!=null&&endDate!=null){
			query.setDate("beginDate",beginDate);
			query.setDate("endDate",endDate);	
		}
		@SuppressWarnings("unchecked")
		List<Meetting> list=query.list();
		pager.setRows(list);
		return pager;
	}
}
