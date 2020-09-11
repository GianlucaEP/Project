package it.rt.corso.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestBindingException;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import it.rt.corso.beans.Utente;

@Controller
public class WelcomeController {

	@RequestMapping("/")
	public String WelcomeDisplay(@SessionAttribute("utente") Utente utente) throws ServletRequestBindingException {
		if(utente.getUsername() == null) {
			throw new ServletRequestBindingException(null);
		}
		return "Welcome";

	}

}
