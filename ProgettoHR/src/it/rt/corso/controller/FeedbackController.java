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
import it.rt.corso.DAO.FeedbackDAO;
import it.rt.corso.DAO.TipoFeedbackDAO;
import it.rt.corso.beans.Candidato;
import it.rt.corso.beans.Feedback;
import it.rt.corso.beans.TipoFeedback;
import it.rt.corso.beans.Utente;
import it.rt.corso.singleton.Singleton;

@Controller
public class FeedbackController {

	private ApplicationContext factory = new ClassPathXmlApplicationContext("bean.xml");

	private FeedbackDAO feedbackDAO = (FeedbackDAO) factory.getBean("feedbackDAO");
	private TipoFeedbackDAO tipoFeedbackDAO = (TipoFeedbackDAO) factory.getBean("tipoFeedbackDAO");
	private CandidatoDAO dao = (CandidatoDAO) factory.getBean("candidatoDAO");

	/**
	 * Add a feedback to a selected Candidato got by the given id.
	 * 
	 * @param feedback {@link Feedbak Feedback} type Object that have to be added to the selected Candidato.
	 * @param businessUnit business unit String obtained from the URL.
	 * @param utente session attribute of type utente, if it's not null you are logged in session. 
	 * @param id id to search the Candidato with in database.
	 * 
	 * @return JSP URL
	 * */
	@RequestMapping(value = "/AggiungiFeedback/{businessUnit}/{id}", method = RequestMethod.POST)
	public String aggiungiFeedback(@ModelAttribute("feedback") Feedback feedback,
			@SessionAttribute("utente") Utente utente, @PathVariable int id, @PathVariable String businessUnit) {
		Candidato c = dao.get(id);
		TipoFeedback tp = tipoFeedbackDAO.get(feedback.getTipo().getTipo());
		feedback.setTipo(tp);
		feedback.setUserInsert(utente.getUsername());
		Date ora = new Date();
		feedback.setDateInsert(ora);
		feedback.setCandidato(c);
		feedbackDAO.inserisci(feedback);

		return "redirect:/Candidato/{businessUnit}/{id}";

	}

	/**
	 * Update a feedback selected from database using the id of the given feedback that will be updated.
	 * 
	 * @param feedback {@link Feedbak Feedback} type Object that will be updated.
	 * @param businessUnit business unit String obtained from the URL.
	 * @param utente session attribute of type utente, if it's not null you are logged in session. 
	 * @param id Candidato id used in the JSP URL to laod a Candidato page with the data of the Candidato having the corresponding id.
	 * 
	 * @return JSP URL
	 * */
	@RequestMapping(value = "/ModificaFeedback/{businessUnit}/{id}", method = RequestMethod.POST)
	public String modificaFeedback(@ModelAttribute("feedback") Feedback feedback,
			@SessionAttribute("utente") Utente utente, @PathVariable int id, @PathVariable String businessUnit) {
		Feedback f = feedbackDAO.get(feedback.getId());
		TipoFeedback tp = tipoFeedbackDAO.get(feedback.getTipo().getTipo());
		f.setTipo(tp);
		f.setData(feedback.getData());
		f.setCommento(feedback.getCommento());
		f.setUserInsert(utente.getUsername());
		Date ora = new Date();
		f.setDateInsert(ora);
		feedbackDAO.aggiorna(f);

		return "redirect:/Candidato/{businessUnit}/{id}";

	}

	/**
	 * Delete a feedback selected from database using the id of the given feedback that have to be deleted.
	 * 
	 * @param feedback {@link Feedbak Feedback} type Object that have to be deleted.
	 * @param businessUnit business unit String obtained from the URL.
	 * @param id Candidato id used in the JSP URL to laod a Candidato page with the data of the Candidato having the corresponding id.
	 * 
	 * @return JSP URL
	 * */
	@RequestMapping(value = "/EliminaFeedback/{businessUnit}/{id}", method = RequestMethod.POST)
	public String elimina(@RequestParam("removeFeedback") int idFeedback, @PathVariable String businessUnit,
			@PathVariable int id) {

		Feedback f = feedbackDAO.get(idFeedback);

		feedbackDAO.cancella(f);

		Singleton singleton = Singleton.getInstance();
		singleton.aggiornaMansione();

		return "redirect:/Candidato/{businessUnit}/{id}";
	}

}
