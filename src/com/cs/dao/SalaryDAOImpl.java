package com.cs.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import com.cs.bean.Salary;
import com.cs.bean.SalaryInfo;
import com.cs.commom.bean.Pager4EasyUI;

public class SalaryDAOImpl extends AbstractBaseDAO<Salary> implements SalaryDAO{

	@Override
	public Pager4EasyUI<Salary> blurredAllQueryPager(String string, Pager4EasyUI<Salary> pager, String value,
			String name) {
		Session session = this.getSessionFactory().getCurrentSession();
		if (name.equals("emps")) {
			Criteria salaryCriteria = session.createCriteria(Salary.class);
			Criteria typeCriteria = salaryCriteria.createCriteria("emp");
			typeCriteria.add(Restrictions.like("name", "%" + value + "%"));
			@SuppressWarnings("unchecked")
			List<Salary> list = (List<Salary>) salaryCriteria.list();
			pager.setRows(list);
			pager.setTotal(list.size());
		}
		return pager;
	}

	@SuppressWarnings("null")
	public double querysalary(String value) {
		SalaryInfo salaryInfo = null;
		Session session = this.getSessionFactory().getCurrentSession();
			Criteria salaryCriteria = session.createCriteria(SalaryInfo.class);
			Criteria typeCriteria = salaryCriteria.createCriteria("emp");
			typeCriteria.add(Restrictions.like("empId", "%" + value + "%"));
			//salaryInfo.getJobSalary()+salaryInfo.getBasicSalary()
			double a = salaryInfo.getBasicSalary();
			double b = salaryInfo.getJobSalary();
			double s=a+b;
		return s;
	}
}
