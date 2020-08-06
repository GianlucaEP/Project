package it.rt.corso.controller;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import it.rt.corso.DAO.BusinessDAO;
import it.rt.corso.DAO.CandidatoDAO;
import it.rt.corso.beans.Bean;
import it.rt.corso.beans.Business;
import it.rt.corso.beans.Candidato;

// ------------------------------------------------------------------------
// @RequestMapping("/Home")
// rappresenta l'url da scrivere dopo localhost:8080/ProgettoHR, in quanto,
// grazie al pattern MVC,
// non può essere chiamata la jsp direttamente, ma bisogna passare dal
// controller, il quale, semplicemente
// richiama la jsp che vogliamo ottenere
// ------------------------------------------------------------------------
// Model m permette di aggiungere attributi e passarli alla jsp
// -------------------------------------------------------------------------
// @PathVariable grazie a questa annotation, prendo il valore
// passato nell URL, dalla jsp (nella fattispecie <a
// href="/ProgettoHR/Home/Telco">), e, definendolo nell @RequestMapping
// ("/Home/{businessUnit}")
// verrà richiamato nel metodo con la stessa nomenclatura (businessUnit)
// --------------------------------------------------------------------
// return "Home" rappresenta il nome della jsp che questo metodo andrà ad aprire


@Controller
public class HomeController {
	ApplicationContext factory = new ClassPathXmlApplicationContext("bean.xml");

	CandidatoDAO cdao = (CandidatoDAO) factory.getBean("candidatoDAO");
//	BusinessDAO bdao = (BusinessDAO) factory.getBean("businessDAO");
	
	@RequestMapping("/Home/{businessUnit}")
	public String display(Model m, @PathVariable String businessUnit) {

		//Business business= bdao.get(businessUnit);
		List<Candidato> list = cdao.getListaByBusinessUnit(businessUnit); 
		m.addAttribute("list", list);
		return "Home";
	}

}
