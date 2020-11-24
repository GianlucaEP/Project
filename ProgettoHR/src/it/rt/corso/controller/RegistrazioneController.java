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

	/**
	 * Show the Home page with all the Candidato filtered by the given business unit.
	 * 
	 * @param model object to save all model attributes.
	 * @param businessUnit business unit String obtained from the URL.
	 * @param utente session attribute of type utente, if it's not null you are logged in session. 
	 * 
	 * @return JSP URL
	 * */
	@RequestMapping("/Registrati/{businessUnit}")
	public String display(Model m, @SessionAttribute("utente") Utente utente, @PathVariable String businessUnit) {

		List<Ruolo> ruoliList = rdao.getLista();

		m.addAttribute("businessUnit", businessUnit);
		m.addAttribute("nuovoUtente", new Utente());
		m.addAttribute("ruoli", ruoliList);
		return "PaginaRegistrazione";

	}

	/**
	 * Add a new User with the selected {@link Ruolo Ruolo} assigned to itself.
	 * 
	 * @param model object to save all model attributes.
	 * @param businessUnit business unit String obtained from the URL.
	 * @param loggedUser session attribute of type utente, if it's not null you are logged in session.
	 * @param ruoloSelezionato selected {@link Ruolo Ruolo} to be assegned to the new user
	 * @param utente the new Utente that will be added in database.
	 * */
	@RequestMapping(value = "/RegistratiIn/{businessUnit}", method = RequestMethod.POST)
	public String registrazione(@ModelAttribute("utente") Utente utente, Model m,
			@SessionAttribute("utente") Utente loggedUser, @RequestParam("ruoloSelezionato") String ruoloSelezionato,
			@PathVariable String businessUnit) throws NoSuchAlgorithmException  {

		m.addAttribute("businessUnit", businessUnit);

		Utente u = udao.getByUsername(utente.getUsername());

		if (u != null) {

			m.addAttribute("info", "error");
			return "redirect:/Registrati/{businessUnit}";
		}

		String password = utente.getPassword();

		password = PasswordEncrypter.encryptPassword(password);

		utente.setPassword(password);

		utente.setRuolo(rdao.getRuolo(Integer.parseInt(ruoloSelezionato)));

		udao.inserisci(utente);
		
		m.addAttribute("info", "success");
		return "redirect:/Registrati/{businessUnit}";

	}

}
