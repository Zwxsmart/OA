package com.cs.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import com.cs.bean.Stu;
import com.cs.bean.StuChecking;
import com.cs.commom.bean.Pager4EasyUI;

/**
 * 学生考勤DAO实现
 * @author 张文星
 *
 */
public class StuCheckingDAOImpl extends AbstractBaseDAO<StuChecking> implements StuCheckingDAO{

	@Override
	public Pager4EasyUI<StuChecking> blurredAllQueryPager(String string, Pager4EasyUI<StuChecking> pager, String value,
			String name) {
		return null;
	}

	@Override
	public Pager4EasyUI<StuChecking> queryStuChecking(Pager4EasyUI<StuChecking> pager, String gradeId) {
		Session session = this.getSessionFactory().getCurrentSession();
		Query query = session.createQuery("select stuId from Stu where gradeId = ?");
		query.setParameter(0, gradeId);
		List<Object> list = query.list();
		Criteria c = session.createCriteria(StuChecking.class).add(Restrictions.in("stu.stuId", list)); // 条件查询
		List<StuChecking> scores = c.list();
		for(StuChecking s : scores){
			System.out.println(s.getChecking1());
			System.out.println(s.getChecking2());
			System.out.println(s.getChecking3());
		}
		pager.setRows(scores);
		pager.setTotal(scores.size());
		return pager;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<StuChecking> queryAll(String gradeId) {
		Session session = this.getSessionFactory().getCurrentSession();
		Query query = session.createQuery("select stuId from Stu where gradeId = ?");
		query.setParameter(0, gradeId);
		List<Object> list = query.list();
		Criteria c = session.createCriteria(StuChecking.class).add(Restrictions.in("stu.stuId", list)); // 条件查询
		List<StuChecking> scores = c.list();
		return scores;
	}

	//根据月份查找考勤
	@SuppressWarnings("unchecked")
	@Override
	public List<StuChecking> queryByMonth(String gradeId, String startMonth, String endMonth) {
		Session session = this.getSessionFactory().getCurrentSession();
		Query query = session.createSQLQuery("select * from t_stuChecking where  checkingday between '"+ startMonth +"' and '"+endMonth+"' and stuid in (select stuid from t_stu where gradeid = '"+ gradeId+"')").addEntity(StuChecking.class);
  		List<StuChecking> t = (List<StuChecking>)query.list();
		return t;
	}

	

}
