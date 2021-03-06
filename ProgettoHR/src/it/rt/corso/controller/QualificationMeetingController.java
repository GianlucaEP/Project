package it.rt.corso.controller;

import java.util.Date;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import it.rt.corso.DAO.CandidatoDAO;
import it.rt.corso.DAO.QualificationMeetingDAO;
import it.rt.corso.beans.Candidato;
import it.rt.corso.beans.QualificationMeeting;
import it.rt.corso.beans.Utente;

@Controller
public class QualificationMeetingController {

	ApplicationContext factory = new ClassPathXmlApplicationContext("bean.xml");

	QualificationMeetingDAO quafilicationMeetingDAO = (QualificationMeetingDAO) factory
			.getBean("qualificationMeetingDAO");
	CandidatoDAO dao = (CandidatoDAO) factory.getBean("candidatoDAO");

	/**
	 * Add a new {@link QualificationMeeting QualificationMeeting} Object in database for the candidato selected using the given id.
	 * 
	 * @param qualificationMeeting {@link QualificationMeeting QualificationMeeting} that will be added in database.
	 * @param id the given id used to select the Candidato to which we will be adding the {@link QualificationMeeting QualificationMeeting}.
	 * @param businessUnit business unit String obtained from the URL.
	 * @param utente session attribute of type utente, if it's not null you are logged in session. 
	 * 
	 * @return JSP URL.
	 * */
	@RequestMapping(value = "/AggiungiQualificationMeeting/{businessUnit}/{id}", method = RequestMethod.POST)
	public String aggiungiQualificationMeeting(
			@ModelAttribute("qualificationMeeting") QualificationMeeting qualificationMeeting, @PathVariable int id,
			@PathVariable String businessUnit, @SessionAttribute("utente") Utente utente) {
		Candidato c = dao.get(id);
		qualificationMeeting.setUserInsert(utente.getUsername());
		Date ora = new Date();
		qualificationMeeting.setDateInsert(ora);
		qualificationMeeting.setCandidato(c);
		quafilicationMeetingDAO.inserisci(qualificationMeeting);

		return "redirect:/Candidato/{businessUnit}/{id}";

	}

	/**
	 * Update a {@link QualificationMeeting QualificationMeeting} Object in database for the candidato selected using the given id.
	 * 
	 * @param qualificationMeeting {@link QualificationMeeting QualificationMeeting} that will be added in database.
	 * @param id the given id used to select the Candidato to which we will be adding the {@link QualificationMeeting QualificationMeeting}.
	 * @param businessUnit business unit String obtained from the URL.
	 * @param utente session attribute of type utente, if it's not null you are logged in session. 
	 * 
	 * @return JSP URL.
	 * */
	@RequestMapping(value = "/ModificaQualificationMeeting/{businessUnit}/{id}", method = RequestMethod.POST)
	public String modificaQualificationMeeting(
			@ModelAttribute("qualificationMeeting") QualificationMeeting qualificationMeeting, @PathVariable int id,
			@PathVariable String businessUnit, @SessionAttribute("utente") Utente utente) {
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

		return "redirect:/Candidato/{businessUnit}/{id}";

	}

	/**
	 * Delete a {@link QualificationMeeting QualificationMeeting} Object in database for the candidato selected using the given id.
	 * 
	 * @param idQualificationMeeting id used to search {@link QualificationMeeting QualificationMeeting} that will be deleted.
	 * @param id the given id used to select the Candidato that will be showed in page.
	 * @param businessUnit business unit String obtained from the URL.
	 * 
	 * @return JSP URL.
	 * */
	@RequestMapping(value = "/EliminaQualificationMeeting/{businessUnit}/{id}", method = RequestMethod.POST)
	public String elimina(@RequestParam("qualification") int idQualificationMeeting, @PathVariable String businessUnit,
			@PathVariable int id) {
		
		QualificationMeeting qm = quafilicationMeetingDAO.get(idQualificationMeeting);
		
		quafilicationMeetingDAO.cancella(qm);
		
		return "redirect:/Candidato/{businessUnit}/{id}";
	}
}
