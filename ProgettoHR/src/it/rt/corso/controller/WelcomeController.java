package it.rt.corso.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import it.rt.corso.beans.Utente;

@Controller
public class WelcomeController {

	@RequestMapping("/")
	public String WelcomeDisplay(@SessionAttribute("utente") Utente utente) {

		return "Welcome";

	}

}
