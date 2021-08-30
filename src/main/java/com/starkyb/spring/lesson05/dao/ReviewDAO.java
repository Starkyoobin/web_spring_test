package com.starkyb.spring.lesson05.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.starkyb.spring.lesson05.model.Review;

@Repository
public interface ReviewDAO {
	public List<Review> selectReviews();
}
