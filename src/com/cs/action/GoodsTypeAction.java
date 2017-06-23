package com.cs.action;

import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.cs.bean.Emp;
import com.cs.bean.GoodsType;
import com.cs.commom.bean.ControllerResult;
import com.cs.commom.bean.Pager4EasyUI;
import com.cs.service.DeptService;
import com.cs.service.GoodsTypeService;
import com.opensymphony.xwork2.ActionSupport;

public class GoodsTypeAction extends ActionSupport implements ServletRequestAware {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 6656919070598734010L;
	private GoodsTypeService goodsTypeService;
	private long total;
	private String id;
	private GoodsType goodsType;
	private List<GoodsType> rows;
	public ControllerResult result;
	public HttpServletRequest req;
	private DeptService deptService;
	
	public void setDeptService(DeptService deptService) {
		this.deptService = deptService;
	}

	public ControllerResult getResult() {
		return result;
	}
	
	@Override
	public void setServletRequest(HttpServletRequest req) {
		this.req = req;
	}
	

	public void setGoodsTypeService(GoodsTypeService goodsTypeService) {
		this.goodsTypeService = goodsTypeService;
	}

	
	public long getTotal() {
		return total;
	}

	public void setTotal(long total) {
		this.total = total;
	}

	public void setId(String id) {
		this.id = id;
	}
	public GoodsType getGoodsType() {
		return goodsType;
	}
	public void setGoodsType(GoodsType goodsType) {
		this.goodsType = goodsType;
	}
	public List<GoodsType> getRows() {
		return rows;
	}
	
	/**
	 * ��ҳ��ת��userҳ��
	 * @return
	 */
	public String skipPage() {
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		String actionName = GoodsTypeAction.class.getName();
		System.out.println(emp.getRoleId() + emp.getRoleName());
		if (goodsTypeService.queryPrevillige(emp.getRoleId(), actionName + ".skipPage")) {
	        return "skip";
		}else {
			return "NoPrevillige";
		}
	}
	
	/**
	 * �����Ʒ
	 */
	public String save() {
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		String actionName = GoodsTypeAction.class.getName();
		if (goodsTypeService.queryPrevillige(emp.getRoleId(), actionName + ".save")) {
			if (!deptService.queryByName("t_goodstype", goodsType.getName())) {
				goodsType.setStatus(1);
				goodsTypeService.save(goodsType);
				result = ControllerResult.getSuccessResult("��ӳɹ�");
			} else {
				result = ControllerResult.getSuccessResult("��Ʒ�����Ѵ���");
			}
			
		}else {
			result = ControllerResult.getFailResult("Ȩ�޲���");
		}
		return "save";
	}
	
	/**
	 * ��ҳ��ѯ������Ʒ
	 */
	public String queryAll() {
		String pageNoStr = req.getParameter("page");
        String pageSizeStr = req.getParameter("rows");
        Pager4EasyUI<GoodsType> pager = new Pager4EasyUI<GoodsType>();
        if (pageNoStr != null) {
            pager.setPageNo(Integer.valueOf(pageNoStr));
            pager.setPageSize(Integer.valueOf(pageSizeStr));
        }
        pager = goodsTypeService.queryByPager("GoodsType", pager, "");
        pager.setTotal(goodsTypeService.count("GoodsType",""));
        rows = pager.getRows();
        total = pager.getTotal();
        return "all";
	}
	
	/**
	 * ��ѯ������Ʒ����
	 */
	public String queryById(String id){
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		String actionName = GoodsTypeAction.class.getName();
		if (goodsTypeService.queryPrevillige(emp.getRoleId(), actionName + ".queryById")) {
			GoodsType goodsType = goodsTypeService.queryById(GoodsType.class,id);
			System.out.println(goodsType);
		}else {

		}
		return "id";
		
	}
	
	/**
	 * �޸���Ʒ
	 */
	public String update() {
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		String actionName = GoodsTypeAction.class.getName();
		if (goodsTypeService.queryPrevillige(emp.getRoleId(), actionName + ".queryById")) {
			goodsTypeService.update(goodsType);
			result = ControllerResult.getSuccessResult("�޸ĳɹ�");
		}else {
			result = ControllerResult.getFailResult("Ȩ�޲���");
		}
		return "update";
		
	}
	
	/**
	 * ����
	 * @return
	 */
	public String empDisable(){ 
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		String actionName = GoodsTypeAction.class.getName();
		if (goodsTypeService.queryPrevillige(emp.getRoleId(), actionName + ".empDisable")) {
			goodsTypeService.updateStatus("GoodsType","goodsTypeId",0, id);
		}else {

		}
		return "disable";
		
	}
	
	/**
	 * ����
	 * @return
	 */
	public String empActivate(){
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		String actionName = GoodsTypeAction.class.getName();
		if (goodsTypeService.queryPrevillige(emp.getRoleId(), actionName + ".empActivate")) {
			goodsTypeService.updateStatus("GoodsType","goodsTypeId",1, id);
		}else {

		}
		return "activate";
		
	}
	
	

	
}
