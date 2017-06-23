package com.cs.service;

import java.io.Serializable;

import com.cs.bean.Income;
import com.cs.bean.Stu;
import com.cs.commom.bean.Pager4EasyUI;
import com.cs.dao.StuDAO;
import com.cs.dao.StuIntentionDAO;

/**
 * �г�����service��ʵ��
 * @author ����
 *
 */
public class StuIntentionServiceImpl implements StuIntentionService {
	
	private StuIntentionDAO stuIntentionDAO;

	public StuIntentionDAO getStuIntentionDAO() {
		return stuIntentionDAO;
	}

	public void setStuIntentionDAO(StuIntentionDAO stuIntentionDAO) {
		this.stuIntentionDAO = stuIntentionDAO;
	}

	//���
	@Override
	public Stu save(Stu stu) {
		return stuIntentionDAO.save(stu);
	}

	//ɾ��
	@Override
	public void delete(Stu stu) {
		stuIntentionDAO.delete(stu);
	}

	//�޸�
	@Override
	public void update(Stu stu) {
		stuIntentionDAO.update(stu);
	}

	//����id��ѯ
	@Override
	public Stu queryById(Class<?> clazz, Serializable id) {
		return stuIntentionDAO.queryById(clazz, id);
	}
	
	//��ҳ��ѯ��������ѧ��
	@Override
	public Pager4EasyUI<Stu> queryAssignByPager(String string, Pager4EasyUI<Stu> pager){
		return stuIntentionDAO.queryAssignByPager(string, pager);
		
	}
	
	//��ҳ��ѯ������������
	@Override
	public long assignCount(String string){
		return stuIntentionDAO.assignCount(string);
	}
	
	//��ҳ��ѯ����ѧ��
	@Override
	public Pager4EasyUI<Stu> queryByPager(String beanName, Pager4EasyUI<Stu> pager, String sql) {
		return stuIntentionDAO.queryByPager(beanName, pager,sql);
	}

	//��ҳ��ѯ��������
	@Override
	public long count(String beanName, String sql) {
		return stuIntentionDAO.count(beanName, sql);
	}

	//��ҳ��ѯ���н�������ѧ��
	@Override
	public Pager4EasyUI<Stu> queryFreezeByPager(String string, Pager4EasyUI<Stu> pager) {
		return stuIntentionDAO.queryFreezeByPager(string, pager);
	}

	//��ҳ��ѯ���н�����������
	@Override
	public long freezeCount(String string) {
		return stuIntentionDAO.freezeCount(string);
	}

	//��ҳ��ѯ������������ѧ��
	@Override
	public Pager4EasyUI<Stu> queryFreezeByPager1(String string, Pager4EasyUI<Stu> pager) {
		return stuIntentionDAO.queryFreezeByPager1(string, pager);
	}

	//��ҳ��ѯ����������������
	@Override
	public long freezeCount1(String string) {
		return stuIntentionDAO.freezeCount1(string);
	}

	//ģ����ѯ
	@Override
	public Pager4EasyUI<Stu> blurredAllQueryPager(String string, Pager4EasyUI<Stu> pager, String value, String name) {
		return stuIntentionDAO.blurredAllQueryPager(string, pager, value, name);
	}

	//ģ����ѯ����
	@Override
	public long blurredAllQueryCount(String string, Pager4EasyUI<Stu> pager, String value, String name) {
		return stuIntentionDAO.blurredAllQueryCount(string, pager, value, name);
	}

	//��������״̬����
	@Override
	public void updateStatus(String beanName, String beanId, int status, String id) {
		stuIntentionDAO.updateStatus(beanName, beanId, status, id);
	}

	
	//תΪԤ��ѧ��
	@Override
	public void updateIntention(String beanName,String intention, String id) {
		stuIntentionDAO.updateIntention(beanName, intention, id);
	}

	@Override
	public Pager4EasyUI<Stu> queryByDay(Pager4EasyUI<Stu> pager, Serializable startDay, Serializable endDay,
			Serializable beanObject, Serializable attrName) {
		return stuIntentionDAO.queryByDay(pager, startDay, endDay, beanObject, attrName);
	}

	//תΪ��ʽ
	public void updatePredetermine(String beanName,String predetermine, String id){
		stuIntentionDAO.updatePredetermine(beanName, predetermine, id);
	}

	@Override
	public boolean queryPrevillige(String roleId, String actionName) {
		return stuIntentionDAO.queryPrevillige(roleId, actionName);
	}
}
