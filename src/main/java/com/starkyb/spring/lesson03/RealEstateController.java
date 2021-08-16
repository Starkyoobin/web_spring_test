package com.starkyb.spring.lesson03;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.starkyb.spring.lesson03.bo.RealEstateBO;
import com.starkyb.spring.lesson03.model.RealEstate;

@Controller
public class RealEstateController {
	@Autowired
	private RealEstateBO realEstateBO;
	
	@ResponseBody
	@RequestMapping("/lesson03/test01/1")
	public RealEstate test01(@RequestParam("id") int id) {
		return realEstateBO.getRealEstate(id);
	}
}
