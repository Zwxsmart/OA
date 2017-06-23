package com.cs.dao;

import java.io.Serializable;
import java.util.List;

import com.cs.bean.DRECommom;
import com.cs.bean.Emp;
import com.cs.commom.bean.Pager4EasyUI;

public interface EmpDAO extends BaseDAO<Emp> {
	
	/**
	 * ����Ա�������ֲ�ѯ��������
	 */
	public Emp queryById(String id);
	
	
	
	/**
	 * ģ����ѯ��ѯ���ĸ���
	 */
	public long blurredAllQueryCount(String string, Pager4EasyUI<DRECommom> pager, String value, String name);
	

	 /**
     * ���������ҳ��ѯ
     * @param beanName
     * @param pager
     * @return
     */
	 public Pager4EasyUI<DRECommom> queryByPager(Pager4EasyUI<DRECommom> pager, String sql);

	 /**
	  * ģ����ѯ
	  * @return
	  */
	public Pager4EasyUI<DRECommom> queryTermIdPager(String string, Pager4EasyUI<DRECommom> pager, String sql);
				
	/**
     * ��¼��֤
     * @return
     */
    public List<Emp> queryEmailPwd(Emp emp);


    /**
     * ģ������
     * @param string
     * @param pager
     * @param value
     * @param name
     * @return
     */
    public Pager4EasyUI<DRECommom> queryPageAll(String string, Pager4EasyUI<DRECommom> pager, String value,
			String name);
    
    /**
     * ����ʱ���ȥ��ѯ
     */
	public Pager4EasyUI<DRECommom> queryByEmpDay(Pager4EasyUI<DRECommom> pager, Serializable startDay,Serializable endDay, Serializable beanObject);

	
	public void updateByid(String beanName,Emp emp);
	
	/**
	 * �޸�����
	 */
	public void updatePwd(String tableName, String flterId, String id, String pwd);
}
