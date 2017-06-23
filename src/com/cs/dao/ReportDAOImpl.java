package com.cs.dao;

import java.sql.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import com.cs.bean.Report;
import com.cs.commom.bean.Pager4EasyUI;

public class ReportDAOImpl extends AbstractBaseDAO<Report> implements ReportDAO {

	@Override
	public Pager4EasyUI<Report> blurredAllQueryPager(String string, Pager4EasyUI<Report> pager, String value, String name) {
		Session session = this.getSessionFactory().getCurrentSession();
		if(name.equals("all")){
		}else if(name.equals("name")){
			Criteria stuCriteria = session.createCriteria(Report.class);
        	Criteria empCriteria = stuCriteria.createCriteria("emp");
        	empCriteria.add(Restrictions.like("name", "%"+value+"%"));
        	@SuppressWarnings("unchecked")
			List<Report> list = (List<Report>)stuCriteria.list();
			pager.setRows(list);
			pager.setTotal(list.size());
		}
		return pager;
	}

	
	//分页查询所有禁用
		@Override
		public Pager4EasyUI<Report> queryFreezeByPager(String string, Pager4EasyUI<Report> pager) {
			Session session = this.getSessionFactory().getCurrentSession();
	        Query query = session.createQuery("from "+string+" where status = 0");
	        query.setFirstResult(pager.getBeginIndex());
	        query.setMaxResults(pager.getPageSize());
	        @SuppressWarnings("unchecked")
			List<Report> list = (List<Report>) query.list();
	        pager.setRows(list);
	        return pager;
		}
		
		
		//分页查询所有禁用人数
		@Override
		public long freezeCount(String string) {
			 Session session = this.getSessionFactory().getCurrentSession();
		        Query query = session.createQuery("select count(*) from " + string+" where status=0");
		        Long aLong = (long) query.uniqueResult();
		        return aLong;
		}
		
		//分页查询所有启用
		@Override
		public Pager4EasyUI<Report> queryFreezeByPager1(String string, Pager4EasyUI<Report> pager) {
			Session session = this.getSessionFactory().getCurrentSession();
	        Query query = session.createQuery("from "+string+" where status = 1");
	        query.setFirstResult(pager.getBeginIndex());
	        query.setMaxResults(pager.getPageSize());
	        @SuppressWarnings("unchecked")
			List<Report> list = (List<Report>) query.list();
	        pager.setRows(list);
	        return pager;
		}
		//分页查询所有启用人数
		@Override
		public long freezeCount1(String string) {
			 Session session = this.getSessionFactory().getCurrentSession();
		        Query query = session.createQuery("select count(*) from " + string+" where status=1");
		        Long aLong = (long) query.uniqueResult();
		        return aLong;
		}
		
	
}
