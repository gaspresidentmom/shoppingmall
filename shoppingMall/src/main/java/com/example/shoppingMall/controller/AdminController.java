package com.example.shoppingMall.controller;

import java.io.File;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.shoppingMall.dto.ProductDto;
import com.example.shoppingMall.entity.Product;
import com.example.shoppingMall.respository.MemberRepository;
import com.example.shoppingMall.respository.ProductRepository;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	MemberRepository memberRepository;
	
	@Autowired
	ProductRepository productRepository;
	
	@Value("${spring.servlet.multipart.location}")
	//applicaion.properties에 정의한 경로를 읽어와서 변수에 넣어줌.
	private String path;

	// 관리자용 메인
	@RequestMapping("/admin")
	public String root(Product product, Model model, HttpServletRequest req) {
		
		
		// 로그인된 사람이 관리자인지 회원인지 구분
		HttpSession session = req.getSession();
		
		
		
		
		
		
		
		
		
		
		
		
		// 1. (메인페이지)인기상품 
		List<Product> hotItemList = productRepository.findAll();
		System.out.println(hotItemList);
		
		// 1-1.상품 2개 중 누적주문수가 높은 상품대로 정렬하기
		hotItemList.sort((p1, p2) -> Long.compare(p2.getOrderNum(), p1.getOrderNum()));
		
		// 1-2. 정렬한 상품 중 4개만 선별해 새로운 리스트로 저장
		List<Product> HotItems = hotItemList.stream().limit(4).collect(Collectors.toList());
		model.addAttribute("hot", HotItems);
		
		
		// 2. (메인페이지)신상품 리스트
		List<Product> newItemList = productRepository.findAll();
		System.out.println(newItemList);
		
		// 2-1. 상품 2개 중 제일 최신에 등록된 상품대로 정렬하기
		newItemList.sort((p1, p2) -> p2.getRegDate().compareTo(p1.getRegDate()));
		
		// 2-2. 정렬한 상품 중 4개만 선별해 새로운 리스트로 저장
		List<Product> NewItems = newItemList.stream().limit(4).collect(Collectors.toList());
		model.addAttribute("n", NewItems);
		
		// 내가 쓴 코드 : LocalDateTime regDate = product.getRegDate();
		//내가 쓴 코드 : List<Product> plistNew = productRepository.findOrderByRegDate(regDate);
		
		return "/main";
	}
	
	
		// 상품 등록폼
		@RequestMapping("/admin/regProductForm")
		public String regProduct() {
			return "/admin/regProductForm";
		}
		
		// 상품 등록 기능 + 수정 기능
		@RequestMapping("/product/regist")
		public String productRegist(ProductDto productDto) {
			Product newP = new Product();
			String filename = productDto.getFileName();
			newP.setPname(productDto.getPname());
			newP.setFilename(filename);
			newP.setPrice(productDto.getPrice());
			newP.setSaleState(productDto.getSaleState());
			newP.setStock(productDto.getStock());
			newP.setSeller(productDto.getSeller());
			
			File file = new File(filename);
			
			try {
				productDto.getFile().transferTo(file);
				log.info("파일업로드 성공");

			} catch (Exception e) {
				e.printStackTrace();
			}
			
			productRepository.save(newP);
			
			return "redirect:/admin/list";
		}
		
		// 관리자용 상품 리스트
		@RequestMapping("/admin/list")
		public String getList(Model model) {
			List<Product> plist = productRepository.findAll();
			model.addAttribute("plist", plist);
			
			return"/admin/listForAdmin";
		}
		
		// 관리자용 상품 정보 디테일
		@RequestMapping("/admin/prodDetail")
		public String getDetail(@RequestParam("pno") int pno, Model model) {
			Product product = productRepository.findOneByPno(pno);
			model.addAttribute("product",product);
			
		
			return "/admin/detail";
		}
		

		// 상품 수정폼
		@RequestMapping("/admin/upProductForm")
		public String updateProductForm(Product p, Model model) {
			
			Product product = productRepository.findOneByPno(p.getPno());
			model.addAttribute("product",product);
			
			return"/admin/upProductForm";
		}
		
		// 상품 삭제
		@RequestMapping("/product/delete")
		public String deleteProduct(@RequestParam("pno") int pno, Model model) {
			
			productRepository.deleteById(pno);
			
			List<Product> plist = productRepository.findAll();
			model.addAttribute("plist", plist);
			
			return "redirect:/admin/list";
		}
		

		
		
		
		
		
		
	
	
	
	
	
	
	
	
	
	
	
}
