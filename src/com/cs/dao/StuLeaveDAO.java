package com.cs.dao;

import com.cs.bean.StuLeave;

/**
 * 学生分数DAO
 * @author 张文星
 *
 */
public interface StuLeaveDAO extends BaseDAO<StuLeave> {

	public void stuPass(String sql);

}
