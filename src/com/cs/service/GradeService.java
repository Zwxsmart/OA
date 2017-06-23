package com.cs.service;

import com.cs.bean.Grade;

/**
 * 班级service
 * @author 张文星
 *
 */
public interface GradeService extends BaseService<Grade> {
	// 添加学生
	public void addStuByIds(String gradeId,String[] split);
	// 删除学生
	public void delStuByIds(String gradeId, String[] split);

}
