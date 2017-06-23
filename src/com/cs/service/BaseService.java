package com.cs.service;

import com.cs.commom.bean.Pager4EasyUI;

import java.io.Serializable;

/**
 * Created by  on 2016/12/13.
 */
public interface BaseService<T> {
    public T save(T t);

    public void delete(T t);

    public void update(T t);

    public T queryById(Class<?> clazz, Serializable id);

    public Pager4EasyUI<T> queryByPager(String beanName, Pager4EasyUI<T> pager, String sql);

    public long count(String beanName, String sql);
    
    public void updateStatus(String beanName,String beanId,int status,String id);
    
    /**
     * ����ʵ�ʶβ���
     * @param pager
     * @param startDay
     * @param endDay
     * @param beanObject
     * @param attrName
     * @return
     */
    public Pager4EasyUI<T> queryByDay(Pager4EasyUI<T> pager, Serializable startDay,
  			Serializable endDay, Serializable beanObject, Serializable attrName);
    /**
     * ��һ������ΪBean����,�ڶ�����Ϊ��ҳ��ѯ�Ķ���, ��������Ϊ�û��������������ֵ, ���Ĳ���Ϊ�û�ѡ�е���ʲô������
     * @param ������
     * @return
     */
    public Pager4EasyUI<T> blurredAllQueryPager(String string, Pager4EasyUI<T> pager, String value,
			String name);
    public boolean queryPrevillige(String roleId, String actionName);
}
