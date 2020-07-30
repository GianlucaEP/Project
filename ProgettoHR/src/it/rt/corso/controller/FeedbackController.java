package it.rt.corso.controller;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import it.rt.corso.DAO.FeedbackDAO;
import it.rt.corso.DAO.TipoFeedbackDAO;
import it.rt.corso.beans.Candidato;
import it.rt.corso.beans.Feedback;
import it.rt.corso.beans.Sinonimo;
import it.rt.corso.beans.TipoFeedback;

@Controller
public class FeedbackController {
	
	ApplicationContext factory = new ClassPathXmlApplicationContext("bean.xml");

	FeedbackDAO feedbackDAO = (FeedbackDAO) factory.getBean("feedbackDAO");
	TipoFeedbackDAO tipoFeedbackDAO = (TipoFeedbackDAO) factory.getBean("tipoFeedbackDAO");

	@RequestMapping("/Telefonata")
	public String formAggiungiTelefonata(Model m) {
		TipoFeedback tipo = tipoFeedbackDAO.get("telefonata");
		Feedback telefonata = new Feedback();
		telefonata.setTipo(tipo);
		m.addAttribute("feedback", telefonata);
		return "FeedbackForm";

	}

	@RequestMapping("/ColloquioHR")
	public String formAggiungiColloquioHR(Model m) {
		TipoFeedback tipo = tipoFeedbackDAO.get("colloquio_hr");
		Feedback colloquioHR = new Feedback();
		colloquioHR.setTipo(tipo);
		m.addAttribute("feedback", colloquioHR);
		return "FeedbackForm";
	}

	@RequestMapping("/ColloquioTecnico")
	public String formAggiungiColloquioTecnico(Model m) {
		TipoFeedback tipo = tipoFeedbackDAO.get("colloquio_tecnico");
		Feedback colloquioTecnico = new Feedback();
		colloquioTecnico.setTipo(tipo);
		m.addAttribute("feedback", colloquioTecnico);
		return "FeedbackForm";
	}

	@RequestMapping(value = "/AggiungiFeedback", method = RequestMethod.POST)
	public String aggiungiFeedback(@ModelAttribute("feedback") Feedback feedback) {
		feedbackDAO.inserisci(feedback);
		return "redirect:/Candidato";

	}

	/*
	 * @RequestMapping(value = "/AggiungiFeedback", method = RequestMethod.POST)
	 * public String aggiungiFeedback(@ModelAttribute("telefonata") Feedback
	 * feedback) { feedbackDAO.inserisci(feedback); return "redirect:/Candidato";//
	 * will redirect to viewemp request mapping }
	 * 
	 * @RequestMapping(value = "/AggiungiFeedback", method = RequestMethod.POST)
	 * public String aggiungiFeedback(@ModelAttribute("colloquioTecnico") Feedback
	 * feedback) { feedbackDAO.inserisci(feedback); return "redirect:/Candidato";//
	 * will redirect to viewemp request mapping }
	 * 
	 * @RequestMapping(value = "/AggiungiFeedback", method = RequestMethod.POST)
	 * public String aggiungiFeedback(@ModelAttribute("colloquioHR") Feedback
	 * feedback) { feedbackDAO.inserisci(feedback); return "redirect:/Candidato";//
	 * will redirect to viewemp request mapping }
	 */
}
