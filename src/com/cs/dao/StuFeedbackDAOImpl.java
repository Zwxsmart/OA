package com.cs.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import com.cs.bean.Grade;
import com.cs.bean.StuFeedback;
import com.cs.commom.bean.Pager4EasyUI;

/**
 * 学生反馈DAO实现
 * @author 张文星
 *
 */
public class StuFeedbackDAOImpl extends AbstractBaseDAO<StuFeedback> implements StuFeedbackDAO{

	@Override
	public Pager4EasyUI<StuFeedback> blurredAllQueryPager(String string, Pager4EasyUI<StuFeedback> pager, String value,
			String name) {
		Session session = this.getSessionFactory().getCurrentSession();
		if(name.equals("stu")){
			Criteria stuFeedbackCriteria = session.createCriteria(StuFeedback.class);
        	Criteria stuCriteria = stuFeedbackCriteria.createCriteria("stu");
        	stuCriteria.add(Restrictions.like("name", "%"+value+"%"));
        	@SuppressWarnings("unchecked")
			List<StuFeedback> list = (List<StuFeedback>)stuFeedbackCriteria.list();
			pager.setRows(list);
			pager.setTotal(list.size());
		}else if(name.equals("grade")){
			Criteria stuFeedbackCriteria = session.createCriteria(StuFeedback.class);
        	Criteria stuCriteria = stuFeedbackCriteria.createCriteria("stu");
        	Criteria gradeCriteria = stuCriteria.createCriteria("grade");
        	gradeCriteria.add(Restrictions.like("name", "%"+value+"%"));
        	@SuppressWarnings("unchecked")
			List<StuFeedback> list = (List<StuFeedback>)gradeCriteria.list();
			pager.setRows(list);
			pager.setTotal(list.size());
		}
		return pager;
	}

}
