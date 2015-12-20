package com.application;

import java.io.IOException;	
import java.util.Date;
import java.text.SimpleDateFormat;


public class TimeUtil {

	public static Date getTimeByString(String timeString){

		SimpleDateFormat format = new SimpleDateFormat("hh:mm");
		Date dateTime = null;
		try{
			dateTime = format.parse(timeString);
		}

		catch (Exception e){
			System.out.println(e);
		}

		return dateTime;

	}

}