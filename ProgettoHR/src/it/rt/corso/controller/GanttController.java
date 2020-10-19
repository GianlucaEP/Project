package it.rt.corso.controller;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import it.rt.corso.DAO.CandidatoDAO;
import it.rt.corso.beans.Candidato;
import it.rt.corso.beans.Utente;

@Controller
public class GanttController {
	
	private ApplicationContext factory = new ClassPathXmlApplicationContext("bean.xml");

	private CandidatoDAO cdao = (CandidatoDAO) factory.getBean("candidatoDAO");
	
	@RequestMapping("/Gantt/{businessUnit}")
	public String display(Model m,@PathVariable String businessUnit, @SessionAttribute("utente") Utente utente) {
		
		List<Candidato> list = cdao.getListaByBusinessUnit(businessUnit);


		m.addAttribute("list", list);
		m.addAttribute("businessUnit", businessUnit);
		
		return "Gantt";
	}

}
