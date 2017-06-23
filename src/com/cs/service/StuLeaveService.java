package com.cs.service;

import com.cs.bean.StuLeave;

/**
 * 学生分数service
 * @author 张文星
 *
 */
public interface StuLeaveService extends BaseService<StuLeave> {

	public void stuPass(String sql);

}
