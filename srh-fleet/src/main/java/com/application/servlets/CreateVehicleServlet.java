package com.application;

import java.io.IOException;
import java.util.Properties;
import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.googlecode.objectify.ObjectifyService;

public class CreateVehicleServlet extends HttpServlet{

	@Override
	public void doPost(HttpServletRequest request,
		HttpServletResponse response) throws IOException{

		String vehicleNumber = request.getParameter("number");
		int seatCount = Integer.parseInt(
			request.getParameter("seatCount")
		);

		long odometerReading = Long.parseLong(
			request.getParameter("odometer"),
			10
		);

		Vehicle newVehicle = new Vehicle();

		newVehicle.addVehicle(vehicleNumber, seatCount, odometerReading);

		System.out.println(newVehicle);

		ObjectifyService.ofy().save().entity(newVehicle);

		response.sendRedirect("/dashboard.jsp");
	}
}