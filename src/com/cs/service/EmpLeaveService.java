package com.cs.service;

import java.io.Serializable;

import com.cs.bean.EmpLeave;
import com.cs.bean.EmpLeaveInfo;
import com.cs.commom.bean.Pager4EasyUI;

public interface EmpLeaveService extends BaseService<EmpLeave>{
	
	/**
	 * ��ѯ�������
	 * @return
	 */
	public long queryCountLeave(String beanName, String id);
	
	/**
	 * info��ѯԱ�����
	 */
	public Pager4EasyUI<EmpLeaveInfo> queryPager(Pager4EasyUI<EmpLeaveInfo> pager, String sql);
	
	/**
	 * �޸�״̬
	 * @param beanName
	 * @param beanId
	 * @param status
	 * @param fieldName
	 * @param id
	 */
	public void updateStatus(String beanName,String beanId,int status, String fieldName,String id);
	
	 /**
     * ģ������
     * @param string
     * @param pager
     * @param value
     * @param name
     * @return
     */
    public Pager4EasyUI<EmpLeaveInfo> queryPageAll(String string, Pager4EasyUI<EmpLeaveInfo> pager, String value,
			String name);
    
    /**
     * ����ʱ���ȥ��ѯ
     */
	public Pager4EasyUI<EmpLeaveInfo> queryByEmpLeaveDay(Pager4EasyUI<EmpLeaveInfo> pager, Serializable startDay,Serializable endDay, Serializable beanObject);

}
