package it.rt.corso.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
import it.rt.corso.beans.*;
import it.rt.corso.singleton.Singleton;

@Controller
public class CandidatiController {

	ApplicationContext factory = new ClassPathXmlApplicationContext("bean.xml");

// TODO su quale base, scelgo come istanziare un oggetto(dai bean o da
// java(new))??

// Inizializzazione DAO
	FeedbackDAO feedbackDAO = (FeedbackDAO) factory.getBean("feedbackDAO");
	CandidatoDAO candidatoDAO = (CandidatoDAO) factory.getBean("candidatoDAO");
	SpecializzazioneDAO specializzazioneDAO = (SpecializzazioneDAO) factory.getBean("specializzazioneDAO");
	CandidatoSpecializzazioneDAO candidatoSpecializzazioneDAO = (CandidatoSpecializzazioneDAO) factory
			.getBean("candidatoSpecializzazioneDAO");
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

		Singleton singleton = Singleton.getInstance();

		m.addAttribute("businessUnit", businessUnit);
		m.addAttribute("businessList", singleton.getBusinessList());

// model attribute per l' eventuale aggiunta di mansione, area o specializzazione
		m.addAttribute("mansione", new Mansione());
		m.addAttribute("areaCompetenza", new AreaCompetenza());
		m.addAttribute("specializzazione", new Specializzazione());

		m.addAttribute("mansioneList", singleton.getMansioneListString());

		m.addAttribute("areaCompetenzaList", singleton.getAreaCompetenzaListString());
		m.addAttribute("specializzazioneList", singleton.getSpecializzazioneListString());
		m.addAttribute("seniorityList", singleton.getSeniorityList());

		m.addAttribute("candidato", new Candidato());

		return "InserimentoCandidati";
	}

	@RequestMapping(value = "/CandidatiSave/{businessUnit}", method = RequestMethod.POST)
	public String aggiungiCandidato(HttpServletRequest request, @PathVariable String businessUnit,
			@ModelAttribute("candidato") Candidato c) {

		StatoCandidato stato = (StatoCandidato) factory.getBean("inserito");
		c.setStato(stato);

		String[] areeCompetenza = request.getParameterValues("areaCompetenza");
		if (areeCompetenza != null) {
			c.setArea(aggiungiAreaCompetenza(areeCompetenza));
		}

		String[] mansioni = request.getParameterValues("mansioni");
		if (mansioni != null) {
			c.setMansione(aggiungiMansione(mansioni));
		}

		String[] specializzazioni = request.getParameterValues("specializzazione");
		if (specializzazioni != null) {
			c.setCandidatoSpecializzazione(aggiungiSpecializzazione(specializzazioni, c));
		}

		candidatoDAO.inserisci(c);

		return "redirect:/Home/{businessUnit}";

	}

	@RequestMapping(value = "/Elimina/{businessUnit}", method = RequestMethod.POST)
	public String elimina(@RequestParam("idCandidato") int idCandidato, @PathVariable String businessUnit) {
		Candidato c = candidatoDAO.get(idCandidato);
		candidatoDAO.cancella(c);
		return "redirect:/Home/{businessUnit}";
	}

	@RequestMapping(value = "/ModificaAnagrafica/{businessUnit}/{id}", method = RequestMethod.POST)
	public String modificaAnagrafica(@ModelAttribute("mostraCandidato") Candidato c, @PathVariable int id,
			@PathVariable String businessUnit) {

		Candidato candidato = candidatoDAO.get(id);

		candidato.setNome(c.getNome());
		candidato.setCognome(c.getCognome());
		candidato.setAnno(c.getAnno());
		candidato.setTelefono(c.getTelefono());
		candidato.setEmail(c.getEmail());
		candidato.setCodiceFiscale(c.getCodiceFiscale());
		candidato.setProvenienza(c.getProvenienza());

		if (c.isCategoriaProtetta()) {
			candidato.setCategoriaProtetta(true);
		} else
			candidato.setCategoriaProtetta(false);

		candidatoDAO.aggiorna(candidato);
		return "redirect:/Candidato/{businessUnit}/{id}";
	}

	@RequestMapping(value = "/AggiungiModificaCosto/{businessUnit}/{id}", method = RequestMethod.POST)
	public String modificaCosto(@ModelAttribute("mostraCandidato") Candidato c, @PathVariable int id,
			@PathVariable String businessUnit) {
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

		return "redirect:/Candidato/{businessUnit}/{id}";
	}

	@RequestMapping(value = "/AggiungiModificaEconomics/{businessUnit}/{id}", method = RequestMethod.POST)
	public String modificaEconomics(@ModelAttribute("mostraCandidato") Candidato c, @PathVariable int id,
			@PathVariable String businessUnit) {
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

		return "redirect:/Candidato/{businessUnit}/{id}";
	}

