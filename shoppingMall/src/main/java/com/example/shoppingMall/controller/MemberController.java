package com.example.shoppingMall.controller;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.shoppingMall.dto.CartDto;
import com.example.shoppingMall.entity.Cart;
import com.example.shoppingMall.entity.Member;
import com.example.shoppingMall.entity.Product;
import com.example.shoppingMall.respository.CartRepository;
import com.example.shoppingMall.respository.MemberRepository;
import com.example.shoppingMall.respository.ProductRepository;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

//@Slf4j
@Controller
@RequestMapping("/members")
public class MemberController {

	@Autowired
	MemberRepository memberRepository;
	
	@Autowired
	ProductRepository productRepository;
	
	@Autowired
	CartRepository cartRepository;
	
	
	@Value("${spring.servlet.multipart.location}")
	//applicaion.properties에 정의한 경로를 읽어와서 변수에 넣어줌.
	private String path;

	
	// 회원용 메인 (인기상품/최신상품 리스트)
	@RequestMapping("/")
	public String root(Product product, Model model, HttpServletRequest req) {
		
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
		
		return "main";
	}
	
	// 회원용 상품 정보 디테일
	@RequestMapping("/mProdDetail")
	public String getDetail2(@RequestParam("pno") int pno, HttpServletRequest req, Model model) {
		Product product = productRepository.findOneByPno(pno);
		model.addAttribute("product",product);
		HttpSession session = req.getSession();
		model.addAttribute("role", session.getAttribute("role"));
		return "members/detail";
	}
	
	// 장바구니로 이동
	@RequestMapping("/cart")
	public String goCart(Model model, HttpServletRequest req) {
		HttpSession session = req.getSession();
		//Member member = memberRepository.findOneByUsername((String)session.getAttribute("logged"));
		//List<Product> productList = productRepository.findByUsername(member);
		List<CartDto> cartDtoList = cartRepository.findAllWithCartDto((String)session.getAttribute("logged"));
		System.out.println("************************************************");
		System.out.println(cartDtoList);
		model.addAttribute("cartDtoList",cartDtoList);
		return "members/myCart";
	}
	
	// 장바구니에 상품 담기 기능
	@RequestMapping("/saveCart")
	public String saveCart(@RequestParam("pno") int pno
			, @RequestParam("quantity") int quantity
			, HttpServletRequest req) {
		
		HttpSession session = req.getSession();
		String username = (String)session.getAttribute("logged");
		System.out.println("*******************************************************");
		
		Cart cart = new Cart();
		Product product = new Product();
		product.setPno(pno);
		cart.setPno(product);
		cart.setQuantity(quantity);
		
		Member member = new Member();
		member.setUsername(username);
		cart.setUsername(member);
		
		Cart c = cartRepository.save(cart);
		//Cart cart = cartRepository.save(pno, username, quantity);
		System.out.println("c: "+ c);
		System.out.println("저장까지는 완료");
		return "redirect:/members/cart";
	}
}


















