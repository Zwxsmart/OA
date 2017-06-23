package com.cs.dao;

import com.cs.bean.Room;

/**
 *学生宿舍增删改查
 * @author 温鑫
 *
 */
public interface RoomDAO extends BaseDAO<Room> {
	public void addStuByIds(String gradeId,String[] split);

	public void delStuByIds(String gradeId, String studentId, String[] split);

	public String queryStuId(String roomId);
}
