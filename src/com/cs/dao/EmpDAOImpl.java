package com.cs.dao;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;

import com.cs.bean.DRECommom;
import com.cs.bean.Emp;
import com.cs.commom.bean.Pager4EasyUI;

public class EmpDAOImpl extends AbstractBaseDAO<Emp> implements EmpDAO {
	@Override
	public long blurredAllQueryCount(String string, Pager4EasyUI<DRECommom> pager, String value, String name) {
		Session session = this.getSessionFactory().getCurrentSession();
		if (name.equals("all")) {
			Criteria c = session.createCriteria(Emp.class).add(Restrictions.like("depId", "%" + value + "%"))
					.add(Restrictions.like("roleId", "%" + value + "%"))
					.add(Restrictions.like("name", "%" + value + "%")).add(Restrictions.like("pwd", "%" + value + "%"))
					.add(Restrictions.like("idCard", "%" + value + "%"))
					.add(Restrictions.like("nation", "%" + value + "%"))
					.add(Restrictions.like("gender", "%" + value + "%"))
					.add(Restrictions.like("birthDay", "%" + value + "%"))
					.add(Restrictions.like("email", "%" + value + "%"))
					.add(Restrictions.like("phone", "%" + value + "%")).add(Restrictions.like("qq", "%" + value + "%"))
					.add(Restrictions.like("weChat", "%" + value + "%"))
					.add(Restrictions.like("address", "%" + value + "%"))
					.add(Restrictions.like("married", "%" + value + "%"))
					.add(Restrictions.like("contactName", "%" + value + "%"))
					.add(Restrictions.like("contactPhone", "%" + value + "%"))
					.add(Restrictions.like("college", "%" + value + "%"))
					.add(Restrictions.like("major", "%" + value + "%"))
					.add(Restrictions.like("eduback", "%" + value + "%"))
					.add(Restrictions.like("bankName", "%" + value + "%"))
					.add(Restrictions.like("accountName", "%" + value + "%"))
					.add(Restrictions.like("accountNo", "%" + value + "%"))
					.add(Restrictions.like("alipay", "%" + value + "%"))
					.add(Restrictions.like("hireDay", "%" + value + "%"))
					.add(Restrictions.like("resignDay", "%" + value + "%"))
					.add(Restrictions.like("status", "%" + value + "%"));
			@SuppressWarnings("unchecked")
			List<Emp> list = (List<Emp>) c.list();
			return list.size();
		} else {
			System.out.println("value :" + value + ", name: " + name);
			Criteria c = session.createCriteria(DRECommom.class).add(Restrictions.like(name, "%" + value + "%"));
			@SuppressWarnings("unchecked")
			List<DRECommom> list = (List<DRECommom>) c.list();
			System.out.println("size:" + list.size());
			return list.size();
		}
	}

	@Override
	public Emp queryById(String id) {
		return getHibernateTemplate().load(Emp.class, id);
	}

	/**
	 * 三表关联分页查询
	 * 
	 * @param beanName
	 * @param pager
	 * @return
	 */
	public Pager4EasyUI<DRECommom> queryByPager(Pager4EasyUI<DRECommom> pager, String sql) {
		Session session = this.getSessionFactory().getCurrentSession();
		Query query = session.createSQLQuery(sql);
		query.setFirstResult(pager.getBeginIndex());
		query.setMaxResults(pager.getPageSize());
		@SuppressWarnings("unchecked")
		List<Object[]> list = query.list(); // 每一个Object[]存放的是每一行记录的所有字段
		List<DRECommom> info = new ArrayList<DRECommom>();
		for (Object[] objs : list) {
			DRECommom derc = new DRECommom();
			derc.setEmpId((String) objs[0]);
			derc.setName((String) objs[1]);
			derc.setPwd((String) objs[2]);
			derc.setIdCard((String) objs[3]);
			derc.setNation((String) objs[4]);
			derc.setGender((String) objs[5]);
			derc.setFingerNo((String) objs[6]);
			derc.setBirthDay((Date) objs[7]);
			derc.setEmail((String) objs[8]);
			derc.setPhone((String) objs[9]);
			derc.setQq((String) objs[10]);
			derc.setWeChat((String) objs[11]);
			derc.setAddress((String) objs[12]);
			derc.setMarried((String) objs[13]);
			derc.setContactName((String) objs[14]);
			derc.setContactPhone((String) objs[15]);
			derc.setCollege((String) objs[16]);
			derc.setMajor((String) objs[17]);
			derc.setEduback((String) objs[18]);
			derc.setBankName((String) objs[19]);
			derc.setAccountName((String) objs[20]);
			derc.setAccountNo((String) objs[21]);
			derc.setAlipay((String) objs[22]);
			derc.setHireDay((Date) objs[23]);
			derc.setResignDay((Date) objs[24]);
			derc.setStatus((int) objs[25]);
			derc.setDepId((String) objs[26]);
			derc.setDeptName((String) objs[27]);
			derc.setRoleId((String) objs[28]);
			derc.setRoleName((String) objs[29]);
			info.add(derc);
		}
		pager.setRows(info);
		return pager;
	}

