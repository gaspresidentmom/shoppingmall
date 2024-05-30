package com.example.shoppingMall.controller;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.shoppingMall.entity.Member;
import com.example.shoppingMall.entity.Product;
import com.example.shoppingMall.respository.MemberRepository;
import com.example.shoppingMall.respository.ProductRepository;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class MainController {

	@Autowired
	MemberRepository memberRepository;
	
	@Autowired
	ProductRepository productRepository;
	
	@Value("${spring.servlet.multipart.location}")
	//applicaion.properties에 정의한 경로를 읽어와서 변수에 넣어줌.
	private String path;


	@RequestMapping("/")
	public String root(Product product, Model model, HttpServletRequest req) {
		
		// 로그인된 사람이 관리자인지 회원인지 구분

		// 1. (메인페이지)인기상품 
		List<Product> hotItemList = productRepository.findAll();
		System.out.println(hotItemList);
		
		// 1-1.상품 2개 중 누적주문수가 높은 상품대로 정렬하기
		hotItemList.sort((p1, p2) -> Long.compare(p2.getOrderNum(), p1.getOrderNum()));
		
		// 1-2. 정렬한 상품 중 4개만 선별해 새로운 리스트로 저장
		List<Product> HotItems = hotItemList.stream().limit(4).collect(Collectors.toList());
		model.addAttribute("hot", HotItems);
		
		
		// 2. (메인페이지)신상품 리스트
		List<Product> newItemList = productRepository.findOrderByRegDate();
		System.out.println(newItemList);
		model.addAttribute("n", newItemList);
		
		// 2-1. 상품 2개 중 제일 최신에 등록된 상품대로 정렬하기
		//newItemList.sort((p1, p2) -> p2.getRegDate().compareTo(p1.getRegDate()));
		
		// 2-2. 정렬한 상품 중 4개만 선별해 새로운 리스트로 저장
		// List<Product> NewItems = newItemList.stream().limit(4).collect(Collectors.toList());
		
		// 내가 쓴 코드 : LocalDateTime regDate = product.getRegDate();
		//내가 쓴 코드 : List<Product> plistNew = productRepository.findOrderByRegDate(regDate);
		
		return "/main";
	}
	
	// 회원가입 폼
	@RequestMapping("/regForm")
	public String goRegForm() {
		return "/regForm";
	}
	
	// 회원가입 기능
	@RequestMapping("/registMember")
	public String goRegist(@RequestParam("username") String username,
			@RequestParam("pw") String pw,
			@RequestParam("tel") String tel,
			@RequestParam("role") String role) {
		Member mem = new Member();
		mem.setUsername(username);
		mem.setPw(pw);
		mem.setTel(tel);
		mem.setRole(role);
		
		memberRepository.save(mem);
		return "/loginForm";
	}
	
	// 로그인폼으로 가기
		@RequestMapping("/loginForm")
		public String goLoginForm() {
			return "/loginForm";
		}
		
		// 로그인 기능
		@RequestMapping("/getLogin")
		public String getLogin(@RequestParam("username") String username,
				@RequestParam("pw") String pw, HttpServletRequest req) {
			
			HttpSession session = req.getSession();
			Member member = memberRepository.findOneByUsername(username); 
			
			if(pw != null && pw.equals(member.getPw())) {
				
				session.setAttribute("logged",member.getUsername());
				session.setAttribute("role", member.getRole());
				
				return "redirect:/";
				
			}else{
				return "redirect:/loginForm";
			}
		}
		
		// 로그아웃 기능
		@RequestMapping("/logout")
		public String getLogOut(HttpServletRequest req) {
			HttpSession session = req.getSession();
			session.invalidate();
			return "redirect:/";
		}
		
		

	
	
	
	
	
	
	
	
	
}
