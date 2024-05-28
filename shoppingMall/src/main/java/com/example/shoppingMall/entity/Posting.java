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
public class Posting {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int postno;
	
	@OneToOne
	@JoinColumn(name="pname")
	private Product pname;
	private int views;
	private int orders;
	
}
