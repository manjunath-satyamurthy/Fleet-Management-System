package com.application;

import java.io.*;
import java.util.Properties;
import java.util.Iterator;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.googlecode.objectify.ObjectifyService;


public class UpdateLocationServlet extends HttpServlet{

	public static Double originLat = 49.414023;
	public static Double originLng = 8.651009;


	@Override
	public void doPost(HttpServletRequest request,
		HttpServletResponse response) throws IOException {

		JSONObject postData = ParseJson.getJsonByRequest(request);
		Employee employee = Auth.getEmployeeByRequest(request);
		String lattitude = postData.get("lat").toString();
		String longitude = postData.get("lng").toString();


		String baseUrl = "https://maps.googleapis.com/maps/api/"+
	    	"distancematrix/json";

	    String origin = "?origins="+lattitude+","+longitude;
	    String destination = "&destinations="+Double.toString(originLat)+
	    	","+Double.toString(originLng);
	    String key = "&key="+"AIzaSyCERa9YsCflkMzjGGhcKPRmXD3X9C8lWbM";

	    String mapsApiUrl = baseUrl+origin+destination+key;

	    Double distance = null;

	    try {

	    	String mapsResponse = HttpRequests.getResponse(mapsApiUrl);
	    	String distanceJsonString = mapsResponse
	    		.split("distance\" : ")[1];


	    	distance = Double.parseDouble(ParseJson.getJsonByString(
	    		distanceJsonString.split(",               \"duration")[0])
	    		.get("text").toString().split(" ")[0]);

	    }

	    catch (Exception e){
	    	System.out.println("Something went bull"+e);
	    }

	    Employee currentEmployee = Auth.getEmployeeByRequest(request);

	    currentEmployee.updateLocation(
	    	Double.parseDouble(lattitude),
	    	Double.parseDouble(longitude)
	    );

	    currentEmployee.computeAndUpdateDirection(
	    	Double.parseDouble(lattitude),
	    	Double.parseDouble(longitude)
	    	);

	    currentEmployee.updateDistance(distance);

	    ObjectifyService.ofy().save().entity(currentEmployee);

	    org.json.JSONObject jsonResponse = new org.json.JSONObject();

	    jsonResponse.put("status", "success");

	    jsonResponse.write(response.getWriter());

	}
}
