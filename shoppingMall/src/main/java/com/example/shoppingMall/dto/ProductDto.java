package com.example.shoppingMall.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ProductDto {
	private String pname;
	private MultipartFile file;
	private int price;
	private int quantity;
	private String saleState;
	private String manufacturer;
	
	public String getFileName() {
		return file.getOriginalFilename();
	}
}
