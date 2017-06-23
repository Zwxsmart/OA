package com.cs.action;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.cs.bean.Emp;
import com.cs.bean.Goods;
import com.cs.bean.GoodsApp;
import com.cs.bean.Pay;
import com.cs.bean.PayType;
import com.cs.commom.Constants;
import com.cs.commom.bean.ControllerResult;
import com.cs.commom.bean.Pager4EasyUI;
import com.cs.service.GoodsAppService;
import com.cs.service.GoodsService;
import com.cs.service.PayService;
import com.opensymphony.xwork2.ActionSupport;

public class GoodsAppAction extends ActionSupport implements ServletRequestAware {

	private static final long serialVersionUID = 138304422694143675L;

	public HttpServletRequest req;
	public ControllerResult result;
	private GoodsAppService goodsAppService;
	private PayService payService;
	private List<GoodsApp> rows;
	private long total;
	private String id;
	private GoodsApp goodsApp;
	private String empId;
	private GoodsService goodsService;

	/**
	 * ֧��service����
	 * 
	 * @return
	 */
	
	
	
	public void setPayService(PayService payService) {
		this.payService = payService;
	}

	public void setGoodsService(GoodsService goodsService) {
		this.goodsService = goodsService;
	}

	public String getEmpId() {
		return empId;
	}

	public void setEmpId(String empId) {
		this.empId = empId;
	}

	@Override
	public void setServletRequest(HttpServletRequest req) {
		this.req = req;
	}

	public GoodsApp getGoodsApp() {
		return goodsApp;
	}

	public void setGoodsApp(GoodsApp goodsApp) {
		this.goodsApp = goodsApp;
	}

	public ControllerResult getResult() {
		return result;
	}

	public List<GoodsApp> getRows() {
		return rows;
	}

	public long getTotal() {
		return total;
	}

	public void setGoodsAppService(GoodsAppService goodsAppService) {
		this.goodsAppService = goodsAppService;
	}

	public void setId(String id) {
		this.id = id;
	}

	/**
	 * ��תҳ��
	 * 
	 * @return
	 */
	public String skipPage() {
		Emp emp = (Emp) req.getSession().getAttribute("emp");
		String actionName = GoodsAppAction.class.getName();
		if (goodsAppService.queryPrevillige(emp.getRoleId(), actionName + ".skipPage")) {
			return "skip";
		} else {
			return "NoPrevillige";
		}

	}

	/**
	 * ����������
	 * 
	 * @return
	 */
	public String admissionsSkipPage() {
		return "admissionsSkip";
	}

	/**
	 * �����Ʒ�깺
	 */
	public String save() {
		Emp emp = (Emp) req.getSession().getAttribute("emp");
		String actionName = GoodsAppAction.class.getName();
		if (goodsAppService.queryPrevillige(emp.getRoleId(), actionName + ".save")) {
			goodsApp.setEmpId(empId);
			goodsApp.setStatus(1);
			goodsAppService.save(goodsApp);
			result = ControllerResult.getSuccessResult("��ӳɹ�");
		} else {
			result = ControllerResult.getFailResult("Ȩ�޲���");
		}
		return "save";
	}

	/**
	 * ��ѯ���е���Ʒ�깺
	 */
	public String queryAll() {
		String pageNoStr = req.getParameter("page");
		String pageSizeStr = req.getParameter("rows");
		Pager4EasyUI<GoodsApp> pager = new Pager4EasyUI<GoodsApp>();
		if (pageNoStr != null) {
			pager.setPageNo(Integer.valueOf(pageNoStr));
			pager.setPageSize(Integer.valueOf(pageSizeStr));
		}
		pager = goodsAppService.queryByPager("GoodsApp", pager, "");
		pager.setTotal(goodsAppService.count("GoodsApp", ""));
		rows = pager.getRows();
		total = pager.getTotal();
		return "all";
	}

	/**
	 * �޸�������Ʒ�깺
	 */
	public String update() {
		Emp emp = (Emp) req.getSession().getAttribute("emp");
		String actionName = GoodsAppAction.class.getName();
		if (goodsAppService.queryPrevillige(emp.getRoleId(), actionName + ".update")) {
			goodsApp.setGoodsAppId(goodsApp.getGoodsAppId());
			goodsApp.setEmpId(empId);
			goodsAppService.update(goodsApp);
			result = ControllerResult.getSuccessResult("�޸ĳɹ�");
		} else {
			result = ControllerResult.getFailResult("Ȩ�޲���");
		}
		return "update";
	}

	/**
	 * ģ����ѯ
	 */
	public String blurredAllQuery() {
		Emp emp = (Emp) req.getSession().getAttribute("emp");
		String actionName = GoodsAppAction.class.getName();
		if (goodsAppService.queryPrevillige(emp.getRoleId(), actionName + ".blurredAllQuery")) {
			String pageNoStr = req.getParameter("page");
			String pageSizeStr = req.getParameter("rows");
			String value = req.getParameter("value1");
			String name = req.getParameter("name1");
			System.out.println("value :" + value + ", name: " + name);
			Pager4EasyUI<GoodsApp> pager = new Pager4EasyUI<GoodsApp>();
			if (pageNoStr != null) {
				pager.setPageNo(Integer.valueOf(pageNoStr));
				pager.setPageSize(Integer.valueOf(pageSizeStr));
			}
			pager = goodsAppService.blurredAllQueryPager("GoodsApp", pager, value, name);
			rows = pager.getRows();
			total = pager.getTotal();
		} else {

		}
		return "blurredAllQuery";

	}

