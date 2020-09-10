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
import it.rt.corso.singleton.Singleton;

@Controller
public class AreaCompetenzaController {
	ApplicationContext factory = new ClassPathXmlApplicationContext("bean.xml");

	AreaCompetenzaDAO dao = (AreaCompetenzaDAO) factory.getBean("areaCompetenzaDAO");

	//aggiungo un'area di competenza dalla Home
	@RequestMapping(value = "/AreaCompetenzaSaveDaHome/{businessUnit}", method = RequestMethod.POST)
	public String aggiungiAreaCompetenzaHome(@ModelAttribute("areaCompetenza") AreaCompetenza areaCompetenza,
			@PathVariable String businessUnit) {
		
		aggiungiAreaCompetenza(areaCompetenza);
		
		return "redirect:/Home/{businessUnit}";
	}
	

	//aggiungo un'area di competenza dalla pagina di inserimento candidato
	@RequestMapping(value = "/AreaCompetenzaSaveDaInserimentoCandidato/{businessUnit}", method = RequestMethod.POST)
	public String aggiungiAreaCompetenzaInserimentoCandidato(
			@ModelAttribute("areaCompetenza") AreaCompetenza areaCompetenza, @PathVariable String businessUnit) {
		
		aggiungiAreaCompetenza(areaCompetenza);
		
		return "redirect:/Candidati/{businessUnit}";
	}
	

	public void aggiungiAreaCompetenza(AreaCompetenza areaCompetenza) {
		dao.inserisci(areaCompetenza);

		// aggiorno la lista di area
		Singleton singleton = Singleton.getInstance();
		singleton.aggiornaAreaCompetenza();
	}

}
