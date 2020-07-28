package it.rt.corso.controller;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import it.rt.corso.DAO.CandidatoDAO;
import it.rt.corso.beans.Candidato;

@Controller
public class CandidatiController {

	ApplicationContext factory = new ClassPathXmlApplicationContext("bean.xml");

	CandidatoDAO dao = (CandidatoDAO) factory.getBean("candidatoDAO");

	
	@RequestMapping("/Candidati")
	public String formAggiungiCandidato(Model m) {
		m.addAttribute("candidato", new Candidato());
		return "InserimentoCandidati";
	}

	@RequestMapping(value = "/CandidatiSave", method = RequestMethod.POST)
	public String aggiungiCandidato(@ModelAttribute("candidato") Candidato candidato) {
		dao.inserisci(candidato);
		return "redirect:/Home";// will redirect to viewemp request mapping
	}

	
	
}
