package com.cs.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.hibernate.jdbc.Work;

import com.cs.bean.Room;
import com.cs.bean.Stu;
import com.cs.commom.bean.Pager4EasyUI;

/**
 *学生宿舍增删改查
 * @author 温鑫
 *
 */
public class RoomDAOImpl extends AbstractBaseDAO<Room> implements RoomDAO {
	public void addStuByIds(String roomId, String[] split) {
		Session session = this.getSessionFactory().getCurrentSession();
		session.doWork(new Work() {
			@Override
			public void execute(Connection conn) throws SQLException {
				Statement stmt = conn.createStatement();
				for (int i = 0, len = split.length; i < len; i++) {
					stmt.addBatch("update t_stu set roomid = '" + roomId + "' where stuid = '" + split[i] + "'");
				}
				stmt.executeBatch();
			}
		});
	}

	@Override
	public void delStuByIds(String roomId, String studentId,String[] split) {
		Session session = this.getSessionFactory().getCurrentSession();
		for (int i = 0, len = split.length; i < len; i++) {
			if(split[i].equals(studentId)){
				Query query = session.createQuery("update Room set stuid = null");
				query.executeUpdate();
			}
		}
		session.doWork(new Work() {
			@Override
			public void execute(Connection conn) throws SQLException {
				Statement stmt = conn.createStatement();
				for (int i = 0, len = split.length; i < len; i++) {
					stmt.addBatch("update t_stu set roomid = null where stuid = '" + split[i] + "'");
				}
				stmt.executeBatch();
			}
		});
	}
	@Override
	public String queryStuId(String roomId){
		Session session = this.getSessionFactory().getCurrentSession();
		Query query = session.createQuery("select stuId from Room where roomId = '" + roomId+"'");
		return (String)query.uniqueResult();
	}
	@Override
	public Pager4EasyUI<Room> blurredAllQueryPager(String string, Pager4EasyUI<Room> pager, String value, String name) {
		Session session = this.getSessionFactory().getCurrentSession();
		if(name.equals("name")){
        	// 根据bean类增加like查询, name为bean中属性, value为用户在搜索框的值 
        	Criteria c = session.createCriteria(Room.class).add(Restrictions.like(name, "%"+value+"%"));
        	@SuppressWarnings("unchecked")
			List<Room> list = (List<Room>)c.list();
			pager.setRows(list);
			pager.setTotal(list.size());
		}else if(name.equals("building")){
        	// 根据bean类增加like查询, name为bean中属性, value为用户在搜索框的值 
        	Criteria c = session.createCriteria(Room.class).add(Restrictions.like("name", value+"%"));
        	@SuppressWarnings("unchecked")
			List<Room> list = (List<Room>)c.list();
			pager.setRows(list);
			pager.setTotal(list.size());
		}else if(name.equals("floor")){
        	// 根据bean类增加like查询, name为bean中属性, value为用户在搜索框的值 
        	SQLQuery query = session.createSQLQuery("select name from t_room where substring(name,2,1)="+value);
        	@SuppressWarnings("unchecked")
			List<Room> list = (List<Room>)query.list();
			pager.setRows(list);
			pager.setTotal(list.size());
		}
		return pager;
	}
}
