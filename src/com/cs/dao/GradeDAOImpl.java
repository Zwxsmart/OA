package com.cs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.hibernate.jdbc.Work;

import com.cs.bean.Grade;
import com.cs.bean.Stu;
import com.cs.bean.Grade;
import com.cs.commom.bean.Pager4EasyUI;

public class GradeDAOImpl extends AbstractBaseDAO<Grade> implements GradeDAO {
	public void addStuByIds(String gradeId, String[] split) {
		Session session = this.getSessionFactory().getCurrentSession();
		session.doWork(new Work() {
			@Override
			public void execute(Connection conn) throws SQLException {
				Statement stmt = conn.createStatement();
				for (int i = 0, len = split.length; i < len; i++) {
					stmt.addBatch("update t_stu set gradeid = '" + gradeId + "' where stuid = '" + split[i] + "'");
				}
				stmt.executeBatch();
			}
		});
	}

	@Override
	public void delStuByIds(String gradeId, String[] split) {
		Session session = this.getSessionFactory().getCurrentSession();
		session.doWork(new Work() {
			@Override
			public void execute(Connection conn) throws SQLException {
				Statement stmt = conn.createStatement();
				for (int i = 0, len = split.length; i < len; i++) {
					stmt.addBatch("update t_stu set gradeid = null where stuid = '" + split[i] + "'");
				}
				stmt.executeBatch();
			}
		});
	}

	@Override
	public Pager4EasyUI<Grade> blurredAllQueryPager(String string, Pager4EasyUI<Grade> pager, String value,
			String name) {
		Session session = this.getSessionFactory().getCurrentSession();
		if(name.equals("name")){
        	// 根据bean类增加like查询, name为bean中属性, value为用户在搜索框的值 
        	Criteria c = session.createCriteria(Grade.class).add(Restrictions.like(name, "%"+value+"%"));
        	@SuppressWarnings("unchecked")
			List<Grade> list = (List<Grade>)c.list();
			pager.setRows(list);
			pager.setTotal(list.size());
		}else if(name.equals("teacher")){
			Criteria gradeCriteria = session.createCriteria(Grade.class);
        	Criteria teacherCriteria = gradeCriteria.createCriteria("emp1");
        	teacherCriteria.add(Restrictions.like("name", "%"+value+"%"));
        	@SuppressWarnings("unchecked")
			List<Grade> list = (List<Grade>)gradeCriteria.list();
			pager.setRows(list);
			pager.setTotal(list.size());
		}else if(name.equals("instructor")){
			Criteria gradeCriteria = session.createCriteria(Grade.class);
        	Criteria teacherCriteria = gradeCriteria.createCriteria("emp2");
        	teacherCriteria.add(Restrictions.like("name", "%"+value+"%"));
        	@SuppressWarnings("unchecked")
			List<Grade> list = (List<Grade>)gradeCriteria.list();
			pager.setRows(list);
			pager.setTotal(list.size());
		}
		return pager;
	}
}
