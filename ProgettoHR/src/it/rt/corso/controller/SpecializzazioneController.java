package it.rt.corso.controller;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;

import it.rt.corso.DAO.SpecializzazioneDAO;
import it.rt.corso.beans.Specializzazione;
import it.rt.corso.beans.Utente;
import it.rt.corso.singleton.Singleton;

@Controller
public class SpecializzazioneController {
	ApplicationContext factory = new ClassPathXmlApplicationContext("bean.xml");
	SpecializzazioneDAO dao = (SpecializzazioneDAO) factory.getBean("specializzazioneDAO");
	
	@RequestMapping(value = "/Specializzazione/{businessUnit}")
	public String displaySpecializzazione(Model m, @PathVariable String businessUnit,
			@SessionAttribute("utente") Utente utente) {

		Singleton singleton = Singleton.getInstance();

		m.addAttribute("specializzazioneList", singleton.getSpecializzazioneList());
		
		return "/Specializzazione";
		
	}

	//aggiungo una specializzazione dalla Home
	@RequestMapping(value = "/SpecializzazioneSaveDaHome/{businessUnit}", method = RequestMethod.POST)
	public String aggiungiSpecializzazioneHome(@ModelAttribute("specializzazione") Specializzazione specializzazione,
			@PathVariable String businessUnit) {
		aggiungiSpecializzazione(specializzazione);
		return "redirect:/Home/{businessUnit}";
	}
	
	//aggiungo una specializzazione dalla pagina di inserimento candidato
	@RequestMapping(value = "/SpecializzazioneSaveDaInserimentoCandidato/{businessUnit}", method = RequestMethod.POST)
	public String aggiungiSpecializzazioneInserimentoCandidato(@ModelAttribute("specializzazione") Specializzazione specializzazione,
			@PathVariable String businessUnit) {
		aggiungiSpecializzazione(specializzazione);
		return "redirect:/Candidati/{businessUnit}";
	}
	
	public void aggiungiSpecializzazione(Specializzazione specializzazione) {
		dao.inserisci(specializzazione);

		// aggiorno la lista di specializzazione
		Singleton singleton = Singleton.getInstance();
		singleton.aggiornaSpecializzazione();
	}

}
