package com.application;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;

import static com.googlecode.objectify.ObjectifyService.ofy;

public class Auth {

	public static Employee getEmployeeByRequest(
		HttpServletRequest request){

		HttpSession session = request.getSession(true);

		String employeeId = session.getAttribute("employeeId").toString();
		String password = session.getAttribute("password").toString();

		Employee employee = getEmployee(employeeId, password);
		return employee;
		
	}


	public static Employee getEmployee(
		String employeeId, String password){

		Employee employee = ofy().load().type(Employee.class).
			filter("employeeId", employeeId).
			filter("password", password).first().now();

		return employee;

	}


	public static Boolean validateLogin(
		String employeeId, String password) {

		Employee employee = Auth.getEmployee(
			employeeId, password);

		if (employee != null){
			return true;
		}
		else{
			return false;
		}

	}

	public static Boolean isAdmin(Employee employee){
		System.out.println(employee.isAdmin);
		if (employee.isAdmin){
			return true;
		}
		else {
			return false;
		}
	}
}