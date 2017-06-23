package com.cs.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.cs.bean.Course;
import com.cs.bean.Emp;
import com.cs.commom.bean.ControllerResult;
import com.cs.commom.bean.Pager4EasyUI;
import com.cs.service.CourseService;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 课程action
 * 
 * @author 王怡
 *
 */
public class CourseAction extends ActionSupport implements ServletRequestAware {

	private static final long serialVersionUID = 3333846873690305471L;

	private CourseService courseService;

	private Course course;
	private List<Course> rows;
	private long total;
	private ControllerResult result;
	private HttpServletRequest req;
	private String id;
	
	private Emp emp;
	

	@Override
	public void setServletRequest(HttpServletRequest req) {
		this.req = req;
	}

	public void setCourseService(CourseService courseService) {
		this.courseService = courseService;
	}

	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}

	public List<Course> getRows() {
		return rows;
	}

	public long getTotal() {
		return total;
	}

	public void setTotal(long total) {
		this.total = total;
	}

	public ControllerResult getResult() {
		return result;
	}

	public void setId(String id) {
		this.id = id;
	}
	// *********************************************

	/**
	 * 跳转到课程管理页面
	 */
	public String courseSkipPage() {
		emp = (Emp)(req).getSession().getAttribute("emp");//获取此登陆id对象
		System.out.println(emp.toString());
		if(courseService.queryPrevillige(emp.getRoleId(), CourseAction.class.getName() + ".courseSkipPage")){
			return "skipCourse";			
		}else{
			return "NoPrevillige";
		}
	}

	/**
	 * 招生部主任跳转页面
	 * 
	 * @return
	 */
	public String admissionsSkipPage() {
		return "admissionsSkip";
	}

	/**
	 * 查询出所有的课程
	 */
	public String courseQueryAll() {
		System.out.println("正在查询所有课程");
		String pageNoStr = req.getParameter("page");
		String pageSizeStr = req.getParameter("rows");
		Pager4EasyUI<Course> pager = new Pager4EasyUI<Course>();
		if (pageNoStr != null) {
			pager.setPageNo(Integer.valueOf(pageNoStr));
			pager.setPageSize(Integer.valueOf(pageSizeStr));
		}
		pager = courseService.queryByPager("Course", pager, "");
		pager.setTotal(courseService.count("Course", ""));
		rows = pager.getRows();
		total = pager.getTotal();
		return "all";
	}

	/**
	 * 添加新的课程。
	 * 
	 * @return
	 */
	public String addCourse() {
		emp = (Emp)(req).getSession().getAttribute("emp");//获取此登陆id对象
		System.out.println("正在添加课程");
		if(courseService.queryPrevillige(emp.getRoleId(), CourseAction.class.getName() + ".addCourse")){
			course.setStatus(1);
			courseService.save(course);
			result = ControllerResult.getSuccessResult("添加课程成功");
		}else{
			result = ControllerResult.getFailResult("权限不足");
		}
		return "save";
	}

	/**
	 * 删除原有的课程
	 * 
	 * @return
	 */
	public String deleteCourse() {
		emp = (Emp)(req).getSession().getAttribute("emp");//获取此登陆id对象
		System.out.println("正在删除课程");
		if(courseService.queryPrevillige(emp.getRoleId(), CourseAction.class.getName() + ".deleteCourse")){
			Course c = new Course();
			c.setCourseId(id);
			courseService.delete(c);
		}else{
			result = ControllerResult.getFailResult("权限不足");
		}
		return "deletecourse";
	}

	/**
	 * 更新原有的课程信息
	 */
	public String updateCourse() {
		emp = (Emp)(req).getSession().getAttribute("emp");//获取此登陆id对象
		System.out.println("正在更新课程信息");
		System.out.println("传输过来的数据为：" + course);
		if(courseService.queryPrevillige(emp.getRoleId(), CourseAction.class.getName() + ".updateCourse")){
			courseService.update(course);
			result = ControllerResult.getSuccessResult("更新课程成功");
		}else{
			result = ControllerResult.getFailResult("您没有权限支持操作");
		}
		return "updatecourse";
	}

	/**
	 * 模糊查询
	 */
	public String blurredAllQuery() {
		String pageNoStr = req.getParameter("page");
		String pageSizeStr = req.getParameter("rows");
		String value = req.getParameter("value1");
		String name = req.getParameter("name1");
		System.out.println("value :" + value + ", name: " + name);
		Pager4EasyUI<Course> pager = new Pager4EasyUI<Course>();
		if (pageNoStr != null) {
			pager.setPageNo(Integer.valueOf(pageNoStr));
			pager.setPageSize(Integer.valueOf(pageSizeStr));
		}
		pager = courseService.blurredAllQueryPager("Course", pager, value, name);
		pager.setTotal(courseService.blurredAllQueryCount("Course", pager, value, name));
		rows = pager.getRows();
		total = pager.getTotal();
		return "blurredAllQuery";
	}

	public String termSerach() {
		String pageNoStr = req.getParameter("page");
		String pageSizeStr = req.getParameter("rows");
		String term = req.getParameter("term");
		System.out.println("term:" + term);
		Pager4EasyUI<Course> pager = new Pager4EasyUI<Course>();
		if (pageNoStr != null) {
			pager.setPageNo(Integer.valueOf(pageNoStr));
			pager.setPageSize(Integer.valueOf(pageSizeStr));
		}
		pager = courseService.termSerach("Course", pager, term);
		pager.setTotal(courseService.count("Course", ""));
		rows = pager.getRows();
		total = pager.getTotal();
		return "termserach";
	}

	/**
	 * 禁用
	 * 
	 * @return
	 */
	public String courseDisable() {
		emp = (Emp)(req).getSession().getAttribute("emp");//获取此登陆id对象
		if(courseService.queryPrevillige(emp.getRoleId(), CourseAction.class.getName() + ".courseDisable")){
			courseService.updateStatus("Course", "courseId", 0, id);
			result = ControllerResult.getSuccessResult("修改成功");
		}else{
			result = ControllerResult.getFailResult("权限不足");
		}
		return "disable";
	}

	/**
	 * 启用
	 * 
	 * @return
	 */
	public String courseActivate() {
		emp = (Emp)(req).getSession().getAttribute("emp");//获取此登陆id对象
		if(courseService.queryPrevillige(emp.getRoleId(), CourseAction.class.getName() + ".courseActivate")){
			courseService.updateStatus("Course", "courseId", 1, id);
			result = ControllerResult.getSuccessResult("修改成功");
		}else{
			result = ControllerResult.getFailResult("权限不足");
		}
		return "activate";
	}
}
