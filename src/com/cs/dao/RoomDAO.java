package com.cs.dao;

import com.cs.bean.Room;

/**
 *ѧ��������ɾ�Ĳ�
 * @author ����
 *
 */
public interface RoomDAO extends BaseDAO<Room> {
	public void addStuByIds(String gradeId,String[] split);

	public void delStuByIds(String gradeId, String studentId, String[] split);

	public String queryStuId(String roomId);
}
