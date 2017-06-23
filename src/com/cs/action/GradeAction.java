package com.cs.action;

import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.cs.bean.Emp;
import com.cs.bean.Grade;
import com.cs.bean.Room;
import com.cs.bean.Score;
import com.cs.commom.bean.ControllerResult;
import com.cs.commom.bean.Pager4EasyUI;
import com.cs.service.GradeService;
import com.cs.service.ScoreService;
import com.opensymphony.xwork2.ActionSupport;

public class GradeAction extends ActionSupport implements ServletRequestAware {
	
	private static final long serialVersionUID = -7433491681110583231L;

	private GradeService gradeService;
	private ScoreService scoreSerivce;
	private long total;
	private Grade grade;
	private List<Grade> rows;
	private ControllerResult result;
	private String id;
	private HttpServletRequest req;
	@Override
	public void setServletRequest(HttpServletRequest req) {
		this.req = req;
	}

	public void setScoreSerivce(ScoreService scoreSerivce) {
		this.scoreSerivce = scoreSerivce;
	}

	public void setGradeService(GradeService gradeService) {
		this.gradeService = gradeService;
	}
	public long getTotal() {
		return total;
	}
	public Grade getGrade() {
		return grade;
	}
	public void setGrade(Grade grade) {
		this.grade = grade;
	}
	public List<Grade> getRows() {
		return rows;
	}
	public ControllerResult getResult() {
		return result;
	}
	public String getId() {
		return id;
	}
	
