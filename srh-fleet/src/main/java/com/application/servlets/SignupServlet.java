package com.application;

import java.io.IOException;
import java.util.Properties;

import java.util.Date;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.googlecode.objectify.Result;
import com.googlecode.objectify.Key;
import com.googlecode.objectify.ObjectifyService;

public class SignupServlet extends HttpServlet {
	
	@Override
	public void doPost(HttpServletRequest request,
		HttpServletResponse response) throws IOException{

		Boolean isAdmin = false;
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String employeeId = request.getParameter("employeeId");
		String phoneNumber = request.getParameter("phoneNumber");
		String employeeClass = request.getParameter("employeeClass");
		String password = request.getParameter("password");
		String isAdminCheck = request.getParameter("isAdmin");
		String loginTimeString = request.getParameter("loginTime");
		String logoutTimeString = request.getParameter("logoutTime");

		Date loginTime = TimeUtil.getTimeByString(loginTimeString);
		Date logoutTime = TimeUtil.getTimeByString(logoutTimeString);

		if (isAdminCheck != null){
			isAdmin = true;
		}
		
		Employee newUser = new Employee();

		newUser.addEmployee(firstName, lastName, employeeId, password,
			phoneNumber, loginTime, logoutTime, employeeClass, isAdmin);

		Result<Key<Employee>> result = ObjectifyService.
			ofy().save().entity(newUser);
		result.now();

		EmployeeCaleander employeeSchedule = new EmployeeCaleander();
		employeeSchedule.setCaleander(newUser);

		ObjectifyService.ofy().save().entity(employeeSchedule);

		response.sendRedirect("/dashboard.jsp");
	}
}
