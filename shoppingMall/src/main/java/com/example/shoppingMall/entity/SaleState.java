package com.example.shoppingMall.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
import lombok.Data;

@Data
@Entity
public class SaleState {
	@Id
	private int saleState;
	
	@OneToOne
	@JoinColumn(name="pname")
	private Product pname;
	
	@OneToOne
	@JoinColumn(name="username")
	private Member username;
	
}
