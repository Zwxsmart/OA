package com.cs.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;

import com.cs.bean.Goods;
import com.cs.bean.GoodsApp;
import com.cs.bean.GoodsType;
import com.cs.commom.bean.Pager4EasyUI;

public class GoodsAppDAOImpl extends AbstractBaseDAO<GoodsApp> implements GoodsAppDAO {

	@Override
	public void updateAppStatus(String beanName, String beanId, int appStatus, String id) {
		SessionFactory sessionFactory = this.getSessionFactory();
  		Session session = sessionFactory.getCurrentSession();
  		String hql = "update "+beanName+" set appStatus = :appStatus where "+beanId+"= :id";
  		Query query = session.createQuery(hql);
  		query.setParameter("appStatus", appStatus);
  		query.setParameter("id", id);
  		query.executeUpdate();
	}
	

	@Override
	public Pager4EasyUI<GoodsApp> blurredAllQueryPager(String string, Pager4EasyUI<GoodsApp> pager, String value,
			String name) {
		Session session = this.getSessionFactory().getCurrentSession();
		if(name.equals("goodsName")){
        	// 根据bean类增加like查询, name为bean中属性, value为用户在搜索框的值 
        	Criteria c = session.createCriteria(GoodsApp.class).add(Restrictions.like(name, "%"+value+"%"));
        	@SuppressWarnings("unchecked")
			List<GoodsApp> list = (List<GoodsApp>)c.list();
			pager.setRows(list);
			pager.setTotal(list.size());
		}else if(name.equals("empp")){
			Criteria goodsAppCriteria = session.createCriteria(GoodsApp.class);
        	Criteria emppCriteria = goodsAppCriteria.createCriteria("emp");
        	emppCriteria.add(Restrictions.like("name", "%"+value+"%"));
        	@SuppressWarnings("unchecked")
			List<GoodsApp> list = (List<GoodsApp>)goodsAppCriteria.list();
			pager.setRows(list);
			pager.setTotal(list.size());
		}
		return pager;
	}

}
