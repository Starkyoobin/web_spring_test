package com.starkyb.spring.lesson04.dao;

import org.springframework.stereotype.Repository;

import com.starkyb.spring.lesson04.model.Realtor;

@Repository
public interface RealtorDAO {
	public int insertRealtor(Realtor realtor);
}
