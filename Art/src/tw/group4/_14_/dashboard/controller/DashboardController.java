package tw.group4._14_.dashboard.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import tw.group4._14_.back.dao.AlertsService;
import tw.group4._14_.dashboard.dao.DashboardService;
import tw.group4.util.Hibernate;

@Controller
public class DashboardController {

	@Autowired
	public DashboardService dbService;

	@Autowired
	public AlertsService altService;
	
	// 獲取售票總金額
	@Hibernate
	@RequestMapping(path = "/14/showsumTicketTotal", produces = "application/text; charset=utf-8")
	@ResponseBody
	public String showsumTicketTotal() {

		Long sumTicketTotal = dbService.sumTicketTotal();

		String value = String.valueOf(sumTicketTotal);
		
		if ("null".equals(value)) {
			value = "0";
		}

		return value;
	}
	
	// 獲取註冊會員總人數
		@Hibernate
		@RequestMapping(path = "/14/showSumMember", produces = "application/text; charset=utf-8")
		@ResponseBody
		public String showSumMember() {

			Long sumMember = dbService.sumMember();

			String value = String.valueOf(sumMember);

			return value;
		}
	

	// 計算各入口點擊次數
	@Hibernate
	@RequestMapping(path = "/14/barChart", produces = "application/text; charset=utf-8")
	@ResponseBody
	public String barChart() {
		
		
		

		ArrayList<String> arrayList = new ArrayList<String>();
		String action = "1";
		String shop = "5";
		String restaurant = "8";
		String map = "6";
		String course = "3";
		String artist = "2";


		arrayList.add(action);
		arrayList.add(shop);
		arrayList.add(restaurant);
		arrayList.add(map);
		arrayList.add(course);
		arrayList.add(artist);

		Gson gson = new Gson();
		String json = gson.toJson(arrayList);

		return json;
	}

	// 計算各收費管道營收
	@Hibernate
	@RequestMapping(path = "/14/pieChart", produces = "application/text; charset=utf-8")
	@ResponseBody
	public String pieChart() {

		Long sumAPshopTotal = altService.sumTotal();
		
		ArrayList<String> arrayList = new ArrayList<String>();
		String action = "1000";
		String shop = String.valueOf(sumAPshopTotal);
		String restaurant = "180";
		String course = "130";
		String artist = "280";

		arrayList.add(action);
		arrayList.add(shop);
		arrayList.add(restaurant);
		arrayList.add(course);
		arrayList.add(artist);

		Gson gson = new Gson();
		String json = gson.toJson(arrayList);

		return json;
	}

}
