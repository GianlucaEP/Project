package it.rt.corso.controller;

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

	/**
	 * Show FiltroAvanzato JSP containing the Candidato filtered by the given business unit.
	 * 
	 * @param model object to save all model attributes.
	 * @param businessUnit business unit String obtained from the URL.
	 * @param utente session attribute of type utente, if it's not null you are logged in session. 
	 * 
	 * @return JSP URL
	 * */
	@RequestMapping("/Filter/{businessUnit}")
	public String display(Model model, @PathVariable String businessUnit, @SessionAttribute("utente") Utente utente) {
		
		Singleton singleton = Singleton.getInstance();

		// Business business= bdao.get(businessUnit);
		
		List<Candidato> list = cdao.getListaByBusinessUnit(businessUnit);
		Map<String, String> filterLsit = new HashMap<String, String>();
		

		model.addAttribute("businessList", singleton.getBusinessList());
		model.addAttribute("ruolo", utente.getRuolo().getRuolo());
		model.addAttribute("list", list);
		model.addAttribute("businessUnit", businessUnit);
		model.addAttribute("seniorityList", singleton.getSeniorityList());
		model.addAttribute("filterLsit", filterLsit);
		model.addAttribute("mansione", new Mansione());
		model.addAttribute("mansioneList", singleton.getMansioneListString());
		model.addAttribute("specializzazioneList", singleton.getSpecializzazioneListString());
		model.addAttribute("areaCompetenzaList", singleton.getAreaCompetenzaListString());
		model.addAttribute("lingueList", singleton.getCompetenzaLinguisticaListString());
		model.addAttribute("titoloStudioList", singleton.getTitoloStudioListString());
		
		return "FiltroAvanzato";
	}

	/**
	 * Show FiltroAvanzato JSP containing the Candidato filtered by the seelcted filters contained in filterList.
	 * 
	 * @param model object to save all model attributes.
	 * @param businessUnit business unit String obtained from the URL.
	 * @param utente session attribute of type utente, if it's not null you are logged in session. 
	 * @param filterMap <code>Map</code> containing all the filters that have been selected.
	 * 
	 * @return JSP URL
	 * */
	@RequestMapping(value = "/Filter/advanced/{businessUnit}", method = RequestMethod.POST)
	public String homeFilter(Model m, @PathVariable String businessUnit, @SessionAttribute("utente") Utente utente,
			@RequestParam Map<String, String> filterMap){
		
		Singleton singleton = Singleton.getInstance();

		List<Candidato> list = cdao.getListaByBusinessUnitFiltered(filterMap);
		
		if (filterMap.containsKey("costoMin") || filterMap.containsKey("costoMax")) {
			filterMap.remove("costoMin");
			filterMap.remove("costoMax");
			filterMap.put("costo", "");
		}
		
		if (filterMap.containsKey("dataInserimentoFrom") || filterMap.containsKey("dataInserimentoTo")) {
			filterMap.remove("dataInserimentoFrom");
			filterMap.remove("dataInserimentoTo");
			filterMap.put("dataInserimento", "");
		}

		m.addAttribute("businessList", singleton.getBusinessList());
		m.addAttribute("ruolo", utente.getRuolo().getRuolo());
		m.addAttribute("list", list);
		m.addAttribute("businessUnit", businessUnit);
		m.addAttribute("seniorityList", singleton.getSeniorityList());
		m.addAttribute("filterList", filterMap);
		m.addAttribute("mansione", new Mansione());
		m.addAttribute("mansioneList", singleton.getMansioneListString());
		m.addAttribute("specializzazioneList", singleton.getSpecializzazioneListString());
		m.addAttribute("areaCompetenzaList", singleton.getAreaCompetenzaListString());
		m.addAttribute("lingueList", singleton.getCompetenzaLinguisticaListString());
		m.addAttribute("titoloStudioList", singleton.getTitoloStudioListString());
		
		return "FiltroAvanzato";
	}
}
