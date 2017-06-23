package com.cs.service;

import java.io.Serializable;
import java.util.List;

import com.cs.bean.Score;
import com.cs.commom.bean.Pager4EasyUI;
import com.cs.dao.ScoreDAO;

/**
 * 学生分数service实现
 * @author 张文星
 *
 */
public class ScoreServiceImpl implements ScoreService {
	
	private ScoreDAO scoreDAO;

	public ScoreDAO getScoreDAO() {
		return scoreDAO;
	}

	public void setScoreDAO(ScoreDAO scoreDAO) {
		this.scoreDAO = scoreDAO;
	}

	@Override
	public Score save(Score t) {
		return scoreDAO.save(t);
	}

	@Override
	public void delete(Score t) {
		scoreDAO.delete(t);		
	}

	@Override
	public void update(Score t) {
		scoreDAO.update(t);		
	}

	@Override
	public Score queryById(Class<?> clazz, Serializable id) {
		return scoreDAO.queryById(clazz, id);
	}

	@Override
	public Pager4EasyUI<Score> queryByPager(String beanName, Pager4EasyUI<Score> pager, String sql) {
		return scoreDAO.queryByPager(beanName, pager, sql);
	}

	@Override
	public long count(String beanName, String sql) {
		return scoreDAO.count(beanName,sql);
	}

	@Override
	public void updateStatus(String beanName, String beanId, int status, String id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Pager4EasyUI<Score> queryStuScore(Pager4EasyUI<Score> pager, String gradeId,String courseId) {
		return scoreDAO.queryStuScore(pager, gradeId,courseId);
	}

	@Override
	public Pager4EasyUI<Score> queryByDay(Pager4EasyUI<Score> pager, Serializable startDay, Serializable endDay,
			Serializable beanObject, Serializable attrName) {
		return scoreDAO.queryByDay(pager, startDay, endDay, beanObject, attrName);
	}

	@Override
	public Pager4EasyUI<Score> blurredAllQueryPager(String string, Pager4EasyUI<Score> pager, String value,
			String name) {
		return scoreDAO.blurredAllQueryPager(string, pager, value, name);
	}

	@Override
	public Pager4EasyUI<Score> queryStuScoreById(Pager4EasyUI<Score> pager, String stuId) {
		return scoreDAO.queryStuScoreById(pager, stuId);
	}

	@Override
	public boolean queryPrevillige(String roleId, String actionName) {
		return scoreDAO.queryPrevillige(roleId, actionName);
	}

	@Override
	public List<Score> queryAll(String beanName) {
		return scoreDAO.queryAll(beanName);
	}

}
