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

	@RequestMapping(value = "/AreaCompetenza/{businessUnit}")
	public String displayAreaCompetenza(Model m, @PathVariable String businessUnit,
			@SessionAttribute("utente") Utente utente) {
		Singleton singleton = Singleton.getInstance();

		m.addAttribute("areaCompetenzaList", singleton.getAreaCompetenzaList());

		return "/AreaCompetenza";
	}

	// aggiungo un'area di competenza dalla Home
	@RequestMapping(value = "/AreaCompetenzaSaveDaHome/{businessUnit}", method = RequestMethod.POST)
	public String aggiungiAreaCompetenzaHome(@ModelAttribute("areaCompetenza") AreaCompetenza areaCompetenza,
			@PathVariable String businessUnit) {

		aggiungiAreaCompetenza(areaCompetenza);

		return "redirect:/Home/{businessUnit}";
	}

	// aggiungo un'area di competenza dalla pagina di inserimento candidato
	@RequestMapping(value = "/AreaCompetenzaSaveDaInserimentoCandidato/{businessUnit}", method = RequestMethod.POST)
	public String aggiungiAreaCompetenzaInserimentoCandidato(
			@ModelAttribute("areaCompetenza") AreaCompetenza areaCompetenza, @PathVariable String businessUnit) {

		aggiungiAreaCompetenza(areaCompetenza);

		return "redirect:/Candidati/{businessUnit}";
	}

	public void aggiungiAreaCompetenza(AreaCompetenza areaCompetenza) {
		dao.inserisci(areaCompetenza);

		// aggiorno la lista di area
		Singleton singleton = Singleton.getInstance();
		singleton.aggiornaAreaCompetenza();
	}

	@RequestMapping(value = "/EliminaArea/{businessUnit}", method = RequestMethod.POST)
	public String elimina(@RequestParam("area") String area, @PathVariable String businessUnit) {

		AreaCompetenza ac = dao.get(area);
		dao.cancella(ac);

		Singleton singleton = Singleton.getInstance();
		singleton.aggiornaAreaCompetenza();

		return "redirect:/AreaCompetenza/{businessUnit}";

	}
	
	@RequestMapping(value = "/AggiornaArea/{businessUnit}", method = RequestMethod.POST)
	public String aggiorna(@RequestParam("oldArea") String oldArea,@RequestParam("newArea") String newArea, @PathVariable String businessUnit) {

		dao.updade(oldArea, newArea);

		Singleton singleton = Singleton.getInstance();
		singleton.aggiornaAreaCompetenza();

		return "redirect:/AreaCompetenza/{businessUnit}";

	}
	
	

}
