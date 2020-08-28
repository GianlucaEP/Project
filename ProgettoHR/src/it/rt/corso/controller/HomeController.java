package it.rt.corso.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import it.rt.corso.DAO.BusinessDAO;
import it.rt.corso.DAO.CandidatoDAO;
import it.rt.corso.DAO.MansioneDAO;
import it.rt.corso.DAO.StatoCandidatoDAO;
import it.rt.corso.beans.Bean;
import it.rt.corso.beans.Business;
import it.rt.corso.beans.Candidato;
import it.rt.corso.beans.Mansione;
import it.rt.corso.beans.StatoCandidato;
import it.rt.corso.beans.Utente;

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
	ApplicationContext factory = new ClassPathXmlApplicationContext("bean.xml");

	CandidatoDAO cdao = (CandidatoDAO) factory.getBean("candidatoDAO");
	MansioneDAO mansioneDAO = (MansioneDAO) factory.getBean("mansioneDAO");
	StatoCandidatoDAO statoCandidatoDAO = (StatoCandidatoDAO) factory.getBean("statoCandidatoDAO");
//	BusinessDAO bdao = (BusinessDAO) factory.getBean("businessDAO");

	@RequestMapping("/Home/{businessUnit}")
	public String display(Model m, @PathVariable String businessUnit, @SessionAttribute("utente") Utente utente) {

		// Business business= bdao.get(businessUnit);
		List<Candidato> list = cdao.getListaByBusinessUnit(businessUnit);
		List<Mansione> mansioneList = mansioneDAO.getLista();
		List<StatoCandidato> statoCandidatoList = statoCandidatoDAO.getAllFromStato();
		
		HashMap<String, String> hashMap = new HashMap<String, String>();

		m.addAttribute("ruolo", utente.getRuolo().getRuolo());
		m.addAttribute("list", list);
		m.addAttribute("businessUnit", businessUnit);
		m.addAttribute("mansione", new Mansione());
		m.addAttribute("mansioneList", mansioneList);
		m.addAttribute("statoCandidatoList", statoCandidatoList);
		m.addAttribute("filterMap", hashMap); //da togliere
		return "Home";
	}

	@RequestMapping(value = "/Home/filter/{businessUnit}", method = RequestMethod.POST)
	public String homeFilter(Model m, @PathVariable String businessUnit, @SessionAttribute("utente") Utente utente,
			@RequestParam Map<String, String> requestParams) {
		
//		@RequestParam("cognome") String cognome, @RequestParam("nome") String nome) NEL CASO IN CUI NON SI USA MAPPA

//		List<Candidato> list = cdao.getListaByBusinessUnitFiltered(businessUnit, requestParams);
		
		List<Candidato> list = cdao.getListaByBusinessUnitFilteredByStato(businessUnit, requestParams.get("stato"));
		
		List<Mansione> mansioneList = mansioneDAO.getLista();
		List<StatoCandidato> statoCandidatoList = statoCandidatoDAO.getAllFromStato();
		
	
		m.addAttribute("mansioneList", mansioneList);
		m.addAttribute("ruolo", utente.getRuolo().getRuolo());
		m.addAttribute("list", list);
		m.addAttribute("statoCandidatoList", statoCandidatoList);
		m.addAttribute("businessUnit", businessUnit);
		m.addAttribute("mansione", new Mansione());

		return "Home";
	}

}
