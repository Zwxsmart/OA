package com.cs.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import com.cs.bean.Talk;
import com.cs.commom.bean.Pager4EasyUI;

/**
 * 学生谈心DAO实现
 * @author 张文星
 *
 */
public class TalkDAOImpl extends AbstractBaseDAO<Talk> implements TalkDAO{

	@Override
	public Pager4EasyUI<Talk> blurredAllQueryPager(String string, Pager4EasyUI<Talk> pager, String value, String name) {
		Session session = this.getSessionFactory().getCurrentSession();
		if(name.equals("name")){
        	Criteria talkCriteria = session.createCriteria(Talk.class);
        	Criteria stuCriteria = talkCriteria.createCriteria("stu");
        	stuCriteria.add(Restrictions.like(name, "%"+value+"%"));
        	@SuppressWarnings("unchecked")
			List<Talk> list = (List<Talk>)talkCriteria.list();
			pager.setRows(list);
		}
		return pager;
	}
}
