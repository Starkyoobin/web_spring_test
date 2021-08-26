package com.starkyb.spring.lesson05;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.starkyb.spring.lesson05.bo.WeatherHistoryBO;
import com.starkyb.spring.lesson05.model.WeatherHistory;

@Controller
@RequestMapping("/lesson05")
public class WeatherHistoryController {
	@Autowired
	private WeatherHistoryBO weatherHistoryBO;
	@GetMapping("/test05/1")
	public String test05_1(Model model) {
		model.addAttribute("weatherHistory", weatherHistoryBO.getWeatherHistory());
		
		return "lesson05/test05/main";
	}
	
	@GetMapping("/test05/add_weather")
	public String test05_addWeather(
			@RequestParam("date") String date
			, @RequestParam("weather") String weather
			, @RequestParam("temperatures") double temperatures
			, @RequestParam("precipitation") double precipitation
			, @RequestParam("microDust") String microDust
			, @RequestParam("windSpeed") double windSpeed) {
		int count = weatherHistoryBO.addWeatherHistory(date, weather, temperatures, precipitation, microDust, windSpeed);
		
		return "입력 성공 : "  + count;
	}
}
