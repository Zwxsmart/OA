package com.cs.service;

import java.io.Serializable;

import com.cs.bean.Room;
import com.cs.commom.bean.Pager4EasyUI;
import com.cs.dao.RoomDAO;

/**
 * 学生service层实现
 * @author 温鑫
 *
 */
public class RoomServiceImpl implements RoomService {
	
	private RoomDAO roomDAO;

	

	public RoomDAO getRoomDAO() {
		return roomDAO;
	}

	public void setRoomDAO(RoomDAO roomDAO) {
		this.roomDAO = roomDAO;
	}

	@Override
	public Room save(Room r) {
		return roomDAO.save(r);
	}

	@Override
	public void delete(Room r) {
		roomDAO.delete(r);		
	}

	@Override
	public void update(Room r) {
		roomDAO.update(r);		
	}

	@Override
	public Room queryById(Class<?> clazz, Serializable id) {
		return roomDAO.queryById(clazz, id);
	}

	@Override
	public Pager4EasyUI<Room> queryByPager(String beanName, Pager4EasyUI<Room> pager, String sql) {
		return roomDAO.queryByPager(beanName, pager, sql);
	}

	@Override
	public long count(String beanName, String sql) {
		return roomDAO.count(beanName,sql);
	}

	@Override
	public void updateStatus(String beanName, String beanId, int status, String id) {
		roomDAO.updateStatus(beanName, beanId, status, id);
	}
	@Override
	public void addStuByIds(String gradeId, String[] split) {
		roomDAO.addStuByIds(gradeId,split);
	}

	@Override
	public void delStuByIds(String gradeId, String studentId, String[] split) {
		roomDAO.delStuByIds(gradeId, studentId, split);
	}

	@Override
	public Pager4EasyUI<Room> queryByDay(Pager4EasyUI<Room> pager, Serializable startDay, Serializable endDay,
			Serializable beanObject, Serializable attrName) {
		return roomDAO.queryByDay(pager, startDay, endDay, beanObject, attrName);
	}

	@Override
	public Pager4EasyUI<Room> blurredAllQueryPager(String string, Pager4EasyUI<Room> pager, String value, String name) {
		return roomDAO.blurredAllQueryPager(string, pager, value, name);
	}

	@Override
	public boolean queryPrevillige(String roleId, String actionName) {
		return roomDAO.queryPrevillige(roleId, actionName);
	}

	@Override
	public String queryStuId(String roomId) {
		return roomDAO.queryStuId(roomId);
	}
}
