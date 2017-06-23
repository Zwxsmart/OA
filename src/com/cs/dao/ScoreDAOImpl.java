package com.cs.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import com.cs.bean.Score;
import com.cs.commom.bean.Pager4EasyUI;

/**
 * 学生分数DAO实现
 * @author 张文星
 *
 */
public class ScoreDAOImpl extends AbstractBaseDAO<Score> implements ScoreDAO{

	@Override
	public Pager4EasyUI<Score> queryStuScore(Pager4EasyUI<Score> pager, String gradeId,String courseId) {
		Session session = this.getSessionFactory().getCurrentSession();
		Query query = session.createQuery("select stuId from Stu where gradeId = ?");
		query.setParameter(0, gradeId);
		List<Object> list = query.list();
		if(list.size() > 0){
			Criteria c = session.createCriteria(Score.class).add(Restrictions.in("stu.stuId", list)).add(Restrictions.eq("courseId",courseId)); // 条件查询
			List<Score> scores = c.list();
			pager.setRows(scores);
			pager.setTotal(scores.size());
		}
		return pager;
	}

	@Override
	public Pager4EasyUI<Score> blurredAllQueryPager(String string, Pager4EasyUI<Score> pager, String value,
			String name) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Pager4EasyUI<Score> queryStuScoreById(Pager4EasyUI<Score> pager, String stuId) {
		Session session = this.getSessionFactory().getCurrentSession();
		Criteria c = session.createCriteria(Score.class).add(Restrictions.eq("stuId", stuId)); // 条件查询
		List<Score> scores = c.list();
		pager.setRows(scores);
		pager.setTotal(scores.size());
		return pager;
	}

	@Override
	public List<Score> queryAll(String beanName) {
		Session session = this.getSessionFactory().getCurrentSession();
		Query query=session.createQuery("from "+beanName);
		@SuppressWarnings("unchecked")
		List<Score> scoreList=query.list();
		return scoreList;
	}

}
