package it.rt.corso.controller;

import java.io.IOException;
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

	@RequestMapping("/Gantt/{businessUnit}")
	public String display(Model m, @PathVariable String businessUnit, @SessionAttribute("utente") Utente utente) {

		List<Candidato> list = cdao.getLista();
		String data = "";

		m.addAttribute("list", list);
		m.addAttribute("data", data);
		m.addAttribute("businessUnit", businessUnit);

		return "Gantt";
	}

	/**
	 * 
	 * Controller for Excel creation and download of them.
	 * 
	 * */
	@RequestMapping("/ExcelGantt/{businessUnit}")
	public String getExcel(Model m, @PathVariable String businessUnit, @SessionAttribute("utente") Utente utente,@RequestParam String data,
			HttpServletRequest request, HttpServletResponse response) throws IOException {
	
        CreateGanttExcel.downloadExcel(request, response);

		return null;
	}

	

}
