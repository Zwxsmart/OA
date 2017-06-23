package com.cs.dao;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;

import com.cs.bean.Check;
import com.cs.bean.GoodsUse;
import com.cs.commom.bean.Pager4EasyUI;

public class GoodsUseDAOImpl extends AbstractBaseDAO<GoodsUse> implements GoodsUseDAO {

	@Override
	public void updateUseStatus(String beanName, String beanId, int usestatus, String id) {
		 	SessionFactory sessionFactory = super.getSessionFactory();
	  		Session session = sessionFactory.getCurrentSession();
	  		String hql = "update "+beanName+" set usestatus = :usestatus where "+beanId+"= :id";
	  		Query query = session.createQuery(hql);
	  		query.setParameter("usestatus", usestatus);
	  		query.setParameter("id", id);
	  		query.executeUpdate();		
	}

	@Override
	public void updateGoodsQuantity(String beanName, String beanId, int quantity, String id) {
	 	SessionFactory sessionFactory = super.getSessionFactory();
  		Session session = sessionFactory.getCurrentSession();
  		String hql = "update "+beanName+" set quantity = :quantity where "+beanId+"= :id";
  		Query query = session.createQuery(hql);
  		query.setParameter("quantity", quantity);
  		query.setParameter("id", id);
  		query.executeUpdate();		
	}

	@Override
	public void updateUseRequestDate(String beanName, String beanId, Serializable returnday, String id) {
		SessionFactory sessionFactory = super.getSessionFactory();
  		Session session = sessionFactory.getCurrentSession();
  		String hql = "update "+beanName+" set returnday = :returnday where "+beanId+"= :id";
  		Query query = session.createQuery(hql);
  		query.setParameter("returnday",returnday);
  		query.setParameter("id", id);
  		query.executeUpdate();	
	}

	@Override
	public Pager4EasyUI<GoodsUse> blurredAllQueryPager(String string, Pager4EasyUI<GoodsUse> pager, String value,
			String name) {
		Session session = this.getSessionFactory().getCurrentSession();
		if(name.equals("goodsname")){
			Criteria goodsUseCriteria = session.createCriteria(GoodsUse.class);
			Criteria goodsCriteria = goodsUseCriteria.createCriteria("goods");
			goodsCriteria.add(Restrictions.like("name", "%"+value+"%"));
			@SuppressWarnings("unchecked")
			List<GoodsUse> list = (List<GoodsUse>)goodsUseCriteria.list();
			pager.setRows(list);
			pager.setTotal(list.size());
		}else if(name.equals("empp")){
			Criteria goodsUseCriteria = session.createCriteria(GoodsUse.class);
			Criteria emppCriteria = goodsUseCriteria.createCriteria("emp");
			emppCriteria.add(Restrictions.like("name", "%"+value+"%"));
			@SuppressWarnings("unchecked")
			List<GoodsUse> list = (List<GoodsUse>)goodsUseCriteria.list();
			pager.setRows(list);
			pager.setTotal(list.size());
		}
		return pager;
	}

}