// metodo per aggiornare la seniority del candidato dalla pagina del candidato
// stesso
	@RequestMapping("/ModificaSeniority/{businessUnit}/{id}")
	public String modificaSeniority(@RequestParam(name = "seniority") String seniority, @PathVariable int id,
			@PathVariable String businessUnit) {
		Candidato candidato = candidatoDAO.get(id);
		candidato.getSeniority().setSeniority(seniority);
		candidatoDAO.aggiorna(candidato);

		return "redirect:/Candidato/{businessUnit}/{id}";
	}

// metodo per aggiornare la businessUnit del candidato dalla pagina del
// candidato stesso
	@RequestMapping("/ModificaBusinessUnit/{businessUnit}/{id}")
	public String modificaBusinessUnit(@RequestParam(name = "businessUnit") String businessUnit, @PathVariable int id) {
		Candidato candidato = candidatoDAO.get(id);
		candidato.getBusiness().setBusiness(businessUnit);
		candidatoDAO.aggiorna(candidato);

		return "redirect:/Candidato/{businessUnit}/{id}";
	}

// metodo per aggiornare l'area competenza del candidato dalla pagina del
// candidato stesso
	@RequestMapping("/ModificaAreaCompetenza/{businessUnit}/{id}")
	public String modificaAreaCompetenza(HttpServletRequest request, @PathVariable int id,
			@PathVariable String businessUnit) {

		Candidato candidato = candidatoDAO.get(id);

		String[] areeCompetenza = request.getParameterValues("areaCompetenza");
		if (areeCompetenza != null) {
			candidato.setArea(aggiungiAreaCompetenza(areeCompetenza));
		} else {
			candidato.setArea(new ArrayList<AreaCompetenza>());
		}

		candidatoDAO.aggiorna(candidato);

		return "redirect:/Candidato/{businessUnit}/{id}";
	}

// metodo per aggiornare la mansione del candidato dalla pagina del
// candidato stesso
	@RequestMapping("/ModificaMansione/{businessUnit}/{id}")
	public String modificaMansione(HttpServletRequest request, @PathVariable int id,
			@PathVariable String businessUnit) {

		Candidato candidato = candidatoDAO.get(id);

		String[] mansioni = request.getParameterValues("mansione");
		if (mansioni != null) {
			candidato.setMansione(aggiungiMansione(mansioni));
		} else {
			candidato.setMansione(new ArrayList<Mansione>());
		}

		candidatoDAO.aggiorna(candidato);

		return "redirect:/Candidato/{businessUnit}/{id}";
	}

// metodo per aggiornare la specializzazione del candidato dalla pagina del
// candidato stesso
	@RequestMapping("/ModificaSpecializzazione/{businessUnit}/{id}")
	public String modificaSpecializzazione(HttpServletRequest request, @PathVariable int id,
			@PathVariable String businessUnit) {
		Candidato candidato = candidatoDAO.get(id);

		String[] specializzazioni = request.getParameterValues("specializzazione");
		if (specializzazioni != null) {

			List<CandidatoSpecializzazione> listaCandidatoSpecializzazione = new ArrayList<CandidatoSpecializzazione>();
			int trovato = 0;
// controllo che non siano stati cancellati delle specializzazioni e nel caso la
// elimino dalla tabella di mezzo
			for (CandidatoSpecializzazione cs : candidato.getCandidatoSpecializzazione()) {
				for (String specializzazione : specializzazioni) {
					String[] specializzazioneCorretta = specializzazione.split(" ");
					if (cs.getSpecializzazione().getSpecializzazione().equalsIgnoreCase(specializzazioneCorretta[0])) {
						trovato = 1;
					}
				}
				if (trovato == 0) {
					candidatoSpecializzazioneDAO.cancella(cs);
				} else
					trovato = 0;
			}

// aggiorno tutte le specializzazioni
			candidato.setCandidatoSpecializzazione(aggiungiSpecializzazione(specializzazioni, candidato));
			candidatoDAO.aggiorna(candidato);

		} else {
			for (CandidatoSpecializzazione cs : candidato.getCandidatoSpecializzazione()) {
				candidatoSpecializzazioneDAO.cancella(cs);
			}
		}

		return "redirect:/Candidato/{businessUnit}/{id}";
	}

