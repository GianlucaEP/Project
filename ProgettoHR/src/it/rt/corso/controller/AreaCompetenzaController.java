package it.rt.corso.controller;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import it.rt.corso.DAO.AreaCompetenzaDAO;
import it.rt.corso.beans.AreaCompetenza;
import it.rt.corso.beans.Mansione;

@Controller
public class AreaCompetenzaController {
	ApplicationContext factory = new ClassPathXmlApplicationContext("bean.xml");

	AreaCompetenzaDAO dao = (AreaCompetenzaDAO) factory.getBean("areaCompetenzaDAO");
	
	@RequestMapping(value = "/AreaCompetenzaSave/{businessUnit}", method = RequestMethod.POST)
	public String aggiungiAreaCompetenzaHome(@ModelAttribute("areaCompetenza") AreaCompetenza areaCompetenza, @PathVariable String businessUnit) {
		dao.inserisci(areaCompetenza); 
		return "redirect:/Home/{businessUnit}";
	}
	

}
