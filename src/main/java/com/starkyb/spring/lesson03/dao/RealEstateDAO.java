package com.starkyb.spring.lesson03.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.starkyb.spring.lesson03.model.RealEstate;

@Repository
public interface RealEstateDAO {
	//id로 select하기
	public RealEstate selectRealEstate(@Param("id") int id);
	//월세 조건 select
	public List<RealEstate> selectRentPrice(@Param("rent") int rent);
	//복합조건 select
	public List<RealEstate> selectAreaPrice(@Param("area") int area, @Param("price") int price);
	
}
