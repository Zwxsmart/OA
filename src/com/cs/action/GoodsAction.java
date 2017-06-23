package com.cs.action;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.cs.bean.Check;
import com.cs.bean.Emp;
import com.cs.bean.Goods;
import com.cs.bean.GoodsApp;
import com.cs.bean.GoodsUse;
import com.cs.commom.Constants;
import com.cs.commom.bean.ControllerResult;
import com.cs.commom.bean.Pager4EasyUI;
import com.cs.service.DeptService;
import com.cs.service.GoodsAppService;
import com.cs.service.GoodsService;
import com.cs.service.GoodsUseService;
import com.opensymphony.xwork2.ActionSupport;


public class GoodsAction extends ActionSupport implements ServletRequestAware {
	
	private static final long serialVersionUID = 5672904925645490312L;
	
	private GoodsService goodsService;
	private long total;
	private Goods goods;
	private List<Goods> rows;
	private String id;
	public ControllerResult result;
	public HttpServletRequest req;
	private String typeId;
	private GoodsAppService goodsAppService;
	private DeptService deptService;
	/**
	 * 员工申领service调用
	 */
	
	
	private GoodsUseService goodsUseService;
	
	public void setDeptService(DeptService deptService) {
		this.deptService = deptService;
	}

	/**
	 * 员工申购service调用
	 * @param goodsAppService
	 */
	public void setGoodsAppService(GoodsAppService goodsAppService) {
		this.goodsAppService = goodsAppService;
	}

	/**
	 * 员工申领service调用
	 * @param goodsAppService
	 */
	public void setGoodsUseService(GoodsUseService goodsUseService) {
		this.goodsUseService = goodsUseService;
	}
	
	public String getTypeId() {
		return typeId;
	}

	public void setTypeId(String typeId) {
		this.typeId = typeId;
	}

	public ControllerResult getResult() {
		return result;
	}
	
	@Override
	public void setServletRequest(HttpServletRequest req) {
		this.req = req;
	}
	
	public long getTotal() {
		return total;
	}

	public Goods getGoods() {
		return goods;
	}

	public void setGoods(Goods goods) {
		this.goods = goods;
	}

	public List<Goods> getRows() {
		return rows;
	}

	public void setGoodsService(GoodsService goodsService) {
		this.goodsService = goodsService;
	}
	



	public void setId(String id) {
		this.id = id;
	}

	/**
	 * 主页跳转到物品页面
	 * @return
	 */
	public String skipPage() {
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		String actionName = GoodsAction.class.getName();
		if (goodsService.queryPrevillige(emp.getRoleId(), actionName + ".skipPage")) {
	        return "skip";
		}else {
			return "NoPrevillige";
		}
	}
	
	
	/**
	 * 招生部主任
	 * @return
	 */
	public String admissionsSkipPage() {
	        return "admissionsSkip";
	}
	/**
	 * 添加物品
	 */
	public String save() {
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		String actionName = GoodsAction.class.getName();
		if (goodsService.queryPrevillige(emp.getRoleId(), actionName + ".save")) {
			if (!deptService.queryByName("t_goods", goods.getName())) {
				goods.setGoodsTypeId(typeId);
				goods.setQuantityCount(goods.getQuantity());
				goods.setStatus(1);
				goodsService.save(goods);
				result = ControllerResult.getSuccessResult("添加成功");
			} else {
				result = ControllerResult.getSuccessResult("物品已存在");
			}
		
		}else {
			result = ControllerResult.getFailResult("权限不足");
		}
		return "save";
	}
	
	/**
	 * 分页查询所有物品
	 */
	public String queryAll() {
			String pageNoStr = req.getParameter("page");
	        String pageSizeStr = req.getParameter("rows");
	        Pager4EasyUI<Goods> pager = new Pager4EasyUI<Goods>();
	        if (pageNoStr != null) {
	            pager.setPageNo(Integer.valueOf(pageNoStr));
	            pager.setPageSize(Integer.valueOf(pageSizeStr));
	        }
	        pager = goodsService.queryByPager("Goods", pager, "");
	        pager.setTotal(goodsService.count("Goods",""));
	        rows = pager.getRows();
	        total = pager.getTotal();
	        return "all";
		}
		
	/**
	 * 查询单个物品详情
	 */
	public String queryById(String id){
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		String actionName = GoodsAction.class.getName();
		if (goodsService.queryPrevillige(emp.getRoleId(), actionName + ".queryById")) {
			Goods goods = goodsService.queryById(Goods.class, id);
			System.out.println(goods);
		}else {

		}
		return "id";
		
	}
	
	/**
	 * 修改物品
	 */
	public String update() {
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		String actionName = GoodsAction.class.getName();
		if (goodsService.queryPrevillige(emp.getRoleId(), actionName + ".update")) {
			System.out.println(typeId + "ddddddddddd");
			goods.setGoodsId(goods.getGoodsId());
			goods.setGoodsTypeId(typeId);
			goodsService.update(goods);
			result = ControllerResult.getSuccessResult("修改成功");
		}else {
			result = ControllerResult.getFailResult("权限不足");
		}
		return "update";
	}
	
	/**
	 * 模糊查询
	 */
	public String blurredAllQuery(){
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		String actionName = GoodsAction.class.getName();
		if (goodsService.queryPrevillige(emp.getRoleId(), actionName + ".blurredAllQuery")) {
			String pageNoStr = req.getParameter("page");
	        String pageSizeStr = req.getParameter("rows");
	        String value= req.getParameter("value1");
	        String name= req.getParameter("name1");
	        System.out.println("value :" + value +", name: "+ name);
	        Pager4EasyUI<Goods> pager = new Pager4EasyUI<Goods>();
	        if (pageNoStr != null) {
	            pager.setPageNo(Integer.valueOf(pageNoStr));
	            pager.setPageSize(Integer.valueOf(pageSizeStr));
	        }
	        pager = goodsService.blurredAllQueryPager("Goods", pager, value, name);
	        rows = pager.getRows();
	        total = pager.getTotal();
		}else {

		}
		return "blurredAllQuery";
		
	}
	
