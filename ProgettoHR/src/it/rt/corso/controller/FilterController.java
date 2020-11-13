package it.rt.corso.controller;

import java.text.ParseException;
import java.util.HashMap;
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

import it.rt.corso.DAO.CandidatoDAO;
import it.rt.corso.beans.Candidato;
import it.rt.corso.beans.Mansione;
import it.rt.corso.beans.Utente;
import it.rt.corso.singleton.Singleton;

@Controller
public class FilterController {

	private ApplicationContext factory = new ClassPathXmlApplicationContext("bean.xml");

	private CandidatoDAO cdao = (CandidatoDAO) factory.getBean("candidatoDAO");

	@RequestMapping("/Filter/{businessUnit}")
	public String display(Model m, @PathVariable String businessUnit, @SessionAttribute("utente") Utente utente) {
		
		Singleton singleton = Singleton.getInstance();

		// Business business= bdao.get(businessUnit);
		
		List<Candidato> list = cdao.getListaByBusinessUnit(businessUnit);
		Map<String, String> filterLsit = new HashMap<String, String>();
		

		m.addAttribute("businessList", singleton.getBusinessList());
		m.addAttribute("ruolo", utente.getRuolo().getRuolo());
		m.addAttribute("list", list);
		m.addAttribute("businessUnit", businessUnit);
		m.addAttribute("seniorityList", singleton.getSeniorityList());
		m.addAttribute("filterLsit", filterLsit);
		m.addAttribute("mansione", new Mansione());
		m.addAttribute("mansioneList", singleton.getMansioneListString());
		m.addAttribute("specializzazioneList", singleton.getSpecializzazioneListString());
		m.addAttribute("areaCompetenzaList", singleton.getAreaCompetenzaListString());
		m.addAttribute("lingueList", singleton.getCompetenzaLinguisticaListString());
		
		return "FiltroAvanzato";
	}

	@RequestMapping(value = "/Filter/advanced/{businessUnit}", method = RequestMethod.POST)
	public String homeFilter(Model m, @PathVariable String businessUnit, @SessionAttribute("utente") Utente utente,
			@RequestParam Map<String, String> filterLsit) throws ParseException {
		
		Singleton singleton = Singleton.getInstance();

		List<Candidato> list = cdao.getListaByBusinessUnitFiltered(filterLsit);

		m.addAttribute("businessList", singleton.getBusinessList());
		m.addAttribute("ruolo", utente.getRuolo().getRuolo());
		m.addAttribute("list", list);
		m.addAttribute("businessUnit", businessUnit);
		m.addAttribute("seniorityList", singleton.getSeniorityList());
		m.addAttribute("filterList", filterLsit);
		m.addAttribute("mansione", new Mansione());
		m.addAttribute("mansioneList", singleton.getMansioneListString());
		m.addAttribute("specializzazioneList", singleton.getSpecializzazioneListString());
		m.addAttribute("areaCompetenzaList", singleton.getAreaCompetenzaListString());
		m.addAttribute("lingueList", singleton.getCompetenzaLinguisticaListString());

		return "FiltroAvanzato";
	}
}
