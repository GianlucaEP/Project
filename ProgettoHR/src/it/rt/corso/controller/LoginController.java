package it.rt.corso.controller;

import java.security.NoSuchAlgorithmException;

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
import it.rt.corso.filter.PasswordEncrypter;
import it.rt.corso.utility.Utility;

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
	public String Login(@ModelAttribute Utente utente, Model m) throws NoSuchAlgorithmException {
		// creo la sessionFactory che rimarrà aperta fino a fine sessione
		Utility.buildSessionFactory();
		
		String encryptedPassword = PasswordEncrypter.encryptPassword(utente.getPassword());
		Utente u = udao.getByUsernamePassword(utente.getUsername(), encryptedPassword);
		
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
		Utility.destroySessionFactory();
		return "redirect:/Login";
	}

}
