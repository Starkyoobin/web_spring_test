package com.starkyb.spring.lesson05;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.starkyb.spring.lesson05.bo.WeatherHistoryBO;
import com.starkyb.spring.lesson05.model.WeatherHistory;

@Controller
@RequestMapping("/lesson05/test05")
public class WeatherHistoryController {
	@Autowired
	private WeatherHistoryBO weatherHistoryBO;
	
	@GetMapping("/weather_history")
	public String weatherHistory(Model model) {
		List<WeatherHistory> weatherHistory = weatherHistoryBO.getWeatherHistory();
		model.addAttribute("weatherHistory", weatherHistory);
		
		return "lesson05/test05/main";
	}
	
	@GetMapping("/add_weather_view")
	public String test05_addWeatherView() {	
		return "/lesson05/test05/addWeather";
	}
	
	@PostMapping("/add_weather")
	public String addWeather(
			@RequestParam("date") String date
			, @RequestParam("weather") String weather
			, @RequestParam("temperatures") double temperatures
			, @RequestParam("precipitation") double precipitation
			, @RequestParam("microDust") String microDust
			, @RequestParam("windSpeed") double windSpeed) {
		weatherHistoryBO.addWeatherHistory(date, weather, temperatures, precipitation, microDust, windSpeed);
		
		return "redirect:/lesson05/test05/weather_history";
	}
}
