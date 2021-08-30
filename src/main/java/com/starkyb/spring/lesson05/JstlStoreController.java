package com.starkyb.spring.lesson05;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.starkyb.spring.lesson02.bo.StoreBO;
import com.starkyb.spring.lesson02.model.Store;

@Controller
@RequestMapping("/lesson05/test06")
public class JstlStoreController {
	@Autowired
	private StoreBO storeBO;
	
	@GetMapping("/store_info")
	public String storeInfo(Model model) {
		List<Store> stores = storeBO.getStoreList();
		model.addAttribute("stores", stores);
		
		return "lesson05/test06/storeInfo";
	}
	
	@GetMapping("/reviews")
	public String reviews() {
		
		
		return "lesson05/test06/reviewInfo";
	}
}
