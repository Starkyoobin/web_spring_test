package com.starkyb.spring.lesson03.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.starkyb.spring.lesson03.dao.RealEstateDAO;
import com.starkyb.spring.lesson03.model.RealEstate;

@Service
public class RealEstateBO {
	@Autowired
	private RealEstateDAO realEstateDAO;
	
	//id로 select하기
	public RealEstate getRealEstate(int id) {
		return realEstateDAO.selectRealEstate(id);
	}
	
	//월세 조건 select
	public List<RealEstate> getRentPrice(int rent) {
		return realEstateDAO.selectRentPrice(rent);
	}
	
	//복합조건 select
	public List<RealEstate> getAreaPrice(int area, int price) {
		return realEstateDAO.selectAreaPrice(area, price);
	}
	
	//객체로 insert
	public int addRealEstateAsObject(RealEstate realEstate) {
		return realEstateDAO.insertRealEstateAsObject(realEstate);
	}
	//field로 insert
	public int addRealEstate(int realtorId, String address, int area, String type, int price, int rentPrice) {
		return realEstateDAO.insertRealEstate(realtorId, address, area, type, price, rentPrice);
	}
	
}
