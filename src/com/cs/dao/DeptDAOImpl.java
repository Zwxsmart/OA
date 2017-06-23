package com.cs.dao;


import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.cs.bean.DRECommom;
import com.cs.bean.Dept;
import com.cs.bean.EmpDept;
import com.cs.commom.bean.Pager4EasyUI;

public class DeptDAOImpl extends AbstractBaseDAO<Dept> implements DeptDAO {

	
	
	@Override
	public Dept queryByDepId(String id) {
		return getHibernateTemplate().load(Dept.class, id);
	}

	@Override
	public Pager4EasyUI<EmpDept> queryByPager(Pager4EasyUI<EmpDept> pager) {
		Session session = this.getSessionFactory().getCurrentSession();
		Query query = session.createSQLQuery(
				"select d.depid, d.des, d.name, d.status, e.empid, e.name as empName from t_dept d, t_emp e where d.empid = e.empid");
		query.setFirstResult(pager.getBeginIndex());
		query.setMaxResults(pager.getPageSize());
		@SuppressWarnings("unchecked")
		List<Object[]> list = query.list(); // 每一个Object[]存放的是每一行记录的所有字段
		List<EmpDept> eds = new ArrayList<EmpDept>();
		for (Object[] objs : list) {
			EmpDept ed = new EmpDept();
			ed.setDepId((String) objs[0]);
			ed.setDes((String) objs[1]);
			ed.setName((String) objs[2]);
			ed.setStatus((int) objs[3]);
			ed.setEmpId((String) objs[4]);
			ed.setEmpName((String) objs[5]);
			eds.add(ed);
		}
		pager.setRows(eds);
		return pager;
	}

	@Override
	public Pager4EasyUI<Dept> blurredAllQueryPager(String string, Pager4EasyUI<Dept> pager, String value, String name) {
		return null;
	}

	/**
	 * 根据名称查找部门
	 */
	@Override
	public boolean queryByName(String beanName, String name) {
		Session session = this.getSessionFactory().getCurrentSession();
		String sql = "select * from "+beanName+" where name = '"+name+"'";
		Query query = session.createSQLQuery(sql);
		if(query.list().size() > 0){
			return true;
		}
		return false;
	}
}
