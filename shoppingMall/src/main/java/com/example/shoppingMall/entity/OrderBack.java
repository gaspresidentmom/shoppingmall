package com.example.shoppingMall.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
import lombok.Data;

@Data
@Entity
public class OrderBack {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int orderbackno;
	
	@OneToOne
	@JoinColumn(name="purchaseno")
	private Purchase purchaseno;
	
}
