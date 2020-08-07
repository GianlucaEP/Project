package it.rt.corso.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
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
import it.rt.corso.DAO.AreaCompetenzaDAO;
import it.rt.corso.DAO.BusinessDAO;
import it.rt.corso.DAO.CandidatoDAO;
import it.rt.corso.DAO.FeedbackDAO;
import it.rt.corso.DAO.MansioneDAO;
import it.rt.corso.DAO.SeniorityDAO;
import it.rt.corso.DAO.SpecializzazioneDAO;
import it.rt.corso.beans.AreaCompetenza;
import it.rt.corso.beans.Business;
import it.rt.corso.beans.Candidato;
import it.rt.corso.beans.CandidatoSpecializzazione;
import it.rt.corso.beans.Feedback;
import it.rt.corso.beans.Mansione;
import it.rt.corso.beans.Seniority;
import it.rt.corso.beans.Specializzazione;
import it.rt.corso.beans.StatoCandidato;
import it.rt.corso.beans.TipoFeedback;

@Controller
public class CandidatiController {

	ApplicationContext factory = new ClassPathXmlApplicationContext("bean.xml");

	// TODO su quale base, scelgo come istanziare un oggetto(dai bean o da
	// java(new))??

	// Inizializzazione DAO
	FeedbackDAO feedbackDAO = (FeedbackDAO) factory.getBean("feedbackDAO");
	CandidatoDAO candidatoDAO = (CandidatoDAO) factory.getBean("candidatoDAO");
	SpecializzazioneDAO specializzazioneDAO = (SpecializzazioneDAO) factory.getBean("specializzazioneDAO");
	BusinessDAO businessDAO = (BusinessDAO) factory.getBean("businessDAO");
	AreaCompetenzaDAO areaCompetenzaDAO = (AreaCompetenzaDAO) factory.getBean("areaCompetenzaDAO");
	MansioneDAO mansioneDAO = (MansioneDAO) factory.getBean("mansioneDAO");
	SeniorityDAO seniorityDAO = (SeniorityDAO) factory.getBean("seniorityDAO");

	@InitBinder
	public final void initBinderUsuariosFormValidator(final WebDataBinder binder, final Locale locale) {
		final SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd", locale);
		binder.registerCustomEditor(Date.class, "inserimentoAzienda", new CustomDateEditor(dateFormat, true));
	}

	@RequestMapping("/Candidati")
	public String formAggiungiCandidato(Model m) {

		List<Business> businessList = businessDAO.getLista();
		List<AreaCompetenza> areaCompetenzaList = areaCompetenzaDAO.getLista();
		List<Mansione> mansioneList = mansioneDAO.getLista();
		List<Specializzazione> specializzazioneList = specializzazioneDAO.getLista();
		List<Seniority> seniorityList = seniorityDAO.getLista();

		m.addAttribute("businessList", businessList);
		m.addAttribute("areaCompetenzaList", areaCompetenzaList);
		m.addAttribute("mansioneList", mansioneList);
		m.addAttribute("specializzazioneList", specializzazioneList);
		m.addAttribute("seniorityList", seniorityList);
		m.addAttribute("candidato", new Candidato());

		return "InserimentoCandidati";
	}

	@RequestMapping(value = "/CandidatiSave", method = RequestMethod.POST)
	public String aggiungiCandidato(@ModelAttribute("candidato") Candidato candidato) {

		// Inserisce lo stato di default "nuovo inserito"
		StatoCandidato stato = (StatoCandidato) factory.getBean("inserito");
		candidato.setStato(stato);

		Seniority seniority = seniorityDAO.get(candidato.getSeniority().getSeniority());
		candidato.setSeniority(seniority);

		// Ciclo for per AreaCompetenza
		for (AreaCompetenza a : candidato.getArea()) {

			Set<AreaCompetenza> setArea = new HashSet<>();
			AreaCompetenza area = areaCompetenzaDAO.get(a.getArea());
			setArea.add(area);
			candidato.setArea(setArea);
		}
		// Inserisce il Business
		Business business = businessDAO.get(candidato.getBusiness().getBusiness());
		candidato.setBusiness(business);

		// Ciclo for per Mansione
		for (Mansione m : candidato.getMansione()) {

			Set<Mansione> setMansione = new HashSet<>();
			Mansione mansione = mansioneDAO.get(m.getMansione());
			setMansione.add(mansione);
			candidato.setMansione(setMansione);
		}

		// Ciclo for per CandidatoSpecializzazione
		for (CandidatoSpecializzazione cs : candidato.getCandidatoSpecializzazione()) {

			Set<CandidatoSpecializzazione> setCandidatoSpecializzazione = new HashSet<>();
			Specializzazione s = specializzazioneDAO.get(cs.getSpecializzazione().getSpecializzazione());
			cs.setSpecializzazione(s);
			setCandidatoSpecializzazione.add(cs);
			candidato.setCandidatoSpecializzazione(setCandidatoSpecializzazione);
		}

		candidatoDAO.inserisci(candidato);
		return "redirect:/Home";// will redirect to viewemp request mapping
	}

	@RequestMapping(value = "/Candidato/{id}", method = RequestMethod.GET)
	public String Candidato(@PathVariable int id, Model m) {

		Candidato c = candidatoDAO.get(id);
		List<Feedback> f = feedbackDAO.getByIdCandidato(id);

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
		Candidato c = candidatoDAO.get(id);
		candidatoDAO.cancella(c);
		return "redirect:/Home";
	}

	@RequestMapping(value = "/Modifica/{id}/{statoInput}", method = RequestMethod.POST)
	public String modifica(@ModelAttribute("mostraCandidato") Candidato c, @PathVariable int id,
			@PathVariable String statoInput) {
		StatoCandidato statoOutput = (StatoCandidato) factory.getBean(statoInput);
		c.setStato(statoOutput);

		candidatoDAO.aggiorna(c);
		return "redirect:/Candidato/{id}";
	}

	@RequestMapping("/Aggiorna/{id}/{stato}")
	public String candidatoUpdateStato(@PathVariable int id, @PathVariable String stato) {
		Candidato c = candidatoDAO.get(id);
		StatoCandidato statoCandidato = (StatoCandidato) factory.getBean(stato);

		c.setStato(statoCandidato);

		candidatoDAO.aggiorna(c);

		return "redirect:/Candidato/{id}";

	}

}