	// ʱ��β�ѯ
	public String serachTime() {
		Emp emp = (Emp) req.getSession().getAttribute("emp");
		String actionName = GoodsAppAction.class.getName();
		if (goodsAppService.queryPrevillige(emp.getRoleId(), actionName + ".serachTime")) {
			String pageNoStr = req.getParameter("page");
			String pageSizeStr = req.getParameter("rows");
			String beginTime = req.getParameter("beginTime");
			String endTime = req.getParameter("endTime");
			System.out.println("��ʼʱ��" + beginTime + "����ʱ�䣺" + endTime);
			Pager4EasyUI<GoodsApp> pager = new Pager4EasyUI<GoodsApp>();
			if (pageNoStr != null) {
				pager.setPageNo(Integer.valueOf(pageNoStr));
				pager.setPageSize(Integer.valueOf(pageSizeStr));
			}
			pager = goodsAppService.queryByDay(pager, beginTime, endTime, "GoodsApp", "appDay");
			System.out.println(pager.toString());
			pager.setTotal(goodsAppService.count("GoodsApp", ""));
			rows = pager.getRows();
			total = pager.getTotal();
		} else {

		}
		return "serachtime";

	}

	/**
	 * ����
	 * 
	 * @return
	 */
	public String goodsAppDisable() {
		Emp emp = (Emp) req.getSession().getAttribute("emp");
		String actionName = GoodsAppAction.class.getName();
		if (goodsAppService.queryPrevillige(emp.getRoleId(), actionName + ".goodsAppDisable")) {
			goodsAppService.updateStatus("GoodsApp", "goodsAppId", 0, id);
		} else {

		}
		return "disable";

	}

	/**
	 * ����
	 * 
	 * @return
	 */
	public String goodsAppActivate() {
		Emp emp = (Emp) req.getSession().getAttribute("emp");
		String actionName = GoodsAppAction.class.getName();
		if (goodsAppService.queryPrevillige(emp.getRoleId(), actionName + ".goodsAppActivate")) {
			goodsAppService.updateStatus("GoodsApp", "goodsAppId", 1, id);
		} else {

		}
		return "activate";

	}

	/**
	 * ͨ��
	 * 
	 * @return
	 */
	public String goodsAppDis() {
		Emp emp = (Emp) req.getSession().getAttribute("emp");
		String actionName = GoodsAppAction.class.getName();
		System.out.println("Aaaaaaaaaaaaaaaaaaa");
		if (goodsAppService.queryPrevillige(emp.getRoleId(), actionName + ".goodsAppDis")) {
			String countStr = req.getParameter("count");
			String idStr = req.getParameter("goodsName");
			String des = req.getParameter("des");
			String unitPrice = req.getParameter("unitPrice");
			int a = 0;
			double b = 0;
			if (countStr != null) {
				a = Integer.valueOf(countStr);
				b = Double.valueOf(unitPrice);
			}
			
			double c = b * a;
			
			Pay pay = new Pay();
			pay.setPayTypeId("402880925996b0e3015996b4706c0000");
			pay.setPayDay(Constants.CURRENT_TIME);
			pay.setEmpId(emp.getEmpId());
			pay.setDes(des);
			pay.setPay(c);
			pay.setToName(emp.getName());
			pay.setToPhone(emp.getPhone());
			payService.save(pay);
			goodsService.updateAppQuantity(a, idStr);
			goodsAppService.updateAppStatus("GoodsApp", "goodsAppId", 2, id);
		} else {

		}
		return "dable";

	}

	/**
	 * δͨ��
	 * 
	 * @return
	 */
	public String goodsAppAct() {
		Emp emp = (Emp) req.getSession().getAttribute("emp");
		String actionName = GoodsAppAction.class.getName();
		System.out.println("ddddddddddddddddddddd");
		if (goodsAppService.queryPrevillige(emp.getRoleId(), actionName + ".goodsAppAct")) {
			goodsAppService.updateAppStatus("GoodsApp", "goodsAppId", 0, id);
		} else {
			
		}
		return "avate";

	}

	/**
	 * Ա����Ʒ�깺ҳ��1
	 */
	public String giveBackPage() {
		return "giveBackPage";

	}

	/**
	 * Ա�������Ʒ�깺1
	 */
	public String saveGoodsApp() {
		System.out.println("aaaaaaaaaaaaaaa");
		Emp emps = (Emp) req.getSession().getAttribute("emp");
		goodsApp.setEmpId(emps.getEmpId());
		goodsApp.setAppStatus(1);
		goodsApp.setStatus(1);
		/**
		 * ��ȡϵͳʱ��
		 */
		Calendar c = Calendar.getInstance();
		Date nowTime = c.getTime();
		goodsApp.setAppDay(nowTime);
		goodsAppService.save(goodsApp);
		result = ControllerResult.getSuccessResult("��ӳɹ�");
		return "saveGoodsApp";

	}

	/**
	 * Ա����Ʒ�깺
	 */
	public String giveBack() {
		Emp emp = (Emp) req.getSession().getAttribute("emp");
		String pageNoStr = req.getParameter("page");
		String pageSizeStr = req.getParameter("rows");
		Pager4EasyUI<GoodsApp> pager = new Pager4EasyUI<GoodsApp>();
		if (pageNoStr != null) {
			pager.setPageNo(Integer.valueOf(pageNoStr));
			pager.setPageSize(Integer.valueOf(pageSizeStr));
		}
		pager = goodsAppService.queryByPager("GoodsApp where empId = '" + emp.getEmpId() + "'", pager, "");
		pager.setTotal(goodsAppService.count("GoodsApp", ""));
		rows = pager.getRows();
		total = pager.getTotal();
		return "giveBack";
	}

}
