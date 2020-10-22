package it.rt.corso.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
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
import it.rt.corso.utility.CreateGanttExcel;

@Controller
public class GanttController {

	private ApplicationContext factory = new ClassPathXmlApplicationContext("bean.xml");

	private CandidatoDAO cdao = (CandidatoDAO) factory.getBean("candidatoDAO");

	@RequestMapping("/Gantt/{businessUnit}")
	public String display(Model m, @PathVariable String businessUnit, @SessionAttribute("utente") Utente utente) {

		List<Candidato> list = cdao.getLista();

		m.addAttribute("list", list);
		m.addAttribute("businessUnit", businessUnit);

		return "Gantt";
	}

	@RequestMapping("/ExcelGantt/{businessUnit}")
	public String getExcel(Model m, @PathVariable String businessUnit, @SessionAttribute("utente") Utente utente,
			HttpServletRequest request, HttpServletResponse response) throws IOException {
	
        CreateGanttExcel.downloadExcel(request, response);

		return null;
	}

	

}
