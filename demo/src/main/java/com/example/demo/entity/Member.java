package com.example.demo.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import lombok.Data;

@Entity
@Data
public class Member {
	@Id
	//private Integer mno;
	//@Column(unique = true)
	private String username;
	private String password;
	private String name;
}
