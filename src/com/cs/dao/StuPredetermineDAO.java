package com.cs.dao;

import com.cs.bean.Income;
import com.cs.bean.Stu;
import com.cs.commom.bean.Pager4EasyUI;

/**
 * �г�������ɾ�Ĳ�DAO
 * @author ����
 *
 */
public interface StuPredetermineDAO extends BaseDAO<Stu> {
	
	//��ҳ��ѯ����Ԥ��ѧ��
	public Pager4EasyUI<Stu> queryAssignByPager(String string, Pager4EasyUI<Stu> pager);
	
	
	//��ҳ��ѯ����Ԥ������
	public long assignCount(String string);

	
	//��ҳ��ѯ���н���Ԥ��ѧ��
	public Pager4EasyUI<Stu> queryFreezeByPager(String string, Pager4EasyUI<Stu> pager);
	
	
	//��ҳ��ѯ���н���Ԥ������
	public long freezeCount(String string);
	
	
	//��ҳ��ѯ��������Ԥ��ѧ��
	public Pager4EasyUI<Stu> queryFreezeByPager1(String string, Pager4EasyUI<Stu> pager);
	
	
	//��ҳ��ѯ��������Ԥ������
	public long freezeCount1(String string);
	
	
	//ģ����ѯ
	public Pager4EasyUI<Stu> blurredAllQueryPager(String string, Pager4EasyUI<Stu> pager, String value, String name);
	
	
	//ģ����ѯ����
	public long blurredAllQueryCount(String string, Pager4EasyUI<Stu> pager, String value, String name);
	
	
	//��������״̬����
	public void updateStatus(String beanName,String beanId,int status,String id);
	
	
	//תΪ��ʽѧ��
	public void updatePredetermine(String beanName,String intention, String id);
}
