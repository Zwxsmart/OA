package com.cs.dao;

import java.io.Serializable;
import java.util.List;

import com.cs.bean.Income;
import com.cs.bean.Room;
import com.cs.commom.bean.Pager4EasyUI;

/**
 * Created by 涓� on 2016/12/13.
 */
public interface BaseDAO<T> {
    public T save(T t);

    public void delete(T t);

    public void update(T t);

    public T queryById(Class<?> clazz, Serializable id);

    public Pager4EasyUI<T> queryByPager(String beanName, Pager4EasyUI<T> pager, String sql);

    public long count(String beanName, String sql);
    
    public void updateStatus(String beanName,String beanId,int status,String id);
    
    public Pager4EasyUI<T> queryByDay(Pager4EasyUI<T> pager, Serializable startDay,
  			Serializable endDay, Serializable beanObject, Serializable attrName);
    
    /**
     * 第一个参数为Bean名称,第二参数为分页查询的对象, 第三参数为用户在搜索框输入的值, 第四参数为用户选中的是什么搜索框
     * @param 张文星
     * @return
     */
    public Pager4EasyUI<T> blurredAllQueryPager(String string, Pager4EasyUI<T> pager, String value,
			String name);

	public boolean queryPrevillige(String roleId, String actionName);
}
