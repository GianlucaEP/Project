package it.rt.corso.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import it.rt.corso.DAO.CandidatoDAO;
import it.rt.corso.beans.Candidato;
import it.rt.corso.beans.Utente;
import it.rt.corso.utility.CreateGanttExcel;

@Controller
public class GanttController {

	private ApplicationContext factory = new ClassPathXmlApplicationContext("bean.xml");

	private CandidatoDAO cdao = (CandidatoDAO) factory.getBean("candidatoDAO");

	/**
	 * 
	 * Show the Gantt creation page.
	 * 
	 * @param model object to save all model attributes.
	 * @param businessUnit business unit String obtained from the URL.
	 * @param utente session attribute of type utente, if it's not null you are logged in session. 
	 * 
	 * @return JSP URL
	 * */
	@RequestMapping("/Gantt/{businessUnit}")
	public String display(Model m, @PathVariable String businessUnit, @SessionAttribute("utente") Utente utente) {

		List<Candidato> list = cdao.getListaFilteredByStato("Attivo");
		String data = "";

		m.addAttribute("list", list);
		m.addAttribute("data", data);
		m.addAttribute("businessUnit", businessUnit);

		return "Gantt";
	}

	/**
	 * 
	 * Controller for creation and downloading of Excel files containing a Gantt chart.
	 * 
	 * @param model object to save all model attributes.
	 * @param businessUnit business unit String obtained from the URL.
	 * @param utente session attribute of type utente, if it's not null you are logged in session. 
	 * 
	 * @return null in order to not make the page to reload itself
	 * */
	@RequestMapping("/ExcelGantt/{businessUnit}")
	public String getExcel(Model m, @PathVariable String businessUnit, @SessionAttribute("utente") Utente utente,@RequestParam List<String> data,
			@RequestParam List<String> costi,@RequestParam String days,HttpServletRequest request, HttpServletResponse response) {
	
        CreateGanttExcel.downloadExcel(request, response, data, costi, days);

		return null;
	}

	

}
