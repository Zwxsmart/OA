package com.cs.service;

import com.cs.bean.User;
import com.cs.commom.bean.Pager4EasyUI;
import com.cs.dao.UserDAO;

import java.io.Serializable;


public class UserServiceImpl implements UserService {

    private UserDAO userDAO;

    public UserDAO getUserDAO() {
        return userDAO;
    }

    public void setUserDAO(UserDAO userDAO) {
        this.userDAO = userDAO;
    }


    @Override
    public User save(User user) {
        return userDAO.save(user);
    }

    @Override
    public void delete(User user) {
        userDAO.delete(user);
    }

    @Override
    public void update(User user) {
        userDAO.update(user);
    }

    @Override
    public User queryById(Class<?> clazz, Serializable id) {
        return userDAO.queryById(clazz, id);
    }

    @Override
    public Pager4EasyUI<User> queryByPager(String beanName, Pager4EasyUI<User> pager, String sql) {
        return userDAO.queryByPager(beanName, pager, sql);
    }

    @Override
    public long count(String beanName, String sql) {
        return userDAO.count(beanName,sql);
    }

	@Override
	public void updateStatus(String beanName, String beanId, int status, String id) {
		
	}

	@Override
	public Pager4EasyUI<User> queryByDay(Pager4EasyUI<User> pager, Serializable startDay, Serializable endDay,
			Serializable beanObject, Serializable attrName) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Pager4EasyUI<User> blurredAllQueryPager(String string, Pager4EasyUI<User> pager, String value, String name) {
		return userDAO.blurredAllQueryPager(string, pager, value, name);
	}

	@Override
	public boolean queryPrevillige(String roleId, String actionName) {
		// TODO Auto-generated method stub
		return false;
	}
}
