package com.example.shoppingMall.respository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;

import com.example.shoppingMall.entity.Member;

public interface MemberRepository extends JpaRepository<Member, String>{
	
	public Member findOneByUsername(@Param("username") String username);

}
