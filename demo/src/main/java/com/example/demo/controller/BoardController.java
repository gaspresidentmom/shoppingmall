package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.dto.BoardDto;
import com.example.demo.entity.Board;
import com.example.demo.entity.Member;
import com.example.demo.repository.BoardRepository;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	private BoardRepository boardRepository;
	
	@RequestMapping("/regBoardProc")
	public @ResponseBody String regBoardProc(BoardDto boardDto) {
		Board board = new Board();
		//dto --> entity
		board.setComment(boardDto.getComment());
		
		Member member = new Member();
		member.setUsername(boardDto.getUsername());
		
		board.setMember(member);
		
		String msg = "fail....T.T";
		//디비에 넣기
		Board result = boardRepository.save(board);
		if(result != null) {
			msg = "success....^^";
		}
		return msg;
	}
}
