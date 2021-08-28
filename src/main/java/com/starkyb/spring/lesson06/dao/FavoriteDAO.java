package com.starkyb.spring.lesson06.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface FavoriteDAO {
	public int insertFavorite(
			@Param("name") String name
			, @Param("url") String url);
	
	public String selectFavorite();
}
