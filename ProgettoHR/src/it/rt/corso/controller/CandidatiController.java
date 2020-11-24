package it.rt.corso.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.stream.Collectors;

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

	private ApplicationContext factory = new ClassPathXmlApplicationContext("bean.xml");

// Inizializzazione DAO
	private FeedbackDAO feedbackDAO = (FeedbackDAO) factory.getBean("feedbackDAO");
	private CandidatoDAO candidatoDAO = (CandidatoDAO) factory.getBean("candidatoDAO");
	private CandidatoSpecializzazioneDAO candidatoSpecializzazioneDAO = (CandidatoSpecializzazioneDAO) factory
			.getBean("candidatoSpecializzazioneDAO");
	private EconomicsDAO economicsDAO = (EconomicsDAO) factory.getBean("economicsDAO");
	private CostoDAO costoDAO = (CostoDAO) factory.getBean("costoDAO");

	@InitBinder
	public final void initBinderUsuariosFormValidator(final WebDataBinder binder, final Locale locale) {
		final SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd", locale);
		binder.registerCustomEditor(Date.class, "inserimentoAzienda", new CustomDateEditor(dateFormat, true));
	}

	/**
	 * Shows the JSP showing the form to add {@link Candidato Candidato} objects to database.
	 * 
	 * @param m instantiate a {@link Model Model} object to create a model attribute.
	 * @param businessUnit business unit String obtained from the URL.
	 * @param utente session attribute of type utente, if it's not null you are logged in session. 
	 * 
	 * @return JSP URL
	 * */
	@RequestMapping("/Candidati/{businessUnit}")
	public String formAggiungiCandidato(Model m, @PathVariable String businessUnit,
			@SessionAttribute("utente") Utente utente) {

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

	/**
	 * Save a new {@link Candidato Candidato} object in database when added from the Candidati page.
	 * 
	 * @param candidato {@link Candidato Candidato} present in the request.
	 * @param businessUnit business unit String obtained from the URL.
	 * @param utente session attribute of type utente, if it's not null you are logged in session. 
	 * @param dataNascita date <code>String</code> that have to be formatted to a {@link Date Date} object
	 * 
	 * @return JSP URL
	 * */
	@RequestMapping(value = "/CandidatiSave/{businessUnit}", method = RequestMethod.POST)
	public String aggiungiCandidato(HttpServletRequest request, @PathVariable String businessUnit,
			@ModelAttribute("candidato") Candidato candidato, @SessionAttribute("utente") Utente utente,
			@RequestParam("dataDiNascita") String dataNascita) throws ParseException {

		StatoCandidato stato = (StatoCandidato) factory.getBean("inserito");
		candidato.setStato(stato);

		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		candidato.setDataNascita(formatter.parse(dataNascita));

		candidato.setInseritoDa(utente);

		String[] areeCompetenza = request.getParameterValues("areaCompetenza");
		if (areeCompetenza != null) {
			candidato.setArea(aggiungiAreaCompetenza(areeCompetenza));
		}

		String[] mansioni = request.getParameterValues("mansioni");
		if (mansioni != null) {
			candidato.setMansione(aggiungiMansione(mansioni));
		}

		String[] specializzazioni = request.getParameterValues("specializzazione");
		if (specializzazioni != null) {
			candidato.setCandidatoSpecializzazione(aggiungiSpecializzazione(specializzazioni, candidato));
		}

		candidatoDAO.inserisci(candidato);

		return "redirect:/Home/{businessUnit}";

	}

	/**
	 * Delete a {@link Candidato Candidato} object from database when deleted from the Candidati page.
	 * 
	 * @param idCandidato id used to search the candidato that have to be deleted from database. 
	 * @param businessUnit business unit String obtained from the URL.
	 * 
	 * @return JSP URL
	 * */
	@RequestMapping(value = "/Elimina/{businessUnit}", method = RequestMethod.POST)
	public String elimina(@RequestParam("idCandidato") int idCandidato, @PathVariable String businessUnit) {
		Candidato c = candidatoDAO.get(idCandidato);
		candidatoDAO.cancella(c);
		return "redirect:/Home/{businessUnit}";
	}

	/**
	 * Update a {@link Candidato Candidato} object in database when updated from the Candidati page.
	 * 
	 * @param idCandidato id used to search the candidato that will be updated from database. 
	 * @param businessUnit business unit String obtained from the URL.
	 * @param dataNascita date <code>String</code> that have to be formatted to a {@link Date Date} object
	 * 
	 * @return JSP URL
	 * */
	@RequestMapping(value = "/ModificaAnagrafica/{businessUnit}/{id}", method = RequestMethod.POST)
	public String modificaAnagrafica(@ModelAttribute("mostraCandidato") Candidato c, @PathVariable int idCandidato,
			@PathVariable String businessUnit, @RequestParam("dataDiNascita") String dataNascita)
			throws ParseException {

		Candidato candidato = candidatoDAO.get(idCandidato);

		candidato.setNome(c.getNome());
		candidato.setCognome(c.getCognome());
		candidato.setTelefono(c.getTelefono());
		candidato.setEmail(c.getEmail());
		candidato.setCodiceFiscale(c.getCodiceFiscale());
		candidato.setProvenienza(c.getProvenienza());

		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		candidato.setDataNascita(formatter.parse(dataNascita));

		if (c.isCategoriaProtetta()) {
			candidato.setCategoriaProtetta(true);
		} else
			candidato.setCategoriaProtetta(false);

		candidatoDAO.aggiorna(candidato);
		return "redirect:/Candidato/{businessUnit}/{id}";
	}

	/**
	 * Update or add a {@link Costo Costo} object in database when updated or added from the Candidati page.
	 * 
	 * @param c {@link Candidato Candidato} wich the updated or added {@link Costo Costo} object will be referenced.
	 * @param idCandidato id used to search the candidato that will be updated from database. 
	 * @param businessUnit business unit String obtained from the URL.
	 * 
	 * @return JSP URL
	 * */
	@RequestMapping(value = "/AggiungiModificaCosto/{businessUnit}/{id}", method = RequestMethod.POST)
	public String modificaCosto(@ModelAttribute("mostraCandidato") Candidato c, @PathVariable int idCandidato,
			@PathVariable String businessUnit) {
		Candidato candidato = candidatoDAO.get(idCandidato);

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


	
	/**
	 * Update or add a {@link Economics Economics} object in database when updated or added from the Candidati page.
	 * 
	 * @param c {@link Candidato Candidato} wich the updated or added {@link Economics Economics} object will be referenced.
	 * @param idCandidato id used to search the candidato that will be updated from database. 
	 * @param businessUnit business unit String obtained from the URL.
	 * 
	 * @return JSP URL
	 * */
	@RequestMapping(value = "/AggiungiModificaEconomics/{businessUnit}/{id}", method = RequestMethod.POST)
	public String modificaEconomics(@ModelAttribute("mostraCandidato") Candidato c, @PathVariable int idCandidato,
			@PathVariable String businessUnit) {
		Candidato candidato = candidatoDAO.get(idCandidato);

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

	/**
	 * Update or add a {@link Seniority Seniority} object in database when updated or added from the Candidati page.
	 * 
	 * @param seniority {@link Seniority Seniority} wich the updated or added {@link Seniority Seniority} object will be referenced.
	 * @param idCandidato id used to search the candidato that will be updated from database. 
	 * @param businessUnit business unit String obtained from the URL.
	 * 
	 * @return JSP URL
	 * */
	@RequestMapping("/ModificaSeniority/{businessUnit}/{id}")
	public String modificaSeniority(@RequestParam(name = "seniority") String seniority, @PathVariable int idCandidato,
			@PathVariable String businessUnit) {
		Candidato candidato = candidatoDAO.get(idCandidato);
		candidato.getSeniority().setSeniority(seniority);
		candidatoDAO.aggiorna(candidato);

		return "redirect:/Candidato/{businessUnit}/{id}";
	}
	
	
	/**
	 * Update or add a {@link BusinessUnit BusinessUnit} object in database when updated or added from the Candidati page.
	 * 
	 * @param idCandidato id used to search the candidato that will be updated from database. 
	 * @param businessUnit business unit String obtained from the URL.
	 * 
	 * @return JSP URL
	 * */
	@RequestMapping("/ModificaBusinessUnit/{businessUnit}/{id}")
	public String modificaBusinessUnit(@RequestParam(name = "businessUnit") String businessUnit, @PathVariable int idCandidato) {
		Candidato candidato = candidatoDAO.get(idCandidato);
		candidato.getBusiness().setBusiness(businessUnit);
		candidatoDAO.aggiorna(candidato);

		return "redirect:/Candidato/{businessUnit}/{id}";
	}

	/**
	 * Update or add a {@link AreaCompetenza AreaCompetenza} object in database when updated or added from the Candidati page.
	 * 
	 * @param c {@link AreaCompetenza AreaCompetenza} wiche the updated or added {@link AreaCompetenza AreaCompetenza} object will be referenced.
	 * @param idCandidato id used to search the candidato that will be updated from database. 
	 * @param businessUnit business unit String obtained from the URL.
	 * 
	 * @return JSP URL
	 * */
	@RequestMapping("/ModificaAreaCompetenza/{businessUnit}/{id}")
	public String modificaAreaCompetenza(HttpServletRequest request, @PathVariable int idCandidato,
			@PathVariable String businessUnit) {

		Candidato candidato = candidatoDAO.get(idCandidato);

		String[] areeCompetenza = request.getParameterValues("areaCompetenza");
		if (areeCompetenza != null) {
			candidato.setArea(aggiungiAreaCompetenza(areeCompetenza));
		} else {
			candidato.setArea(new ArrayList<AreaCompetenza>());
		}

		candidatoDAO.aggiorna(candidato);

		return "redirect:/Candidato/{businessUnit}/{id}";
	}

	/**
	 * Update or add a {@link Mansione Mansione} object in database when updated or added from the Candidati page.
	 * 
	 * @param request {@link HttpServletRequest HttpServletRequest} Object used to get the string mansione from the request.
	 * @param idCandidato id used to search the candidato that will be updated from database. 
	 * @param businessUnit business unit String obtained from the URL.
	 * 
	 * @return JSP URL
	 * */
	@RequestMapping("/ModificaMansione/{businessUnit}/{id}")
	public String modificaMansione(HttpServletRequest request, @PathVariable int idCandidato,
			@PathVariable String businessUnit) {

		Candidato candidato = candidatoDAO.get(idCandidato);

		String[] mansioni = request.getParameterValues("mansione");
		if (mansioni != null) {
			candidato.setMansione(aggiungiMansione(mansioni));
		} else {
			candidato.setMansione(new ArrayList<Mansione>());
		}

		candidatoDAO.aggiorna(candidato);

		return "redirect:/Candidato/{businessUnit}/{id}";
	}

	/**
	 * Update or add a {@link Specializzazione Specializzazione} object in database when updated or added from the Candidati page.
	 * 
	 * @param request {@link HttpServletRequest HttpServletRequest} Object used to get the string specializzazione from the request.
	 * @param idCandidato id used to search the candidato that will be updated from database. 
	 * @param businessUnit business unit String obtained from the URL.
	 * 
	 * @return JSP URL
	 * */
	@RequestMapping("/ModificaSpecializzazione/{businessUnit}/{id}")
	public String modificaSpecializzazione(HttpServletRequest request, @PathVariable int idCandidato,
			@PathVariable String businessUnit) {
		Candidato candidato = candidatoDAO.get(idCandidato);

		String[] specializzazioni = request.getParameterValues("specializzazione");
		if (specializzazioni != null) {

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

	/**
	 * Update <code>dataInserimentoAzienda</code> in a {@link Candidato Candidato} object in database when updated from the Candidati page.
	 * 
	 * @param dataInserimentoAzienda String containing the new dataInserimento.
	 * @param idCandidato id used to search the candidato that will be updated from database. 
	 * @param businessUnit business unit String obtained from the URL.
	 * 
	 * @return JSP URL
	 * */
	@RequestMapping("/ModificaDataInserimentoAzienda/{businessUnit}/{id}")
	public String modificaDataInserimentoAzienda(
			@RequestParam(name = "dataInserimentoAzienda") String dataInserimentoAzienda, @PathVariable int idCandidato,
			@PathVariable String businessUnit) throws ParseException {
		Candidato candidato = candidatoDAO.get(idCandidato);

		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

		Date dataFormattata = formatter.parse(dataInserimentoAzienda);
		candidato.setInserimentoAzienda(dataFormattata);
		candidatoDAO.aggiorna(candidato);

		return "redirect:/Candidato/{businessUnit}/{id}";
	}

	/**
	 * Update <code>statoCandidato</code> in a {@link StatoCandidato StatoCandidato} object in database when updated from the Candidati page.
	 * 
	 * @param stato String containing the new stato.
	 * @param idCandidato id used to search the candidato that will be updated from database. 
	 * @param businessUnit business unit String obtained from the URL.
	 * 
	 * @return JSP URL
	 * */
	@RequestMapping("/Aggiorna/{businessUnit}/{id}/{stato}")
	public String candidatoUpdateStato(@PathVariable int idCandidato, @PathVariable String stato,
			@PathVariable String businessUnit) {
		Candidato c = candidatoDAO.get(idCandidato);
		StatoCandidato statoCandidato = (StatoCandidato) factory.getBean(stato);

		c.setStato(statoCandidato);

		candidatoDAO.aggiorna(c);

		return "redirect:/Candidato/{businessUnit}/{id}";

	}

	/**
	 * Show the selected {@link Candidato Candidato} from the Home page in the Candidato Page.
	 *  
	 * @param id id used to search the candidato that will be updated from database. 
	 * @param businessUnit business unit String obtained from the URL.
	 * @param m {@link Model Model} type Object used to store daat in the model attribute.
	 * @param utente session attribute of type utente, if it's not null you are logged in session. 
	 * 
	 * @return JSP URL
	 * */
	@RequestMapping(value = "/Candidato/{businessUnit}/{id}", method = RequestMethod.GET)
	public String Candidato(@PathVariable int id, @PathVariable String businessUnit, Model m,
			@SessionAttribute("utente") Utente utente) {

		Singleton singleton = Singleton.getInstance();

		Candidato c = candidatoDAO.get(id);

		List<Feedback> f = feedbackDAO.getByIdCandidato(id);

		List<String> listaFunzionalita = utente.getRuolo().getFunzionalita().stream().map(Funzionalita::getFunzionalita)
				.collect(Collectors.toList());

		m.addAttribute("titoloStudio", new TitoloStudio());
		m.addAttribute("candidatoCompetenzaLinguistica", new CandidatoCompetenzaLinguistica());
		m.addAttribute("mostraFeedback", f);
		m.addAttribute("mansione", new Mansione());
		m.addAttribute("mostraCandidato", c);
		m.addAttribute("businessUnit", businessUnit);
		m.addAttribute("businessList", singleton.getBusinessList());
		m.addAttribute("competenzaLinguisticaList", singleton.getCompetenzaLinguisticaList());
		m.addAttribute("areaCompetenzaList", singleton.getAreaCompetenzaListString());
		m.addAttribute("mansioneList", singleton.getMansioneListString());
		m.addAttribute("specializzazioneList", singleton.getSpecializzazioneListString());
		m.addAttribute("seniorityList", singleton.getSeniorityList());
		m.addAttribute("tipoFeedbackList", singleton.getTipoFeedbackList());
		m.addAttribute("feedback", new Feedback());
		m.addAttribute("tipoFeedback", new TipoFeedback());
		m.addAttribute("qualificationMeeting", new QualificationMeeting());
		m.addAttribute("funzionalita", listaFunzionalita);

		return "Candidato";
	}

	/**
	 *  Create an {@link AreaCompetenza AreaCompetenza} <code>List</code> from a given <code>Array</code> of <code>String</code>.
	 * 
	 *  @param areeCompetenza array of strings containing the name of the new aree competenza that will be added.
	 *  
	 *  @return listaCompetenza
	 * */
	public List<AreaCompetenza> aggiungiAreaCompetenza(String[] areeCompetenza) {

		List<AreaCompetenza> listaCompetenza = new ArrayList<AreaCompetenza>();

		for (String area : areeCompetenza) {

			AreaCompetenza areaCompetenza = new AreaCompetenza();
			areaCompetenza.setArea(area);

			listaCompetenza.add(areaCompetenza);
		}

		return listaCompetenza;
	}

	/**
	 *  Create a {@link Mansione Mansione} <code>List</code> from a given <code>Array</code> of <code>String</code>.
	 * 
	 *  @param mansioni array of strings containing the name of the new mansioni that will be added.
	 *  
	 *  @return listaMansione
	 * */
	public List<Mansione> aggiungiMansione(String[] mansioni) {

		List<Mansione> listaMansione = new ArrayList<Mansione>();

		for (String mansione : mansioni) {

			Mansione mansioneDaInserire = new Mansione();
			mansioneDaInserire.setMansione(mansione);

			listaMansione.add(mansioneDaInserire);
		}

		return listaMansione;
	}

	/**
	 *  Create a {@link Specializzazione Specializzazione} <code>List</code> from a given <code>Array</code> of <code>String</code>.
	 * 
	 *  @param specializzazioni array of strings containing the name of the new specializzazioni that will be added.
	 *  @param c {@link Candidato Candidato} object to create listaCandidatoSpecializzazione List
	 *  
	 *  @return listaCandidatoSpecializzazione
	 * */
	public List<CandidatoSpecializzazione> aggiungiSpecializzazione(String[] specializzazioni, Candidato c) {

		List<CandidatoSpecializzazione> listaCandidatoSpecializzazione = new ArrayList<CandidatoSpecializzazione>();

		for (String specializzazione : specializzazioni) {
//			String[] specializzazioneCorretta = specializzazione.split(" ");

			CandidatoSpecializzazione candidatoSpecializzazione = new CandidatoSpecializzazione();

			Specializzazione specializzazioneDaInserire = new Specializzazione();
			specializzazioneDaInserire.setSpecializzazione(getSpecializzazioneName(specializzazione));

			candidatoSpecializzazione.setAnni(getAnniSpecializzazione(specializzazione));
			candidatoSpecializzazione.setSpecializzazione(specializzazioneDaInserire);
			candidatoSpecializzazione.setCandidato(c);
			listaCandidatoSpecializzazione.add(candidatoSpecializzazione);
		}

		return listaCandidatoSpecializzazione;
	}

	/**
	 * Get anni specializzazione from a given specializzazione String by removing the Specializzazione name from the String.
	 * 
	 * @param specializzazione the given specializzazione String.
	 * */
	private static int getAnniSpecializzazione(String specializzazione) {

		if (Character.isDigit(specializzazione.charAt(specializzazione.length() - 1))) {
			return Integer.parseInt(
					specializzazione.substring(specializzazione.lastIndexOf(" ") + 1, specializzazione.length()));
		}
		return 0;
	}

	/**
	 * Get specializzazione from a given specializzazione String by removing anni specializzazione from the string.
	 * 
	 * @param specializzazione the given specializzazione String.
	 * */
	private static String getSpecializzazioneName(String specializzazione) {
		if (Character.isDigit(specializzazione.charAt(specializzazione.length() - 1))) {
			return specializzazione.substring(0, specializzazione.lastIndexOf(" "));
		}
		return specializzazione.substring(0, specializzazione.length() - 1);

	}

}