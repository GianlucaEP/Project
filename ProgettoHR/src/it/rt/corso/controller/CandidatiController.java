package it.rt.corso.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Set;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import it.rt.corso.DAO.CandidatoDAO;
import it.rt.corso.DAO.FeedbackDAO;
import it.rt.corso.DAO.SinonimoDAO;
import it.rt.corso.DAO.StatoCandidatoDAO;
import it.rt.corso.beans.Candidato;
import it.rt.corso.beans.Feedback;
import it.rt.corso.beans.QualificationMeeting;
import it.rt.corso.beans.Sinonimo;
import it.rt.corso.beans.StatoCandidato;
import it.rt.corso.beans.TipoFeedback;

@Controller
public class CandidatiController {

	ApplicationContext factory = new ClassPathXmlApplicationContext("bean.xml");

	// su quale base, scelgo come istanziare un oggetto(dai bean o da java(new))??
//	DA CHIEDERE AL PROF
	FeedbackDAO fdao = (FeedbackDAO) factory.getBean("feedbackDAO");
	CandidatoDAO dao = (CandidatoDAO) factory.getBean("candidatoDAO");

	SinonimoDAO sdao = (SinonimoDAO) factory.getBean("sinonimoDAO");

	@InitBinder
	public final void initBinderUsuariosFormValidator(final WebDataBinder binder, final Locale locale) {
		final SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd", locale);
		binder.registerCustomEditor(Date.class, "inserimentoAzienda", new CustomDateEditor(dateFormat, true));
	}

	@RequestMapping("/Candidati")
	public String formAggiungiCandidato(Model m) {

		m.addAttribute("candidato", new Candidato());
		
		return "InserimentoCandidati";
	}

	@RequestMapping(value = "/CandidatiSave", method = RequestMethod.POST)
	public String aggiungiCandidato(@ModelAttribute("candidato") Candidato candidato) {
		StatoCandidato stato = (StatoCandidato) factory.getBean("inserito");
		candidato.setStatoCandidato(stato);
		dao.inserisci(candidato);
		// aggiungi sinonimo alla tabella sinonimo corrispondente alla mansione del
		// candidato
		Sinonimo s = new Sinonimo();
		s.setSinonimo(candidato.getMansione());
		sdao.inserisci(s);
		return "redirect:/Home";// will redirect to viewemp request mapping
	}

	@RequestMapping(value = "/Candidato/{id}", method = RequestMethod.GET)
	public String Candidato(@PathVariable int id, Model m) {

		Candidato c = dao.get(id);
		List<Feedback> f = fdao.getByIdCandidato(id);

		m.addAttribute("mostraFeedback", f);

		// List<Feedback> feedbacks = c.getFeedback();
		// List<QualificationMeeting> listQM = c.getFeedback();
		m.addAttribute("mostraCandidato", c);
		
		m.addAttribute("feedback", new Feedback());
		
		m.addAttribute("tipoFeedback", new TipoFeedback());

		// m.addAttribute("listaFeedback", feedbacks);
		// m.addAttribute("listaFeedback", listQM);
		return "Candidato";
	}

	@RequestMapping(value = "/Elimina/{id}", method = RequestMethod.GET)
	public String elimina(@PathVariable int id) {
		Candidato c = dao.get(id);
		dao.cancella(c);
		return "redirect:/Home";
	}

	@RequestMapping(value = "/Modifica/{id}/{statoInput}", method = RequestMethod.POST)
	public String modifica(@ModelAttribute("mostraCandidato") Candidato c, @PathVariable int id,  @PathVariable String statoInput) {
		StatoCandidato statoOutput = (StatoCandidato) factory.getBean(statoInput);
		c.setStatoCandidato(statoOutput);
		
		dao.aggiorna(c);
		return "redirect:/Candidato/{id}";
	}

	@RequestMapping("/Aggiorna/{id}/{stato}")
	public String candidatoUpdateStato(@PathVariable int id, @PathVariable String stato) {
		Candidato c = dao.get(id);
		StatoCandidato statoCandidato = (StatoCandidato) factory.getBean(stato);

		c.setStatoCandidato(statoCandidato);

		dao.aggiorna(c);

		return "redirect:/Candidato/{id}";

	}

}
