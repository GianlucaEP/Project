package it.rt.corso.controller;


import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.context.request.WebRequest;

import it.rt.corso.DAO.UtenteDAO;
import it.rt.corso.beans.Utente;

@Controller
@SessionAttributes("utente")
public class LoginController {

	ApplicationContext factory = new ClassPathXmlApplicationContext("bean.xml");
	UtenteDAO udao = (UtenteDAO) factory.getBean("utenteDAO");

	@ModelAttribute("utente")
	public Utente setUpUserForm() {
		return new Utente();
	}

	@RequestMapping(value = "/Login", method = RequestMethod.GET)
	public String display() {

		return "Login";
	}

	@RequestMapping(value = "/LogginIn", method = RequestMethod.POST)
	public String Login(@ModelAttribute Utente utente, Model m) {

		Utente u = udao.getByUsernamePassword(utente.getUsername(), utente.getPassword());

		if (u != null) {

			m.addAttribute("utente", u);
			return "redirect:/";
		}
		m.addAttribute("info", "error");
		return "redirect:/Login";
	}

	@RequestMapping(value = "/Logout", method = RequestMethod.GET)
	public String Logout(WebRequest webRequest, SessionStatus status) {
		status.setComplete();
		webRequest.removeAttribute("utente", WebRequest.SCOPE_SESSION);

		return "redirect:/Login";
	}

}
