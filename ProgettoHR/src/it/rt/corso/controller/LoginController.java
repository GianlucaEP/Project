package it.rt.corso.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import it.rt.corso.beans.Utente;

@Controller
public class LoginController {

	@RequestMapping(value = "/Login", method = RequestMethod.POST)
	public String display(@ModelAttribute Utente utente) {
		
		
		return "Login";
	}
}
