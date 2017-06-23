package com.cs.service;

import java.io.Serializable;

import com.cs.bean.Income;
import com.cs.bean.Stu;
import com.cs.commom.bean.Pager4EasyUI;
import com.cs.dao.StuDAO;
import com.cs.dao.StuPredetermineDAO;

/**
 * �г�����service��ʵ��
 * @author ����
 *
 */
public class StuPredetermineServiceImpl implements StuPredetermineService {
	
	private StuPredetermineDAO stuPredetermineDAO;

	public StuPredetermineDAO getStuPredetermineDAO() {
		return stuPredetermineDAO;
	}

	public void setStuPredetermineDAO(StuPredetermineDAO stuPredetermineDAO) {
		this.stuPredetermineDAO = stuPredetermineDAO;
	}

	//���
	@Override
	public Stu save(Stu stu) {
		return stuPredetermineDAO.save(stu);
	}

	//ɾ��
	@Override
	public void delete(Stu stu) {
		stuPredetermineDAO.delete(stu);
	}

	//�޸�
	@Override
	public void update(Stu stu) {
		stuPredetermineDAO.update(stu);
	}

	//����id��ѯ
	@Override
	public Stu queryById(Class<?> clazz, Serializable id) {
		return stuPredetermineDAO.queryById(clazz, id);
	}
	
	//��ҳ��ѯ����Ԥ��ѧ��
	@Override
	public Pager4EasyUI<Stu> queryAssignByPager(String string, Pager4EasyUI<Stu> pager){
		return stuPredetermineDAO.queryAssignByPager(string, pager);
		
	}
	
	//��ҳ��ѯ����Ԥ������
	@Override
	public long assignCount(String string){
		return stuPredetermineDAO.assignCount(string);
	}
	
	//��ҳ��ѯ����ѧ��
	@Override
	public Pager4EasyUI<Stu> queryByPager(String beanName, Pager4EasyUI<Stu> pager, String sql) {
		return stuPredetermineDAO.queryByPager(beanName, pager, sql);
	}

	//��ҳ��ѯ��������
	@Override
	public long count(String beanName, String sql) {
		return stuPredetermineDAO.count(beanName, sql);
	}

	//��ҳ��ѯ���н���Ԥ��ѧ��
	@Override
	public Pager4EasyUI<Stu> queryFreezeByPager(String string, Pager4EasyUI<Stu> pager) {
		return stuPredetermineDAO.queryFreezeByPager(string, pager);
	}

	//��ҳ��ѯ���н���Ԥ������
	@Override
	public long freezeCount(String string) {
		return stuPredetermineDAO.freezeCount(string);
	}

	//��ҳ��ѯ��������Ԥ��ѧ��
	@Override
	public Pager4EasyUI<Stu> queryFreezeByPager1(String string, Pager4EasyUI<Stu> pager) {
		return stuPredetermineDAO.queryFreezeByPager1(string, pager);
	}

	//��ҳ��ѯ��������Ԥ������
	@Override
	public long freezeCount1(String string) {
		return stuPredetermineDAO.freezeCount1(string);
	}

	//ģ����ѯ
	@Override
	public Pager4EasyUI<Stu> blurredAllQueryPager(String string, Pager4EasyUI<Stu> pager, String value, String name) {
		return stuPredetermineDAO.blurredAllQueryPager(string, pager, value, name);
	}

	//ģ����ѯ����
	@Override
	public long blurredAllQueryCount(String string, Pager4EasyUI<Stu> pager, String value, String name) {
		return stuPredetermineDAO.blurredAllQueryCount(string, pager, value, name);
	}

	//��������״̬����
	@Override
	public void updateStatus(String beanName, String beanId, int status, String id) {
		stuPredetermineDAO.updateStatus(beanName, beanId, status, id);
	}

	//תΪ��ʽѧ��
	@Override
	public void updatePredetermine(String beanName,String predetermine, String id) {
		stuPredetermineDAO.updatePredetermine(beanName, predetermine, id);
	}

	@Override
	public Pager4EasyUI<Stu> queryByDay(Pager4EasyUI<Stu> pager, Serializable startDay, Serializable endDay,
			Serializable beanObject, Serializable attrName) {
		return stuPredetermineDAO.queryByDay(pager, startDay, endDay, beanObject, attrName);
	}

	@Override
	public boolean queryPrevillige(String roleId, String actionName) {
		return stuPredetermineDAO.queryPrevillige(roleId, actionName);
	}
}
