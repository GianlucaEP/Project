package it.rt.corso.controller;

import java.security.NoSuchAlgorithmException;
import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import it.rt.corso.DAO.RuoloDAO;
import it.rt.corso.DAO.UtenteDAO;
import it.rt.corso.beans.Ruolo;
import it.rt.corso.beans.Utente;
import it.rt.corso.filter.PasswordEncrypter;

@Controller
public class RegistrazioneController {

	private ApplicationContext factory = new ClassPathXmlApplicationContext("bean.xml");
	private UtenteDAO udao = (UtenteDAO) factory.getBean("utenteDAO");
	private RuoloDAO rdao = (RuoloDAO) factory.getBean("ruoloDAO");

	@RequestMapping("/Registrati/{businessUnit}")
	public String display(Model m, @SessionAttribute("utente") Utente utente, @PathVariable String businessUnit) {

		List<Ruolo> ruoliList = rdao.getLista();

		m.addAttribute("businessUnit", businessUnit);
		m.addAttribute("nuovoUtente", new Utente());
		m.addAttribute("ruoli", ruoliList);
		return "PaginaRegistrazione";

	}

	@RequestMapping(value = "/RegistratiIn/{businessUnit}", method = RequestMethod.POST)
	public String registrazione(@ModelAttribute("utente") Utente utente, Model m,
			@SessionAttribute("utente") Utente loggedUser, @RequestParam("ruoloSelezionato") String ruoloSelezionato,
			@PathVariable String businessUnit) throws NoSuchAlgorithmException {

		m.addAttribute("businessUnit", businessUnit);
		
		String password = utente.getPassword();

		password = PasswordEncrypter.encryptPassword(password);

		utente.setPassword(password);

		utente.setRuolo(rdao.getRuolo(Integer.parseInt(ruoloSelezionato)));

		udao.inserisci(utente);
		return "redirect:/Registrati/{businessUnit}";

	}

}
