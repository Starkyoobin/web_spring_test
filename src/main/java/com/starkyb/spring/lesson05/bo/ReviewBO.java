package com.starkyb.spring.lesson05.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.starkyb.spring.lesson05.dao.ReviewDAO;
import com.starkyb.spring.lesson05.model.Review;

@Service
public class ReviewBO {
	@Autowired
	private ReviewDAO reviewDAO;
	
	public List<Review> getReviews() {
		return reviewDAO.selectReviews();
	}
}
