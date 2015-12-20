package com.application;

import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;
import com.googlecode.objectify.annotation.Index;

import com.googlecode.objectify.Key;

import java.util.Date;
import java.util.List;
import java.util.ArrayList;
import java.text.SimpleDateFormat;

import java.lang.String;
import java.sql.Time;


@Entity
public class EmployeeCaleander implements java.io.Serializable{

	@Id public Long id;
	@Index public Long employeeId;
	@Index public List<Integer> schedule;

	public EmployeeCaleander setCaleander(Employee employee){
		
		List scheduleList = new ArrayList();
		int count = 0;
		while (count < 31){
			scheduleList.add(1);
			count++;
		}

		this.schedule = scheduleList;
		this.employeeId = employee.id;
		return this;
	}

	public List<Integer> getSchedule(){
		return this.schedule;
	}

}