package com.starkyb.spring.lesson04.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.starkyb.spring.lesson04.dao.SellerDAO;
import com.starkyb.spring.lesson04.model.NewSeller;

@Service
public class SellerBO {
	@Autowired
	private SellerDAO sellerDAO;
	
	//seller 추가
	public int addSeller(String nickname, String profileImageUrl, double temperature) {
		return sellerDAO.insertSeller(nickname, profileImageUrl, temperature);
	}
	
	//seller 출력
	public NewSeller getLastSeller() {
		return sellerDAO.selectLastSeller();
	}
	
	public NewSeller getSeller(int id) {
		return sellerDAO.selectSeller(id);
	}
}
