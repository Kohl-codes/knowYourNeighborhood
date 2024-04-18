package com.springboot.kynspringboot.service;

import com.springboot.kynspringboot.dao.Store;

import java.util.List;

import org.springframework.stereotype.Service;

@Service
public interface StoreService {
    public void save(Store store);
    public List<Store> getAllStores();
    
    public Store getStoreById(Long id);
	public void deleteStore(Long id); 
}
