package com.starkyb.spring.lesson03.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.starkyb.spring.lesson03.dao.RealEstateDAO;
import com.starkyb.spring.lesson03.model.RealEstate;

@Service
public class RealEstateBO {
	@Autowired
	private RealEstateDAO realEstateDAO;	
	public RealEstate getRealEstate(int id) {
		return realEstateDAO.selectRealEstate(id);
	}
	
	@Autowired
	private RealEstateDAO rentPriceDAO;
	public RealEstate getRentPrice(int rent) {
		return rentPriceDAO.selectRentPrice(rent);
	}
}
