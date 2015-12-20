package com.application;

import java.util.List;
import java.util.Date;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Map;
import java.util.HashMap;
import java.text.SimpleDateFormat;

import com.googlecode.objectify.ObjectifyService;


public class DatabaseApi {

	public static List<Employee> getPresentEmployees(){
		List<Employee> presentEmployees = new ArrayList<Employee>();
		Date date = new Date();
		DateFormat dateFormat = new SimpleDateFormat("dd");
		int today = Integer.parseInt(dateFormat.format(date));

		List<Employee> allEmployees = ObjectifyService.ofy()
			.load().type(Employee.class).list();

		for (Employee employee: allEmployees){
			int isPresent = 0;
			List<Integer> schedule = getEmployeeCaleanderById(
				employee.id);
			if (schedule != null){
				isPresent = schedule.get(today);
			}

			if (isPresent == 1){
				presentEmployees.add(employee);
			}
		}

		return presentEmployees;
	}

	public static List<Integer> getEmployeeCaleanderById(
		Long employeeId){

		EmployeeCaleander employee = ObjectifyService.ofy()
			.load().type(EmployeeCaleander.class)
			.filter("employeeId", employeeId).first().now();

		if ( employee != null){
			return employee.schedule;
		}

		return null;
	}

	public static List<Vehicle> getAvailableVehicles(){
		List<Vehicle> allVehicles = ObjectifyService.ofy()
			.load().type(Vehicle.class).list();
		List<Vehicle> availableVehicle = new ArrayList<Vehicle>();

		for (Vehicle vehicle: allVehicles){
			if (vehicle.isAvailable){
				availableVehicle.add(vehicle);
			}
		}

		return availableVehicle;

	}

	public static Vehicle getEmployeeVehicle(Employee employee){
		List<Vehicle> allVehicles = ObjectifyService.ofy()
					.load().type(Vehicle.class).list();
		Vehicle employeeVehicle = new Vehicle();
		System.out.println(allVehicles);
		if (allVehicles != null){
		for (Vehicle vehicle : allVehicles){
			List<Long> passengerList = vehicle.passengers;
			if (passengerList != null){
				for (Long employeeId: passengerList){
					if (employeeId == employee.id){
						employeeVehicle = vehicle;
						break;
				}
			}	
			}
		}
		}

		return employeeVehicle;
	}

}