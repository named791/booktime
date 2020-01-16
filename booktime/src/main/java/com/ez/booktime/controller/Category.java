package com.ez.booktime.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.ez.booktime.api.AladinAPI;

public class Category {
	private static final String LIST_URL = "http://www.aladin.co.kr/ttb/api/ItemList.aspx";
	private static final String TTB_KEY = "?ttbkey=ttbstjgh5051633001&";
	
	private static final String LIST_NEW_ALL = "QueryType=ItemNewAll&";
	
	private static final Logger logger
		=LoggerFactory.getLogger(AladinAPI.class);
	
	public List<Map<String, Object>> categoryFind(int cateNo) throws Exception {
		
		//카테고리 번호
		
		String category = "categoryId="
		//+cateNo
		+2551		
		+"&";
		
		//url 조립
		String apiURL = LIST_URL+TTB_KEY
				+LIST_NEW_ALL
				+category
				+options();
		URL url = new URL(apiURL);
		System.out.println(url);
		
		HttpURLConnection con = (HttpURLConnection)url.openConnection();
        con.setRequestMethod("GET");
        int responseCode = con.getResponseCode();
        BufferedReader br;
        if(responseCode==200) { // 정상 호출
            br = new BufferedReader(new InputStreamReader(con.getInputStream()));
        } else {  // 에러 발생
            br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
        }
        String inputLine;
        StringBuffer response = new StringBuffer();
        while ((inputLine = br.readLine()) != null) {
            response.append(inputLine);
        }
        br.close();
        con.disconnect();
        
        String cateResult=response.toString();
        System.out.println(cateResult);
        
        JSONParser jp = new JSONParser();
        JSONObject jsonObj = (JSONObject) jp.parse(cateResult);
        JSONArray memberArray = (JSONArray)jsonObj.get("item");
        System.out.println(memberArray.toString());
		
        List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		for(int i=0;i<memberArray.size();i++) {
			JSONObject jsonObj2 = (JSONObject)memberArray.get(i);
			
			Map<String, Object> map = new HashMap<String, Object>();
			
			String title=(String) jsonObj2.get("title");
			map.put("title", title);	//제목
			System.out.println(title);
			String author=(String) jsonObj2.get("author");
			map.put("author", author); //지은이
			System.out.println(author);
			map.put("publisher", jsonObj2.get("publisher"));	//출판사
	        map.put("pubDate", jsonObj2.get("pubDate"));	//출간일
			//map.put("discription", jsonObj2.get("discription"));	//설명
			map.put("priceStandard", jsonObj2.get("priceStandard"));	//가격
			map.put("cover", jsonObj2.get("cover"));	//표지
			
			list.add(map);
        }
		return list;
	}
	
	public String options() {
		String cover = "Cover=big&";	//표지 크기
		String output = "Output=JS&";	//json
		String version = "Version=20131101";
		
		return cover+output+version;
	}
}
