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

	private int pno;
	private String pname;
	private String file;
	private int price;
	private String saleState;
	private int quantity;
	private String payment;

}
