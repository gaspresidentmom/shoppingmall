package com.example.shoppingMall.controller;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.shoppingMall.dto.ProductDto;
import com.example.shoppingMall.entity.Member;
import com.example.shoppingMall.entity.Product;
import com.example.shoppingMall.respository.MemberRepository;
import com.example.shoppingMall.respository.ProductRepository;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MyController {

	@Autowired
	MemberRepository memberRepository;
	
	@Autowired
	ProductRepository productRepository;
	
	@Value("${spring.servlet.multipart.location}")
	//applicaion.properties에 정의한 경로를 읽어와서 변수에 넣어줌.
	private String path;

	@RequestMapping("/")
	public String root() {
		return "/main";
	}
	
	// 로그인폼으로 가기
	@RequestMapping("/members/loginForm")
	public String goLoginForm() {
		return "/members/loginForm";
	}
	
	// 로그인 기능
	@RequestMapping("/members/getLogin")
	public String getLogin(@RequestParam("username") String username,
			@RequestParam("pw") String pw, HttpServletRequest req) {
		HttpSession session = req.getSession();
		String role = (String)req.getAttribute("role");
		Member member = memberRepository.findOneByUsername(username); 
		
		if(pw != null && pw.equals(member.getPw()) ) {
			
			session.setAttribute("logged",member.getUsername());
			session.setAttribute("role", member.getRole());
			return "/main";
		}
		return "redirect:/members/loginForm";
	}
	
	// 로그아웃 기능
	@RequestMapping("/members/logout")
	public String getLogOut(HttpServletRequest req) {
		HttpSession session = req.getSession();
		session.invalidate();
		return "/main";
	}
	
	// 회원가입 폼
	@RequestMapping("/members/regForm")
	public String goRegForm() {
		return "/members/regForm";
	}
	
	// 회원가입 기능
	@RequestMapping("members/registMember")
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
		return "/members/loginForm";
	}
	
	// 게시물 등록폼
	@RequestMapping("/admin/regProductForm")
	public String regProduct() {
		return "/admin/regProductForm";
	}
	
	// 게시물 등록 기능
	@RequestMapping("/product/regist")
	public String productRegist(ProductDto productDto) {
		Product newP = new Product();
		String filename = productDto.getFileName();
		newP.setPname(productDto.getPname());
		newP.setFilename(filename);
		newP.setPrice(productDto.getPrice());
		newP.setSaleState(productDto.getSaleState());
		newP.setQuantity(productDto.getQuantity());
		newP.setManufacturer(productDto.getManufacturer());
		
		File file = new File(filename);
		
		try {
			productDto.getFile().transferTo(file);
			log.info("파일업로드 성공");

			File ufile = new File(path + filename);
			// Thumbnailator.createThumbnail(file, thumbnailFile, 100, 100);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		productRepository.save(newP);
		
		return "/main";
	}
	
	@RequestMapping("/list")
	public String getList(Model model) {
		List<Product> plist = productRepository.findAll();
		model.addAttribute("plist", plist);
		
		return"/admin/list";
	}
	
	
	
	
	
}
