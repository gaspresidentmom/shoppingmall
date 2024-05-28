package com.example.shoppingMall.entity;

import java.time.LocalDate;

import org.springframework.web.multipart.MultipartFile;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.Data;

@Data
@Entity
public class Product {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int pno;
	private String pname;
	private int price;
	private String manufacturer;
	//private String photoUrl;
	private String saleState;
	private int quantity;
	private String filename;
	private LocalDate regDate;
	private int orderNum;
}
