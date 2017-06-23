package com.cs.service;

import java.util.List;

import com.cs.bean.Notice;
import com.cs.commom.bean.Pager4EasyUI;

public interface NoticeService extends BaseService<Notice>{
	public Notice queryNewNotice();
}
