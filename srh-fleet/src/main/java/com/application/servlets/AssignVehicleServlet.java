package com.application;

import java.io.*;
import java.util.Map;
import java.util.List;
import java.util.HashMap;
import java.util.Iterator;
import java.util.ArrayList;
import java.util.Properties;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.googlecode.objectify.ObjectifyService;


public class AssignVehicleServlet extends HttpServlet{

	@Override
	public void doPost(HttpServletRequest request,
		HttpServletResponse response) throws IOException {

		List<Employee> presentEmployees = DatabaseApi.
			getPresentEmployees();

		Map<String, List<Employee>> directionsortedEmployees = new 
			HashMap<String, List<Employee>>();

		for (Employee employee: presentEmployees){
			List<Employee> employeeList = new ArrayList<Employee>();
			String direction = employee.direction;

			if(directionsortedEmployees.get(direction) == null){
				employeeList.add(employee);
				directionsortedEmployees.put(
					direction, employeeList);
			}

			else{
				List<Employee> tempList= directionsortedEmployees
					.get(direction);
				tempList.add(employee);
				directionsortedEmployees.put(direction, tempList);
			}
		}

		List<Vehicle> avaliableVehicles= DatabaseApi.getAvailableVehicles();

		for (Vehicle vehicle : avaliableVehicles){

			int vehicleSeatCount = vehicle.seatCount;
			List<Long> passengers = new ArrayList<Long>();
			for (String direction : directionsortedEmployees.keySet()){
				List<Employee> sortedEmployees = directionsortedEmployees
					.get(direction);

				while(vehicleSeatCount > 0 && sortedEmployees.size() > 0){
					vehicleSeatCount--;
					passengers.add(sortedEmployees.get(0).id);
					sortedEmployees.remove(0);
				}


				if (vehicleSeatCount == 0 || sortedEmployees.size() == 0){
					System.out.println(passengers);
					vehicle.addPassengers(passengers);
					ObjectifyService.ofy().save().entity(vehicle);
				}
			}


		}
	
	    org.json.JSONObject jsonResponse = new org.json.JSONObject();

	    jsonResponse.put("status", "success");

	    jsonResponse.write(response.getWriter());

	}


}
