package com.example.shoppingMall.respository;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.shoppingMall.entity.Product;


public interface ProductRepository extends JpaRepository<Product, Integer >{
	
	public List<Product> findOrderByRegDate(LocalDateTime regDate);
	public Product findOneByPno(int pno);
}
