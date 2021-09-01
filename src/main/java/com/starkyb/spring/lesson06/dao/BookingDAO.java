package com.starkyb.spring.lesson06.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.starkyb.spring.lesson06.model.Booking;

@Repository
public interface BookingDAO {
	public List<Booking> selectBooking();
	
	public int deleteBooking(@Param("id") int id);
}
