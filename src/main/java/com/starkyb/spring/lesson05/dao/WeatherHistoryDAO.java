package com.starkyb.spring.lesson05.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.starkyb.spring.lesson05.model.WeatherHistory;

@Repository
public interface WeatherHistoryDAO {

	
	public List<WeatherHistory> selectWeatherHistory();
}
