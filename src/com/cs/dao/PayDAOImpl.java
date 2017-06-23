package com.cs.dao;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import com.cs.bean.Pay;
import com.cs.commom.bean.Pager4EasyUI;

public class PayDAOImpl extends AbstractBaseDAO<Pay> implements PayDAO {

	@Override
	public Pager4EasyUI<Pay> blurredAllQueryPager(String string, Pager4EasyUI<Pay> pager, String value, String name) {
		Session session = this.getSessionFactory().getCurrentSession();
		if (name.equals("payTypes")) {
			Criteria IncomeCriteria = session.createCriteria(Pay.class);
			Criteria typeCriteria = IncomeCriteria.createCriteria("payType");
			typeCriteria.add(Restrictions.like("name", "%" + value + "%"));
			@SuppressWarnings("unchecked")
			List<Pay> list = (List<Pay>) IncomeCriteria.list();
			pager.setRows(list);
			pager.setTotal(list.size());
		}else if (name.equals("emps")) {
			Criteria IncomeCriteria = session.createCriteria(Pay.class);
			Criteria typeCriteria = IncomeCriteria.createCriteria("emp");
			typeCriteria.add(Restrictions.like("name", "%" + value + "%"));
			@SuppressWarnings("unchecked")
			List<Pay> list = (List<Pay>) IncomeCriteria.list();
			pager.setRows(list);
			pager.setTotal(list.size());
		}
		return pager;
	}
	
	@Override
	public long blurredAllQueryCount(String string, Pager4EasyUI<Pay> pager, String value, String name) {
		Session session = this.getSessionFactory().getCurrentSession();
		if (name.equals("all")) {
			return 1;
		} else {
			Criteria meettingCriteria = session.createCriteria(Pay.class);
        	Criteria empCriteria = session.createCriteria("emp");
        	empCriteria.add(Restrictions.like(name, "%"+value+"%"));
        	@SuppressWarnings("unchecked")
			List<Pay> list = (List<Pay>)meettingCriteria.list();
			System.out.println("size:" + list.size());
			return list.size();
        }
	}

	@Override
	public Pager4EasyUI<Pay> serachDate(String beginTime, String endTime, Pager4EasyUI<Pay> pager) {
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
		List<Pay> list=query.list();
		pager.setRows(list);
		return pager;
	}

	@Override
	public List<Map<String,String>> payQueryTypeName() {
		Session session = this.getSessionFactory().getCurrentSession();
		String sql="SELECT  t_paytype.`name`,t_pay.pay FROM t_pay INNER JOIN t_paytype ON t_pay.paytypeid=t_paytype.paytypeid";
		Query query=session.createSQLQuery(sql);
		@SuppressWarnings("unchecked")
		List<Map<String,String>> pay=query.list();
		return pay;
	}


}