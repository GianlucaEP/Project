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

import it.rt.corso.DAO.MansioneDAO;
import it.rt.corso.beans.Mansione;
import it.rt.corso.beans.Utente;
import it.rt.corso.singleton.Singleton;

@Controller
public class MansioneController {

	private ApplicationContext factory = new ClassPathXmlApplicationContext("bean.xml");

	private MansioneDAO dao = (MansioneDAO) factory.getBean("mansioneDAO");

	/**
	 * 
	 * Show the Mansione page with all the Mansione object selected from database.
	 * 
	 * @param model object to save all model attributes.
	 * @param businessUnit business unit String obtained from the URL.
	 * @param utente session attribute of type utente, if it's not null you are logged in session. 
	 * 
	 * @return JSP URL
	 * */
	@RequestMapping(value = "/Mansione/{businessUnit}")
	public String displayMansione(Model m, @PathVariable String businessUnit,
			@SessionAttribute("utente") Utente utente) {

		Singleton singleton = Singleton.getInstance();

		m.addAttribute("mansioneList", singleton.getMansioneList());
		m.addAttribute("mansione", new Mansione());

		return "/Mansione";
	}

	/**
	 * 
	 * Add a new Mansione from the Home page
	 * 
	 * @param mansione the {@link Mansione Mansione} object that will be added in database.
	 * @param businessUnit business unit String obtained from the URL.
	 * 
	 * @return JSP URL
	 * */
	@RequestMapping(value = "/MansioniSaveDaHome/{businessUnit}", method = RequestMethod.POST)
	public String aggiungiMansioneHome(@ModelAttribute("mansione") Mansione mansione,
			@PathVariable String businessUnit) {
		aggiungiMansione(mansione);
		return "redirect:/Home/{businessUnit}";
	}

	/**
	 * 
	 * Add a new Mansione from the Mansione page
	 * 
	 * @param mansione the {@link Mansione Mansione} object that will be added in database.
	 * @param businessUnit business unit String obtained from the URL.
	 * 
	 * @return JSP URL
	 * */
	@RequestMapping(value = "/MansioniSaveDaMansione/{businessUnit}", method = RequestMethod.POST)
	public String aggiungiMansioneDaMansioneList(@ModelAttribute("mansione") Mansione mansione,
			@PathVariable String businessUnit) {
		aggiungiMansione(mansione);
		return "redirect:/Mansione/{businessUnit}";
	}

	/**
	 * 
	 * Add a new Mansione from the Candidati page
	 * 
	 * @param mansione the {@link Mansione Mansione} object that will be added in database.
	 * @param businessUnit business unit String obtained from the URL.
	 * 
	 * @return JSP URL
	 * */
	@RequestMapping(value = "/MansioniSaveDaInserimentoCandidato/{businessUnit}", method = RequestMethod.POST)
	public String aggiungiMansioneInserimentoCandidato(@ModelAttribute("mansione") Mansione mansione,
			@PathVariable String businessUnit) {
		aggiungiMansione(mansione);
		return "redirect:/Candidati/{businessUnit}";
	}

	/**
	 * 
	 * Add a new Mansione from the Candidato page
	 * 
	 * @param mansione the {@link Mansione Mansione} object that will be added in database.
	 * @param businessUnit business unit String obtained from the URL.
	 * 
	 * @return JSP URL
	 * */
	@RequestMapping(value = "/MansioniSaveInCandidato/{id}", method = RequestMethod.POST)
	public String aggiungiMansioneCandidato(@ModelAttribute("mansione") Mansione mansione, @PathVariable int id) {
		aggiungiMansione(mansione);
		return "redirect:/Candidato/{id}";
	}

	/**
	 * 
	 * Uses DAO methods to add a new Mansione
	 * 
	 * @param mansione the {@link Mansione Mansione} object that will bused in the DAO methods.
	 * 
	 * */
	public void aggiungiMansione(Mansione mansione) {
		dao.inserisci(mansione);

		// aggiorno la lista di mansione
		Singleton singleton = Singleton.getInstance();
		singleton.aggiornaMansione();
	}

	/**
	 * 
	 * Delete the Mansione from database selected by the mansione name contained in the given mansione String. 
	 * 
	 * @param mansione the String that will be used to search the Mansione in database.
	 * @param businessUnit business unit String obtained from the URL.
	 * 
	 * @return JSP URL
	 * */
	@RequestMapping(value = "/EliminaMansione/{businessUnit}", method = RequestMethod.POST)
	public String elimina(@RequestParam("eliminaMansione") String mansione, @PathVariable String businessUnit) {

		Mansione m = dao.get(mansione);

		dao.cancella(m);

		Singleton singleton = Singleton.getInstance();
		singleton.aggiornaMansione();

		return "redirect:/Mansione/{businessUnit}";
	}

	/**
	 * 
	 * Update the Mansione from database selected by the mansione name contained in the given mansione String. 
	 * 
	 * @param mansione old mansione value that will be updated.
	 * @param newMansione new mansione value that will be used to execute the update.
	 * @param businessUnit business unit String obtained from the URL.
	 * 
	 * @return JSP URL
	 * */
	@RequestMapping(value = "/AggiornaMansione/{businessUnit}", method = RequestMethod.POST)
	public String aggiorna(@RequestParam("oldMansione") String mansione,
			@RequestParam("newMansione") String newMansione, @PathVariable String businessUnit) {

		dao.update(mansione, newMansione);

		Singleton singleton = Singleton.getInstance();
		singleton.aggiornaMansione();

		return "redirect:/Mansione/{businessUnit}";
	}
}
