package org.zerock.controller;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.MemberVO;
import org.zerock.service.MemberService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/member/*")
@AllArgsConstructor
public class CommonController {

	
	private MemberService service;
	
	private BCryptPasswordEncoder pwEncoder;
	
	@GetMapping("/memberRegister")
	public void memberRegister() {
		log.info("회원가입페이지로 GET");
	}
	
	@PostMapping("/memberRegister")
	public String memberRegister(MemberVO vo, RedirectAttributes rttr){
		
		log.info("CommonController - memberRegister: " + vo);
		int result = service.useridChk(vo);

		if(result == 1) {
			return "/member/memberRegister";
		}else if(result == 0) {
			
			String auth = vo.getAuth();
			
			if(auth.equals("관리자")) {
				vo.setAuth("0");
			}else {
				vo.setAuth("1");
			}
			
			String inputPassword = vo.getUserpw();
			String pwd = pwEncoder.encode(inputPassword);
			vo.setUserpw(pwd);
			
			rttr.addFlashAttribute("msg", "회원가입 성공");
			service.memberRegister(vo);
			log.info("회원가입 암호화 POST 완료");
		}
		
		return "redirect:/";
	}
	
	@GetMapping("/memberLogin")
	public void memberLogin() {
		log.info("로그인페이지로 GET");
	}
	
	@PostMapping("/memberLogin")
	public String memberLogin(MemberVO vo, HttpServletRequest req, RedirectAttributes rttr){
		
		HttpSession session = req.getSession();
		MemberVO login = service.memberLogin(vo);
		
		boolean pwMatch = pwEncoder.matches(vo.getUserpw(), login.getUserpw());
		
		if(login != null && pwMatch) {
			 
			session.setAttribute("member", login);
			log.info(login);
			session.setAttribute("id", login.getUserid());
			log.info(login.getUserid());
			rttr.addFlashAttribute("msg", "암호화 로그인 되었습니다");
			
			log.info("암호화 로그인 완료");
			
			return "redirect:/";
			  
		} else {
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg", "로그인 실패");
				
			return "redirect:/member/memberLogin";
		}  
		
	}
	
	@GetMapping("/memberLogout")
	public String memberLogout(HttpSession session, RedirectAttributes rttr) {
		
		session.invalidate();
		rttr.addFlashAttribute("msg", "로그아웃");
		log.info("로그아웃 완료");
		
		return "redirect:/";
		
	}
	
	@GetMapping("/memberUpdate")
	public void memberUpdate() {
		log.info("memberUpdate로 GET");
	}
	
	@PostMapping("/memberUpdate")
	public String memberUpdate(MemberVO vo, HttpSession session, RedirectAttributes rttr){
		
		MemberVO login = service.memberLogin(vo);
		
		//암호화 된 로그인 확인하기 위함.
		boolean pwMatch = pwEncoder.matches(vo.getUserpw(), login.getUserpw());
		if(pwMatch) {
			
			String pwd = pwEncoder.encode(vo.getUserpw_chk());
			vo.setUserpw(pwd);
			
			session.invalidate();
			service.memberModify(vo);
			rttr.addFlashAttribute("msg", "회원 정보 수정 완료 : 재로그인 하시오");
			
			return "redirect:/";
			
		}else {
			rttr.addFlashAttribute("msg", "변경 실패 : 재입력 바람");
			return "redirect:/member/memberUpdate";
		}
	}

	@GetMapping("/memberDelete")
	public void memberDelete() {
		log.info("memberDelete로 GET");
	}
	
	@PostMapping("/memberDelete")
	public String memberDelete(MemberVO vo, HttpSession session, RedirectAttributes rttr){
		
		log.info("CommonController - memberDelete: " + vo);
		
		MemberVO login = service.memberLogin(vo);
		
		//암호화 된 비밀번호와 입력한 비밀번호가 맞아야 탈퇴가 됨.
		boolean pwMatch = pwEncoder.matches(vo.getUserpw(), login.getUserpw());
		if(pwMatch) {
			session.invalidate();
			service.memberDelete(vo);
			rttr.addFlashAttribute("msg", "탈퇴가 성공적으로.....ㅠㅠ");
			
			return "redirect:/";
			
		}else {
			rttr.addFlashAttribute("msg", "탈퇴실패...크킄킄ㅋ");
			return "redirect:/member/memberDelete";
		}
		
	}
	
	@ResponseBody
	@PostMapping("/userpwChk")
	public int userpwChk(MemberVO vo) {
		
		int result = service.userpwChk(vo);
		return result;
		
	}

	@ResponseBody
	@PostMapping("/useridChk")
	public int useridChk(MemberVO vo) {
		
		int result = service.useridChk(vo);
		return result;
		
	}
	
	@GetMapping("/memberList")
	public void memberList(Model model) {
		
		log.info("CommonController - memberList 이다");
		model.addAttribute("memberList", service.memberList());
		
	}
	
	@GetMapping("/search_id")
	public String search_id(HttpServletRequest request, Model model, MemberVO searchVO) {
	    
	    return "/member/search_id";
	}
	
	@PostMapping("/search_result_id")
	public String search_result_id(HttpServletRequest request, Model model,
		    @RequestParam(required = true, value = "username") String username, 
		    @RequestParam(required = true, value = "phone") String phone,
		    MemberVO searchVO) {
		 
		try {
		    
		    searchVO.setUsername(username);
		    searchVO.setPhone(phone);
		    MemberVO memberSearch = service.memberIDSearch(searchVO);
		    
		    model.addAttribute("searchVO", memberSearch);
		 
		} catch (Exception e) {
		    System.out.println(e.toString());
		    model.addAttribute("msg", "오류가 발생되었습니다.");
		}
		 
		return "/member/search_result_id";
		}
	 
	@GetMapping("/search_pwd")
	public String search_pwd(HttpServletRequest request, Model model, MemberVO searchVO) {
	    
	    return "/member/search_pwd";
	}
	
	@PostMapping("/search_result_pwd")
	public String search_result_pwd(HttpServletRequest request, Model model,
		    @RequestParam(required = true, value = "username") String username, 
		    @RequestParam(required = true, value = "phone") String phone, 
		    @RequestParam(required = true, value = "userid") String userid, 
		    MemberVO searchVO) {
		 
		try {
		    
		    searchVO.setUsername(username);
		    searchVO.setPhone(phone);
		    searchVO.setUserid(userid);
		    int memberSearch = service.memberPwdCheck(searchVO);
		    
		    if(memberSearch == 0) {
		        model.addAttribute("msg", "기입된 정보가 잘못되었습니다. 다시 입력해주세요.");
		        return "/member/search_pwd";
		    }
		    
		    String newPwd = RandomStringUtils.randomAlphanumeric(10);
		    String enpassword = pwEncoder.encode(newPwd);
		    searchVO.setUserpw(enpassword);
		    
		    service.passwordUpdate(searchVO);
		    
		    model.addAttribute("newPwd", newPwd);
		 
		} catch (Exception e) {
		    System.out.println(e.toString());
		    model.addAttribute("msg", "오류가 발생되었습니다.");
		}
		 
		return "/member/search_result_pwd";
		}

}
