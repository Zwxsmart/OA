package com.cs.dao;


import java.io.Serializable;

import org.hibernate.Query;
import org.hibernate.Session;

import com.cs.bean.DRECommom;
import com.cs.bean.EmpLeave;
import com.cs.bean.EmpLeaveInfo;
import com.cs.commom.bean.Pager4EasyUI;

public interface EmpLeaveDAO extends BaseDAO<EmpLeave> {
	
	/**
	 * 查询请假天数
	 * @return
	 */
	public long queryCountLeave(String beanName, String id);
	
	/**
	 * info查询请假并分页
	 */
	public Pager4EasyUI<EmpLeaveInfo> queryPager(Pager4EasyUI<EmpLeaveInfo> pager, String sql);
	
	/**
	 * 修改状态
	 */
	public void updateStatus(String beanName,String beanId,int status, String fieldName,String id);
	
	 /**
     * 模糊搜索
     * @param string
     * @param pager
     * @param value
     * @param name
     * @return
     */
    public Pager4EasyUI<EmpLeaveInfo> queryPageAll(String string, Pager4EasyUI<EmpLeaveInfo> pager, String value,
			String name);
    
    /**
     * 根据时间段去查询
     */
	public Pager4EasyUI<EmpLeaveInfo> queryByEmpLeaveDay(Pager4EasyUI<EmpLeaveInfo> pager, Serializable startDay,Serializable endDay, Serializable beanObject);


}
