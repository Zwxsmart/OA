package com.cs.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.cs.bean.Emp;
import com.cs.bean.Progress;
import com.cs.commom.bean.ControllerResult;
import com.cs.commom.bean.Pager4EasyUI;
import com.cs.service.ProgressService;
import com.opensymphony.xwork2.ActionSupport;

public class ProgressAction extends ActionSupport implements ServletRequestAware{

	private static final long serialVersionUID = -2385992324781319264L;
	private ProgressService progressService;
	private Progress progress;
	private List<Progress> rows;
	private long total;
	private ControllerResult result;
	private HttpServletRequest req;
	private String id;
	private String empId;
	private String gradeId;
	
	private Emp emp;
	
	public String getEmpId() {
		return empId;
	}

	public void setEmpId(String empId) {
		this.empId = empId;
	}

	public String getGradeId() {
		return gradeId;
	}

	public void setGradeId(String gradeId) {
		this.gradeId = gradeId;
	}

	@Override
	public void setServletRequest(HttpServletRequest req) {
		this.req=req;
	}
	
	public void setProgressService(ProgressService progressService) {
		this.progressService = progressService;
	}

	public Progress getProgress() {
		return progress;
	}

	public void setProgress(Progress progress) {
		this.progress = progress;
	}

	public long getTotal() {
		return total;
	}

	public ControllerResult getResult() {
		return result;
	}

	public List<Progress> getRows() {
		return rows;
	}

	public void setId(String id) {
		this.id = id;
	}
//	***************************************
	public String progressSkipPage(){
		emp = (Emp)(req).getSession().getAttribute("emp");//��ȡ�˵�½id����
		if(progressService.queryPrevillige(emp.getRoleId(), ProgressAction.class.getName() + ".progressSkipPage")){
			return "skipProgress";
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
	 * ��ҳ��ѯ���еĿγ̽���
	 */
	public String progressQueryAll(){
		System.out.println("���ڲ�ѯ���пγ̽���");
		String pageNoStr = req.getParameter("page");
		String pageSizeStr = req.getParameter("rows");
		Pager4EasyUI<Progress> pager = new Pager4EasyUI<Progress>();
		if (pageNoStr != null) {
			pager.setPageNo(Integer.valueOf(pageNoStr));
			pager.setPageSize(Integer.valueOf(pageSizeStr));
		}
		pager=progressService.queryByPager("Progress", pager, "");
		System.out.println(pager.toString());
		pager.setTotal(progressService.count("Progress",""));
		rows = pager.getRows();
		total = pager.getTotal();
		return "all";
	}
	/**
	 * ����µĿγ̽���
	 */
	public String addProgress(){
		emp = (Emp)(req).getSession().getAttribute("emp");//��ȡ�˵�½id����
		System.out.println("��������µĿγ̽���");
		System.out.println("ǰ̨�����ֵΪ"+progress.toString());
		String id=req.getParameter("empId");
		System.out.println("ǰ̨��������id��"+id);
		if(progressService.queryPrevillige(emp.getRoleId(), ProgressAction.class.getName() + ".addProgress")){
			progress.setEmpId(id);
			progress.setStatus(1);
			progressService.save(progress);
			result=ControllerResult.getSuccessResult("��ӿγ̽��ȳɹ�");
		}else{
			result = ControllerResult.getFailResult("Ȩ�޲���");
		}
		return "addprogress";
	}
	
	/**
	 * ���¿γ̽�����Ϣ
	 */
	public String updateProgress(){
		emp = (Emp)(req).getSession().getAttribute("emp");//��ȡ�˵�½id����
		System.out.println("���ڸ��¿γ̽�����Ϣ");
		if(progressService.queryPrevillige(emp.getRoleId(), ProgressAction.class.getName() + ".updateProgress")){
			progress.setGradeId(gradeId);
			progress.setProgressId(progress.getProgressId());
			progressService.update(progress);
			result=ControllerResult.getSuccessResult("���¿γ̽�����Ϣ�ɹ�");
		}else{
			result = ControllerResult.getFailResult("Ȩ�޲���");
		}
		
		return "updateprogress";
	}
	/**
	 * ɾ���γ̽�����Ϣ
	 */
	public String deleteProgress(){
		emp = (Emp)(req).getSession().getAttribute("emp");//��ȡ�˵�½id����
		System.out.println("����ɾ���γ̽�����Ϣ");
		if(progressService.queryPrevillige(emp.getRoleId(), ProgressAction.class.getName() + ".deleteProgress")){
			Progress progress=new Progress();
			progress.setProgressId(id);
			progressService.delete(progress);
			result=ControllerResult.getSuccessResult("ɾ���ɹ�");
		}else{
			result = ControllerResult.getFailResult("Ȩ�޲���");
		}
		return "deleteprogress";
	}
	
	/**
	 * ģ����ѯ
	 */
	public String blurredAllQuery(){
		String pageNoStr = req.getParameter("page");
        String pageSizeStr = req.getParameter("rows");
        String value= req.getParameter("value1");
        String name= req.getParameter("name1");
        System.out.println("value :" + value +", name: "+ name);
        Pager4EasyUI<Progress> pager = new Pager4EasyUI<Progress>();
        if (pageNoStr != null) {
            pager.setPageNo(Integer.valueOf(pageNoStr));
            pager.setPageSize(Integer.valueOf(pageSizeStr));
        }
    	pager = progressService.blurredAllQueryPager("Progress", pager, value, name);
        pager.setTotal(progressService.blurredAllQueryCount("Progress", pager, value, name));
        rows = pager.getRows();
        total = pager.getTotal();
		return "blurredAllQuery";
	}
	
	/**
	 * ����
	 * @return
	 */
	public String progressDisable(){ 
		emp = (Emp)(req).getSession().getAttribute("emp");//��ȡ�˵�½id����
		if(progressService.queryPrevillige(emp.getRoleId(), ProgressAction.class.getName() + ".progressDisable")){
			progressService.updateStatus("Progress","progressId",0, id);
			result = ControllerResult.getSuccessResult("�޸ĳɹ�");
		}else{
			result = ControllerResult.getFailResult("Ȩ�޲���");
		}
		return "disable";
	}
	
	/**
	 * ����
	 * @return
	 */
	public String progressActivate(){
		emp = (Emp)(req).getSession().getAttribute("emp");//��ȡ�˵�½id����
		if(progressService.queryPrevillige(emp.getRoleId(), ProgressAction.class.getName() + ".progressActivate")){
			progressService.updateStatus("Progress","progressId",1, id);
			result = ControllerResult.getSuccessResult("�޸ĳɹ�");
		}else{
			result = ControllerResult.getFailResult("Ȩ�޲���");
		}
		return "activate";
	}
}
