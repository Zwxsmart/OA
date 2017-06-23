package com.cs.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;

import com.cs.bean.Goods;
import com.cs.bean.Grade;
import com.cs.commom.bean.Pager4EasyUI;

public class GoodsDAOImpl extends AbstractBaseDAO<Goods> implements GoodsDAO {

	@Override
	public void updateQuantity(String beanName, String beanId, int quantity, String id) {
		SessionFactory sessionFactory = super.getSessionFactory();
  		Session session = sessionFactory.getCurrentSession();
  		String hql = "update "+beanName+" set quantity = :quantity where "+beanId+"= :id";
  		Query query = session.createQuery(hql);
  		query.setParameter("quantity", quantity);
  		query.setParameter("id", id);
  		query.executeUpdate();
		
	}

	@Override
	public Pager4EasyUI<Goods> blurredAllQueryPager(String string, Pager4EasyUI<Goods> pager, String value,
			String name) {
		Session session = this.getSessionFactory().getCurrentSession();
		if(name.equals("name")){
        	// 根据bean类增加like查询, name为bean中属性, value为用户在搜索框的值 
        	Criteria c = session.createCriteria(Goods.class).add(Restrictions.like(name, "%"+value+"%"));
        	@SuppressWarnings("unchecked")
			List<Goods> list = (List<Goods>)c.list();
			pager.setRows(list);
			pager.setTotal(list.size());
		}else if(name.equals("type")){
			Criteria goodsCriteria = session.createCriteria(Goods.class);
        	Criteria typeCriteria = goodsCriteria.createCriteria("goodsType");
        	typeCriteria.add(Restrictions.like("name", "%"+value+"%"));
        	@SuppressWarnings("unchecked")
			List<Goods> list = (List<Goods>)goodsCriteria.list();
			pager.setRows(list);
			pager.setTotal(list.size());
		}
		return pager;
	}
	
	/**
	 * 实现申购数量的物品加法
	 */
	public void updateAppQuantity(int appCount, String id) {
		SessionFactory sessionFactory = super.getSessionFactory();
  		Session session = sessionFactory.getCurrentSession();
  		String sql = "update t_goods t set t.quantity = "+appCount+"+ t.quantity, t.quantitycount = "+appCount+" + t.quantitycount where t.name = '"+id+"';";
  		Query query = session.createSQLQuery(sql);
  		query.executeUpdate();
	}

}
