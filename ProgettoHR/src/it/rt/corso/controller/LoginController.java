package it.rt.corso.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import it.rt.corso.beans.Utente;

@Controller
public class LoginController {

	@RequestMapping("/Login")
	public String display(@ModelAttribute Utente utente) {
		
		
		return "Login";
	}
}
