package com.application;

import java.lang.String;
import java.lang.Math;
import java.util.Date;
import java.util.List;
import java.util.Arrays;
import java.text.SimpleDateFormat;

import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;
import com.googlecode.objectify.annotation.Index;


@Entity
public class Employee implements java.io.Serializable{
	@Id public Long id;
	@Index public String userName;
	@Index public String firstName;
	@Index public String lastName;
	@Index public String employeeId;
	@Index public String password;
	@Index public String phoneNumber;
	@Index public Date loginTime;
	@Index public Date logoutTime;
	@Index public String employeeClass;
	@Index public Boolean isAdmin = false;
	@Index public Double locationLat;
	@Index public Double locationLng;
	@Index public String direction;
	@Index public Double distance;

	public Employee addEmployee(String firstName, String lastName, 
		String employeeId, String password, String phoneNumber,
		Date loginTime, Date logoutTime, String employeeClass,
		Boolean isAdmin){
		this.firstName = firstName;
		this.lastName = lastName;
		this.employeeId = employeeId;
		this.password = password;
		this.phoneNumber = phoneNumber;
		this.loginTime = loginTime;
		this.logoutTime = logoutTime;
		this.employeeClass = employeeClass;
		this.userName = firstName+'.'+lastName;
		this.isAdmin = isAdmin;
		return this;
	}


	public Employee computeAndUpdateDirection(
		Double locationLat, Double locationLng){

		String direction;
		List<String> coordNames = Arrays.
			asList("N", "NE", "E", "SE", "S", "SW", "W", "NW", "N");

		Double originLat = UpdateLocationServlet.originLat;
		Double originLng = UpdateLocationServlet.originLng; 

		Double radians = Math.atan2(
			(locationLng - originLng), (locationLat - originLat));

		Double compassReading = radians * (180/Math.PI);
		long coordIndex = Math.round(compassReading/45);

		if(coordIndex < 0){
			direction = coordNames.get((int)coordIndex+8);
		}
		direction = coordNames.get((int)coordIndex);

		this.direction = direction;
		return this;
	}


	public Employee updateLocation(Double locationLat,
		Double locationLng){
		this.locationLat = locationLat;
		this.locationLng = locationLng;
		return this;
	}
	

	public Employee updateDistance(Double distance){
		this.distance = distance;
		return this;
	}

}

