package com.cs.action;

import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.cs.bean.Emp;
import com.cs.bean.Room;
import com.cs.bean.Stu;
import com.cs.bean.User;
import com.cs.commom.bean.ControllerResult;
import com.cs.commom.bean.Pager4EasyUI;
import com.cs.service.RoomService;
import com.opensymphony.xwork2.ActionSupport;

/**
 * ����Action
 * @author ����
 *
 */
public class RoomAction extends ActionSupport implements ServletRequestAware {
	
	private static final long serialVersionUID = 4124704445790732902L;

	private RoomService roomService;
	private Room room;
	private long total;
	private List<Room> rows;
	private ControllerResult result;
	private String id;
	private HttpServletRequest req;
	
	private String stuId;

	
	@Override
	public void setServletRequest(HttpServletRequest req) {
		this.req = req;
	}
	


	public void setRoomService(RoomService roomService) {
		this.roomService = roomService;
	}


	public Room getRoom() {
		return room;
	}

	public long getTotal() {
		return total;
	}

	public void setTotal(long total) {
		this.total = total;
	}

	public void setRoom(Room room) {
		this.room = room;
	}

	public List<Room> getRows() {
		return rows;
	}
	
	public ControllerResult getResult() {
		return result;
	}

	public void setId(String id) {
		this.id = id;
	}


	public String getStuId() {
		return stuId;
	}



	public void setStuId(String stuId) {
		this.stuId = stuId;
	}



