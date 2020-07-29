package it.rt.corso.controller;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import it.rt.corso.DAO.CandidatoDAO;
import it.rt.corso.beans.Candidato;

@Controller
public class HomeController {

	ApplicationContext factory = new ClassPathXmlApplicationContext("bean.xml");

	CandidatoDAO dao = (CandidatoDAO) factory.getBean("candidatoDAO");

	@RequestMapping("/Home")
	public String display(Model m) {
		List<Candidato> list = dao.getLista();
		m.addAttribute("list", list);
		return "Home";
	}

	
}
