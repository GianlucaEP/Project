package it.rt.corso.controller;

import java.util.ArrayList;
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
import it.rt.corso.DAO.MansioneDAO;
import it.rt.corso.beans.Candidato;
import it.rt.corso.beans.Mansione;
import it.rt.corso.beans.Utente;

@Controller
public class FilterController {
	
	ApplicationContext factory = new ClassPathXmlApplicationContext("bean.xml");

	CandidatoDAO cdao = (CandidatoDAO) factory.getBean("candidatoDAO");
	MansioneDAO mansioneDAO = (MansioneDAO) factory.getBean("mansioneDAO");
	
	@RequestMapping("/Filter/{businessUnit}")
	public String display(Model m, @PathVariable String businessUnit, @SessionAttribute("utente") Utente utente) {

		// Business business= bdao.get(businessUnit);
		List<Candidato> list = cdao.getListaByBusinessUnit(businessUnit);
		List<Mansione> mansioneList = mansioneDAO.getLista();
		
		List<String> mansioneListString= new ArrayList<String>();
		
		for (Mansione mansione : mansioneList) {
			
			mansioneListString.add(mansione.getMansione());
		}
		
//		String[] stringArray= new String[mansioneListString.size()];
//		
//		stringArray= mansioneListString.toArray(stringArray);
		
		HashMap<String, String> hashMap = new HashMap<String, String>();

		m.addAttribute("ruolo", utente.getRuolo().getRuolo());
		m.addAttribute("list", list);
		m.addAttribute("businessUnit", businessUnit);
		m.addAttribute("mansione", new Mansione());
		m.addAttribute("mansioneList", mansioneListString);
//		m.addAttribute("cognome", "");
//		m.addAttribute("filterMap", hashMap); //da togliere
		return "FiltroAvanzato";
	}

	@RequestMapping(value = "/Filter/advanced/{businessUnit}", method = RequestMethod.POST)
	public String homeFilter(Model m, @PathVariable String businessUnit, @SessionAttribute("utente") Utente utente,
			@RequestParam Map<String, String> requestParams) {
		
//		@RequestParam("cognome") String cognome, @RequestParam("nome") String nome) NEL CASO IN CUI NON SI USA MAPPA

		List<Candidato> list = cdao.getListaByBusinessUnitFiltered(businessUnit, requestParams);
		
		List<Mansione> mansioneList = mansioneDAO.getLista();
		
	
		
		m.addAttribute("ruolo", utente.getRuolo().getRuolo());
		m.addAttribute("list", list);
		m.addAttribute("businessUnit", businessUnit);
		m.addAttribute("mansione", new Mansione());
		m.addAttribute("mansioneList", mansioneList);

		return "FiltroAvanzato";
	}
}
