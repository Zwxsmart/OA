package com.cs.service;

import com.cs.bean.Report;
import com.cs.commom.bean.Pager4EasyUI;

public interface ReportService extends BaseService<Report>{
	
	//��ҳ��ѯ���н���
		public Pager4EasyUI<Report> queryFreezeByPager(String string, Pager4EasyUI<Report> pager);
			
			
		//��ҳ��ѯ���н�������
		public long freezeCount(String string);
			
			
		//��ҳ��ѯ��������
		public Pager4EasyUI<Report> queryFreezeByPager1(String string, Pager4EasyUI<Report> pager);
		
			
		//��ҳ��ѯ������������
		public long freezeCount1(String string);
}
