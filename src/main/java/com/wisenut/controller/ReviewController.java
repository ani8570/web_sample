package com.wisenut.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;//추가 작성자 : 조윤희 - 조회 목록 페이징 처리를 위한 추가 작성
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.wisenut.domain.PageDTO;
import com.wisenut.domain.PageVO;	//추가 작성자 : 조윤희 - 리뷰 목록 페이징 처리를 위한 추가 작성
import com.wisenut.domain.ReviewVO;
import com.wisenut.service.ReviewService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

/**
 * 
 * @author 조윤희, 이지훈
 * @date 2021.10.28
 * @description : 각종 목록 페이징 처리 및 전체 데이터 개수 처리<br>
 * 검색처리를 위한 수정, 삭제 부분 처리
 * 					
 * 
 **/

@Log4j
@Controller
@RequestMapping("/board/*")
@AllArgsConstructor
public class ReviewController {	
	
	private ReviewService service;
	
	@GetMapping("/register")
	public void register() {
		
	}//end reg
	
	@GetMapping("/list")	//리뷰 목록 페이징 처리를 위한 추가 작성
	public void list(PageVO pageVO, Model model) {
		log.info("list " + pageVO);
		model.addAttribute("list", service.getList(pageVO));
		
		//전체 데이터 개수 처리를 위해 테스트를 위한 작성코드 주석처리
		//model.addAttribute("pageMaker", new PageDTO(pageVO, 123));
		
		//전체 데이터 개수 처리를 위해 작성
		int total = service.getTotal(pageVO);
		log.info("total : " + total);
		model.addAttribute("pageMaker", new PageDTO(pageVO, total));
		
	}
	
	@PostMapping("/register")
	public String register(ReviewVO review, RedirectAttributes rttr) {
		
		log.info( "register: " + review);		
		service.register(review);		
		rttr.addFlashAttribute("result", review.getBno());		
		
		return "redirect:/board/list";		
	}//end regster

	// 조회 목록 페이지 처리를 위해 수정
	@GetMapping({"/get","/modify"})
	public void get(@RequestParam("bno") Long bno, 
					@ModelAttribute("pageVO") PageVO pageVO, Model model) {
		log.info("/get or Modify");
		model.addAttribute("board", service.get(bno));
		
	}//end get
	
	// 수정/삭체 처리 후 목록 이동 위해 수정
	@PostMapping("/modify")
	public String modify(ReviewVO review, RedirectAttributes rttr,
						 @ModelAttribute("pageVO") PageVO pageVO) {
		log.info("modify :" + review);
		
		if(service.modify(review)) {
			rttr.addFlashAttribute("result", "success");
		}//end if
		rttr.addAttribute("pageNum", pageVO.getPageNum());
		rttr.addAttribute("amount", pageVO.getAmount());
		rttr.addAttribute("type", pageVO.getType());
		rttr.addAttribute("keyword", pageVO.getKeyword());
		
		return "redirect:/board/list";		
	}//end modify
	
	// 수정/삭체 처리 후 목록 이동 위해 수정
	@PostMapping("/remove")
	public String remove(@RequestParam("bno") Long bno,@ModelAttribute("pageVO") PageVO pageVO,
						 RedirectAttributes rttr ) {
		
		log.info("remove..." + bno);
		if(service.remove(bno)) {
			rttr.addFlashAttribute("result", "success");
		}//end if
		rttr.addAttribute("pageNum", pageVO.getPageNum());
		rttr.addAttribute("amount", pageVO.getAmount());
		rttr.addAttribute("type", pageVO.getType());
		rttr.addAttribute("keyword", pageVO.getKeyword());
		return "redirect:/board/list";		
	}//end remove

}//end class
