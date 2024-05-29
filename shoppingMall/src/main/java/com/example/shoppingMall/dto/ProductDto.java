package com.example.shoppingMall.dto;

import java.time.LocalDateTime;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ProductDto {
	private String pname;
	private MultipartFile file;
	private int price;
	private int stock;
	private String saleState;
	private String seller;
	private LocalDateTime regDate;
	private int orderNum;
	
	public String getFileName() {
		return file.getOriginalFilename();
	}
}
