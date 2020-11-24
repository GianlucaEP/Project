package it.rt.corso.controller;

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

import it.rt.corso.DAO.SpecializzazioneDAO;
import it.rt.corso.beans.Specializzazione;
import it.rt.corso.beans.Utente;
import it.rt.corso.singleton.Singleton;

@Controller
public class SpecializzazioneController {
	private ApplicationContext factory = new ClassPathXmlApplicationContext("bean.xml");
	private SpecializzazioneDAO dao = (SpecializzazioneDAO) factory.getBean("specializzazioneDAO");

	/**
	 * 
	 * Show the Specializzazione page with all the Specializzazione.
	 * 
	 * @param model        object to save all model attributes.
	 * @param businessUnit business unit String obtained from the URL.
	 * @param utente       session attribute of type utente, if it's not null you
	 *                     are logged in session.
	 * 
	 * @return JSP URL
	 */
	@RequestMapping(value = "/Specializzazione/{businessUnit}")
	public String displaySpecializzazione(Model m, @PathVariable String businessUnit,
			@SessionAttribute("utente") Utente utente) {

		Singleton singleton = Singleton.getInstance();

		m.addAttribute("specializzazioneList", singleton.getSpecializzazioneList());
		m.addAttribute("specializzazione", new Specializzazione());

		return "/Specializzazione";

	}

	/**
	 * 
	 * Add a new Specializzazione from the Home page
	 * 
	 * @param mansione     the {@link Specializzazione Specializzazione} object that
	 *                     will be added in database.
	 * @param businessUnit business unit String obtained from the URL.
	 * 
	 * @return JSP URL
	 */
	@RequestMapping(value = "/SpecializzazioneSaveDaHome/{businessUnit}", method = RequestMethod.POST)
	public String aggiungiSpecializzazioneHome(@ModelAttribute("specializzazione") Specializzazione specializzazione,
			@PathVariable String businessUnit) {
		aggiungiSpecializzazione(specializzazione);
		return "redirect:/Home/{businessUnit}";
	}

	/**
	 * 
	 * Add a new Specializzazione from the Specializzazione page
	 * 
	 * @param mansione     the {@link Specializzazione Specializzazione} object that
	 *                     will be added in database.
	 * @param businessUnit business unit String obtained from the URL.
	 * 
	 * @return JSP URL
	 */
	@RequestMapping(value = "/SpecializzazioneSaveDaSpecializzazione/{businessUnit}", method = RequestMethod.POST)
	public String aggiungiSpecializzazioneList(@ModelAttribute("specializzazione") Specializzazione specializzazione,
			@PathVariable String businessUnit) {
		aggiungiSpecializzazione(specializzazione);
		return "redirect:/Specializzazione/{businessUnit}";
	}

	/**
	 * 
	 * Add a new Specializzazione from the Candidati page
	 * 
	 * @param mansione     the {@link Specializzazione Specializzazione} object that
	 *                     will be added in database.
	 * @param businessUnit business unit String obtained from the URL.
	 * 
	 * @return JSP URL
	 */
	@RequestMapping(value = "/SpecializzazioneSaveDaInserimentoCandidato/{businessUnit}", method = RequestMethod.POST)
	public String aggiungiSpecializzazioneInserimentoCandidato(
			@ModelAttribute("specializzazione") Specializzazione specializzazione, @PathVariable String businessUnit) {
		aggiungiSpecializzazione(specializzazione);
		return "redirect:/Candidati/{businessUnit}";
	}

	/**
	 * 
	 * Uses DAO methods to add a new Mansione
	 * 
	 * @param mansione the {@link Specializzazione Specializzazione} object that will bused in the DAO methods.
	 * 
	 * */
	public void aggiungiSpecializzazione(Specializzazione specializzazione) {
		dao.inserisci(specializzazione);

		// aggiorno la lista di specializzazione
		Singleton singleton = Singleton.getInstance();
		singleton.aggiornaSpecializzazione();
	}

	/**
	 * 
	 * Delete the Specializzazione from database selected by the specializzazione name contained in the given specializzazione String. 
	 * 
	 * @param specializzazione the String that will be used to search the Mansione in database.
	 * @param businessUnit business unit String obtained from the URL.
	 * 
	 * @return JSP URL
	 * */
	@RequestMapping(value = "/EliminaSpecializzazione/{businessUnit}", method = RequestMethod.POST)
	public String elimina(@RequestParam("eliminaSpecializzazione") String specializzazione,
			@PathVariable String businessUnit) {

		Specializzazione spec = dao.get(specializzazione);

		dao.cancella(spec);

		Singleton singleton = Singleton.getInstance();
		singleton.aggiornaSpecializzazione();

		return "redirect:/Specializzazione/{businessUnit}";
	}

	/**
	 * 
	 * Update the Specializzazione from database selected by the specializzazione name contained in the given specializzazione String. 
	 * 
	 * @param oldSpecializzazione the String that contains the specializzazione that will be updated.
	 * @param newSpecializzazione the String that will be used to update the old specializzazione value.
	 * @param businessUnit business unit String obtained from the URL.
	 * 
	 * @return JSP URL
	 * */
	@RequestMapping(value = "/AggiornaSpecializzazione/{businessUnit}", method = RequestMethod.POST)
	public String aggiorna(@RequestParam("oldSpecializzazione") String oldSpecializzazione,
			@RequestParam("newSpecializzazione") String newSpecializzazione, @PathVariable String businessUnit) {

		dao.updade(oldSpecializzazione, newSpecializzazione);

		Singleton singleton = Singleton.getInstance();
		singleton.aggiornaSpecializzazione();

		return "redirect:/Specializzazione/{businessUnit}";
	}
}