	/**
	 * ��ҳ��ת��userҳ��
	 * @return
	 */
	public String skipPage() {
		Emp emp = (Emp)(req).getSession().getAttribute("emp");//��ȡ�˵�½id����
		if(roomService.queryPrevillige(emp.getRoleId(), RoomAction.class.getName() + ".skipPage")){
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
	 * �������
	 */
	
	public String save() {
		Emp emp = (Emp)(req).getSession().getAttribute("emp");//��ȡ�˵�½id����
		if(roomService.queryPrevillige(emp.getRoleId(), RoomAction.class.getName() + ".save")){
			room.setStatus(1);
			roomService.save(room);
			result = ControllerResult.getSuccessResult("��ӳɹ�");
		}else{
			result = ControllerResult.getSuccessResult("Ȩ�޲���");
		}
		return "save";
	}
	
	/**
	 * ��ҳ��ѯ����ѧ������
	 */
	public String queryAll() {
		Emp emp = (Emp)(req).getSession().getAttribute("emp");//��ȡ�˵�½id����
		if(roomService.queryPrevillige(emp.getRoleId(), RoomAction.class.getName() + ".queryAll")){
			String pageNoStr = req.getParameter("page");
	        String pageSizeStr = req.getParameter("rows");
	        Pager4EasyUI<Room> pager = new Pager4EasyUI<Room>();
	        if (pageNoStr != null) {
	            pager.setPageNo(Integer.valueOf(pageNoStr));
	            pager.setPageSize(Integer.valueOf(pageSizeStr));
	        }
	        pager = roomService.queryByPager("Room", pager, " where status =1");
	        pager.setTotal(roomService.count("Room",""));
	        rows = pager.getRows();
	        total = pager.getTotal();
		}else{
			
		}
        return "all";
	}
	
	/**
	 * ��ѯ���б���������
	 */
	public String queryFreezeAll(){
		Emp emp = (Emp)(req).getSession().getAttribute("emp");//��ȡ�˵�½id����
		if(roomService.queryPrevillige(emp.getRoleId(), RoomAction.class.getName() + ".queryFreezeAll")){
			String pageNoStr = req.getParameter("page");
	        String pageSizeStr = req.getParameter("rows");
	        Pager4EasyUI<Room> pager = new Pager4EasyUI<Room>();
	        if (pageNoStr != null) {
	            pager.setPageNo(Integer.valueOf(pageNoStr));
	            pager.setPageSize(Integer.valueOf(pageSizeStr));
	        }
	        pager = roomService.queryByPager("Room", pager, " where status =0");
	        pager.setTotal(roomService.count("Room",""));
	        rows = pager.getRows();
	        total = pager.getTotal();
		}else{
			
		}
		return "freezeAll";
	}
	
	/**
	 * ��ѯ������������
	 */
	public String queryById(String id){
		Emp emp = (Emp)(req).getSession().getAttribute("emp");//��ȡ�˵�½id����
		if(roomService.queryPrevillige(emp.getRoleId(), RoomAction.class.getName() + ".queryById")){
			Room room = roomService.queryById(User.class, id);
		}else{
			
		}
		return "id";
	}
	
	/**
	 * �޸�����
	 */
	public String update() {
		Emp emp = (Emp)(req).getSession().getAttribute("emp");//��ȡ�˵�½id����
		if(roomService.queryPrevillige(emp.getRoleId(), RoomAction.class.getName() + ".update")){
			if (stuId != null && !stuId.trim().equals("")) {
				room.setStuId(stuId);
			}
				room.setStatus(1);
			roomService.update(room);
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
		if(roomService.queryPrevillige(emp.getRoleId(), RoomAction.class.getName() + ".addStuByIds")){
			String roomId = req.getParameter("roomId");
			String stuIds = req.getParameter("stuIds");
			roomService.addStuByIds(roomId,stuIds.split(","));
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
		if(roomService.queryPrevillige(emp.getRoleId(), RoomAction.class.getName() + ".delStuByIds")){
			String roomId = req.getParameter("roomId");
			String stuIds = req.getParameter("stuIds");
			String studentId = roomService.queryStuId(roomId);
			roomService.delStuByIds(roomId,studentId,stuIds.split(","));
			result = ControllerResult.getSuccessResult("ɾ���ɹ�");
		}else{
			result = ControllerResult.getSuccessResult("Ȩ�޲���");
		}
		return "delStuByIds";
	}
	/**
	 * �޸�����״̬
	 */
	public String updateFreeze() {
		Emp emp = (Emp)(req).getSession().getAttribute("emp");//��ȡ�˵�½id����
		if(roomService.queryPrevillige(emp.getRoleId(), RoomAction.class.getName() + ".updateFreeze")){
			int status = 0;
			String id = req.getParameter("roomId");
			String statusStr = req.getParameter("status");
			if(statusStr != null && !statusStr.equals("")){
				status = Integer.valueOf(statusStr);
			}
			roomService.updateStatus("Room", "roomId", status, id);
		}else{
			
		}
		return "updateFreeze";
	}
	
	/**
	 * ģ����ѯ
	 */
	public String blurredAllQuery(){
		Emp emp = (Emp)(req).getSession().getAttribute("emp");//��ȡ�˵�½id����
		if(roomService.queryPrevillige(emp.getRoleId(), RoomAction.class.getName() + ".blurredAllQuery")){
			String pageNoStr = req.getParameter("page");
	        String pageSizeStr = req.getParameter("rows");
	        String value= req.getParameter("value1");
	        String name= req.getParameter("name1");
	        System.out.println("value :" + value +", name: "+ name);
	        Pager4EasyUI<Room> pager = new Pager4EasyUI<Room>();
	        if (pageNoStr != null) {
	            pager.setPageNo(Integer.valueOf(pageNoStr));
	            pager.setPageSize(Integer.valueOf(pageSizeStr));
	        }
	        pager = roomService.blurredAllQueryPager("Room", pager, value, name);
	        rows = pager.getRows();
	        total = pager.getTotal();
		}else{
			
		}
		return "blurredAllQuery";

	}
	public String queryAlls() {
			String pageNoStr = req.getParameter("page");
	        String pageSizeStr = req.getParameter("rows");
	        Pager4EasyUI<Room> pager = new Pager4EasyUI<Room>();
	        if (pageNoStr != null) {
	            pager.setPageNo(Integer.valueOf(pageNoStr));
	            pager.setPageSize(Integer.valueOf(pageSizeStr));
	        }
	        pager = roomService.queryByPager("Room", pager, "");
	        pager.setTotal(roomService.count("Room",""));
	        rows = pager.getRows();
	        total = pager.getTotal();
	    return "alls";
	}
	
	public String skipPages() {
			return "skips";
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
	        Pager4EasyUI<Room> pager = new Pager4EasyUI<Room>();
	        if (pageNoStr != null) {
	            pager.setPageNo(Integer.valueOf(pageNoStr));
	            pager.setPageSize(Integer.valueOf(pageSizeStr));
	        }
	        pager = roomService.blurredAllQueryPager("Room", pager, value, name);
	        rows = pager.getRows();
	        total = pager.getTotal();
		return "blurredAllQuerys";
	}

}
