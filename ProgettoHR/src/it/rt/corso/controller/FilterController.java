package it.rt.corso.controller;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import it.rt.corso.DAO.AreaCompetenzaDAO;
import it.rt.corso.DAO.BusinessDAO;
import it.rt.corso.DAO.CandidatoDAO;
import it.rt.corso.DAO.MansioneDAO;
import it.rt.corso.DAO.SeniorityDAO;
import it.rt.corso.DAO.SpecializzazioneDAO;
import it.rt.corso.beans.AreaCompetenza;
import it.rt.corso.beans.Business;
import it.rt.corso.beans.Candidato;
import it.rt.corso.beans.Mansione;
import it.rt.corso.beans.Seniority;
import it.rt.corso.beans.Specializzazione;
import it.rt.corso.beans.Utente;
import it.rt.corso.singleton.Singleton;

@Controller
public class FilterController {

	ApplicationContext factory = new ClassPathXmlApplicationContext("bean.xml");

	CandidatoDAO cdao = (CandidatoDAO) factory.getBean("candidatoDAO");

	@RequestMapping("/Filter/{businessUnit}")
	public String display(Model m, @PathVariable String businessUnit, @SessionAttribute("utente") Utente utente) {
		
		Singleton singleton = Singleton.getInstance();

		// Business business= bdao.get(businessUnit);
		
		List<Candidato> list = cdao.getListaByBusinessUnit(businessUnit);
		

		m.addAttribute("businessList", singleton.getBusinessList());
		m.addAttribute("ruolo", utente.getRuolo().getRuolo());
		m.addAttribute("list", list);
		m.addAttribute("businessUnit", businessUnit);
		m.addAttribute("seniorityList", singleton.getSeniorityList());

		m.addAttribute("mansione", new Mansione());
		m.addAttribute("mansioneList", singleton.getMansioneListString());
		m.addAttribute("specializzazioneList", singleton.getSpecializzazioneListString());
		m.addAttribute("areaCompetenzaList", singleton.getAreaCompetenzaListString());
		
		
		return "FiltroAvanzato";
	}

	@RequestMapping(value = "/Filter/advanced/{businessUnit}", method = RequestMethod.POST)
	public String homeFilter(Model m, @PathVariable String businessUnit, @SessionAttribute("utente") Utente utente,
			@RequestParam Map<String, String> requestParams) throws ParseException {

//		@RequestParam("cognome") String cognome, @RequestParam("nome") String nome) NEL CASO IN CUI NON SI USA MAPPA
		
		Singleton singleton = Singleton.getInstance();

		List<Candidato> list = cdao.getListaByBusinessUnitFiltered(requestParams);

		m.addAttribute("businessList", singleton.getBusinessList());
		m.addAttribute("ruolo", utente.getRuolo().getRuolo());
		m.addAttribute("list", list);
		m.addAttribute("businessUnit", businessUnit);
		m.addAttribute("seniorityList", singleton.getSeniorityList());

		m.addAttribute("mansione", new Mansione());
		m.addAttribute("mansioneList", singleton.getMansioneListString());
		m.addAttribute("specializzazioneList", singleton.getSpecializzazioneListString());
		m.addAttribute("areaCompetenzaList", singleton.getAreaCompetenzaListString());
		

		return "FiltroAvanzato";
	}
}
