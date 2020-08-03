package it.rt.corso.controller;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import it.rt.corso.DAO.UtenteDAO;
import it.rt.corso.DAOImpl.UtenteDAOImpl;
import it.rt.corso.beans.Candidato;
import it.rt.corso.beans.Utente;



@Controller
public class LoginEffettuatoController {
	
	ApplicationContext factory = new ClassPathXmlApplicationContext("bean.xml");
	UtenteDAO udao= (UtenteDAO) factory.getBean("utenteDAO");
	
	@RequestMapping(value = "/LoginTest/{user}/{password}", method = RequestMethod.POST)
	public String LoginTest(Model m, @PathVariable String user,  @PathVariable String password) {
		
		
		Utente utente= udao.getByUsernamePassword(user, password);
		
		if (utente!=null) {
			
			m.addAttribute(utente);
		return "Home";
		}
		m.addAttribute("info", "error");
		return"Login";
	}
}
