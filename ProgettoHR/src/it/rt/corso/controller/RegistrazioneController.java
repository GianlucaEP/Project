package it.rt.corso.controller;

import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import it.rt.corso.DAO.UtenteDAO;

import it.rt.corso.beans.Utente;
import it.rt.corso.filter.PasswordEncrypter;

@Controller
public class RegistrazioneController {

	ApplicationContext factory = new ClassPathXmlApplicationContext("bean.xml");
	UtenteDAO udao = (UtenteDAO) factory.getBean("utenteDAO");

	@RequestMapping("/Registrati")
	public String display(Model m) {

		m.addAttribute(new Utente());
		return "PaginaRegistrazione";

	}

	@RequestMapping(value = "/RegistratiIn", method = RequestMethod.POST)
	public String registrazione(@ModelAttribute("utente") Utente utente, Model m)
			throws NoSuchAlgorithmException, InvalidKeySpecException{

		String password = utente.getPassword();
		
		PasswordEncrypter.encryptPassword(password);
		
		utente.setPassword(password);

		udao.inserisci(utente);
		return "redirect:/Home";

	}

}
