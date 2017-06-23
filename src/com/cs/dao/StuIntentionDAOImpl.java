package com.cs.dao;


import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;

import com.cs.bean.Income;
import com.cs.bean.Stu;
import com.cs.commom.bean.Pager4EasyUI;

/**
 *市场管理增删改查DAO实现
 * @author 温鑫
 *
 */
public class StuIntentionDAOImpl extends AbstractBaseDAO<Stu> implements StuIntentionDAO {
	
	//分页查询所有意向学生
	@Override
	public Pager4EasyUI<Stu> queryAssignByPager(String string, Pager4EasyUI<Stu> pager) {
		Session session = this.getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from "+string+" where stuStatus = 'intention'");
        query.setFirstResult(pager.getBeginIndex());
        query.setMaxResults(pager.getPageSize());
        @SuppressWarnings("unchecked")
		List<Stu> list = (List<Stu>) query.list();
        pager.setRows(list);
        return pager;
	}
	
	
	//分页查询所有意向人数
	@Override
	public long assignCount(String string) {
		 Session session = this.getSessionFactory().getCurrentSession();
	        Query query = session.createQuery("select count(*) from " + string+" where stuStatus = 'intention'");
	        Long aLong = (long) query.uniqueResult();
	        return aLong;
	}
	
	
	//分页查询所有禁用意向学生
	@Override
	public Pager4EasyUI<Stu> queryFreezeByPager(String string, Pager4EasyUI<Stu> pager) {
		Session session = this.getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from "+string+" where status = 0  and stuStatus = 'intention'");
        query.setFirstResult(pager.getBeginIndex());
        query.setMaxResults(pager.getPageSize());
        @SuppressWarnings("unchecked")
		List<Stu> list = (List<Stu>) query.list();
        pager.setRows(list);
        return pager;
	}
	
	
	//分页查询所有禁用意向人数
	@Override
	public long freezeCount(String string) {
		 Session session = this.getSessionFactory().getCurrentSession();
	        Query query = session.createQuery("select count(*) from " + string+" where status=0  and stuStatus = 'intention'");
	        Long aLong = (long) query.uniqueResult();
	        return aLong;
	}
	
	//分页查询所有启用意向学生
	@Override
	public Pager4EasyUI<Stu> queryFreezeByPager1(String string, Pager4EasyUI<Stu> pager) {
		Session session = this.getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from "+string+" where status = 1  and stuStatus = 'intention'");
        query.setFirstResult(pager.getBeginIndex());
        query.setMaxResults(pager.getPageSize());
        @SuppressWarnings("unchecked")
		List<Stu> list = (List<Stu>) query.list();
        pager.setRows(list);
        return pager;
	}
	//分页查询所有启用意向人数
	@Override
	public long freezeCount1(String string) {
		 Session session = this.getSessionFactory().getCurrentSession();
	        Query query = session.createQuery("select count(*) from " + string+" where status=1 and stuStatus = 'intention'");
	        Long aLong = (long) query.uniqueResult();
	        return aLong;
	}
	
	
	//模糊查询
	@Override
	public Pager4EasyUI<Stu> blurredAllQueryPager(String string, Pager4EasyUI<Stu> pager, String value, String name) {
		Session session = this.getSessionFactory().getCurrentSession();
		if(name.equals("all")){
			Criteria c = session.createCriteria(Stu.class).add(Restrictions.like("name", "%"+value+"%")).add(Restrictions.like("phone", "%"+value+"%"))
					.add(Restrictions.like("qq", "%"+value+"%")).add(Restrictions.like("school", "%"+value+"%"));
			@SuppressWarnings("unchecked")
			List<Stu> list = (List<Stu>)c.list();
			pager.setRows(list);
        }else {
        	// 根据bean类增加like查询, name为bean中属性, value为用户在搜索框的值
        	Criteria c = session.createCriteria(Stu.class).add(Restrictions.like(name, "%"+value+"%")).add(Restrictions.eq("stuStatus", "intention"));
			@SuppressWarnings("unchecked")
			List<Stu> list = (List<Stu>)c.list();
			pager.setRows(list);
		}
		return pager;
	}
	
	
	//模糊查询人数
	@Override
	public long blurredAllQueryCount(String string, Pager4EasyUI<Stu> pager, String value, String name) {
		Session session = this.getSessionFactory().getCurrentSession();
		if(name.equals("all")){
			Criteria c = session.createCriteria(Stu.class).add(Restrictions.like("name", "%"+value+"%")).add(Restrictions.like("phone", "%"+value+"%"))
					.add(Restrictions.like("qq", "%"+value+"%")).add(Restrictions.like("school", "%"+value+"%"));
			@SuppressWarnings("unchecked")
			List<Stu> list = (List<Stu>)c.list();
			return list.size();
        }else {
        	Criteria c = session.createCriteria(Stu.class).add(Restrictions.like(name, "%"+value+"%")).add(Restrictions.eq("stuStatus", "intention"));
			@SuppressWarnings("unchecked")
			List<Stu> list = (List<Stu>)c.list();
			return list.size();
		}
	}

	//禁用启用状态操作
      public void updateStatus(String beanName,String beanId,int status,String id) {
    	SessionFactory sessionFactory = this.getSessionFactory();
  		Session session = sessionFactory.getCurrentSession();
  		String hql = "update "+beanName+" set status = :status where "+beanId+"= :id";
  		Query query = session.createQuery(hql);
  		query.setParameter("status", status);
  		query.setParameter("id", id);
  		query.executeUpdate();
  	}

    //转为预定学生
	@Override
	public void updateIntention(String beanName,String intention, String id) {
			Session session = this.getSessionFactory().getCurrentSession();
	  		Query query = session.createQuery("update "+beanName+" set stuStatus = '"+intention+"' where stuId = '"+id+"'");
	  		query.executeUpdate();
	  	}
	
	
	  //转为正式学生
  	@Override
  	public void updatePredetermine(String beanName,String predetermine, String id) {
  			Session session = this.getSessionFactory().getCurrentSession();
  	  		Query query = session.createQuery("update "+beanName+" set stuStatus = '"+predetermine+"' where stuId = '"+id+"'");
  	  		query.executeUpdate();
  	  	}
}
