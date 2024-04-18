package com.springboot.kynspringboot.repository;

import com.springboot.kynspringboot.dao.Store;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface StoreRepository extends JpaRepository<Store, Long>{

}

