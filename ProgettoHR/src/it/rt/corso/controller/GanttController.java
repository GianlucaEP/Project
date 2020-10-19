package it.rt.corso.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import it.rt.corso.beans.Utente;

@Controller
public class GanttController {
	
	@RequestMapping("/Gantt/{businessUnit}")
	public String display(Model m,@PathVariable String businessUnit, @SessionAttribute("utente") Utente utente) {
		
		m.addAttribute("businessUnit", businessUnit);
		
		return "Gantt";
	}

}