	// 时间段查询
	public String serachTime(){
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		String actionName = GoodsAction.class.getName();
		if (goodsService.queryPrevillige(emp.getRoleId(), actionName + ".serachTime")) {
			String pageNoStr = req.getParameter("page");
	        String pageSizeStr = req.getParameter("rows");
			String beginTime=req.getParameter("beginTime");
			String endTime=req.getParameter("endTime");
			System.out.println("开始时间"+beginTime+"结束时间："+endTime);
			Pager4EasyUI<Goods> pager = new Pager4EasyUI<Goods>();
		    if (pageNoStr != null) {
		    	pager.setPageNo(Integer.valueOf(pageNoStr));
		        pager.setPageSize(Integer.valueOf(pageSizeStr));
		    }
			pager=goodsService.queryByDay(pager,beginTime,endTime, "Goods", "buyDay");
			System.out.println(pager.toString());
			pager.setTotal(goodsService.count("Goods", ""));
			rows = pager.getRows();
			total = pager.getTotal();
		}else {

		}
		return "serachtime";
		
	}
	
	/**
	 * 禁用
	 * @return
	 */
	public String empDisable(){ 
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		String actionName = GoodsAction.class.getName();
		if (goodsService.queryPrevillige(emp.getRoleId(), actionName + ".empDisable")) {
			goodsService.updateStatus("Goods","goodsId",0, id);
		}else {

		}
		return "disable";
		
	}
	
	/**
	 * 启用
	 * @return
	 */
	public String empActivate(){
		Emp emp = (Emp)req.getSession().getAttribute("emp");
		String actionName = GoodsAction.class.getName();
		if (goodsService.queryPrevillige(emp.getRoleId(), actionName + ".empActivate")) {
			goodsService.updateStatus("Goods","goodsId",1, id);
		}else {

		}
		return "activate";
		
	}
	
	/**1
	 * 员工个人物品页面
	 */
	public String empGoodsPage() {
		return "empGoodsPage";
	}
	
	/**
	 * 员工物品管理
	 */
	public String empGoods() {
			String pageNoStr = req.getParameter("page");
	        String pageSizeStr = req.getParameter("rows");
	        Pager4EasyUI<Goods> pager = new Pager4EasyUI<Goods>();
	        if (pageNoStr != null) {
	            pager.setPageNo(Integer.valueOf(pageNoStr));
	            pager.setPageSize(Integer.valueOf(pageSizeStr));
	        }
	        pager = goodsService.queryByPager("Goods", pager, "");
	        pager.setTotal(goodsService.count("Goods",""));
	        rows = pager.getRows();
	        total = pager.getTotal();
			return "empGoods";
	}
	
	
	/**
	 * 员工申领
	 */
	public String goodsPurchase() {
			String countStr = req.getParameter("count");
			String idStr = req.getParameter("id");
			String des = req.getParameter("des");
			String name = req.getParameter("name");
			String quantity = req.getParameter("goodsCount");
			
			String dateTime = req.getParameter("dateTime");
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			System.out.println(dateTime + "ccccccccccccccccccccccccccccc");
			Date d = null;
			try {
				d = formatter.parse(dateTime);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			
			Integer goodsCount = Integer.valueOf(quantity);
			Integer count = Integer.valueOf(countStr);
			Emp emp = (Emp)req.getSession().getAttribute("emp");
			GoodsUse goodsUse = new GoodsUse();
			goodsUse.setEmpId(emp.getEmpId());
			goodsUse.setGoodsId(idStr);
			goodsUse.setQuantity(goodsCount);
			goodsUse.setEreturnDay(d);
			goodsUse.setQuantity(count);
			goodsUse.setDes(des);
			/**
			 * 获取系统时间
			 */
			Calendar c = Calendar.getInstance();
			Date nowTime = c.getTime();
			goodsUse.setUseDay(nowTime);
//			int a = 0;
//			if (goodsCount != 0) {
//				a  = goodsCount - count;
//			}
//			goodsService.updateQuantity("Goods", "goodsId", a, idStr);
			goodsUseService.save(goodsUse);
			return "goodsPurchase";
	}	
	
	/**
	 * 物品申购
	 */
	public String goodsEmption() {
		String countStr = req.getParameter("count");
		String idStr = req.getParameter("id");
		String des = req.getParameter("des");
		String name = req.getParameter("name");
		String priceStr = req.getParameter("price");
		int count = 0;
		double price = 0;
		if (countStr != null) {
			count = Integer.valueOf(countStr);
			price = Double.valueOf(count);
		}
		Emp emps = (Emp) req.getSession().getAttribute("emp");
		GoodsApp goodsApp = new GoodsApp();
		goodsApp.setEmpId(emps.getEmpId());
		goodsApp.setAppDay(Constants.CURRENT_TIME);
		goodsApp.setGoodsName(name);
		goodsApp.setQuantity(count);
		goodsApp.setDes(des);
		goodsApp.setUnitPrice(price);
		goodsApp.setAppStatus(1);
		goodsApp.setStatus(1);
		goodsAppService.save(goodsApp);
		return "goodsEmption";
	}
	/**
	 * 权限管理：教务部主任  跳转到物品管理
	 */
	public String skipEadGoods(){
		return "eadgoods";
	}
}
