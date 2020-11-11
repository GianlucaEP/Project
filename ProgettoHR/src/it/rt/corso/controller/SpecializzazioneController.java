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
	
	@RequestMapping(value = "/Specializzazione/{businessUnit}")
	public String displaySpecializzazione(Model m, @PathVariable String businessUnit,
			@SessionAttribute("utente") Utente utente) {

		Singleton singleton = Singleton.getInstance();

		m.addAttribute("specializzazioneList", singleton.getSpecializzazioneList());
		m.addAttribute("specializzazione", new Specializzazione());
		
		return "/Specializzazione";
		
	}

	//aggiungo una specializzazione dalla Home
	@RequestMapping(value = "/SpecializzazioneSaveDaHome/{businessUnit}", method = RequestMethod.POST)
	public String aggiungiSpecializzazioneHome(@ModelAttribute("specializzazione") Specializzazione specializzazione,
			@PathVariable String businessUnit) {
		aggiungiSpecializzazione(specializzazione);
		return "redirect:/Home/{businessUnit}";
	}
	
	//aggiungo una specializzazione da Specializzazione
		@RequestMapping(value = "/SpecializzazioneSaveDaSpecializzazione/{businessUnit}", method = RequestMethod.POST)
		public String aggiungiSpecializzazioneList(@ModelAttribute("specializzazione") Specializzazione specializzazione,
				@PathVariable String businessUnit) {
			aggiungiSpecializzazione(specializzazione);
			return "redirect:/Specializzazione/{businessUnit}";
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

	@RequestMapping(value = "/EliminaSpecializzazione/{businessUnit}", method = RequestMethod.POST)
	public String elimina(@RequestParam("eliminaSpecializzazione") String specializzazione, @PathVariable String businessUnit) {
		
		Specializzazione spec = dao.get(specializzazione);
		
		dao.cancella(spec);
		
		Singleton singleton = Singleton.getInstance();
		singleton.aggiornaSpecializzazione();
		
		return "redirect:/Specializzazione/{businessUnit}";
	}
	
	@RequestMapping(value = "/AggiornaSpecializzazione/{businessUnit}", method = RequestMethod.POST)
	public String aggiorna(@RequestParam("oldSpecializzazione") String oldSpecializzazione,@RequestParam("newSpecializzazione") String newSpecializzazione, @PathVariable String businessUnit) {
		
		dao.updade(oldSpecializzazione, newSpecializzazione);

		Singleton singleton = Singleton.getInstance();
		singleton.aggiornaSpecializzazione();
		
		return "redirect:/Specializzazione/{businessUnit}";
	}
}
