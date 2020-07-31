package it.rt.corso.controller;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import it.rt.corso.DAO.CandidatoDAO;
import it.rt.corso.DAO.QualificationMeetingDAO;
import it.rt.corso.beans.Candidato;
import it.rt.corso.beans.Feedback;
import it.rt.corso.beans.QualificationMeeting;
import it.rt.corso.beans.TipoFeedback;

@Controller
public class QualificationMeetingController {

	ApplicationContext factory = new ClassPathXmlApplicationContext("bean.xml");

	QualificationMeetingDAO quafilicationMeetingDAO = (QualificationMeetingDAO) factory
			.getBean("qualificationMeetingDAO");
	CandidatoDAO dao = (CandidatoDAO) factory.getBean("candidatoDAO");

	@RequestMapping("/QualificationMeetingForm")
	public String formAggiungiQualificationMeeting(Model m) {
		m.addAttribute("qualificationMeeting", new QualificationMeeting());
		return "QualificationMeetingForm";

	}

	@RequestMapping(value = "/AggiungiQualificationMeeting/{id}", method = RequestMethod.POST)
	public String aggiungiFeedback(@ModelAttribute("qualificationMeeting") QualificationMeeting qualificationMeeting,
			@PathVariable int id) {
		quafilicationMeetingDAO.inserisci(qualificationMeeting);
		Candidato c = dao.get(id);
		c.addQualificationMeeting(qualificationMeeting);
		return "redirect:/Candidato/{id}";

	}
}
