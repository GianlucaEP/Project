package it.rt.corso.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import it.rt.corso.DAO.CandidatoDAO;
import it.rt.corso.beans.AreaCompetenza;
import it.rt.corso.beans.Candidato;
import it.rt.corso.beans.Funzionalita;
import it.rt.corso.beans.Mansione;
import it.rt.corso.beans.Specializzazione;
import it.rt.corso.beans.Utente;
import it.rt.corso.singleton.Singleton;

// ------------------------------------------------------------------------
// @RequestMapping("/Home")
// rappresenta l'url da scrivere dopo localhost:8080/ProgettoHR, in quanto,
// grazie al pattern MVC,
// non può essere chiamata la jsp direttamente, ma bisogna passare dal
// controller, il quale, semplicemente
// richiama la jsp che vogliamo ottenere
// ------------------------------------------------------------------------
// Model m permette di aggiungere attributi e passarli alla jsp
// -------------------------------------------------------------------------
// @PathVariable grazie a questa annotation, prendo il valore
// passato nell URL, dalla jsp (nella fattispecie <a
// href="/ProgettoHR/Home/Telco">), e, definendolo nell @RequestMapping
// ("/Home/{businessUnit}")
// verrà richiamato nel metodo con la stessa nomenclatura (businessUnit)
// --------------------------------------------------------------------
// return "Home" rappresenta il nome della jsp che questo metodo andrà ad aprire

@Controller
public class HomeController {
	private ApplicationContext factory = new ClassPathXmlApplicationContext("bean.xml");

	private CandidatoDAO cdao = (CandidatoDAO) factory.getBean("candidatoDAO");

	/**
	 * 
	 * Show the Home page with all the Candidato filtered by the given business unit.
	 * 
	 * @param model object to save all model attributes.
	 * @param businessUnit business unit String obtained from the URL.
	 * @param utente session attribute of type utente, if it's not null you are logged in session. 
	 * 
	 * @return JSP URL
	 * */
	@RequestMapping("/Home/{businessUnit}")
	public String display(Model m, @PathVariable String businessUnit, @SessionAttribute("utente") Utente utente) {

		Singleton singleton = Singleton.getInstance();

		// Business business= bdao.get(businessUnit);
		List<Candidato> list = cdao.getListaByBusinessUnit(businessUnit);

		if (utente.getUsername() == null) {
			return "redirect:/Login";
		}

		List<String> listaFunzionalita = utente.getRuolo().getFunzionalita().stream().map(Funzionalita::getFunzionalita)
				.collect(Collectors.toList());
		
		m.addAttribute("list", list);
		m.addAttribute("businessUnit", businessUnit);
		m.addAttribute("businessList", singleton.getBusinessList());
		m.addAttribute("mansione", new Mansione());
		m.addAttribute("areaCompetenza", new AreaCompetenza());
		m.addAttribute("specializzazione", new Specializzazione());
		m.addAttribute("mansioneList", singleton.getMansioneListString());
		m.addAttribute("areaList", singleton.getAreaCompetenzaListString());
		m.addAttribute("specializzazioneList", singleton.getSpecializzazioneListString());
		m.addAttribute("statoCandidatoList", singleton.getStatoCandidatoList());
		m.addAttribute("funzionalita", listaFunzionalita);
		
		return "Home";
	}

	/**
	 * 
	 * Show the Home page with all the Candidato filtered by the selected stato and business unit; if no stato is selected show all the Candidato for the given business unit.
	 * 
	 * @param model object to save all model attributes.
	 * @param businessUnit business unit String obtained from the URL.
	 * @param utente session attribute of type utente, if it's not null you are logged in session. 
	 * 
	 * @return JSP URL
	 * */
	@RequestMapping(value = "/Home/filter/{businessUnit}", method = RequestMethod.GET)
	public String homeFilter(Model m, @PathVariable String businessUnit, @SessionAttribute("utente") Utente utente,
			@RequestParam Map<String, String> requestParams) {

		Singleton singleton = Singleton.getInstance();

		List<Candidato> list = new ArrayList<>();
		if (requestParams.get("statoSelezionato").equals("noFiltro")) {//no stato selected
			list = cdao.getListaByBusinessUnit(businessUnit);
		} else {
			list = cdao.getListaByBusinessUnitFilteredByStato(businessUnit, requestParams.get("statoSelezionato"));
		}
		
		List<String> listaFunzionalita = utente.getRuolo().getFunzionalita().stream().map(Funzionalita::getFunzionalita)
				.collect(Collectors.toList());

		m.addAttribute("mansioneList", singleton.getMansioneList());
		m.addAttribute("list", list);
		m.addAttribute("statoCandidatoList", singleton.getStatoCandidatoList());
		m.addAttribute("businessList", singleton.getBusinessList());
		m.addAttribute("businessUnit", businessUnit);
		m.addAttribute("areaCompetenza", new AreaCompetenza());
		m.addAttribute("specializzazione", new Specializzazione());
		m.addAttribute("mansione", new Mansione());
		m.addAttribute("statoSelezionato", requestParams.get("statoSelezionato"));
		m.addAttribute("funzionalita", listaFunzionalita);

		return "Home";
	}


}
