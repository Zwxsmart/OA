package com.cs.service;

import com.cs.bean.Grade;

/**
 * �༶service
 * @author ������
 *
 */
public interface GradeService extends BaseService<Grade> {
	// ���ѧ��
	public void addStuByIds(String gradeId,String[] split);
	// ɾ��ѧ��
	public void delStuByIds(String gradeId, String[] split);

}
