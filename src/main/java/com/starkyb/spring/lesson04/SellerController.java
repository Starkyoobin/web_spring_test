package com.starkyb.spring.lesson04;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.starkyb.spring.lesson04.bo.SellerBO;
import com.starkyb.spring.lesson04.model.NewSeller;

@Controller
@RequestMapping("/lesson04")
public class SellerController {
	@Autowired
	private SellerBO sellerBO;
	
	//seller 추가
	@RequestMapping("/test01/1")
	public String test01_1() {
		return "lesson04/addSeller";
	}
	
	@PostMapping("/test01/add_seller")
	@ResponseBody
	public String addSeller(
			@RequestParam("nickname") String nickname
			, @RequestParam("profileImageUrl") String profileImageUrl
			, @RequestParam("temperature") double temperature) {
		int count = sellerBO.addSeller(nickname, profileImageUrl, temperature);
		return "입력 성공 : " + count;
	}
	
	//seller 출력
	@GetMapping("/test01/2")
	public String lastUser(Model model) {
		NewSeller seller = sellerBO.getLastSeller();
		model.addAttribute("result", seller);
		model.addAttribute("subject", "판매자 정보");
		
		return "lesson04/sellerInfo";
	}
}
