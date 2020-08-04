package it.rt.corso.controller;

import java.util.Set;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import it.rt.corso.DAO.CandidatoDAO;
import it.rt.corso.DAO.FeedbackDAO;
import it.rt.corso.DAO.TipoFeedbackDAO;
import it.rt.corso.beans.Candidato;
import it.rt.corso.beans.Feedback;
import it.rt.corso.beans.TipoFeedback;

@Controller
public class FeedbackController {

	ApplicationContext factory = new ClassPathXmlApplicationContext("bean.xml");

	FeedbackDAO feedbackDAO = (FeedbackDAO) factory.getBean("feedbackDAO");
	TipoFeedbackDAO tipoFeedbackDAO = (TipoFeedbackDAO) factory.getBean("tipoFeedbackDAO");
	CandidatoDAO dao = (CandidatoDAO) factory.getBean("candidatoDAO");

	@RequestMapping(value = "/AggiungiFeedback/{id}", method = RequestMethod.POST)
	public String aggiungiFeedback(@ModelAttribute("feedback") Feedback feedback,
			@ModelAttribute("tipoFeedback") TipoFeedback tipoFeedback, @PathVariable int id) {
		Candidato c = dao.get(id);
		feedback.setTipo(tipoFeedback);
		feedback.setCandidato(c);
		//feedbackDAO.inserisci(feedback);

		Set<Feedback> feedbacks = c.getFeedback();
		feedbacks.add(feedback);
		c.setFeedback(feedbacks);

		dao.aggiorna(c);

		return "redirect:/Candidato/{id}";

	}

}
