package com.starkyb.spring.lesson05;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.starkyb.spring.lesson02.bo.StoreBO;

@Controller
@RequestMapping("/lesson05/test06")
public class JstlStoreController {
	@Autowired
	private StoreBO storeBO;
	
	@GetMapping("/store_info")
	public String storeInfo() {
		
		
		return "lesson05/test06/storeInfo";
	}
}
