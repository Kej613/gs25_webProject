package spring.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpSession;
import spring.entity.AuthInfo;
import spring.service.AuthService;
import spring.service.WrongIdPasswordException;


@Controller
@RequestMapping("/login")
public class LoginController {
	
	private static final String ADMIN_ID = "eunjeongkim";  //관리자 아이디
    private static final String ADMIN_PASSWORD = "1234";  //관리자 비밀번호
	
	@Autowired
 private AuthService authService;
 
 public void setAuthService(AuthService authService) {
	 this.authService = authService;
 }
 @GetMapping
 public String form(LoginCommand loginCommand) {
	 return "login/loginForm";
 }
 @PostMapping
 public String submit(LoginCommand loginCommand, Errors errors, Model model, HttpSession session) {
	 
	 new LoginCommandValidator().validate(loginCommand, errors);
	 if (errors.hasErrors()) {
		 model.addAttribute("errorMessage", "틀렸습니다. 다시 입력해주세요");
		 return "login/loginForm";
	 }
	 
	 if (loginCommand.getEmail().equals(ADMIN_ID) && loginCommand.getPassword().equals(ADMIN_PASSWORD)) {
         return "login/Manager_login";  // 관리자 아이디와 비밀번호가 일치하는 경우 loginCheck.jsp로 페이지를 넘깁니다.
     }
	 
	 try {
		AuthInfo authInfo = authService.authenticate(loginCommand.getEmail(), loginCommand.getPassword());
		session.setAttribute("authInfo", authInfo);
		return "login/staff_login";  
	 }catch(WrongIdPasswordException e) {
		 errors.reject("idPasswordNotMatching");
		 model.addAttribute("errorMessage", "틀렸습니다. 다시 입력해주세요");
		 return "login/loginForm"; 
		
	 }
	 
	    
 }


}