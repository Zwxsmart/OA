package com.cs.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.cs.bean.Emp;
import com.cs.bean.PayType;
import com.cs.bean.User;
import com.cs.commom.bean.ControllerResult;
import com.cs.commom.bean.Pager4EasyUI;
import com.cs.service.PayTypeService;
import com.opensymphony.xwork2.ActionSupport;

public class PayTypeAction extends ActionSupport implements ServletRequestAware {

	private static final long serialVersionUID = 6501238897093801839L;

	private PayTypeService payTypeService;

	private PayType payType;

	private long total;

	private List<PayType> rows;

	private ControllerResult result;

	private HttpServletRequest req;

	private String id;
	private Emp emp;

	@Override
	public void setServletRequest(HttpServletRequest req) {
		this.req = req;
	}

	public void setPayTypeService(PayTypeService payTypeService) {
		this.payTypeService = payTypeService;
	}

	public PayType getPayType() {
		return payType;
	}

	public long getTotal() {
		return total;
	}

	public void setTotal(long total) {
		this.total = total;
	}

	public void setPayType(PayType payType) {
		this.payType = payType;
	}

	public List<PayType> getRows() {
		return rows;
	}

	public ControllerResult getResult() {
		return result;
	}

	public void setId(String id) {
		this.id = id;
	}

	/**
	 * 主页跳转到支出类别页面
	 * 
	 * @return
	 */
	public String payTypePage() {
		emp = (Emp) (req).getSession().getAttribute("emp");
		if (payTypeService.queryPrevillige(emp.getRoleId(), PayTypeAction.class.getName() + ".payTypePage")) {
			return "payType";
		} else {
			return "NoPrevillige";
		}
	}

	/**
	 * 支出类别添加
	 */
	public String save() {
		emp = (Emp) (req).getSession().getAttribute("emp");
		if (payTypeService.queryPrevillige(emp.getRoleId(), PayTypeAction.class.getName() + ".payTypePage")) {
			payType.setStatus(1);//添加状态默认为启用
			payTypeService.save(payType);
			result = ControllerResult.getSuccessResult("添加成功");
		} else {
			result = ControllerResult.getSuccessResult("权限不足");
		}
		return "save";
	}

	/**
	 * 分页所有有工资类型
	 */
	public String queryAll() {
		emp = (Emp) (req).getSession().getAttribute("emp");
		if (payTypeService.queryPrevillige(emp.getRoleId(), PayTypeAction.class.getName() + ".payTypePage")) {
			String pageNoStr = req.getParameter("page");
			String pageSizeStr = req.getParameter("rows");
			Pager4EasyUI<PayType> pager = new Pager4EasyUI<PayType>();
			String sql = "";
			if (pageNoStr != null) {
				pager.setPageNo(Integer.valueOf(pageNoStr));
				pager.setPageSize(Integer.valueOf(pageSizeStr));
			}
			pager = payTypeService.queryByPager("PayType", pager, sql);
			pager.setTotal(payTypeService.count("PayType", sql));
			rows = pager.getRows();
			total = pager.getTotal();

		} else {
			result = ControllerResult.getSuccessResult("权限不足");
		}
		return "all";
	}

	/**
	 * 查询单个工资类型详情
	 */
	public String queryById(String id) {
		emp = (Emp) (req).getSession().getAttribute("emp");
		if (payTypeService.queryPrevillige(emp.getRoleId(), PayTypeAction.class.getName() + ".payTypePage")) {
			PayType PayType = payTypeService.queryById(User.class, id);
			System.out.println(PayType);
		} else {
			result = ControllerResult.getSuccessResult("权限不足");
		}
		return "id";
	}

	/**
	 * 修改工资类型
	 */
	public String update() {
		emp = (Emp) (req).getSession().getAttribute("emp");
		if (payTypeService.queryPrevillige(emp.getRoleId(), PayTypeAction.class.getName() + ".payTypePage")) {
			payTypeService.update(payType);
			result = ControllerResult.getSuccessResult("修改成功");
		} else {
			result = ControllerResult.getSuccessResult("权限不足");
		}
		return "update";
	}

	/**
	 * 禁用
	 * 
	 * @return
	 */
	public String payTypeDisable() {
		Emp emp = (Emp) (req).getSession().getAttribute("emp");// 获取此登陆id对象
		if (payTypeService.queryPrevillige(emp.getRoleId(), PayTypeAction.class.getName() + ".payTypeDisable")) {
			payTypeService.updateStatus("PayType", "payTypeId", 0, id);

		} else {
			result = ControllerResult.getSuccessResult("权限不足");
		}
		return "disable";
	}

	/**
	 * 启用
	 * 
	 * @return
	 */
	public String payTypeActivate() {
		Emp emp = (Emp) (req).getSession().getAttribute("emp");// 获取此登陆id对象
		if (payTypeService.queryPrevillige(emp.getRoleId(), PayTypeAction.class.getName() + ".payTypeActivate")) {
			payTypeService.updateStatus("PayType", "payTypeId", 1, id);
		} else {
			result = ControllerResult.getSuccessResult("权限不足");
		}
		return "activate";
	}
}