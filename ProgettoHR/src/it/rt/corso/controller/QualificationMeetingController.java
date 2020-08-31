package it.rt.corso.controller;

import java.util.Date;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;

import it.rt.corso.DAO.CandidatoDAO;
import it.rt.corso.DAO.QualificationMeetingDAO;
import it.rt.corso.beans.Candidato;
import it.rt.corso.beans.Feedback;
import it.rt.corso.beans.QualificationMeeting;
import it.rt.corso.beans.TipoFeedback;
import it.rt.corso.beans.Utente;

@Controller
public class QualificationMeetingController {

	ApplicationContext factory = new ClassPathXmlApplicationContext("bean.xml");

	QualificationMeetingDAO quafilicationMeetingDAO = (QualificationMeetingDAO) factory
			.getBean("qualificationMeetingDAO");
	CandidatoDAO dao = (CandidatoDAO) factory.getBean("candidatoDAO");

	@RequestMapping(value = "/AggiungiQualificationMeeting/{id}", method = RequestMethod.POST)
	public String aggiungiQualificationMeeting(@ModelAttribute("qualificationMeeting") QualificationMeeting qualificationMeeting,
			@PathVariable int id, @SessionAttribute("utente") Utente utente) {
		Candidato c = dao.get(id);
		qualificationMeeting.setUserInsert(utente.getUsername());
		Date ora = new Date();
		qualificationMeeting.setDateInsert(ora);
		qualificationMeeting.setCandidato(c);
		quafilicationMeetingDAO.inserisci(qualificationMeeting);

		return "redirect:/Candidato/{id}";

	}
	
	@RequestMapping(value = "/ModificaQualificationMeeting/{id}", method = RequestMethod.POST)
	public String modificaQualificationMeeting(@ModelAttribute("qualificationMeeting") QualificationMeeting qualificationMeeting,
			@PathVariable int id, @SessionAttribute("utente") Utente utente) {
		QualificationMeeting qm = quafilicationMeetingDAO.get(qualificationMeeting.getId());
		qm.setUserInsert(utente.getUsername());
		qm.setCliente(qualificationMeeting.getCliente());
		qm.setDataPresentato(qualificationMeeting.getDataPresentato());
		qm.setDataColloquio(qualificationMeeting.getDataColloquio());
		qm.setRiferimentoGara(qualificationMeeting.getRiferimentoGara());
		qm.setFeedback(qualificationMeeting.getFeedback());
		Date ora = new Date();
		qualificationMeeting.setDateInsert(ora);
		quafilicationMeetingDAO.aggiorna(qm);

		return "redirect:/Candidato/{id}";

	}
}