// metodo per aggiornare la data di inserimento azienda del candidato dalla
// pagina del
// candidato stesso
	@RequestMapping("/ModificaDataInserimentoAzienda/{businessUnit}/{id}")
	public String modificaDataInserimentoAzienda(
			@RequestParam(name = "dataInserimentoAzienda") String dataInserimentoAzienda, @PathVariable int id,
			@PathVariable String businessUnit) throws ParseException {
		Candidato candidato = candidatoDAO.get(id);

		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

		Date dataFormattata = formatter.parse(dataInserimentoAzienda);
		candidato.setInserimentoAzienda(dataFormattata);
		candidatoDAO.aggiorna(candidato);

		return "redirect:/Candidato/{businessUnit}/{id}";
	}

	@RequestMapping("/Aggiorna/{businessUnit}/{id}/{stato}")
	public String candidatoUpdateStato(@PathVariable int id, @PathVariable String stato,
			@PathVariable String businessUnit) {
		Candidato c = candidatoDAO.get(id);
		StatoCandidato statoCandidato = (StatoCandidato) factory.getBean(stato);

		c.setStato(statoCandidato);

		candidatoDAO.aggiorna(c);

		return "redirect:/Candidato/{businessUnit}/{id}";

	}

	@RequestMapping(value = "/Candidato/{businessUnit}/{id}", method = RequestMethod.GET)
	public String Candidato(@PathVariable int id, @PathVariable String businessUnit, Model m,
			@SessionAttribute("utente") Utente utente) {

		Singleton singleton = Singleton.getInstance();

		Candidato c = candidatoDAO.get(id);

		List<Feedback> f = feedbackDAO.getByIdCandidato(id);

		m.addAttribute("mostraFeedback", f);
		m.addAttribute("mansione", new Mansione());
		m.addAttribute("mostraCandidato", c);
		m.addAttribute("businessUnit", businessUnit);
		m.addAttribute("businessList", singleton.getBusinessList());
		m.addAttribute("areaCompetenzaList", singleton.getAreaCompetenzaListString());
		m.addAttribute("mansioneList", singleton.getMansioneListString());
		m.addAttribute("specializzazioneList", singleton.getSpecializzazioneListString());
		m.addAttribute("seniorityList", singleton.getSeniorityList());
		m.addAttribute("feedback", new Feedback());
		m.addAttribute("tipoFeedback", new TipoFeedback());
		m.addAttribute("qualificationMeeting", new QualificationMeeting());

		return "Candidato";
	}

	public List<AreaCompetenza> aggiungiAreaCompetenza(String[] areeCompetenza) {

		List<AreaCompetenza> listaCompetenza = new ArrayList<AreaCompetenza>();

		for (String area : areeCompetenza) {

			AreaCompetenza areaCompetenza = new AreaCompetenza();
			areaCompetenza.setArea(area);

			listaCompetenza.add(areaCompetenza);
		}

		return listaCompetenza;
	}

	public List<Mansione> aggiungiMansione(String[] mansioni) {

		List<Mansione> listaMansione = new ArrayList<Mansione>();

		for (String mansione : mansioni) {

			Mansione mansioneDaInserire = new Mansione();
			mansioneDaInserire.setMansione(mansione);

			listaMansione.add(mansioneDaInserire);
		}

		return listaMansione;
	}

	public List<CandidatoSpecializzazione> aggiungiSpecializzazione(String[] specializzazioni, Candidato c) {

		List<CandidatoSpecializzazione> listaCandidatoSpecializzazione = new ArrayList<CandidatoSpecializzazione>();

		for (String specializzazione : specializzazioni) {
			String[] specializzazioneCorretta = specializzazione.split(" ");

			CandidatoSpecializzazione candidatoSpecializzazione = new CandidatoSpecializzazione();

			Specializzazione specializzazioneDaInserire = new Specializzazione();
			specializzazioneDaInserire.setSpecializzazione(specializzazioneCorretta[0]);

			candidatoSpecializzazione.setAnni(Integer.parseInt(specializzazioneCorretta[1]));
			candidatoSpecializzazione.setSpecializzazione(specializzazioneDaInserire);
			candidatoSpecializzazione.setCandidato(c);
			listaCandidatoSpecializzazione.add(candidatoSpecializzazione);
		}

		return listaCandidatoSpecializzazione;
	}

}