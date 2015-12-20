package com.application;

import java.io.*;
import java.net.*;

public class HttpRequests {

   public static String getResponse(String urlToRead) throws Exception {
      
      StringBuilder result = new StringBuilder();
      URL url = new URL(urlToRead);
      HttpURLConnection conn = (HttpURLConnection) url.openConnection();

      conn.setRequestMethod("GET");
      BufferedReader rd = new BufferedReader(
         new InputStreamReader(conn.getInputStream()));
      
      String line;
      while ((line = rd.readLine()) != null) {
         result.append(line);
      }
      rd.close();
      return result.toString();
   }

}