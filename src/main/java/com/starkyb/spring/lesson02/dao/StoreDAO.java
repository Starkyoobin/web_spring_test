package com.starkyb.spring.lesson02.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.starkyb.spring.lesson02.model.Store;

@Repository
public interface StoreDAO {
	public List<Store> selectStoreList();
}