	//张文星
	@Override
	public Pager4EasyUI<DRECommom> queryTermIdPager(String beanName, Pager4EasyUI<DRECommom> pager, String sql) {
		 Session session = this.getSessionFactory().getCurrentSession();
	        System.out.println("from " + beanName + sql);
	        Query query = session.createQuery("from " + beanName +sql);
	        query.setFirstResult(pager.getBeginIndex());
	        query.setMaxResults(pager.getPageSize());
	        @SuppressWarnings("unchecked")
			List<DRECommom> list = (List<DRECommom>) query.list();
	        pager.setRows(list);
	        return pager;
	}

	/**
	 * 登陆验证
	 */
	@Override
	public List<Emp> queryEmailPwd(Emp emp) {
		  	List<Emp> list=null;
	        try{
	            String hql ="from Emp where email=? and pwd=?";
	            System.out.println("from Emp where email=? and pwd=?");
	            list= (List<Emp>) getHibernateTemplate().find(hql, new String[]{emp.getEmail(),emp.getPwd()});
	        }catch(RuntimeException ex){
	            logger.error("find by property name failed", ex);
	        }
	        return list;
	}

	@Override
	public Pager4EasyUI<Emp> blurredAllQueryPager(String string, Pager4EasyUI<Emp> pager, String value, String name) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Pager4EasyUI<DRECommom> queryPageAll(String string, Pager4EasyUI<DRECommom> pager, String value,
			String name) {
		Session session = this.getSessionFactory().getCurrentSession();
		String sql = "select e.empid,e.name,e.pwd,e.idcard,e.nation,e.gender,e.fingerno,e.birthday,e.email,e.phone,e.qq,e.wechat,e.address,e.married,e.contactname,e.contactphone,e.college,e.major,e.eduback,e.bankname,e.accountname,e.accountno,e.alipay,e.hireday,e.resignday,e.status,d.depid as id1, d.name as name1,r.roleid as id2,r.name as name2 from t_dept d, t_role r, t_emp e where e.depid = d.depid and e.roleid = r.roleid and "+name+" like '%"+value+"%'";
		System.out.println(sql + "cccccccccccccccccccccccccc");
		Query query = session.createSQLQuery(sql);
		query.setFirstResult(pager.getBeginIndex());
		query.setMaxResults(pager.getPageSize());
		@SuppressWarnings("unchecked")
		List<Object[]> list = query.list(); // 每一个Object[]存放的是每一行记录的所有字段
		List<DRECommom> info = new ArrayList<DRECommom>();
		for (Object[] objs : list) {
			DRECommom derc = new DRECommom();
			derc.setEmpId((String) objs[0]);
			derc.setName((String) objs[1]);
			derc.setPwd((String) objs[2]);
			derc.setIdCard((String) objs[3]);
			derc.setNation((String) objs[4]);
			derc.setGender((String) objs[5]);
			derc.setFingerNo((String) objs[6]);
			derc.setBirthDay((Date) objs[7]);
			derc.setEmail((String) objs[8]);
			derc.setPhone((String) objs[9]);
			derc.setQq((String) objs[10]);
			derc.setWeChat((String) objs[11]);
			derc.setAddress((String) objs[12]);
			derc.setMarried((String) objs[13]);
			derc.setContactName((String) objs[14]);
			derc.setContactPhone((String) objs[15]);
			derc.setCollege((String) objs[16]);
			derc.setMajor((String) objs[17]);
			derc.setEduback((String) objs[18]);
			derc.setBankName((String) objs[19]);
			derc.setAccountName((String) objs[20]);
			derc.setAccountNo((String) objs[21]);
			derc.setAlipay((String) objs[22]);
			derc.setHireDay((Date) objs[23]);
			derc.setResignDay((Date) objs[24]);
			derc.setStatus((int) objs[25]);
			derc.setDepId((String) objs[26]);
			derc.setDeptName((String) objs[27]);
			derc.setRoleId((String) objs[28]);
			derc.setRoleName((String) objs[29]);
			info.add(derc);
		}
		pager.setRows(info);
		return pager;
		
		
	}

