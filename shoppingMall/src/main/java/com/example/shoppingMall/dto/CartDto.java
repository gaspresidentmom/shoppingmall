package com.example.shoppingMall.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class CartDto {

	private int cno;
	private int pno;
	private String pname;
	private String username;
	private String filename;
	private int price;
	private String saleState;
	private int quantity;
	private String payment;

}
