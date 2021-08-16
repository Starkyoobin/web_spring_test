package com.starkyb.spring.lesson03.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.starkyb.spring.lesson03.model.RealEstate;

@Repository
public interface RealEstateDAO {
	public RealEstate selectRealEstate(@Param("id") int id);
}
