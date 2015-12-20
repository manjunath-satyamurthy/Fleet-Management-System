package com.application;

import java.io.IOException;
import java.io.BufferedReader;
import java.lang.StringBuilder;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class ParseJson {

	public static JSONObject getJsonByRequest(
		HttpServletRequest request) throws IOException{

		String line;
		JSONObject jsonData = null;
		StringBuilder buffer = new StringBuilder();
		BufferedReader postData = request.getReader();
	    
	    while ((line = postData.readLine()) != null) {
	        buffer.append(line);
	    }

	    String data = buffer.toString();

	    return getJsonByString(data);

	}

	public static JSONObject getJsonByString(String jsonString){

		JSONObject jsonData = null;

		try{
			jsonData = (JSONObject)new JSONParser().parse(jsonString);
		} 

		catch(ParseException pe){
	        System.out.println("Parse Error !");
	    }

	    return jsonData;

	}

}