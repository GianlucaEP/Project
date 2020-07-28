package it.rt.corso.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import it.rt.corso.DAO.CandidatoDAO;
import it.rt.corso.beans.Candidato;

@Controller
public class CandidatiController {

	ApplicationContext factory = new ClassPathXmlApplicationContext("bean.xml");

	CandidatoDAO dao = (CandidatoDAO) factory.getBean("candidatoDAO");
	
	@InitBinder
	public final void initBinderUsuariosFormValidator(final WebDataBinder binder, final Locale locale) {
	    final SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd", locale);  
	    binder.registerCustomEditor(Date.class, "inserimentoAzienda", new CustomDateEditor(dateFormat, true));
	}

	
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
