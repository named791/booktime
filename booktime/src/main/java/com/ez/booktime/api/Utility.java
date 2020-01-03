package com.ez.booktime.api;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class Utility {
	public String getAPI() {
		String clientId = "I21D6WpJCxTcTFU13297";
		String clientSecret = "iA2hf299kC";
		String title = null;
		try{
			String text = URLEncoder.encode("아낌", "UTF-8");
			String apiURL = "https://openapi.naver.com/v1/search/book.json?query="+text; // json 결과
			//String apiURL = "https://openapi.naver.com/v1/search/blog.xml?query="+ text; // xml 결과
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection)url.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("X-Naver-Client-Id", clientId);
			con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
			
			int responseCode = con.getResponseCode();
            BufferedReader br;
            if(responseCode==200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {  // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
			
			String line;
			String res = "";
			while((line = br.readLine()) != null) {
				res += line;
			}
			JSONObject obj = (JSONObject)new JSONParser().parse(res);
			JSONArray jarr = (JSONArray)obj.get("items");
			obj = (JSONObject)jarr.get(0);
			
			title = (String)obj.get("title");
			
		}catch (Exception e) {
			
		}
		return title;
	}
	
	public static void main(String[] args) {
		Utility u = new Utility();
		System.out.println(u.getAPI());
	}
}
