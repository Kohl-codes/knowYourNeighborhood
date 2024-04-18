package com.springboot.kynspringboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.springboot.kynspringboot.dao.Store;
import com.springboot.kynspringboot.repository.StoreRepository;

@Service
@Transactional
public class StoreServiceImpl implements StoreService {

    @Autowired
    private StoreRepository storeRepository;

    @Override
    public void save(Store store) {
        storeRepository.save(store);
    }

    @Override
    public List<Store> getAllStores() {
        return storeRepository.findAll();
    }
    
    @SuppressWarnings("deprecation")
	@Override
	public Store getStoreById(Long id) {
		return storeRepository.getById(id);
	}

	@Override
	public void deleteStore(Long id) {
		storeRepository.deleteById(id);
	}
}

