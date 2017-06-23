package com.cs.test;

import org.junit.Test;

import com.cs.bean.Dept;
import com.cs.dao.DeptDAO;
import com.cs.dao.DeptDAOImpl;

import junit.framework.TestCase;

public class DeptTest extends TestCase {
	
	 private DeptDAO deptDAO;

	    @Override
	    protected void setUp() throws Exception {
	    	deptDAO = new DeptDAOImpl();
	    }
	
	    @Test
	    public void testQuery() {
	
	        Dept dept = deptDAO.queryByDepId("esfdffdfssd");
	        System.out.println(dept.getDes());
	    }
}
