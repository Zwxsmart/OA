package com.cs.dao;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.cs.bean.Income;
import com.cs.commom.bean.Pager4EasyUI;

public class IncomeDAOImpl extends AbstractBaseDAO<Income> implements IncomeDAO{

	@Override
	public Pager4EasyUI<Income> blurredAllQueryPager(String string, Pager4EasyUI<Income> pager, String value,
			String name) {
		Session session = this.getSessionFactory().getCurrentSession();
		if (name.equals("incomeTypes")) {
			Criteria IncomeCriteria = session.createCriteria(Income.class);
			Criteria typeCriteria = IncomeCriteria.createCriteria("incomeType");
			typeCriteria.add(Restrictions.like("name", "%" + value + "%"));
			@SuppressWarnings("unchecked")
			List<Income> list = (List<Income>) IncomeCriteria.list();
			pager.setRows(list);
			pager.setTotal(list.size());
		}else if (name.equals("emps")) {
			Criteria IncomeCriteria = session.createCriteria(Income.class);
			Criteria typeCriteria = IncomeCriteria.createCriteria("emp");
			typeCriteria.add(Restrictions.like("name", "%" + value + "%"));
			@SuppressWarnings("unchecked")
			List<Income> list = (List<Income>) IncomeCriteria.list();
			pager.setRows(list);
			pager.setTotal(list.size());
		}else if (name.equals("stus")) {
			Criteria IncomeCriteria = session.createCriteria(Income.class);
			Criteria typeCriteria = IncomeCriteria.createCriteria("stu");
			typeCriteria.add(Restrictions.like("name", "%" + value + "%"));
			@SuppressWarnings("unchecked")
			List<Income> list = (List<Income>) IncomeCriteria.list();
			pager.setRows(list);
			pager.setTotal(list.size());
		}
		return pager;
	}

	@Override
	public void updateByStuId(String stuId, double d) {
		System.out.println("..........."+stuId);
		 SessionFactory sessionFactory = this.getSessionFactory();
	  		Session session = sessionFactory.getCurrentSession();
	  		String hql = "update Income set income = :status where stuId= :id";
	  		Query query = session.createQuery(hql);
	  		query.setParameter("status", d);
	  		query.setParameter("id", stuId);
	  		query.executeUpdate();
	}
	

	@Override
	public long blurredAllQueryCount(String string, Pager4EasyUI<Income> pager, String value, String name) {
		Session session = this.getSessionFactory().getCurrentSession();
		if (name.equals("all")) {
			return 1;
		} else {
			Criteria meettingCriteria = session.createCriteria(Income.class);
        	Criteria empCriteria = session.createCriteria("emp");
        	empCriteria.add(Restrictions.like(name, "%"+value+"%"));
        	@SuppressWarnings("unchecked")
			List<Income> list = (List<Income>)meettingCriteria.list();
			System.out.println("size:" + list.size());
			return list.size();
        }
	}

	@Override
	public Pager4EasyUI<Income> serachDate(String beginTime, String endTime, Pager4EasyUI<Income> pager) {
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
		List<Income> list=query.list();
		pager.setRows(list);
		return pager;
	}

	@Override
	public List<Map<String, String>> payQueryTypeName() {
		Session session = this.getSessionFactory().getCurrentSession();
		String sql="SELECT  t_incometype.`name`,t_income.income FROM t_income INNER JOIN t_incometype ON t_income.incometypeid=t_incometype.incometypeid";
		Query query=session.createSQLQuery(sql);
		@SuppressWarnings("unchecked")
		List<Map<String,String>> income=query.list();
		return income;
	}

}
