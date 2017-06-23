package com.cs.action;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.cs.bean.Emp;
import com.cs.bean.Goods;
import com.cs.bean.GoodsUse;
import com.cs.commom.bean.ControllerResult;
import com.cs.commom.bean.Pager4EasyUI;
import com.cs.service.GoodsService;
import com.cs.service.GoodsUseService;
import com.opensymphony.xwork2.ActionSupport;

public class GoodsUseAction extends ActionSupport implements ServletRequestAware {
	
	private static final long serialVersionUID = 6226500372214744354L;
	
	public HttpServletRequest req;
	public ControllerResult result;
	private GoodsUse goodsUse;
	private List<GoodsUse> rows;
	private long total;
	private String id;
	private GoodsUseService goodsUseService;
	private String empId;
	private String goodsId;
	private GoodsService goodsService;
	
	
	
	public void setGoodsService(GoodsService goodsService) {
		this.goodsService = goodsService;
	}

	public String getEmpId() {
		return empId;
	}

	public void setEmpId(String empId) {
		this.empId = empId;
	}

	public String getGoodsId() {
		return goodsId;
	}

	public void setGoodsId(String goodsId) {
		this.goodsId = goodsId;
	}

	@Override
	public void setServletRequest(HttpServletRequest req) {
		this.req = req;
	}

	public GoodsUse getGoodsUse() {
		return goodsUse;
	}

	public void setGoodsUse(GoodsUse goodsUse) {
		this.goodsUse = goodsUse;
	}

	public ControllerResult getResult() {
		return result;
	}

	public List<GoodsUse> getRows() {
		return rows;
	}

	public long getTotal() {
		return total;
	}

	public void setId(String id) {
		this.id = id;
	}

	public void setGoodsUseService(GoodsUseService goodsUseService) {
		this.goodsUseService = goodsUseService;
	}
	
	
	/**
	 * ��תҳ��
	 * @return
	 */
	public String skipPage() {
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		String actionName = GoodsUseAction.class.getName();
		if (goodsUseService.queryPrevillige(emp.getRoleId(), actionName + ".skipPage")) {
			 return "skip";
		}else {
			return "NoPrevillige";
		}
	  
	}
	
	/**
	 * ����������
	 * @return
	 */
	public String admissionsSkipPage() {
	        return "admissionsSkip";
	}

	/**
	 * �����Ʒ������Ϣ
	 */
	public String save() {
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		String actionName = GoodsUseAction.class.getName();
		if (goodsUseService.queryPrevillige(emp.getRoleId(), actionName + ".save")) {
			goodsUse.setEmpId(empId);
			goodsUse.setGoodsId(goodsId);
			goodsUseService.save(goodsUse);
			result = ControllerResult.getSuccessResult("��ӳɹ�");
		}else {
			result = ControllerResult.getFailResult("Ȩ�޲���");
		}
		return "save";
	}

	/**
	 * ��ѯ���е���Ʒ������Ϣ
	 */
	public String queryAll() {
		String pageNoStr = req.getParameter("page");
		String pageSizeStr = req.getParameter("rows");
		Pager4EasyUI<GoodsUse> pager = new Pager4EasyUI<GoodsUse>();
		if (pageNoStr != null) {
			pager.setPageNo(Integer.valueOf(pageNoStr));
			pager.setPageSize(Integer.valueOf(pageSizeStr));
		}
		pager = goodsUseService.queryByPager("GoodsUse", pager, "");
		pager.setTotal(goodsUseService.count("GoodsUse",""));
		rows = pager.getRows();
		total = pager.getTotal();
		return "all";
	}
	
	/**
	 * �޸�������Ʒ������Ϣ
	 */
	public String update() {
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		String actionName = GoodsUseAction.class.getName();
		if (goodsUseService.queryPrevillige(emp.getRoleId(), actionName + ".update")) {
			goodsUse.setUseId(goodsUse.getUseId());
			goodsUse.setEmpId(empId);
			goodsUse.setGoodsId(goodsId);
			goodsUseService.update(goodsUse);
			result = ControllerResult.getSuccessResult("�޸ĳɹ�");
		}else {
			result = ControllerResult.getFailResult("Ȩ�޲���");
		}
		return "update";
	}
	
	/**
	 * ģ����ѯ
	 */
	public String blurredAllQuery(){
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		String actionName = GoodsUseAction.class.getName();
		if (goodsUseService.queryPrevillige(emp.getRoleId(), actionName + ".blurredAllQuery")) {
			String pageNoStr = req.getParameter("page");
	        String pageSizeStr = req.getParameter("rows");
	        String value= req.getParameter("value1");
	        String name= req.getParameter("name1");
	        System.out.println("value :" + value +", name: "+ name);
	        Pager4EasyUI<GoodsUse> pager = new Pager4EasyUI<GoodsUse>();
	        if (pageNoStr != null) {
	            pager.setPageNo(Integer.valueOf(pageNoStr));
	            pager.setPageSize(Integer.valueOf(pageSizeStr));
	        }
	        pager = goodsUseService.blurredAllQueryPager("GoodsUse", pager, value, name);
	        rows = pager.getRows();
	        total = pager.getTotal();
		}else {

		}
		return "blurredAllQuery";
		
	}
	
