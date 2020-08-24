package it.rt.corso.controller;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import it.rt.corso.DAO.MansioneDAO;
import it.rt.corso.beans.Mansione;

@Controller
public class MansioneController {
	
	ApplicationContext factory = new ClassPathXmlApplicationContext("bean.xml");

	MansioneDAO dao = (MansioneDAO) factory.getBean("mansioneDAO");
	
	@RequestMapping(value = "/MansioniSave/{businessUnit}", method = RequestMethod.POST)
	public String aggiungiCandidato(@ModelAttribute("mansione") Mansione mansione, @PathVariable String businessUnit) {
		dao.inserisci(mansione); 
		return "redirect:/Home/{businessUnit}";
	}
}
