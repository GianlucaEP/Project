package it.rt.corso.controller;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import it.rt.corso.DAO.SpecializzazioneDAO;
import it.rt.corso.beans.Specializzazione;

@Controller
public class SpecializzazioneController {
	ApplicationContext factory = new ClassPathXmlApplicationContext("bean.xml");
	SpecializzazioneDAO dao = (SpecializzazioneDAO) factory.getBean("specializzazioneDAO");

	@RequestMapping(value = "/SpecializzazioneSave/{businessUnit}", method = RequestMethod.POST)
	public String aggiungiSpecializzazioneHome(@ModelAttribute("specializzazione") Specializzazione specializzazione,
			@PathVariable String businessUnit) {
		dao.inserisci(specializzazione);
		return "redirect:/Home/{businessUnit}";
	}

}
