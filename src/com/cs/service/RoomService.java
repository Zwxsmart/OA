package com.cs.service;

import com.cs.bean.Room;
import com.cs.dao.BaseDAO;

/**
 * ѧ��service��
 * @author ����
 *
 */
public interface RoomService extends BaseDAO<Room>{
		// ���ѧ��
		public void addStuByIds(String gradeId,String[] split);
		// ɾ��ѧ��
		public void delStuByIds(String gradeId, String studentId, String[] split);
		public String queryStuId(String roomId);
		
}
