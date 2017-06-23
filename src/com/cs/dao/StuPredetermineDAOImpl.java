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
 *�г�������ɾ�Ĳ�DAOʵ��
 * @author ����
 *
 */
public class StuPredetermineDAOImpl extends AbstractBaseDAO<Stu> implements StuPredetermineDAO {
	
	//��ҳ��ѯ����Ԥ��ѧ��
	@Override
	public Pager4EasyUI<Stu> queryAssignByPager(String string, Pager4EasyUI<Stu> pager) {
		Session session = this.getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from "+string+" where stuStatus = 'predetermine'");
        query.setFirstResult(pager.getBeginIndex());
        query.setMaxResults(pager.getPageSize());
        @SuppressWarnings("unchecked")
		List<Stu> list = (List<Stu>) query.list();
        pager.setRows(list);
        return pager;
	}
	
	//��ҳ��ѯ����Ԥ������
	@Override
	public long assignCount(String string) {
		 Session session = this.getSessionFactory().getCurrentSession();
	        Query query = session.createQuery("select count(*) from " + string+" where stuStatus = 'predetermine'");
	        Long aLong = (long) query.uniqueResult();
	        return aLong;
	}
	
	
	//��ҳ��ѯ���н���Ԥ��ѧ��
	@Override
	public Pager4EasyUI<Stu> queryFreezeByPager(String string, Pager4EasyUI<Stu> pager) {
		Session session = this.getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from "+string+" where status = 0  and stuStatus = 'predetermine'");
        query.setFirstResult(pager.getBeginIndex());
        query.setMaxResults(pager.getPageSize());
        @SuppressWarnings("unchecked")
		List<Stu> list = (List<Stu>) query.list();
        pager.setRows(list);
        return pager;
	}
	
	
	//��ҳ��ѯ���н���Ԥ������
	@Override
	public long freezeCount(String string) {
		 Session session = this.getSessionFactory().getCurrentSession();
	        Query query = session.createQuery("select count(*) from " + string+" where status=0  and stuStatus = 'predetermine'");
	        Long aLong = (long) query.uniqueResult();
	        return aLong;
	}
	
	//��ҳ��ѯ��������Ԥ��ѧ��
	@Override
	public Pager4EasyUI<Stu> queryFreezeByPager1(String string, Pager4EasyUI<Stu> pager) {
		Session session = this.getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from "+string+" where status = 1  and stuStatus = 'predetermine'");
        query.setFirstResult(pager.getBeginIndex());
        query.setMaxResults(pager.getPageSize());
        @SuppressWarnings("unchecked")
		List<Stu> list = (List<Stu>) query.list();
        pager.setRows(list);
        return pager;
	}
	//��ҳ��ѯ��������Ԥ������
	@Override
	public long freezeCount1(String string) {
		 Session session = this.getSessionFactory().getCurrentSession();
	        Query query = session.createQuery("select count(*) from " + string+" where status=1 and stuStatus = 'predetermine'");
	        Long aLong = (long) query.uniqueResult();
	        return aLong;
	}
	
	
	//ģ����ѯ
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
        	// ����bean������like��ѯ, nameΪbean������, valueΪ�û����������ֵ
        	Criteria c = session.createCriteria(Stu.class).add(Restrictions.like(name, "%"+value+"%")).add(Restrictions.eq("stuStatus", "predetermine"));
			@SuppressWarnings("unchecked")
			List<Stu> list = (List<Stu>)c.list();
			pager.setRows(list);
		}
		return pager;
	}
	
	
	//ģ����ѯ����
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
        	Criteria c = session.createCriteria(Stu.class).add(Restrictions.like(name, "%"+value+"%")).add(Restrictions.eq("stuStatus", "predetermine"));
			@SuppressWarnings("unchecked")
			List<Stu> list = (List<Stu>)c.list();
			return list.size();
		}
	}

	//��������״̬����
      public void updateStatus(String beanName,String beanId,int status,String id) {
    	SessionFactory sessionFactory = this.getSessionFactory();
  		Session session = sessionFactory.getCurrentSession();
  		String hql = "update "+beanName+" set status = :status where "+beanId+"= :id";
  		Query query = session.createQuery(hql);
  		query.setParameter("status", status);
  		query.setParameter("id", id);
  		query.executeUpdate();
  	}
  	
      
      //תΪ��ʽѧ��
  	@Override
  	public void updatePredetermine(String beanName,String predetermine, String id) {
  			Session session = this.getSessionFactory().getCurrentSession();
  	  		Query query = session.createQuery("update "+beanName+" set stuStatus = '"+predetermine+"' where stuId = '"+id+"'");
  	  		query.executeUpdate();
  	  	}
}
