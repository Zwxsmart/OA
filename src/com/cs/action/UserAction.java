package com.cs.action;

import com.cs.bean.User;
import com.cs.commom.bean.ControllerResult;
import com.cs.commom.bean.Pager4EasyUI;
import com.cs.service.UserService;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.interceptor.ServletRequestAware;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public class UserAction extends ActionSupport implements ServletRequestAware {

	private static final long serialVersionUID = 5598917004407777767L;
	
	private UserService userService;
    private User user;
    private long total;
    private List<User> rows;
    private ControllerResult result;

    private String id;
    private HttpServletRequest req;



    public ControllerResult getResult() {
        return result;
    }

    public long getTotal() {
        return total;
    }

    public List<User> getRows() {
        return rows;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public void setServletRequest(HttpServletRequest req) {
        this.req = req;
    }

    public String skipPage() {
        return "skip";
    }
   
    public String loginPage(){
    	return "loginPage";
    }

    public String queryAll() {
        String pageNoStr = req.getParameter("page");
        String pageSizeStr = req.getParameter("rows");
        Pager4EasyUI<User> pager = new Pager4EasyUI<User>();
        if (pageNoStr != null) {
            pager.setPageNo(Integer.valueOf(pageNoStr));
            pager.setPageSize(Integer.valueOf(pageSizeStr));
        }
        pager = userService.queryByPager("User", pager, "");
        pager.setTotal(userService.count("User",""));
        rows = pager.getRows();
        total = pager.getTotal();
        return "all";
    }


}
