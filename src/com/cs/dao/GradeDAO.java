package com.cs.dao;

import com.cs.bean.Grade;

public interface GradeDAO extends BaseDAO<Grade> {

	public void addStuByIds(String gradeId,String[] split);

	public void delStuByIds(String gradeId, String[] split);

}
