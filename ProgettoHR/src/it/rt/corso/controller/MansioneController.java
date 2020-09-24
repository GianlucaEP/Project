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

	@RequestMapping(value = "/Mansione/{businessUnit}")
	public String displayMansione(Model m, @PathVariable String businessUnit,
			@SessionAttribute("utente") Utente utente) {

		Singleton singleton = Singleton.getInstance();

		m.addAttribute("mansioneList", singleton.getMansioneList());
		return "/Mansione";
	}

	// aggiungo una mansione dalla Home
	@RequestMapping(value = "/MansioniSaveDaHome/{businessUnit}", method = RequestMethod.POST)
	public String aggiungiMansioneHome(@ModelAttribute("mansione") Mansione mansione,
			@PathVariable String businessUnit) {
		aggiungiMansione(mansione);
		return "redirect:/Home/{businessUnit}";
	}

	// aggiungo una mansione dalla pagina di inserimento candidato
	@RequestMapping(value = "/MansioniSaveDaInserimentoCandidato/{businessUnit}", method = RequestMethod.POST)
	public String aggiungiMansioneInserimentoCandidato(@ModelAttribute("mansione") Mansione mansione,
			@PathVariable String businessUnit) {
		aggiungiMansione(mansione);
		return "redirect:/Candidati/{businessUnit}";
	}

	// aggiungo una mansione dalla pagina del candidato
	@RequestMapping(value = "/MansioniSaveInCandidato/{id}", method = RequestMethod.POST)
	public String aggiungiMansioneCandidato(@ModelAttribute("mansione") Mansione mansione, @PathVariable int id) {
		aggiungiMansione(mansione);
		return "redirect:/Candidato/{id}";
	}

	public void aggiungiMansione(Mansione mansione) {
		dao.inserisci(mansione);

		// aggiorno la lista di mansione
		Singleton singleton = Singleton.getInstance();
		singleton.aggiornaMansione();
	}
	
	@RequestMapping(value = "/EliminaMansione/{businessUnit}", method = RequestMethod.POST)
	public String elimina(@RequestParam("mansione") String mansione, @PathVariable String businessUnit) {
		
		Mansione m = dao.get(mansione);
		
		dao.cancella(m);
		
		Singleton singleton = Singleton.getInstance();
		singleton.aggiornaMansione();
		
		return "redirect:/Mansione/{businessUnit}";
	}
	
	@RequestMapping(value = "/AggiornaMansione/{businessUnit}", method = RequestMethod.POST)
	public String aggiorna(@RequestParam("oldMansione") String mansione,@RequestParam("newMansione") String newMansione, @PathVariable String businessUnit) {
		
		dao.updade(mansione, newMansione);

		Singleton singleton = Singleton.getInstance();
		singleton.aggiornaMansione();
		
		return "redirect:/Mansione/{businessUnit}";
	}
}
