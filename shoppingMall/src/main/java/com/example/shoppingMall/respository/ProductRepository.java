package com.example.shoppingMall.respository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.shoppingMall.entity.Product;


public interface ProductRepository extends JpaRepository<Product, Integer >{
	
}
