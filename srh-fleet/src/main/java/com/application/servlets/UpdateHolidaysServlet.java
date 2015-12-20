package com.application;

import java.io.IOException;
import java.util.List;
import java.util.ArrayList;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.googlecode.objectify.ObjectifyService;;


public class UpdateHolidaysServlet extends HttpServlet {

	@Override
	public void doPost(HttpServletRequest request,
		HttpServletResponse response) throws IOException{

		int day = Integer.parseInt(request.getParameter("holiday"));

		Employee employee = Auth.getEmployeeByRequest(request);

		List<Integer> scheduleList = DatabaseApi
			.getEmployeeCaleanderById(employee.id);
		List<Integer> newScheduleList = new ArrayList<Integer>();

		for (Integer value: scheduleList){
			if ((int) value != day){
				newScheduleList.add(value);	
			}
			else {
				newScheduleList.add(0);
			}

		}

		EmployeeCaleander employeeCaleander = ObjectifyService.ofy()
			.load().type(EmployeeCaleander.class)
			.filter("employeeId", employee.id).first().now();

		employeeCaleander.schedule = newScheduleList;
		ObjectifyService.ofy().save().entity(employeeCaleander);


		response.sendRedirect("/dashboard.jsp");

	}
}