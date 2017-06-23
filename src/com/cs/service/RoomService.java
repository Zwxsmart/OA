package com.cs.service;

import com.cs.bean.Room;
import com.cs.dao.BaseDAO;

/**
 * 学生service层
 * @author 温鑫
 *
 */
public interface RoomService extends BaseDAO<Room>{
		// 添加学生
		public void addStuByIds(String gradeId,String[] split);
		// 删除学生
		public void delStuByIds(String gradeId, String studentId, String[] split);
		public String queryStuId(String roomId);
		
}
