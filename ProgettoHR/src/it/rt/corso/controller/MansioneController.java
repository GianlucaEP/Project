package it.rt.corso.controller;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import it.rt.corso.DAO.MansioneDAO;
import it.rt.corso.beans.Mansione;

@Controller
public class MansioneController {
	
	ApplicationContext factory = new ClassPathXmlApplicationContext("bean.xml");

	MansioneDAO dao = (MansioneDAO) factory.getBean("mansioneDAO");
	
	@RequestMapping("/Mansioni")
	public String formAggiungiMansione(Model m) {
		m.addAttribute("mansione", new Mansione());
		return "InserimentoMansione";
	}
	
	@RequestMapping(value = "/MansioniSave", method = RequestMethod.POST)
	public String aggiungiCandidato(@ModelAttribute("candidato") Mansione mansione) {
		dao.inserisci(mansione); 
		return "redirect:/Mansioni";
	}
}