	/**
	 * ��תҳ��
	 * @return
	 */
	public String skipPage() {
		Emp emp = (Emp)(req).getSession().getAttribute("emp");//��ȡ�˵�½id����
		if(gradeService.queryPrevillige(emp.getRoleId(), GradeAction.class.getName() + ".skipPage")){
			return "skip";
		}else{
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
	 * ��Ӱ༶
	 */
	public String save() {
		Emp emp = (Emp)(req).getSession().getAttribute("emp");//��ȡ�˵�½id����
		if(gradeService.queryPrevillige(emp.getRoleId(), GradeAction.class.getName() + ".save")){
			grade.setStatus(1);
			gradeService.save(grade);
			result = ControllerResult.getSuccessResult("��ӳɹ�");
		}else{
			result = ControllerResult.getSuccessResult("Ȩ�޲���");
		}
		return "save";
	}

	/**
	 * ��ѯ���еİ༶
	 */
	public String queryAll() {
		Emp emp = (Emp)(req).getSession().getAttribute("emp");//��ȡ�˵�½id����
		if(gradeService.queryPrevillige(emp.getRoleId(), GradeAction.class.getName() + ".queryAll")){
			String pageNoStr = req.getParameter("page");
			String pageSizeStr = req.getParameter("rows");
			Pager4EasyUI<Grade> pager = new Pager4EasyUI<Grade>();
			if (pageNoStr != null) {
				pager.setPageNo(Integer.valueOf(pageNoStr));
				pager.setPageSize(Integer.valueOf(pageSizeStr));
			}
			if (emp.getRoleName().equals("������")){
				pager = gradeService.queryByPager("Grade", pager, " where status =1 and empId1 ='"+ emp.getEmpId() +"'");
			}else{
				pager = gradeService.queryByPager("Grade", pager, " where status =1");
			}
			System.out.println(pager);
			pager.setTotal(gradeService.count("Grade",""));
			rows = pager.getRows();
			total = pager.getTotal();
		}else{
			
		}
		return "all";
	}
	
	/**
	 * ��ѯ���б�����༶
	 */
	public String queryFreezeAll(){
		Emp emp = (Emp)(req).getSession().getAttribute("emp");//��ȡ�˵�½id����
		if(gradeService.queryPrevillige(emp.getRoleId(), GradeAction.class.getName() + ".queryFreezeAll")){
			String pageNoStr = req.getParameter("page");
			String pageSizeStr = req.getParameter("rows");
			Pager4EasyUI<Grade> pager = new Pager4EasyUI<Grade>();
			if (pageNoStr != null) {
				pager.setPageNo(Integer.valueOf(pageNoStr));
				pager.setPageSize(Integer.valueOf(pageSizeStr));
			}
			pager = gradeService.queryByPager("Grade", pager, " where status =0");
			System.out.println(pager);
			pager.setTotal(gradeService.count("Grade",""));
			rows = pager.getRows();
			total = pager.getTotal();
		}else{
			
		}
		return "freezeAll";
	}
	
	/**
	 * �޸����а༶
	 */
	public String update() {
		Emp emp = (Emp)(req).getSession().getAttribute("emp");//��ȡ�˵�½id����
		if(gradeService.queryPrevillige(emp.getRoleId(), GradeAction.class.getName() + ".update")){
			grade.setStatus(1);
			gradeService.update(grade);
			result = ControllerResult.getSuccessResult("�޸ĳɹ�");
		}else{
			result = ControllerResult.getSuccessResult("Ȩ�޲���");
		}
			return "update";
	}
	
	/**
	 * ���ѧ��
	 */
	public String addStuByIds() {
		Emp emp = (Emp)(req).getSession().getAttribute("emp");//��ȡ�˵�½id����
		if(gradeService.queryPrevillige(emp.getRoleId(), GradeAction.class.getName() + ".addStuByIds")){
			String gradeId = req.getParameter("gradeId");
			String stuIds = req.getParameter("stuIds");
			gradeService.addStuByIds(gradeId,stuIds.split(","));
			result = ControllerResult.getSuccessResult("��ӳɹ�");
		}else{
			result = ControllerResult.getSuccessResult("Ȩ�޲���");
		}
		return "addStuByIds";
	}
	
	/**
	 * ɾ��ѧ��
	 */
	public String delStuByIds() {
		Emp emp = (Emp)(req).getSession().getAttribute("emp");//��ȡ�˵�½id����
		if(gradeService.queryPrevillige(emp.getRoleId(), GradeAction.class.getName() + ".delStuByIds")){
			String gradeId = req.getParameter("gradeId");
			String stuIds = req.getParameter("stuIds");
			gradeService.delStuByIds(gradeId,stuIds.split(","));
			result = ControllerResult.getSuccessResult("ɾ���ɹ�");
		}else{
			result = ControllerResult.getSuccessResult("Ȩ�޲���");
		}
		return "delStuByIds";
	}
	/**
	 * �޸İ༶״̬
	 */
	public String updateFreeze() {
		Emp emp = (Emp)(req).getSession().getAttribute("emp");//��ȡ�˵�½id����
		if(gradeService.queryPrevillige(emp.getRoleId(), GradeAction.class.getName() + ".updateFreeze")){
			int status = 0;
			String id = req.getParameter("gradeId");
			String statusStr = req.getParameter("status");
			if(statusStr != null && !statusStr.equals("")){
				status = Integer.valueOf(statusStr);
			}
			gradeService.updateStatus("Grade", "gradeId", status, id);
		}else{
			
		}
		return "updateFreeze";
	}
	
	/**
	 * ģ����ѯ
	 */
	public String blurredAllQuery(){
		Emp emp = (Emp)(req).getSession().getAttribute("emp");//��ȡ�˵�½id����
		if(gradeService.queryPrevillige(emp.getRoleId(), GradeAction.class.getName() + ".blurredAllQuery")){
			String pageNoStr = req.getParameter("page");
	        String pageSizeStr = req.getParameter("rows");
	        String value= req.getParameter("value1");
	        String name= req.getParameter("name1");
	        System.out.println("value :" + value +", name: "+ name);
	        Pager4EasyUI<Grade> pager = new Pager4EasyUI<Grade>();
	        if (pageNoStr != null) {
	            pager.setPageNo(Integer.valueOf(pageNoStr));
	            pager.setPageSize(Integer.valueOf(pageSizeStr));
	        }
	        pager = gradeService.blurredAllQueryPager("Grade", pager, value, name);
	        rows = pager.getRows();
	        total = pager.getTotal();
		}else{
			
		}
		return "blurredAllQuery";
	}
	
	
	
	/**
	 * �������� ��ת���鿴�༶ҳ��
	 * @return
	 */
	/**
	 * ��תҳ��
	 * @return
	 */
	public String skipPages() {
			return "skips";
	}
	public String queryAlls() {
			String pageNoStr = req.getParameter("page");
			String pageSizeStr = req.getParameter("rows");
			Pager4EasyUI<Grade> pager = new Pager4EasyUI<Grade>();
			if (pageNoStr != null) {
				pager.setPageNo(Integer.valueOf(pageNoStr));
				pager.setPageSize(Integer.valueOf(pageSizeStr));
			}
			pager = gradeService.queryByPager("Grade", pager, "");
			pager.setTotal(gradeService.count("Grade",""));
			pager = gradeService.queryByPager("Grade", pager, " where status =1");
			System.out.println(pager);
			pager.setTotal(gradeService.count("Grade",""));
			rows = pager.getRows();
			total = pager.getTotal();
		return "alls";
	}
	/**
	 * ģ����ѯ
	 */
	public String blurredAllQuerys(){
			String pageNoStr = req.getParameter("page");
	        String pageSizeStr = req.getParameter("rows");
	        String value= req.getParameter("value1");
	        String name= req.getParameter("name1");
	        System.out.println("value :" + value +", name: "+ name);
	        Pager4EasyUI<Grade> pager = new Pager4EasyUI<Grade>();
	        if (pageNoStr != null) {
	            pager.setPageNo(Integer.valueOf(pageNoStr));
	            pager.setPageSize(Integer.valueOf(pageSizeStr));
	        }
	        pager = gradeService.blurredAllQueryPager("Grade", pager, value, name);
	        rows = pager.getRows();
	        total = pager.getTotal();
		return "blurredAllQuerys";
	}
}