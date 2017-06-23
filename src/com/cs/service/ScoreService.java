package com.cs.service;

import java.util.List;

import com.cs.bean.Score;
import com.cs.commom.bean.Pager4EasyUI;

/**
 * ѧ������service
 * @author ������
 *
 */
public interface ScoreService extends BaseService<Score> {

	public Pager4EasyUI<Score> queryStuScore(Pager4EasyUI<Score> pager, String gradeId, String courseId);

	public Pager4EasyUI<Score> queryStuScoreById(Pager4EasyUI<Score> pager, String stuId);
	public List<Score> queryAll(String beanName);
}
