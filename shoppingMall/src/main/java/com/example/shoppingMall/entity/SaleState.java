package com.example.shoppingMall.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToOne;
import lombok.Data;

@Data
@Entity
public class SaleState {
	@Id
	private int saleState;
	
	@ManyToOne
	@JoinColumn(name="pname")
	private Product pname;
	
	@ManyToOne
	@JoinColumn(name="username")
	private Member username;
	
}
