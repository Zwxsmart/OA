package com.cs.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import com.cs.bean.DRECommom;
import com.cs.bean.EmpChecking;
import com.cs.commom.bean.Pager4EasyUI;

public class EmpCheckingDAOImpl extends AbstractBaseDAO<EmpChecking> implements EmpCheckingDAO{

	@Override
	public Pager4EasyUI<EmpChecking> blurredAllQueryPager(String string, Pager4EasyUI<EmpChecking> pager, String value,
			String name) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Pager4EasyUI<EmpChecking> queryEmpChecking(Pager4EasyUI<EmpChecking> pager, String depId) {
		Session session = this.getSessionFactory().getCurrentSession();
		Query query = session.createQuery("select empId from Emp where depId = ?");
		query.setParameter(0, depId);
		List<Object> list = query.list();
		Criteria c = session.createCriteria(EmpChecking.class).add(Restrictions.in("emp.empId", list)); // 条件查询
		List<EmpChecking> scores = c.list();
		for(EmpChecking e : scores){
			System.out.println(e.getTime1());
			System.out.println(e.getTime2());
			System.out.println(e.getTime3());
			System.out.println(e.getTime4());
			System.out.println(e.getTime5());
			System.out.println(e.getTime6());
			System.out.println(e.getTime7());
			System.out.println(e.getTime8());
		}
		pager.setRows(scores);
		pager.setTotal(scores.size());
		return pager;
	}

	@Override
	public List<EmpChecking> queryAll(String depId) {
		Session session = this.getSessionFactory().getCurrentSession();
		Query query = session.createQuery("select empId from Emp where depId = ?");
		query.setParameter(0, depId);
		List<Object> list = query.list();
		Criteria c = session.createCriteria(EmpChecking.class).add(Restrictions.in("emp.empId", list)); // 条件查询
		List<EmpChecking> scores = c.list();
		return scores;
	}

	@Override
	public List<EmpChecking> queryByMonth(String depId, String startMonth, String endMonth) {
		Session session = this.getSessionFactory().getCurrentSession();
		String hql = "select * from t_empchecking where checkingday between '"+ startMonth +"' and '"+endMonth+"' and empid in (select empid from t_emp where depid = '"+ depId+"')";
		
		Query query = session.createSQLQuery(hql);
		List<Object[]> list = query.list(); // 每一个Object[]存放的是每一行记录的所有字段
		List<EmpChecking> info = new ArrayList<EmpChecking>();
		for (Object[] objs : list) {
			EmpChecking derc = new EmpChecking();
			derc.setCheckingId((String) objs[0]);
			derc.setEmpId((String) objs[1]);
			derc.setCheckingDay((Date) objs[2]);
			derc.setTime1((Date) objs[3]);
			derc.setTime2((Date) objs[4]);
			derc.setTime3((Date) objs[5]);
			derc.setTime4((Date) objs[6]);
			derc.setTime5((Date) objs[7]);
			derc.setTime6((Date) objs[8]);
			derc.setTime7((Date) objs[9]);
			derc.setTime8((Date) objs[10]);
			info.add(derc);
		}
		return info;
	}



}
