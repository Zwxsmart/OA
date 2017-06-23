package com.cs.service;

import java.io.Serializable;

import com.cs.bean.Income;
import com.cs.bean.Stu;
import com.cs.commom.bean.Pager4EasyUI;
import com.cs.dao.BaseDAO;


/**
 * �г�����Service
 * @author ����
 *
 */
public interface StuIntentionService extends BaseDAO<Stu> {
	
	//��ҳ��ѯ��������ѧ��
	public Pager4EasyUI<Stu> queryAssignByPager(String string, Pager4EasyUI<Stu> pager);
	
	
	//��ҳ��ѯ������������
	public long assignCount(String string);

	
	//��ҳ��ѯ���н�������ѧ��
	public Pager4EasyUI<Stu> queryFreezeByPager(String string, Pager4EasyUI<Stu> pager);
	
	
	//��ҳ��ѯ���н�����������
	public long freezeCount(String string);
	
	
	//��ҳ��ѯ������������ѧ��
	public Pager4EasyUI<Stu> queryFreezeByPager1(String string, Pager4EasyUI<Stu> pager);
	
	
	//��ҳ��ѯ����������������
	public long freezeCount1(String string);
	
	
	//ģ����ѯ
	public Pager4EasyUI<Stu> blurredAllQueryPager(String string, Pager4EasyUI<Stu> pager, String value, String name);
	
	
	//ģ����ѯ����
	public long blurredAllQueryCount(String string, Pager4EasyUI<Stu> pager, String value, String name);
	
	
	//��������״̬����
	public void updateStatus(String beanName,String beanId,int status,String id);
	
	
	//תΪԤ��ѧ��
	public void updateIntention(String beanName,String intention, String id);
	
	
	public Pager4EasyUI<Stu> queryByDay(Pager4EasyUI<Stu> pager, Serializable startDay, Serializable endDay,
			Serializable beanObject, Serializable attrName);
	
	//תΪ��ʽ
	public void updatePredetermine(String beanName,String predetermine, String id);
}
