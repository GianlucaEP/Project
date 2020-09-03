package it.rt.corso.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import it.rt.corso.DAO.*;
import it.rt.corso.DAOImpl.StatoCandidatoDAOImpl;
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

		List<String> mansioneListString = new ArrayList<String>();
		List<String> areaCompetenzaListString = new ArrayList<String>();
		List<String> specializzazioneListString = new ArrayList<String>();

		for (Mansione mansione : mansioneList) {

			mansioneListString.add(mansione.getMansione());
		}

		for (AreaCompetenza area : areaCompetenzaList) {

			areaCompetenzaListString.add(area.getArea());
		}

		for (Specializzazione spec : specializzazioneList) {

			specializzazioneListString.add(spec.getSpecializzazione());
		}

		m.addAttribute("businessUnit", businessUnit);
		m.addAttribute("businessList", businessList);
		m.addAttribute("areaCompetenzaList", areaCompetenzaListString);
		m.addAttribute("mansioneList", mansioneListString);
		m.addAttribute("specializzazioneList", specializzazioneListString);
		m.addAttribute("seniorityList", seniorityList);

		m.addAttribute("candidato", new Candidato());

		return "InserimentoCandidati";
	}

//	@RequestMapping(value = "/CandidatiSave/{businessUnit}", method = RequestMethod.POST)
//	public String aggiungiCandidato(@ModelAttribute("candidato") Candidato candidato,
//			@PathVariable String businessUnit) {
//
//		// Inserisce lo stato di default "nuovo inserito"
//		StatoCandidato stato = (StatoCandidato) factory.getBean("inserito");
//		candidato.setStato(stato);
//
//		// Ciclo for per Mansione
//		List<Mansione> listMansione = new ArrayList<>();
//		for (Mansione m : candidato.getMansione()) {
//
//			if (m.getMansione() != null) {
//				Mansione mansione = mansioneDAO.get(m.getMansione());
//				listMansione.add(mansione);
//			}
//		}
//		candidato.setMansione(listMansione);
//
//		Seniority seniority = seniorityDAO.get(candidato.getSeniority().getSeniority());
//		candidato.setSeniority(seniority);
//
//		// Ciclo for per AreaCompetenza
//		List<AreaCompetenza> listArea = new ArrayList<>();
//		for (AreaCompetenza a : candidato.getArea()) {
//
//			if (a.getArea() != null) {
//				AreaCompetenza area = areaCompetenzaDAO.get(a.getArea());
//				listArea.add(area);
//			}
//
//		}
//		candidato.setArea(listArea);
//
//		// Inserisce il Business
//		Business business = businessDAO.get(candidato.getBusiness().getBusiness());
//		candidato.setBusiness(business);
//
//		// Ciclo for per CandidatoSpecializzazione
//		List<CandidatoSpecializzazione> listCandidatoSpecializzazione = new ArrayList<>();
//		for (CandidatoSpecializzazione cs : candidato.getCandidatoSpecializzazione()) {
//
//			if (cs.getSpecializzazione().getSpecializzazione() != null) {
//				Specializzazione s = specializzazioneDAO.get(cs.getSpecializzazione().getSpecializzazione());
//				cs.setSpecializzazione(s);
//				cs.setCandidato(candidato);
//				listCandidatoSpecializzazione.add(cs);
//			}
//
//		}
//		candidato.setCandidatoSpecializzazione(listCandidatoSpecializzazione);
//
//		candidatoDAO.inserisci(candidato);
//		return "redirect:/Home/{businessUnit}";
//	}
//
	@RequestMapping(value = "/CandidatiSave/{businessUnit}", method = RequestMethod.POST)
	public String aggiungiCandidato(@RequestParam Map<String, String> mappaCandidato,
			@PathVariable String businessUnit) {

		Candidato candidato = new Candidato();

		StatoCandidato stato = (StatoCandidato) factory.getBean("inserito");
		candidato.setStato(stato);

		candidato.setNome(mappaCandidato.get("nome"));
		candidato.setCognome(mappaCandidato.get("cognome"));
		String annoString = mappaCandidato.get("anno");
		Integer anno = Integer.parseInt(annoString);
		candidato.setAnno(anno);
		candidato.setTelefono(mappaCandidato.get("telefono"));
		candidato.setEmail(mappaCandidato.get("email"));

		Seniority seniority = seniorityDAO.get(mappaCandidato.get("seniority"));
		candidato.setSeniority(seniority);

		Business business = businessDAO.get(mappaCandidato.get("business"));
		candidato.setBusiness(business);

		candidato.setProvenienza(mappaCandidato.get("provenienza"));
		candidato.setCategoriaProtetta(Boolean.parseBoolean(mappaCandidato.get("provenienza")));
//		candidato.setCodiceFiscale(mappaCandidato.get("codiceFiscale"));

		/*
		 * SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd"); Date date =
		 * null; try { date = formatter.parse(mappaCandidato.get("data")); } catch
		 * (ParseException e) { // TODO Auto-generated catch block e.printStackTrace();
		 * } candidato.setInserimentoAzienda(date);
		 */
		candidato.setBusiness(business);

		List<AreaCompetenza> listaCompetenza = new ArrayList<AreaCompetenza>();
		List<Mansione> listaMansione = new ArrayList<Mansione>();
		List<CandidatoSpecializzazione> listaCandidatoSpecializzazione = new ArrayList<CandidatoSpecializzazione>();

		for (Map.Entry<String, String> entry : mappaCandidato.entrySet()) {
			if (entry.getKey().contains("area")) {

				AreaCompetenza area = areaCompetenzaDAO.get(entry.getValue());
				listaCompetenza.add(area);
			} else if (entry.getKey().contains("mansione")) {
				Mansione mansione = mansioneDAO.get(entry.getValue());
				listaMansione.add(mansione);
			} else if (entry.getKey().contains("specializzazione")) {

				// da jsp mi arriva la specializzazione come stringa in formato
				// "specializzazione anniEsperienza e devo dividerla per assengnarla ai 2 campi
				// di candidatoSpecializzazione
				String[] specializzazioneCorretta = entry.getValue().split(" ");
				CandidatoSpecializzazione candidatoSpecializzazione = new CandidatoSpecializzazione();
				Specializzazione specializzazione = specializzazioneDAO.get(specializzazioneCorretta[0]);
				candidatoSpecializzazione.setAnni(Integer.parseInt(specializzazioneCorretta[1]));
				candidatoSpecializzazione.setSpecializzazione(specializzazione);
				candidatoSpecializzazione.setCandidato(candidato);
				listaCandidatoSpecializzazione.add(candidatoSpecializzazione);
			}
		}

		candidato.setArea(listaCompetenza);
		candidato.setMansione(listaMansione);
		candidato.setCandidatoSpecializzazione(listaCandidatoSpecializzazione);

		candidatoDAO.inserisci(candidato);

		return "redirect:/Home/{businessUnit}";

	}

	@RequestMapping(value = "/Elimina/{id}", method = RequestMethod.GET)
	public String elimina(@PathVariable int id) {
		Candidato c = candidatoDAO.get(id);
		candidatoDAO.cancella(c);
		return "redirect:/Home";
	}

	@RequestMapping(value = "/ModificaAnagrafica/{id}/{statoInput}", method = RequestMethod.POST)
	public String modificaAnagrafica(@ModelAttribute("mostraCandidato") Candidato c, @PathVariable int id,
			@PathVariable String statoInput) {
		Candidato candidato = candidatoDAO.get(id);
		StatoCandidato statoOutput = (StatoCandidato) factory.getBean(statoInput);
		candidato.setStato(statoOutput);
		candidato.setNome(c.getNome());
		candidato.setCognome(c.getCognome());
		candidato.setAnno(c.getAnno());
		candidato.setTelefono(c.getTelefono());
		candidato.setEmail(c.getEmail());
		candidato.setInserimentoAzienda(c.getInserimentoAzienda());
		candidatoDAO.aggiorna(candidato);
		return "redirect:/Candidato/{id}";
	}

	@RequestMapping(value = "/AggiungiModificaCosto/{id}", method = RequestMethod.POST)
	public String modificaCosto(@ModelAttribute("mostraCandidato") Candidato c, @PathVariable int id) {
		Candidato candidato = candidatoDAO.get(id);

		if (candidato.getCosto() == null) {
			// aggiungi costo per la prima volta di un dato candidato
			candidato.setCosto(c.getCosto());
			candidatoDAO.aggiorna(candidato);
		}

		else {
			// modifica costo di un dato candidato
			candidato.getCosto().setOrario(c.getCosto().getOrario());
			candidato.getCosto().setGiornaliero(c.getCosto().getGiornaliero());
			candidato.getCosto().setCommento(c.getCosto().getCommento());
			costoDAO.aggiorna(candidato.getCosto());
		}

		return "redirect:/Candidato/{id}";
	}

	@RequestMapping(value = "/AggiungiModificaEconomics/{id}", method = RequestMethod.POST)
	public String modificaEconomics(@ModelAttribute("mostraCandidato") Candidato c, @PathVariable int id) {
		Candidato candidato = candidatoDAO.get(id);

		if (candidato.getEconomics() == null) {
			// aggiungi economics per la prima volta di un dato candidato
			candidato.setEconomics(c.getEconomics());
			candidatoDAO.aggiorna(candidato);
		}

		else {
			// modifica economics di un dato candidato
			candidato.getEconomics().setInquadramento(c.getEconomics().getInquadramento());
			candidato.getEconomics().setRal(c.getEconomics().getRal());
			candidato.getEconomics().setBenefit(c.getEconomics().getBenefit());
			candidato.getEconomics().setPreavviso(c.getEconomics().getPreavviso());
			candidato.getEconomics().setDesiderata(c.getEconomics().getDesiderata());
			economicsDAO.aggiorna(candidato.getEconomics());
		}

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

	@RequestMapping(value = "/Candidato//{id}", method = RequestMethod.GET)
	public String Candidato(@PathVariable int id, Model m,
			@SessionAttribute("utente") Utente utente) {

		Candidato c = candidatoDAO.get(id);

		List<Feedback> f = feedbackDAO.getByIdCandidato(id);

		
		m.addAttribute("mostraFeedback", f);

		// m.addAttribute("listaMansione", listaMansione);

		// m.addAttribute("listaAreaComp", listaAreaComp);

		// List<Feedback> feedbacks = c.getFeedback();
		// List<QualificationMeeting> listQM = c.getFeedback();
		m.addAttribute("mansione", new Mansione());

		m.addAttribute("mostraCandidato", c);

		m.addAttribute("feedback", new Feedback());

		m.addAttribute("tipoFeedback", new TipoFeedback());

		m.addAttribute("qualificationMeeting", new QualificationMeeting());

		m.addAttribute("ruolo", utente.getRuolo());

		// m.addAttribute("listaFeedback", feedbacks);
		// m.addAttribute("listaFeedback", listQM);
		return "Candidato";
	}

}
