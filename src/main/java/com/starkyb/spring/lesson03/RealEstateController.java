package com.starkyb.spring.lesson03;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.starkyb.spring.lesson03.bo.RealEstateBO;
import com.starkyb.spring.lesson03.model.RealEstate;

@Controller
@RequestMapping("/lesson03")
public class RealEstateController {
	@Autowired
	private RealEstateBO realEstateBO;	
	
	//id로 select하기
	@ResponseBody
	@RequestMapping("/test01/1")
	public RealEstate test01_1(@RequestParam("id") int id) {
		return realEstateBO.getRealEstate(id);
	}
	
	//월세 조건 select
	@ResponseBody
	@RequestMapping("/test01/2")
	public List<RealEstate> test01_2(@RequestParam("rent") int rent) {
		return realEstateBO.getRentPrice(rent);
	}
	
	//복합조건 select
	@ResponseBody
	@RequestMapping("/test01/3")
	public List<RealEstate> test01_3(@RequestParam("area") int area, @RequestParam("price") int price) {
		return realEstateBO.getAreaPrice(area, price);
	}
	
	//객체로 insert
	@ResponseBody
	@RequestMapping("/test02/1")
	public String test02_1() {
		RealEstate realEstate = new RealEstate();
		realEstate.setRealtorId(3);
		realEstate.setAddress("푸르지용 리버 303동 1104호");
		realEstate.setArea(89);
		realEstate.setType("매매");
		realEstate.setPrice(100000);
		
		int count = realEstateBO.addRealEstateAsObject(realEstate);
		return "입력 성공 : " + count;
	}
	
	//field로 insert
	@ResponseBody
	@RequestMapping("/test02/2")
	public String test02_2(@RequestParam("realtorId") int realtorId) {
		int count = realEstateBO.addRealEstate(realtorId, "썅떼빌리버 오피스텔 814호", 45, "월세", 100000, 120);
		return "입력 성공 : " + count;
	}
	
	//update
	@ResponseBody
	@RequestMapping("/test03")
	public String test03(@RequestParam("id") int id, @RequestParam("price") int price) {
		int count = realEstateBO.updateRealEstateById(id, price);
		return "수정 성공 : " + count;
	}
}
