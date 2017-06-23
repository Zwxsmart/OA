package com.cs.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.cs.bean.Emp;
import com.cs.bean.Pay;
import com.cs.bean.User;
import com.cs.commom.bean.ControllerResult;
import com.cs.commom.bean.Pager4EasyUI;
import com.cs.service.PayService;
import com.opensymphony.xwork2.ActionSupport;

public class PayAction extends ActionSupport implements ServletRequestAware {

	private static final long serialVersionUID = 6501238897093801839L;

	private PayService payService;
	private Pay pay;
	private long total;
	private List<Pay> rows;
	private ControllerResult result;
	private HttpServletRequest req;
	private String payTypeId;
	private String empId;
	
	private List<Map<String,String>> pays;
	
	public List<Map<String, String>> getPays() {
		return pays;
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

	public String getPayTypeId() {
		return payTypeId;
	}

	public void setPayTypeId(String payTypeId) {
		this.payTypeId = payTypeId;
	}

	public void setPayService(PayService payService) {
		this.payService = payService;
	}

	public Pay getPay() {
		return pay;
	}

	public long getTotal() {
		return total;
	}

	public void setTotal(long total) {
		this.total = total;
	}

	public void setPay(Pay pay) {
		this.pay = pay;
	}

	public List<Pay> getRows() {
		return rows;
	}

	public ControllerResult getResult() {
		return result;
	}

	/**
	 * 主页跳转到u页面
	 * 
	 * @return
	 */
	public String payPage() {
		Emp emp = (Emp) (req).getSession().getAttribute("emp");
		if (payService.queryPrevillige(emp.getRoleId(), PayAction.class.getName() + ".payPage")) {
			return "pay";
		} else {
			return "NoPrevillige";
		}
	}

	/**
	 * 添加支出管理
	 */
	public String save() {
		Emp emp = (Emp) (req).getSession().getAttribute("emp");
		if (payService.queryPrevillige(emp.getRoleId(), PayAction.class.getName() + ".payPage")) {
			pay.setEmpId(empId);
			pay.setPayTypeId(payTypeId);
			payService.save(pay);
			result = ControllerResult.getSuccessResult("添加成功");
		} else {
			result = ControllerResult.getSuccessResult("权限不足");
		}
		return "save";
	}

	/**
	 * 分页查询所有支出
	 */
	public String queryAll() {
		Emp emp = (Emp) (req).getSession().getAttribute("emp");
		if (payService.queryPrevillige(emp.getRoleId(), PayAction.class.getName() + ".payPage")) {
			String pageNoStr = req.getParameter("page");
			String pageSizeStr = req.getParameter("rows");
			Pager4EasyUI<Pay> pager = new Pager4EasyUI<Pay>();
			if (pageNoStr != null) {
				pager.setPageNo(Integer.valueOf(pageNoStr));
				pager.setPageSize(Integer.valueOf(pageSizeStr));
			}
			pager = payService.queryByPager("Pay", pager, "");
			pager.setTotal(payService.count("Pay", ""));
			rows = pager.getRows();
			total = pager.getTotal();

		} else {
			result = ControllerResult.getSuccessResult("权限不足");
		}
		return "all";
	}

	/**
	 * 查询单个支出详情
	 */
	public String queryById(String id) {
		Emp emp = (Emp) (req).getSession().getAttribute("emp");
		if (payService.queryPrevillige(emp.getRoleId(), PayAction.class.getName() + ".payPage")) {
			Pay Pay = payService.queryById(User.class, id);
			System.out.println(Pay);

		} else {
			result = ControllerResult.getSuccessResult("权限不足");
		}
		return "id";
	}

	/**
	 * 修改支出
	 */
	public String update() {
		Emp emp = (Emp) (req).getSession().getAttribute("emp");
		if (payService.queryPrevillige(emp.getRoleId(), PayAction.class.getName() + ".payPage")) {
			pay.setPayId(pay.getPayId());
			pay.setPayTypeId(pay.getPayTypeId());
			pay.setEmpId(pay.getEmpId());
			payService.update(pay);
			result = ControllerResult.getSuccessResult("修改成功");

		} else {
			result = ControllerResult.getSuccessResult("权限不足");
		}
		return "update";
	}

	/**
	 * 模糊查询
	 */
	public String blurredAllQuery() {
		Emp emp = (Emp) (req).getSession().getAttribute("emp");
		if (payService.queryPrevillige(emp.getRoleId(), PayAction.class.getName() + ".payPage")) {
			String pageNoStr = req.getParameter("page");
			String pageSizeStr = req.getParameter("rows");
			String value = req.getParameter("value1");
			String name = req.getParameter("name1");
			System.out.println("value :" + value + ", name: " + name);
			Pager4EasyUI<Pay> pager = new Pager4EasyUI<Pay>();
			if (pageNoStr != null) {
				pager.setPageNo(Integer.valueOf(pageNoStr));
				pager.setPageSize(Integer.valueOf(pageSizeStr));
			}
			pager = payService.blurredAllQueryPager("Pay", pager, value, name);
			rows = pager.getRows();
			total = pager.getTotal();
		} else {
			result = ControllerResult.getSuccessResult("权限不足");
		}
		return "blurredAllQuery";
	}

	/**
	 * 跳转到财务部表格
	 * @return
	 */
	public String paybiaoge(){
		return "paybiaoge";
	}
	
	public String getChartsPie(){
		System.out.println("进入到数据表格");
		pays =payService.payQueryTypeName();
		return "getChartsPie";
	}
}