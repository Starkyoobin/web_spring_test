package com.starkyb.spring.lesson04.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.starkyb.spring.lesson04.model.NewSeller;

@Repository
public interface SellerDAO {
	//seller 추가
	public int insertSeller(
			@Param("nickname") String nickname
			, @Param("profileImageUrl") String profileImageUrl
			, @Param("temperature") double temperature);
	
	//seller 출력
	public NewSeller selectLastSeller();
	
	public NewSeller selectSeller(@Param("id") int id);
}
