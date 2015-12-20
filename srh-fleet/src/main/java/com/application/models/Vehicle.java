package com.application;

import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;
import com.googlecode.objectify.annotation.Index;

import java.lang.String;
import java.util.List;
import java.util.ArrayList;


@Entity
public class Vehicle implements java.io.Serializable {
	
	@Id public Long id;
	@Index public String number;
	@Index public int seatCount;
	@Index public long odometer;
	@Index public long nextService;
	@Index public Boolean isAvailable=true;
	@Index public Boolean isAtService=false;
	@Index public List<Long> passengers;

	public Vehicle addPassengers(List<Long> passengers){
		this.passengers = passengers;
		return this;
	}


	public Vehicle addVehicle(String number, int seatCount,
		long odometer){
		this.number = number;
		this.seatCount = seatCount;
		this.odometer = odometer;
		this.nextService = odometer+5000;
		this.passengers = new ArrayList<Long>();

		return this;
	}


	public Vehicle updateAvalabilityTrue(){
		this.isAvailable = true;
		this.isAtService = true;
		return this;
	}


	public Vehicle setVehicleOnDuty(){
		this.isAvailable = false;
		return this;
	}


	public Vehicle setVehicleOnService(){
		this.isAtService = true;
		return this;
	}
}