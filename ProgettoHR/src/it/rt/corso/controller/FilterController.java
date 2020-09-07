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

@Controller
public class FilterController {

	ApplicationContext factory = new ClassPathXmlApplicationContext("bean.xml");

	CandidatoDAO cdao = (CandidatoDAO) factory.getBean("candidatoDAO");
	MansioneDAO mansioneDAO = (MansioneDAO) factory.getBean("mansioneDAO");
	SpecializzazioneDAO specializzazioneDAO = (SpecializzazioneDAO) factory.getBean("specializzazioneDAO");
	AreaCompetenzaDAO areaCompetenzaDAO = (AreaCompetenzaDAO) factory.getBean("areaCompetenzaDAO");
	BusinessDAO businessDAO = (BusinessDAO) factory.getBean("businessDAO");
	SeniorityDAO seniorityDAO = (SeniorityDAO) factory.getBean("seniorityDAO");

	@RequestMapping("/Filter/{businessUnit}")
	public String display(Model m, @PathVariable String businessUnit, @SessionAttribute("utente") Utente utente) {

		// Business business= bdao.get(businessUnit);
		List<Business> businessList = businessDAO.getLista();
		List<Candidato> list = cdao.getListaByBusinessUnit(businessUnit);
		List<Mansione> mansioneList = mansioneDAO.getLista();
		List<Specializzazione> specializzazioneList = specializzazioneDAO.getLista();
		List<AreaCompetenza> areaCompetenzaList = areaCompetenzaDAO.getLista();
		List<Seniority> seniorityList = seniorityDAO.getLista();

		
		List<String> mansioneListString = new ArrayList<String>();
		List<String> specializzazioneListString = new ArrayList<String>();
		List<String> areaCompetenzaListString = new ArrayList<String>();

		for (Mansione mansione : mansioneList) {

			mansioneListString.add(mansione.getMansione());
		}
		
		for (Specializzazione specializzazione : specializzazioneList) {

			specializzazioneListString.add(specializzazione.getSpecializzazione());
		}
		
		for (AreaCompetenza areaCompetenza : areaCompetenzaList) {

			areaCompetenzaListString.add(areaCompetenza.getArea());
		}

		m.addAttribute("businessList", businessList);
		m.addAttribute("ruolo", utente.getRuolo().getRuolo());
		m.addAttribute("list", list);
		m.addAttribute("businessUnit", businessUnit);
		m.addAttribute("seniorityList", seniorityList);

		m.addAttribute("mansione", new Mansione());
		m.addAttribute("mansioneList", mansioneListString);
		m.addAttribute("specializzazioneList", specializzazioneListString);
		m.addAttribute("areaCompetenzaList", areaCompetenzaListString);
		
		
		return "FiltroAvanzato";
	}

	@RequestMapping(value = "/Filter/advanced/{businessUnit}", method = RequestMethod.POST)
	public String homeFilter(Model m, @PathVariable String businessUnit, @SessionAttribute("utente") Utente utente,
			@RequestParam Map<String, String> requestParams) throws ParseException {

//		@RequestParam("cognome") String cognome, @RequestParam("nome") String nome) NEL CASO IN CUI NON SI USA MAPPA

		List<Candidato> list = cdao.getListaByBusinessUnitFiltered(requestParams);
		
		List<Mansione> mansioneList = mansioneDAO.getLista();
		List<Business> businessList = businessDAO.getLista();		
		List<Specializzazione> specializzazioneList = specializzazioneDAO.getLista();
		List<AreaCompetenza> areaCompetenzaList = areaCompetenzaDAO.getLista();
		List<Seniority> seniorityList = seniorityDAO.getLista();

		
		List<String> mansioneListString = new ArrayList<String>();
		List<String> specializzazioneListString = new ArrayList<String>();
		List<String> areaCompetenzaListString = new ArrayList<String>();

		for (Mansione mansione : mansioneList) {

			mansioneListString.add(mansione.getMansione());
		}
		
		for (Specializzazione specializzazione : specializzazioneList) {

			specializzazioneListString.add(specializzazione.getSpecializzazione());
		}
		
		for (AreaCompetenza areaCompetenza : areaCompetenzaList) {

			areaCompetenzaListString.add(areaCompetenza.getArea());
		}

		m.addAttribute("businessList", businessList);
		m.addAttribute("ruolo", utente.getRuolo().getRuolo());
		m.addAttribute("list", list);
		m.addAttribute("businessUnit", businessUnit);
		m.addAttribute("seniorityList", seniorityList);

		m.addAttribute("mansione", new Mansione());
		m.addAttribute("mansioneList", mansioneListString);
		m.addAttribute("specializzazioneList", specializzazioneListString);
		m.addAttribute("areaCompetenzaList", areaCompetenzaListString);
		
		
	
		return "FiltroAvanzato";
	}
}
