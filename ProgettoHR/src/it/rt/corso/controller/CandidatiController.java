package it.rt.corso.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
import it.rt.corso.DAO.*;
import it.rt.corso.beans.*;

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
	EconomicsDAO economicsDAO = (EconomicsDAO) factory.getBean("economicsDAO");
	CostoDAO costoDAO = (CostoDAO) factory.getBean("costoDAO");

	@InitBinder
	public final void initBinderUsuariosFormValidator(final WebDataBinder binder, final Locale locale) {
		final SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd", locale);
		binder.registerCustomEditor(Date.class, "inserimentoAzienda", new CustomDateEditor(dateFormat, true));
	}

	@RequestMapping("/Candidati/{businessUnit}")
	public String formAggiungiCandidato(Model m, @PathVariable String businessUnit) {

		List<Business> businessList = businessDAO.getLista();
		List<AreaCompetenza> areaCompetenzaList = areaCompetenzaDAO.getLista();
		List<Mansione> mansioneList = mansioneDAO.getLista();
		List<Specializzazione> specializzazioneList = specializzazioneDAO.getLista();
		List<Seniority> seniorityList = seniorityDAO.getLista();

		m.addAttribute("businessUnit", businessUnit);
		m.addAttribute("businessList", businessList);
		m.addAttribute("areaCompetenzaList", areaCompetenzaList);
		m.addAttribute("mansioneList", mansioneList);
		m.addAttribute("specializzazioneList", specializzazioneList);
		m.addAttribute("seniorityList", seniorityList);

		m.addAttribute("candidato", new Candidato());

		return "InserimentoCandidati";
	}

	@RequestMapping(value = "/CandidatiSave/{businessUnit}", method = RequestMethod.POST)
	public String aggiungiCandidato(@ModelAttribute("candidato") Candidato candidato, @PathVariable String businessUnit) {

		// Inserisce lo stato di default "nuovo inserito"
		StatoCandidato stato = (StatoCandidato) factory.getBean("inserito");
		candidato.setStato(stato);

		// Ciclo for per Mansione
		List<Mansione> listMansione = new ArrayList<>();
		for (Mansione m : candidato.getMansione()) {

			if (m.getMansione() != null) {
				Mansione mansione = mansioneDAO.get(m.getMansione());
				listMansione.add(mansione);
			}
		}
		candidato.setMansione(listMansione);

		Seniority seniority = seniorityDAO.get(candidato.getSeniority().getSeniority());
		candidato.setSeniority(seniority);

		// Ciclo for per AreaCompetenza
		List<AreaCompetenza> listArea = new ArrayList<>();
		for (AreaCompetenza a : candidato.getArea()) {

			if (a.getArea() != null) {
				AreaCompetenza area = areaCompetenzaDAO.get(a.getArea());
				listArea.add(area);
			}

		}
		candidato.setArea(listArea);

		// Inserisce il Business
		Business business = businessDAO.get(candidato.getBusiness().getBusiness());
		candidato.setBusiness(business);

		// Ciclo for per CandidatoSpecializzazione
		List<CandidatoSpecializzazione> listCandidatoSpecializzazione = new ArrayList<>();
		for (CandidatoSpecializzazione cs : candidato.getCandidatoSpecializzazione()) {

			if (cs.getSpecializzazione().getSpecializzazione() != null) {
				Specializzazione s = specializzazioneDAO.get(cs.getSpecializzazione().getSpecializzazione());
				cs.setSpecializzazione(s);
				cs.setCandidato(candidato);
				listCandidatoSpecializzazione.add(cs);
			}

		}
		candidato.setCandidatoSpecializzazione(listCandidatoSpecializzazione);

		candidatoDAO.inserisci(candidato);
		return "redirect:/Home/{businessUnit}";
	}

	@RequestMapping(value = "/Candidato/{id}", method = RequestMethod.GET)
	public String Candidato(@PathVariable int id, Model m) {

		Candidato c = candidatoDAO.get(id);
		List<Feedback> f = feedbackDAO.getByIdCandidato(id);
		List<Economics> e = economicsDAO.getByIdCandidato(id);
		List<Costo> co = costoDAO.getByIdCandidato(id);

		m.addAttribute("mostraFeedback", f);

		// List<Feedback> feedbacks = c.getFeedback();
		// List<QualificationMeeting> listQM = c.getFeedback();
		m.addAttribute("mostraCandidato", c);

		m.addAttribute("feedback", new Feedback());

		m.addAttribute("tipoFeedback", new TipoFeedback());
		
		m.addAttribute("mostraEconomics", e);
		
		m.addAttribute("mostraCosto", co);

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
