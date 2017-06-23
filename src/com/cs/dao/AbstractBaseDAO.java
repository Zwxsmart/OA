package com.cs.dao;
import com.cs.commom.bean.Pager4EasyUI;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;

import java.io.Serializable;
import java.util.List;

public abstract class AbstractBaseDAO<T> extends HibernateDaoSupport implements BaseDAO<T>  {
	
	/**
     * 添加
     * @param t
     * @return
     */
    public T save(T t) {
        this.getHibernateTemplate().save(t);
        return t;
    }

    /**
     * 删除
     * @param t
     */
    public void delete(T t) {
        this.getHibernateTemplate().delete(t);
    }

    /**
     * 修改
     * @param t
     */
    public void update(T t) {
        this.getHibernateTemplate().update(t);
    }

    /**
     * 查询id
     * @param clazz
     * @param id
     * @return
     */
    @SuppressWarnings("unchecked")
	public T queryById(Class<?> clazz, Serializable id) {
        return (T) this.getHibernateTemplate().get(clazz, id);
    }
    
  

    /**
     * 分页查询
     * @param beanName
     * @param pager
     * @return
     */
    public Pager4EasyUI<T> queryByPager(String beanName, Pager4EasyUI<T> pager, String sql) {
        Session session = this.getSessionFactory().getCurrentSession();
        System.out.println("from " + beanName + sql);
        Query query = session.createQuery("from " + beanName + sql);
        query.setFirstResult(pager.getBeginIndex());
        query.setMaxResults(pager.getPageSize());
        @SuppressWarnings("unchecked")
		List<T> list = (List<T>) query.list();
        pager.setRows(list);
        pager.setTotal(list.size());
        return pager;
    }

    /**
     * 记录总数
     * @param beanName
     * @return
     */
    public long count(String beanName, String sql) {
        Session session = this.getSessionFactory().getCurrentSession();
        Query query = session.createQuery("select count(*) from " + beanName+sql);
//        SQLQuery sqlQuery = session.createSQLQuery("select count(*) from " + beanName);
        Long aLong = (long) query.uniqueResult();
        return aLong;
    }
    
    /**
  	 * 模糊搜索名字, 身份证号, 手机号, 部门
  	 * @param name
  	 * @return
  	 */
      
      public List<T> queryByCheckin(String filedName, String name, String beanName) {
      	SessionFactory sessionFactory = this.getSessionFactory();
  		Session session = sessionFactory.openSession();
  		Query query = (Query)session.createQuery("from "+beanName+" where "+filedName+" like '"+name+"%%'");
  		@SuppressWarnings("unchecked")
  		List<T> emp = query.list();
  		return emp;
      }
    
     /**
  	 * 修改状态
  	 */
      public void updateStatus(String beanName,String beanId,int status,String id) {
    	 SessionFactory sessionFactory = this.getSessionFactory();
  		Session session = sessionFactory.getCurrentSession();
  		String hql = "update "+beanName+" set status = :status where "+beanId+"= :id";
  		Query query = session.createQuery(hql);
  		query.setParameter("status", status);
  		query.setParameter("id", id);
  		query.executeUpdate();
  	}
    
      /**
  	 * 根据时间查询
  	 */
  	
  	public Pager4EasyUI<T> queryByDay(Pager4EasyUI<T> pager, Serializable startDay,
  		Serializable endDay, Serializable beanObject, Serializable attrName) {
  		Session session = this.getSessionFactory().getCurrentSession();
  		Query query = session.createQuery("from "+beanObject+" where "+attrName+" > ? and "+attrName+" < ?");
  		System.out.println("from "+beanObject+" where "+attrName+" > ? and "+attrName+" < ?");
  		query.setString(0, (String)startDay);
  		query.setString(1,(String)endDay);
  		query.setFirstResult(pager.getBeginIndex());
  		query.setMaxResults(pager.getPageSize());
  		List<T> t = query.list();
  		if (t.size() > 0) {
  			pager.setRows(t);
  		}
  		return pager;
  	}
  	@Override
	public boolean queryPrevillige(String roleId, String actionName) {
		Session session = this.getSessionFactory().getCurrentSession();
		Query query = session.createSQLQuery("select rp.id, rp.preid, rp.roleid from t_role role, t_previllige pre, t_role_pre rp where role.roleid = rp.roleid and pre.id = rp.preid and pre.name = '"+ actionName +"' and rp.roleid = '"+ roleId +"'");
		System.out.println(query.list().size());
		if(query.list().size() >0){
			return true;
		}
		return false;
	}
      
}
