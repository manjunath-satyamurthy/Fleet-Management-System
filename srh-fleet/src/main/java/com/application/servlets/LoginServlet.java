package com.application;

import java.io.IOException;
import java.util.Properties;
import java.util.Date;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import static com.googlecode.objectify.ObjectifyService.ofy;


public class LoginServlet extends HttpServlet {

	@Override
	public void doPost(HttpServletRequest request,
		HttpServletResponse response) throws IOException{

		
		System.out.println(DatabaseApi.getPresentEmployees());

		String employeeId = request.getParameter("employeeId");
		String password = request.getParameter("password");

		Boolean loginValidity = Auth.validateLogin(
			employeeId, password);

		if (loginValidity == true){
			HttpSession session = request.getSession(true);
			Employee employee = Auth.getEmployee(employeeId, password);

			session.setAttribute("employeeId", employeeId);
			session.setAttribute("password", password);
			session.setAttribute("employee", employee);
			response.sendRedirect("/dashboard.jsp");	
		}

		else{
			response.getWriter().println(
				"Invalid credentials, try again"
			);
		}
	}
}
