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

import it.rt.corso.DAO.BusinessDAO;
import it.rt.corso.beans.Business;
import it.rt.corso.beans.Utente;
import it.rt.corso.singleton.Singleton;

@Controller
public class BusinessController {
	
	private ApplicationContext factory = new ClassPathXmlApplicationContext("bean.xml");
	
	private BusinessDAO dao = (BusinessDAO) factory.getBean("businessDAO");
	
	@RequestMapping(value = "/Business/{businessUnit}")
	public String displayBusiness(Model m, @PathVariable String businessUnit,
			@SessionAttribute("utente") Utente utente) {
		
		Singleton singleton = Singleton.getInstance();
		
		m.addAttribute("businessList", singleton.getBusinessList());
		m.addAttribute("business", new Business());
		
		return "/Business";
	}
	
	@RequestMapping(value="/BusinessSaveDaHome/{businessUnit}", method = RequestMethod.POST)
	public String aggiungiBusinessHome(@ModelAttribute("business") Business business,
			@PathVariable String businessUnit) {
		aggiungiBusiness(business);
		return "redirect:/Home/{businessUnit}";
		
	}
	
	@RequestMapping(value = "/BusinessSaveDaBusiness/{businessUnit}", method = RequestMethod.POST)
	public String aggiungiBusinessDaBusinessList (@ModelAttribute("business") Business business,
			@PathVariable String businessUnit) {
		aggiungiBusiness(business);
		return "redirect:/Business/{businessUnit}";
	}
	
	@RequestMapping(value = "/BusinessSaveDaInserimentoCandidato/{businessUnit}", method = RequestMethod.POST)
	public String aggiungiBusinessInserimentoCandidato(@ModelAttribute("business") Business business,
			@PathVariable String businessUnit) {
		aggiungiBusiness(business);
		return "redirect:/Candidati/{businessUnit}";
	}
	
	@RequestMapping(value = "/BusinessSaveInCandidato/{id}", method = RequestMethod.POST)
	public String aggiungiBusinessCandidato(@ModelAttribute("business") Business business, @PathVariable int id) {
		aggiungiBusiness(business);
		return "redirect:/Candidato/{id}";
	}

	public void aggiungiBusiness(Business business) {
		dao.inserisci(business);
		
		//aggiorno la lista di business
		Singleton singleton = Singleton.getInstance();
		singleton.aggiornaBusiness();
		
	}
	
	@RequestMapping(value = "/EliminaBusiness/{businessUnit}", method = RequestMethod.POST)
	public String elimina(@RequestParam("eliminaBusiness") String business, @PathVariable String businessUnit) {

		Business b = dao.get(business);

		dao.cancella(b);

		Singleton singleton = Singleton.getInstance();
		singleton.aggiornaBusiness();

		return "redirect:/Business/{businessUnit}";
	}
	
	@RequestMapping(value = "/AggiornaBusiness/{businessUnit}", method = RequestMethod.POST)
	public String aggiorna(@RequestParam("oldBusiness") String business,
			@RequestParam("newBusiness") String newBusiness, @PathVariable String businessUnit) {

		dao.update(business, newBusiness);

		Singleton singleton = Singleton.getInstance();
		singleton.aggiornaBusiness();

		return "redirect:/Business/{businessUnit}";
	}
}
