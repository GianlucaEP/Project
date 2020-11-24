package it.rt.corso.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import it.rt.corso.DAO.CandidatoCompetenzaLinguisticaDAO;
import it.rt.corso.DAO.CandidatoDAO;
import it.rt.corso.DAO.CompetenzaLinguisticaDAO;
import it.rt.corso.beans.Candidato;
import it.rt.corso.beans.CandidatoCompetenzaLinguistica;
import it.rt.corso.beans.CompetenzaLinguistica;
import it.rt.corso.singleton.Singleton;

@Controller
public class CompetenzaLinguisticaController {

	private ApplicationContext factory = new ClassPathXmlApplicationContext("bean.xml");

	private CompetenzaLinguisticaDAO competenzaLinguisticaDAO = (CompetenzaLinguisticaDAO) factory
			.getBean("competenzaLinguisticaDAO");
	private CandidatoCompetenzaLinguisticaDAO candidatoCompetenzaLinguisticaDAO = (CandidatoCompetenzaLinguisticaDAO) factory
			.getBean("candidatoCompetenzaLinguisticaDAO");
	private CandidatoDAO candidatoDAO = (CandidatoDAO) factory.getBean("candidatoDAO");

	/**
	 * Add a new selected competenza linguistica to a given candidato.
	 * 
	 * @param comp         {@link CandidatoCompetenzaLinguistica
	 *                     CandidatoCompetenzaLinguistica} object present in the
	 *                     model attribute
	 * @param businessUnit selected business unit present in the URL.
	 * @param id           id of the selected Candidato present in the URL.
	 * 
	 * @return JSP URL.
	 */
	@RequestMapping(value = "/AggiungiCompetenzaLinguistica/{businessUnit}/{id}", method = RequestMethod.POST)
	public String aggiungiCompetenzaLinguistica(
			@ModelAttribute("candidatoCompetenzaLinguistica") CandidatoCompetenzaLinguistica comp,
			@PathVariable String businessUnit, @PathVariable int id) {

		Candidato candidato = candidatoDAO.get(id);

		List<CandidatoCompetenzaLinguistica> compList = new ArrayList<CandidatoCompetenzaLinguistica>();
		compList = candidato.getCandidatoCompetenzaLingustica();

		CompetenzaLinguistica competenzaLinguisticaTemp = getCompetenzaLinguistica(comp.getCompetenzaLinguistica());

		comp.setCompetenzaLinguistica(competenzaLinguisticaTemp);
		comp.setCandidato(candidato);
		compList.add(comp);
		candidato.setCandidatoCompetenzaLingustica(compList);
		candidatoDAO.aggiorna(candidato);

		return "redirect:/Candidato/{businessUnit}/{id}";

	}

	/**
	 * Update the selected competenza linguistica to a given candidato.
	 * 
	 * @param comp         {@link CandidatoCompetenzaLinguistica
	 *                     CandidatoCompetenzaLinguistica} object present in the
	 *                     model attribute
	 * @param businessUnit selected business unit present in the URL.
	 * @param id           id of the selected Candidato present in the URL.
	 * 
	 * @return JSP URL.
	 */
	@RequestMapping(value = "/ModificaCompetenzaLinguistica/{businessUnit}/{id}", method = RequestMethod.POST)
	public String ModificaCompetenzaLinguistica(
			@ModelAttribute("candidatoCompetenzaLinguistica") CandidatoCompetenzaLinguistica comp,
			@PathVariable String businessUnit, @PathVariable int id) {

		Candidato candidato = candidatoDAO.get(id);

		List<CandidatoCompetenzaLinguistica> compList = new ArrayList<CandidatoCompetenzaLinguistica>();

		int removeCompetenzaLinguisticaId = comp.getCompetenzaLinguistica().getId();

		compList = candidato.getCandidatoCompetenzaLingustica().stream()
				.filter(c -> c.getCompetenzaLinguistica().getId() != removeCompetenzaLinguisticaId)
				.collect(Collectors.toList());

		Optional<CandidatoCompetenzaLinguistica> compTemp = candidato.getCandidatoCompetenzaLingustica().stream()
				.filter(c -> c.getCompetenzaLinguistica().getId() == removeCompetenzaLinguisticaId).findFirst();

		candidatoCompetenzaLinguisticaDAO.cancella(compTemp.get());

		CompetenzaLinguistica competenzaLinguisticaTemp = getCompetenzaLinguistica(comp.getCompetenzaLinguistica());
		comp.setCompetenzaLinguistica(competenzaLinguisticaTemp);
		comp.setCandidato(candidato);
		compList.add(comp);
		candidato.setCandidatoCompetenzaLingustica(compList);

		candidatoDAO.aggiorna(candidato);

		return "redirect:/Candidato/{businessUnit}/{id}";

	}

	/**
	 * Remove the selected competenza linguistica from a Candidato selected by the
	 * given id.
	 * 
	 * @param comp                          {@link CandidatoCompetenzaLinguistica
	 *                                      CandidatoCompetenzaLinguistica} object
	 *                                      present in the model attribute
	 * @param removeCompetenzaLinguisticaId id of the selected competenzaLinguistica
	 *                                      that will be removed.
	 * @param businessUnit                  selected business unit present in the
	 *                                      URL.
	 * @param id                            id of the selected Candidato present in
	 *                                      the URL.
	 * 
	 * @return JSP URL.
	 */
	@RequestMapping(value = "/EliminaCompetenzaLinguistica/{businessUnit}/{id}", method = RequestMethod.POST)
	public String eliminaCompetenzaLinguistica(
			@RequestParam("removeCompetenzaLinguistica") int removeCompetenzaLinguisticaId,
			@PathVariable String businessUnit, @PathVariable int id) {

		Candidato candidato = candidatoDAO.get(id);

		Optional<CandidatoCompetenzaLinguistica> comp = candidato.getCandidatoCompetenzaLingustica().stream()
				.filter(c -> c.getCompetenzaLinguistica().getId() == removeCompetenzaLinguisticaId).findFirst();

		candidatoCompetenzaLinguisticaDAO.cancella(comp.get());

		return "redirect:/Candidato/{businessUnit}/{id}";
	}

	/**
	 * Control if a CompetenzaLinguistica Object exists, if it doesn't it will be added to the database, otherwise the Given CompetenzaLinguistica will be returned.
	 * */
	public CompetenzaLinguistica getCompetenzaLinguistica(CompetenzaLinguistica comp) {

		CompetenzaLinguistica competenzaLinguisticaTemp = competenzaLinguisticaDAO
				.getByName(comp.getLingua().toUpperCase());

		// SE LA LINGUA NON è PRESENTE IN DATABASE LA AGGIUNGO
		if (competenzaLinguisticaTemp == null) {
			competenzaLinguisticaTemp = comp;
			competenzaLinguisticaTemp = competenzaLinguisticaDAO.inserisci(competenzaLinguisticaTemp);
			// AGGIORNO IL SINGLETON DELLA LISTA DELLE COMPETENZE LINGUISTICHE PER
			// AGGIUNGERE AL PROGRAMMA IN SESSIONE LA NUOVA COMPETENZA LINGUISTICA
			Singleton singleton = Singleton.getInstance();
			singleton.aggiornaCompetenzaLinguistica();
		}

		return competenzaLinguisticaTemp;

	}
}
