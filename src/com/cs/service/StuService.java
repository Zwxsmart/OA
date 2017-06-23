package com.cs.service;

import java.util.List;

import com.cs.bean.Stu;
import com.cs.commom.bean.Pager4EasyUI;
import com.cs.dao.BaseDAO;

/**
 * ѧ��service��
 * @author ������
 *
 */
public interface StuService extends BaseDAO<Stu>{
	List<Stu> queryPhonePwd(Stu stu);
	Stu queryById(String id);
	 //��ѯ���б�����ķ�ҳѧ�� 
	public Pager4EasyUI<Stu> queryFreezeByPager(String string, Pager4EasyUI<Stu> pager);
	//ģ����ѯ����
	public Pager4EasyUI<Stu> blurredAllQueryPager(String string, Pager4EasyUI<Stu> pager, String value, String name);
	public Pager4EasyUI<Stu> queryByPager1(String sql, Pager4EasyUI<Stu> pager);
}
