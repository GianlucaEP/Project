package it.rt.corso.controller;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import it.rt.corso.DAO.QualificationMeetingDAO;
import it.rt.corso.beans.QualificationMeeting;

@Controller
public class QualificationMeetingController {

	ApplicationContext factory = new ClassPathXmlApplicationContext("bean.xml");

	QualificationMeetingDAO quafilicationMeetingDAO = (QualificationMeetingDAO) factory.getBean("qualificationMeetingDAO");

	@RequestMapping("/QualificationMeetingForm")
	public String formAggiungiQualificationMeeting(Model m) {
		QualificationMeeting qm = new QualificationMeeting();
		m.addAttribute("qualificationMeeting", qm);
		return "QualificationMeetingForm";

	}

	@RequestMapping(value = "/AggiungiQualificationMeeting", method = RequestMethod.POST)
	public String aggiungiQualificationMeeting(@ModelAttribute("qualificationMeeting") QualificationMeeting qualificationMeeting) {
		quafilicationMeetingDAO.inserisci(qualificationMeeting);
		return "redirect:/Candidato";

	}
}
