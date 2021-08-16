package com.starkyb.spring.lesson03;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.starkyb.spring.lesson03.bo.RealEstateBO;
import com.starkyb.spring.lesson03.model.RealEstate;

@Controller
@RequestMapping("/lesson03/test01")
public class RealEstateController {
	@Autowired
	private RealEstateBO realEstateBO;	
	
	//id로 select하기
	@ResponseBody
	@RequestMapping("/1")
	public RealEstate selectId(@RequestParam("id") int id) {
		return realEstateBO.getRealEstate(id);
	}
	
	//월세 조건 select
	@ResponseBody
	@RequestMapping("/2")
	public RealEstate rentPrice(@RequestParam("rentPrice") int rentPrice) {
		return realEstateBO.getRentPrice(rentPrice);
	}
	
	//복합조건 select
	@ResponseBody
	@RequestMapping("/3")
	public RealEstate areaPrice(@RequestParam("area") int area, @RequestParam("price") int price) {
		return realEstateBO.getAreaPrice(area, price);
	}
}