	// ʱ��β�ѯ
	public String serachTime(){
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		String actionName = GoodsUseAction.class.getName();
		if (goodsUseService.queryPrevillige(emp.getRoleId(), actionName + ".serachTime")) {
			String pageNoStr = req.getParameter("page");
	        String pageSizeStr = req.getParameter("rows");
			String beginTime=req.getParameter("beginTime");
			String endTime=req.getParameter("endTime");
			System.out.println("��ʼʱ��"+beginTime+"����ʱ�䣺"+endTime);
			Pager4EasyUI<GoodsUse> pager = new Pager4EasyUI<GoodsUse>();
		    if (pageNoStr != null) {
		    	pager.setPageNo(Integer.valueOf(pageNoStr));
		        pager.setPageSize(Integer.valueOf(pageSizeStr));
		    }
			pager=goodsUseService.queryByDay(pager,beginTime,endTime, "GoodsUse", "useDay");
			System.out.println(pager.toString());
			pager.setTotal(goodsUseService.count("GoodsUse", ""));
			rows = pager.getRows();
			total = pager.getTotal();
		}else {

		}
		return "serachtime";
		
	}
/*	
	*//**
	 * ɾ��������Ʒ������Ϣ
	 *//*
	public String deleteById() {
		goodsUse = new GoodsUse();
		goodsUse.setUseId(id);
		goodsUseService.delete(goodsUse);
		result = ControllerResult.getSuccessResult("�޸ĳɹ�");
		return "delete";
	}
*/	
	// ������תҳ��1
	public String goodsApplyPage() {
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		String actionName = GoodsUseAction.class.getName();
		if (goodsUseService.queryPrevillige(emp.getRoleId(), actionName + ".goodsApplyPage")) {
		}else {

		}
		return "goodsApplyPage";
		
	}

	// ��ѯ��������ҳ��
	public String goodsApply() {
		String pageNoStr = req.getParameter("page");
		String pageSizeStr = req.getParameter("rows");
		Pager4EasyUI<GoodsUse> pager = new Pager4EasyUI<GoodsUse>();
		if (pageNoStr != null) {
			pager.setPageNo(Integer.valueOf(pageNoStr));
			pager.setPageSize(Integer.valueOf(pageSizeStr));
		}
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		pager = goodsUseService.queryByPager("GoodsUse where empId = '"+emp.getEmpId()+"'", pager, "");
		pager.setTotal(goodsUseService.count("GoodsUse where empId = '"+emp.getEmpId()+"'",""));
		rows = pager.getRows();
		total = pager.getTotal();
		return "goodsApply";
	}

	// �޸�����״̬1
	public String updateUseStatus() {
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		String actionName = GoodsUseAction.class.getName();
		if (goodsUseService.queryPrevillige(emp.getRoleId(), actionName + ".updateUseStatus")) {
			/**
			 * ��ȡϵͳʱ��
			 */
			Calendar c = Calendar.getInstance();
			Date nowTime = c.getTime();
			goodsUseService.updateUseStatus("GoodsUse", "useId", 2, id);
			goodsUseService.updateUseRequestDate("GoodsUse", "useId", nowTime, id);
		}else {

		}
		return "updateUseStatus";
		
	}
	
	/**
	 * ȡ��1
	 */
	public String goodsUseAct() {
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		String actionName = GoodsUseAction.class.getName();
		if (goodsUseService.queryPrevillige(emp.getRoleId(), actionName + ".goodsUseAct")) {
			goodsUseService.updateUseStatus("GoodsUse", "useId", 4, id);
		}else {
		}
		return "goodsUseAct";
		
	}
	
	/**
	 * ͨ��1
	 */
	public String goodsUseDis() {
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		String actionName = GoodsUseAction.class.getName();
		if (goodsUseService.queryPrevillige(emp.getRoleId(), actionName + ".goodsUseDis")) {
			String idStr = req.getParameter("goodsId");
			String quantity = req.getParameter("goodsCount");
			String countStr = req.getParameter("useCount");
			Integer goodsCount = Integer.valueOf(quantity);
			Integer count = Integer.valueOf(countStr);
			int a = 0;
			if (goodsCount != 0) {
				a  = goodsCount - count;
			}
			goodsService.updateQuantity("Goods", "goodsId", a, idStr);
			goodsUseService.updateUseStatus("GoodsUse", "useId", 3, id);
		}else {
			return "NoPrevillige";
		}
		return "goodsUseDis";
		
	}
	
	/**
	 * ȷ��1
	 */
	public String okUse() {
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		String actionName = GoodsUseAction.class.getName();
		if (goodsUseService.queryPrevillige(emp.getRoleId(), actionName + ".okUse")) {
			String quantityStr = req.getParameter("goodsCount");
			String goodsId = req.getParameter("goodsId");
			String useCount = req.getParameter("useCount");
			Integer a = null;
			Integer b = null;
			if (quantityStr != null) {
				a = Integer.valueOf(quantityStr);
				b = Integer.valueOf(useCount);
			}
			int c = a + b;
			goodsUseService.updateGoodsQuantity("Goods", "goodsId", c, goodsId);
			goodsUseService.updateUseStatus("GoodsUse", "useId", 1, id);
		}else {

		}
		return "okUse";
		
	}
	

}