	@Override
	public Pager4EasyUI<DRECommom> queryByEmpDay(Pager4EasyUI<DRECommom> pager, Serializable startDay,
			Serializable endDay, Serializable beanObject) {
	  		Session session = this.getSessionFactory().getCurrentSession();
	  		String sql = "select e.empid,e.name,e.pwd,e.idcard,e.nation,e.gender,e.fingerno,e.birthday,e.email,e.phone,e.qq,e.wechat,e.address,e.married,e.contactname,e.contactphone,e.college,e.major,e.eduback,e.bankname,e.accountname,e.accountno,e.alipay,e.hireday,e.resignday,e.status,d.depid as id1, d.name as name1,r.roleid as id2,r.name as name2 from t_dept d, t_role r, t_emp e where e.depid = d.depid and e.roleid = r.roleid and resignday between ? and ?";
			System.out.println(sql + "aaaaaaaaaaaaaaaaaaaaaa");
			Query query = session.createSQLQuery(sql);
			query.setParameter(0, (String)startDay);
			query.setParameter(1, (String)endDay);
			query.setFirstResult(pager.getBeginIndex());
			query.setMaxResults(pager.getPageSize());
			@SuppressWarnings("unchecked")
			List<Object[]> list = query.list(); // 每一个Object[]存放的是每一行记录的所有字段
			List<DRECommom> info = new ArrayList<DRECommom>();
			for (Object[] objs : list) {
				DRECommom derc = new DRECommom();
				derc.setEmpId((String) objs[0]);
				derc.setName((String) objs[1]);
				derc.setPwd((String) objs[2]);
				derc.setIdCard((String) objs[3]);
				derc.setNation((String) objs[4]);
				derc.setGender((String) objs[5]);
				derc.setFingerNo((String) objs[6]);
				System.out.println(objs[7]);
				derc.setBirthDay((Date) objs[7]);
				derc.setEmail((String) objs[8]);
				derc.setPhone((String) objs[9]);
				derc.setQq((String) objs[10]);
				derc.setWeChat((String) objs[11]);
				derc.setAddress((String) objs[12]);
				derc.setMarried((String) objs[13]);
				derc.setContactName((String) objs[14]);
				derc.setContactPhone((String) objs[15]);
				derc.setCollege((String) objs[16]);
				derc.setMajor((String) objs[17]);
				derc.setEduback((String) objs[18]);
				derc.setBankName((String) objs[19]);
				derc.setAccountName((String) objs[20]);
				derc.setAccountNo((String) objs[21]);
				derc.setAlipay((String) objs[22]);
				derc.setHireDay((Date) objs[23]);
				derc.setResignDay((Date) objs[24]);
				derc.setStatus((int) objs[25]);
				derc.setDepId((String) objs[26]);
				derc.setDeptName((String) objs[27]);
				derc.setRoleId((String) objs[28]);
				derc.setRoleName((String) objs[29]);
				info.add(derc);
			}
			pager.setRows(info);
			return pager;
	}

	@Override
	public void updateByid(String beanName,Emp emp) {
		Session session = this.getSessionFactory().getCurrentSession();
		String sql="update t_emp SET email=?,name=?,phone=?,address=?,gender=? where empid=?";
		String hql = "update "+beanName+" set email = :email,name = :name,phone = :phone, address = :address,gender = :gender where empid= :empid";
		Query query =session.createQuery(hql);
		query.setParameter("email", emp.getEmail());
		query.setParameter("name", emp.getName());
		query.setParameter("phone", emp.getPhone());
		query.setParameter("address", emp.getAddress());
		query.setParameter("gender", emp.getGender());
		query.setParameter("empid", emp.getEmpId());
		query.executeUpdate();
	}

	/**
	 * 修改密码
	 */
	@Override
	public void updatePwd(String tableName, String flterId, String id, String pwd) {
		SessionFactory sessionFactory = super.getSessionFactory();
  		Session session = sessionFactory.getCurrentSession();
  		String sql = "update "+tableName+" set pwd = '"+pwd+"' where "+flterId+" = '"+id+"'";
  		Query query = session.createSQLQuery(sql);
  		query.executeUpdate();
	}
}
