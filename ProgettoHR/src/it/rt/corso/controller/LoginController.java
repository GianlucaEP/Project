package it.rt.corso.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {

	@RequestMapping("/Login")
	public String display() {
		
		
		return "Login";
	}
}
