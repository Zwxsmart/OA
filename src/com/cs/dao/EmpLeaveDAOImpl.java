package com.cs.dao;

import java.io.Serializable;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;

import com.cs.bean.DRECommom;
import com.cs.bean.EmpLeave;
import com.cs.bean.EmpLeaveInfo;
import com.cs.commom.bean.Pager4EasyUI;

public class EmpLeaveDAOImpl extends AbstractBaseDAO<EmpLeave> implements EmpLeaveDAO {

	@Override
	public Pager4EasyUI<EmpLeave> blurredAllQueryPager(String string, Pager4EasyUI<EmpLeave> pager, String value,
			String name) {
		Session session = this.getSessionFactory().getCurrentSession();
		if(name.equals("empp")){
			Criteria empLeaveCriteria = session.createCriteria(EmpLeave.class);
        	Criteria emppCriteria = empLeaveCriteria.createCriteria("emp");
        	emppCriteria.add(Restrictions.like("name", "%"+value+"%"));
        	@SuppressWarnings("unchecked")
			List<EmpLeave> list = (List<EmpLeave>)empLeaveCriteria.list();
			pager.setRows(list);
			pager.setTotal(list.size());
		}
		return pager;
	}

	/**
	 * 查询请假天数
	 * @return
	 */
	@Override
	public long queryCountLeave(String beanName, String id) {
		Session session = super.getSessionFactory().getCurrentSession();
		String sql = "select datediff(e.endtime,e.starttime) from t_empleave where leaveid = '"+id+"'";
		System.out.println(sql + "aaaaaaaaaaaaaaa");
		Query query = session.createSQLQuery(sql);
		Long aLong = (long) query.uniqueResult();
		return aLong;
	}

	@Override
	public Pager4EasyUI<EmpLeaveInfo> queryPager(Pager4EasyUI<EmpLeaveInfo> pager, String sql) {
		Session session = this.getSessionFactory().getCurrentSession();
		Query query = session.createSQLQuery(sql);
		query.setFirstResult(pager.getBeginIndex());
		query.setMaxResults(pager.getPageSize());
		@SuppressWarnings("unchecked")
		List<Object[]> list = query.list(); // 每一个Object[]存放的是每一行记录的所有字段
		List<EmpLeaveInfo> info = new ArrayList<EmpLeaveInfo>();
		for (Object[] objs : list) {
			EmpLeaveInfo eli = new EmpLeaveInfo();
			eli.setLeaveId((String) objs[0]);
			eli.setEmpId((String) objs[1]);
			eli.setStartTime((Date) objs[2]);
			eli.setEndTime((Date)objs[3]);
			eli.setLeaveDay((Date)objs[4]);
			eli.setDes((String)objs[5]);
			eli.setStatus((int)objs[6]);
			eli.setFirstLevel((int)objs[7]);
			eli.setSecondLevel((int)objs[8]);
			eli.setPass((int)objs[9]);
			eli.setEmpName((String)objs[10]);
			eli.setLeaveCount((BigInteger)objs[11]);
			info.add(eli);
		}
		pager.setRows(info);
		pager.setTotal(list.size());
		return pager;
	}

	/**
	 * 修改状态
	 */
	@Override
	public void updateStatus(String beanName, String beanId, int status, String fieldName, String id) {
		 SessionFactory sessionFactory = super.getSessionFactory();
	  		Session session = sessionFactory.getCurrentSession();
	  		String hql = "update "+beanName+" set "+fieldName+" = :status where "+beanId+"= :id";
	  		Query query = session.createQuery(hql);
	  		query.setParameter("status", status);
	  		query.setParameter("id", id);
	  		query.executeUpdate();
	}

	@Override
	public Pager4EasyUI<EmpLeaveInfo> queryPageAll(String string, Pager4EasyUI<EmpLeaveInfo> pager, String value,
			String name) {
		Session session = this.getSessionFactory().getCurrentSession();
		String sql = "select l.*, e.`name`, datediff(l.endtime,l.starttime) as a from t_empleave l , t_emp e, t_dept d where e.empid = l.empid and d.depid = e.depid and "+name+" like '%"+value+"%'";
		System.out.println(sql + "cccccccccccccccccccccccccc");
		Query query = session.createSQLQuery(sql);
		query.setFirstResult(pager.getBeginIndex());
		query.setMaxResults(pager.getPageSize());
		@SuppressWarnings("unchecked")
		List<Object[]> list = query.list(); // 每一个Object[]存放的是每一行记录的所有字段
		List<EmpLeaveInfo> info = new ArrayList<EmpLeaveInfo>();
		for (Object[] objs : list) {
			EmpLeaveInfo derc = new EmpLeaveInfo();
			derc.setLeaveId((String) objs[0]);
			derc.setEmpId((String) objs[1]);
			derc.setStartTime((Date) objs[2]);
			derc.setEndTime((Date) objs[3]);
			derc.setLeaveDay((Date) objs[4]);
			derc.setDes((String) objs[5]);
			derc.setStatus((int) objs[6]);
			derc.setFirstLevel((int) objs[7]);
			derc.setSecondLevel((int) objs[8]);
			derc.setPass((int) objs[9]);
			derc.setEmpName((String) objs[10]);
			derc.setLeaveCount((BigInteger)objs[11]);
			info.add(derc);
		}
		pager.setRows(info);
		return pager;
	}

	@Override
	public Pager4EasyUI<EmpLeaveInfo> queryByEmpLeaveDay(Pager4EasyUI<EmpLeaveInfo> pager, Serializable startDay,
			Serializable endDay, Serializable beanObject) {
		Session session = this.getSessionFactory().getCurrentSession();
  		String sql = "select l.*, e.`name` ,datediff(l.endtime,l.starttime) as a from t_empleave l , t_emp e, t_dept d where e.empid = l.empid and d.depid = e.depid and leaveday between ? and ?";
		System.out.println(sql + "aaaaaaaaaaaaaaaaaaaaaa");
		Query query = session.createSQLQuery(sql);
		query.setParameter(0, (String)startDay);
		query.setParameter(1, (String)endDay);
		query.setFirstResult(pager.getBeginIndex());
		query.setMaxResults(pager.getPageSize());
		@SuppressWarnings("unchecked")
		List<Object[]> list = query.list(); // 每一个Object[]存放的是每一行记录的所有字段
		List<EmpLeaveInfo> info = new ArrayList<EmpLeaveInfo>();
		for (Object[] objs : list) {
			EmpLeaveInfo derc = new EmpLeaveInfo();
			derc.setLeaveId((String) objs[0]);
			derc.setEmpId((String) objs[1]);
			derc.setStartTime((Date) objs[2]);
			derc.setEndTime((Date) objs[3]);
			derc.setLeaveDay((Date) objs[4]);
			derc.setDes((String) objs[5]);
			derc.setStatus((int) objs[6]);
			derc.setFirstLevel((int) objs[7]);
			derc.setSecondLevel((int) objs[8]);
			derc.setPass((int) objs[9]);
			derc.setEmpName((String) objs[10]);
			derc.setLeaveCount((BigInteger)objs[11]);
			info.add(derc);
		}
		pager.setRows(info);
		return pager;
	}



}
