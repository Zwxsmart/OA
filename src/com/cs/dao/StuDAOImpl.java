package com.cs.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.hibernate.type.IntegerType;

import com.cs.bean.DRECommom;
import com.cs.bean.Stu;
import com.cs.commom.bean.Pager4EasyUI;
import com.sun.org.apache.xalan.internal.xsltc.compiler.util.IntType;

/**
 * 学生增删改查DAO实现
 * @author 张文星
 *
 */
public class StuDAOImpl extends AbstractBaseDAO<Stu> implements StuDAO {
	// 查询所有被冻结的学生
	@Override
	public Pager4EasyUI<Stu> queryFreezeByPager(String string, Pager4EasyUI<Stu> pager) {
		Session session = this.getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from "+string+" where status = 0  and stuStatus='official' order by startDay desc");
        query.setFirstResult(pager.getBeginIndex());
        query.setMaxResults(pager.getPageSize());
        @SuppressWarnings("unchecked")
		List<Stu> list = (List<Stu>) query.list();
        pager.setRows(list);
        pager.setTotal(list.size());
        return pager;
	}
	
	//模糊查询方法
	@Override
	public Pager4EasyUI<Stu> blurredAllQueryPager(String string, Pager4EasyUI<Stu> pager, String value, String name) {
		Session session = this.getSessionFactory().getCurrentSession();
		if(name.equals("all")){
        }else if(name.equals("phone") || name.equals("name")){
        	// 根据bean类增加like查询, name为bean中属性, value为用户在搜索框的值 
        	Criteria c = session.createCriteria(Stu.class).add(Restrictions.like(name, "%"+value+"%")).add(Restrictions.eq("stuStatus", "official"));
        	@SuppressWarnings("unchecked")
			List<Stu> list = (List<Stu>)c.list();
			pager.setRows(list);
			pager.setTotal(list.size());
		}else if(name.equals("gradeid")){
			Criteria stuCriteria = session.createCriteria(Stu.class);
        	Criteria gradeCriteria = stuCriteria.createCriteria("grade");
        	gradeCriteria.add(Restrictions.like("name", "%"+value+"%"));
        	@SuppressWarnings("unchecked")
			List<Stu> list = (List<Stu>)stuCriteria.list();
			pager.setRows(list);
			pager.setTotal(list.size());
		}else if(name.equals("roomid")){
			Criteria stuCriteria = session.createCriteria(Stu.class);
        	Criteria roomCriteria = stuCriteria.createCriteria("room");
        	roomCriteria.add(Restrictions.like("name", "%"+value+"%"));
        	@SuppressWarnings("unchecked")
			List<Stu> list = (List<Stu>)stuCriteria.list();
			pager.setRows(list);
			pager.setTotal(list.size());
		}
		return pager;
	}

	@Override
	public Pager4EasyUI<Stu> queryByPager1(Pager4EasyUI<Stu> pager, String sql) {
		  Session session = this.getSessionFactory().getCurrentSession();
	        Query query = session.createSQLQuery(sql);
	        query.setFirstResult(pager.getBeginIndex());
	        query.setMaxResults(pager.getPageSize());
	        @SuppressWarnings("unchecked")
			List<Object[]> list =  query.list();
	        List<Stu> info = new ArrayList<Stu>();
	        for (Object[] objs : list) {
				Stu s = new Stu();
				s.setStuId((String) objs[0]);
				s.setStuNo((String) objs[1]);
				s.setName((String) objs[2]);
				s.setPwd((String) objs[3]);
				s.setIdCard((String) objs[4]);
				s.setPhone((String) objs[5]);
				s.setQq((String) objs[6]);
				s.setWeChat((String) objs[7]);
				s.setSchool((String) objs[8]);
				s.setAge((Integer)objs[9]);
				s.setBirthday((Date) objs[10]);
				s.setGender((String) objs[11]);
				s.setAddress((String) objs[12]);
				s.setNation((String) objs[13]);
				s.setResIdence((String) objs[14]);
				s.setGradeId((String) objs[15]);
				s.setRoomId((String) objs[16]);
				s.setParentName((String) objs[17]);
				s.setParentPhone((String) objs[18]);
				s.setStartDay((Date) objs[19]);
				s.setEmpId((String) objs[20]);
				s.setDes((String) objs[21]);
				s.setStatus((Integer) objs[22]);
				s.setStuStatus((String) objs[23]);
				s.setRole((String) objs[24]);
				info.add(s);
	        }
	        pager.setRows(info);
	        pager.setTotal(list.size());
	        return pager;
	}
	//登入验证
	@Override
	public List<Stu> queryPhonePwd(Stu stu) {
		List<Stu> list=null;
        try{
            String hql ="from Stu where phone=? and pwd=?";
            list = (List<Stu>) getHibernateTemplate().find(hql,new String[]{stu.getPhone(),stu.getPwd()});
        }catch(RuntimeException ex){
            logger.error("find by property name failed", ex);
        }
        return list;
	}

	@Override
	public Pager4EasyUI<Stu> queryByPager(Pager4EasyUI<Stu> pager, String sql) {
		Session session = this.getSessionFactory().getCurrentSession();
		Query query = session.createSQLQuery(sql);
		query.setFirstResult(pager.getBeginIndex());
		query.setMaxResults(pager.getPageSize());
		@SuppressWarnings("unchecked")
		List<Object[]> list = query.list(); // 每一个Object[]存放的是每一行记录的所有字段
		List<Stu> info = new ArrayList<Stu>();
		for (Object[] objs : list) {
			Stu derc = new Stu();
			derc.setPhone((String) objs[0]);
			derc.setName((String) objs[1]);
			derc.setPwd((String) objs[2]);
			derc.setNation((String) objs[3]);
			derc.setQq((String) objs[4]);
			derc.setStatus((int) objs[5]);
			info.add(derc);
		}
		pager.setRows(info);
		return pager;
	}
	public Stu queryById(String id) {
		return getHibernateTemplate().load(Stu.class, id);
	}
	
}
