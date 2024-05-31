package com.example.shoppingMall.respository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.example.shoppingMall.entity.Member;
import com.example.shoppingMall.entity.Product;


public interface ProductRepository extends JpaRepository<Product, Integer >{
	@Query(value="SELECT * FROM product ORDER BY reg_date desc;", nativeQuery = true)
	public List<Product> findOrderByRegDate();
	
	public Product findOneByPno(int pno);

	//public List<Product> findAllByUsername(Member member);
	

}
