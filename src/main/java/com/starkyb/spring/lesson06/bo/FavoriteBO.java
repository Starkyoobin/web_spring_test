package com.starkyb.spring.lesson06.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.starkyb.spring.lesson06.dao.FavoriteDAO;

@Service
public class FavoriteBO {
	@Autowired
	private FavoriteDAO favoriteDAO;
	
	public int addFavorite(String name, String url) {
		return favoriteDAO.insertFavorite(name, url);
	}
	
	public String getFavorite() {
		return favoriteDAO.selectFavorite();
	}
}
