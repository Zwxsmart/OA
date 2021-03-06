package com.cs.service;


import java.io.Serializable;
import java.util.List;

import com.cs.bean.DRECommom;
import com.cs.bean.Emp;
import com.cs.commom.bean.Pager4EasyUI;

public interface EmpService extends BaseService<Emp> {
	
	/**
	 * 模糊查询查询出的个数
	 */
	public long blurredAllQueryCount(String string, Pager4EasyUI<DRECommom> pager, String value, String name);

	/**
	 * 根据员工的名字查询所属部门
	 */
	public Emp queryById(String id);
	
	 /**
     * 三表关联分页查询
     * @param beanName
     * @param pager
     * @return
     */
	 public Pager4EasyUI<DRECommom> queryByPager(Pager4EasyUI<DRECommom> pager, String sql);

	public Pager4EasyUI<DRECommom> queryTermIdPager(String string, Pager4EasyUI<DRECommom> pager, String string2);

	/**
     * 登录验证
     * @return
     */
    public List<Emp> queryEmailPwd(Emp emp);
    
    /**
     * 模糊搜索
     * @param string
     * @param pager
     * @param value
     * @param name
     * @return
     */
    public Pager4EasyUI<DRECommom> queryPageAll(String string, Pager4EasyUI<DRECommom> pager, String value,
			String name);

	/**
	 * 根据时间段查询
	 */
    public Pager4EasyUI<DRECommom> queryByEmpDay(Pager4EasyUI<DRECommom> pager, Serializable startDay,
			Serializable endDay, Serializable beanObject);
    
    public void updateByid(String beanName,Emp emp);
    
    /**
     * 修改密码
     * @param tableName
     * @param flterId
     * @param id
     * @param pwd
     */
    public void updatePwd(String tableName, String flterId, String id, String pwd);
}
