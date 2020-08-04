package it.rt.corso.controller;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import it.rt.corso.DAO.CandidatoDAO;
import it.rt.corso.beans.Bean;
import it.rt.corso.beans.Candidato;

@Controller
public class HomeController {

	ApplicationContext factory = new ClassPathXmlApplicationContext("bean.xml");

	CandidatoDAO dao = (CandidatoDAO) factory.getBean("candidatoDAO");

	 //@RequestMapping("/Home")
	//rappresenta l'url da scrivere dopo localhost:8080/ProgettoHR, in quanto, grazie al pattern MVC,
	//non può essere chiamata la jsp direttamente, ma bisogna passare dal controller, il quale, semplicemente
	// richiama la jsp che vogliamo ottenere
	
	@RequestMapping("/Home")
	public String display(Model m) {    // Model m permette di aggiungere attributi della sessiose 
		List<Candidato> list = dao.getLista();
		m.addAttribute("list", list);
		return "Home"; 		//rappresenta il nome della jsp che questo metodo andrà ad aprire
	}

	
}
