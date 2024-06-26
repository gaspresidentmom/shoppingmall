package com.example.shoppingMall.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToOne;
import lombok.Data;

@Data
@Entity
public class Cart {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int cno;
	
	@ManyToOne
	@JoinColumn(name="pno")
	private Product pno;
	
	@ManyToOne
	@JoinColumn(name="username")
	private Member username;

	private int quantity;
	
}
