package com.cs.action;

import java.io.OutputStream;
import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.cs.bean.Emp;
import com.cs.bean.Score;
import com.cs.commom.bean.ControllerResult;
import com.cs.commom.bean.Pager4EasyUI;
import com.cs.service.ScoreService;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 学生分数Action
 * @author 张文星
 *
 */
public class ScoreAction extends ActionSupport implements ServletRequestAware {
	
	private static final long serialVersionUID = -7433491681110583231L;

	private ScoreService scoreService;
	
	private long total;
	private Score stuScore;
	private List<Score> rows;
	private ControllerResult result;
	private String id;
	private HttpServletRequest req;
	private String gradeId;
	private String score;
	
	private HttpServletResponse response;
	
	public HttpServletResponse getResponse() {
		return response;
	}
	public void setResponse(HttpServletResponse response) {
		this.response = response;
	}
	public String getScore() {
		return score;
	}
	public void setScore(String score) {
		this.score = score;
	}
	@Override
	public void setServletRequest(HttpServletRequest req) {
		this.req = req;
	}
	public void setscoreService(ScoreService scoreService) {
		this.scoreService = scoreService;
	}
	public long getTotal() {
		return total;
	}
	public Score getStuScore() {
		return stuScore;
	}
	public void setStuScore(Score stuScore) {
		this.stuScore = stuScore;
	}
	public List<Score> getRows() {
		return rows;
	}
	public ControllerResult getResult() {
		return result;
	}
	public String getId() {
		return id;
	}
	public String getGradeId() {
		return gradeId;
	}
	public void setGradeId(String gradeId) {
		this.gradeId = gradeId;
	}

	/**
	 * 跳转页面
	 * @return
	 */
	public String skipPage() {
		Emp emp = (Emp)(req).getSession().getAttribute("emp");//获取此登陆id对象
		if(scoreService.queryPrevillige(emp.getRoleId(), ScoreAction.class.getName() + ".skipPage")){
	        return "skip";
		}else{
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
	 * 添加成绩信息
	 */
	public String save() {
		Emp emp = (Emp)(req).getSession().getAttribute("emp");//获取此登陆id对象
		if(scoreService.queryPrevillige(emp.getRoleId(), ScoreAction.class.getName() + ".save")){
			scoreService.save(stuScore);
			result = ControllerResult.getSuccessResult("添加成功");
		}else{
			result = ControllerResult.getSuccessResult("权限不足");
		}
		return "save";
	}

	/**
	 * 查询所有成绩信息
	 */
	public String queryAll() {
		Emp emp = (Emp)(req).getSession().getAttribute("emp");//获取此登陆id对象
		if(scoreService.queryPrevillige(emp.getRoleId(), ScoreAction.class.getName() + ".queryAll")){
			String pageNoStr = req.getParameter("page");
			String pageSizeStr = req.getParameter("rows");
			Pager4EasyUI<Score> pager = new Pager4EasyUI<Score>();
			if (pageNoStr != null) {
				pager.setPageNo(Integer.valueOf(pageNoStr));
				pager.setPageSize(Integer.valueOf(pageSizeStr));
			}
			pager = scoreService.queryByPager("Score", pager, "");
			pager.setTotal(scoreService.count("Score",""));
			rows = pager.getRows();
			total = pager.getTotal();
		}else{
			
		}
		return "all";
	}
	
	/**
	 * 修改成绩信息
	 */
	public String update() {
		Emp emp = (Emp)(req).getSession().getAttribute("emp");//获取此登陆id对象
		if(scoreService.queryPrevillige(emp.getRoleId(), ScoreAction.class.getName() + ".update")){
			scoreService.update(stuScore);
			result = ControllerResult.getSuccessResult("修改成功");
		}else{
			result = ControllerResult.getSuccessResult("权限不足");
		}
		return "update";
	}
	// 根据学生id查看成绩
	public String stuScoreById() {
		Emp emp = (Emp)(req).getSession().getAttribute("emp");//获取此登陆id对象
		if(scoreService.queryPrevillige(emp.getRoleId(), ScoreAction.class.getName() + ".stuScoreById")){
			String stuId = req.getParameter("stuId");
			String pageNoStr = req.getParameter("page");
			String pageSizeStr = req.getParameter("rows");
			Pager4EasyUI<Score> pager = new Pager4EasyUI<Score>();
			if (pageNoStr != null) {
				pager.setPageNo(Integer.valueOf(pageNoStr));
				pager.setPageSize(Integer.valueOf(pageSizeStr));
			}
			pager = scoreService.queryStuScoreById(pager, stuId);
			rows = pager.getRows();
			total = pager.getTotal();
		}else{
			
		}
		return "stuScore1";
	}
	// 根据班级id查看成绩
	public String stuScore() {
		Emp emp = (Emp)(req).getSession().getAttribute("emp");//获取此登陆id对象
		if(scoreService.queryPrevillige(emp.getRoleId(), ScoreAction.class.getName() + ".stuScore")){
			String pageNoStr = req.getParameter("page");
			String pageSizeStr = req.getParameter("rows");
			String courseId = req.getParameter("courseId");
			Pager4EasyUI<Score> pager = new Pager4EasyUI<Score>();
			if (pageNoStr != null) {
				pager.setPageNo(Integer.valueOf(pageNoStr));
				pager.setPageSize(Integer.valueOf(pageSizeStr));
			}
			pager = scoreService.queryStuScore(pager, gradeId,courseId);
			rows = pager.getRows();
			total = pager.getTotal();
		}else{
			
		}
		return "stuScore";
	}
	public String skipPages() {
	        return "skips";
	}
	public String queryAlls() {
			String pageNoStr = req.getParameter("page");
			String pageSizeStr = req.getParameter("rows");
			Pager4EasyUI<Score> pager = new Pager4EasyUI<Score>();
			if (pageNoStr != null) {
				pager.setPageNo(Integer.valueOf(pageNoStr));
				pager.setPageSize(Integer.valueOf(pageSizeStr));
			}
			pager = scoreService.queryByPager("Score", pager, "");
			pager.setTotal(scoreService.count("Score",""));
			rows = pager.getRows();
			total = pager.getTotal();
		return "alls";
	}
}
