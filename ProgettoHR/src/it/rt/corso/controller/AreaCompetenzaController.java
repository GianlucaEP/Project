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

import it.rt.corso.DAO.AreaCompetenzaDAO;
import it.rt.corso.beans.AreaCompetenza;
import it.rt.corso.beans.Utente;
import it.rt.corso.singleton.Singleton;

@Controller
public class AreaCompetenzaController {
	
	private ApplicationContext factory = new ClassPathXmlApplicationContext("bean.xml");

	private AreaCompetenzaDAO dao = (AreaCompetenzaDAO) factory.getBean("areaCompetenzaDAO");

	/**
	 * Shows the JSP showing the {@link AreaCompetenza AreaCompetenza} list extracted from database.
	 * 
	 * @param m instantiate a {@link Model Model} object to create a model attribute.
	 * @param businessUnit business unit String obtained from the URL.
	 * @param utente session attribute of type utente, if it's not null you are logged in session. 
	 * 
	 * @return JSP URL
	 * */
	@RequestMapping(value = "/AreaCompetenza/{businessUnit}")
	public String displayAreaCompetenza(Model m, @PathVariable String businessUnit,
			@SessionAttribute("utente") Utente utente) {
		
		Singleton singleton = Singleton.getInstance();

		m.addAttribute("areaCompetenzaList", singleton.getAreaCompetenzaList());
		m.addAttribute("areaCompetenza", new AreaCompetenza());

		return "/AreaCompetenza";
	}

	/**
	 * Save a new {@link AreaCompetenza AreaCompetenza} object in database when added from the Home page.
	 * 
	 * @param areaCompetenza {@link AreaCompetenza AreaCompetenza} present in the request.
	 * @param businessUnit business unit String obtained from the URL.
	 * 
	 * @return JSP URL
	 * */
	@RequestMapping(value = "/AreaCompetenzaSaveDaHome/{businessUnit}", method = RequestMethod.POST)
	public String aggiungiAreaCompetenzaHome(@ModelAttribute("areaCompetenza") AreaCompetenza areaCompetenza,
			@PathVariable String businessUnit) {

		aggiungiAreaCompetenza(areaCompetenza);

		return "redirect:/Home/{businessUnit}";
	}

	/**
	 * Save a new {@link AreaCompetenza AreaCompetenza} object in database when added from the AreaCompetenza page.
	 * 
	 * @param areaCompetenza {@link AreaCompetenza AreaCompetenza} present in the request.
	 * @param businessUnit business unit String obtained from the URL.
	 * 
	 * @return JSP URL
	 * */
	@RequestMapping(value = "/AreaCompetenzaSaveDaAreaCompetenza/{businessUnit}", method = RequestMethod.POST)
	public String aggiungiAreaCompetenzaList(@ModelAttribute("areaCompetenza") AreaCompetenza areaCompetenza,
			@PathVariable String businessUnit) {

		aggiungiAreaCompetenza(areaCompetenza);

		return "redirect:/AreaCompetenza/{businessUnit}";
	}

	/**
	 * Save a new {@link AreaCompetenza AreaCompetenza} object in database when added from the Candidati page.
	 * 
	 * @param areaCompetenza {@link AreaCompetenza AreaCompetenza} present in the request.
	 * @param businessUnit business unit String obtained from the URL.
	 * 
	 * @return JSP URL
	 * */
	@RequestMapping(value = "/AreaCompetenzaSaveDaInserimentoCandidato/{businessUnit}", method = RequestMethod.POST)
	public String aggiungiAreaCompetenzaInserimentoCandidato(
			@ModelAttribute("areaCompetenza") AreaCompetenza areaCompetenza, @PathVariable String businessUnit) {

		aggiungiAreaCompetenza(areaCompetenza);

		return "redirect:/Candidati/{businessUnit}";
	}

	/**
	 * Add an AreaCompetenza object in database using DAO methods.
	 * 
	 *  @param areaCompetenza {@link AreaCompetenza AreaCompetenza} Object to be added in area_competenza table.
	 *  
	 *  @return JSP URL
	 * */
	public void aggiungiAreaCompetenza(AreaCompetenza areaCompetenza) {
		dao.inserisci(areaCompetenza);

		// aggiorno la lista di area
		Singleton singleton = Singleton.getInstance();
		singleton.aggiornaAreaCompetenza();
	}

	/**
	 * Delete an {@link AreaCompetenza AreaCompetenza} object in database when deleted from the AreaCompetenza page.
	 * 
	 * @param areaCompetenza {@link AreaCompetenza AreaCompetenza} present in the request.
	 * @param businessUnit business unit String obtained from the URL.
	 * 
	 * @return JSP URL
	 * */
	@RequestMapping(value = "/EliminaArea/{businessUnit}", method = RequestMethod.POST)
	public String elimina(@RequestParam("eliminaArea") String areaCompetenza, @PathVariable String businessUnit) {

		AreaCompetenza ac = dao.get(areaCompetenza);
		dao.cancella(ac);

		Singleton singleton = Singleton.getInstance();
		singleton.aggiornaAreaCompetenza();

		return "redirect:/AreaCompetenza/{businessUnit}";

	}

	/**
	 * Update an {@link AreaCompetenza AreaCompetenza} object in database when updated from the AreaCompetenza page.
	 * 
	 * @param oldArea {@link AreaCompetenza AreaCompetenza} present in the request containing the old value that will be updated.
	 * @param newArea {@link AreaCompetenza AreaCompetenza} present in the request containing the new value with which the old value will be updated.
	 * @param businessUnit business unit String obtained from the URL.
	 * 
	 * @return JSP URL
	 * */
	@RequestMapping(value = "/AggiornaArea/{businessUnit}", method = RequestMethod.POST)
	public String aggiorna(@RequestParam("oldArea") String oldArea, @RequestParam("newArea") String newArea,
			@PathVariable String businessUnit) {

		dao.update(oldArea, newArea);

		Singleton singleton = Singleton.getInstance();
		singleton.aggiornaAreaCompetenza();

		return "redirect:/AreaCompetenza/{businessUnit}";

	}

}
