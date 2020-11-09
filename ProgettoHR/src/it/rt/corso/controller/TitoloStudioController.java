package it.rt.corso.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import it.rt.corso.DAO.CandidatoDAO;
import it.rt.corso.DAO.TitoloStudioDAO;
import it.rt.corso.beans.Candidato;
import it.rt.corso.beans.TitoloStudio;

@Controller
public class TitoloStudioController {

	private ApplicationContext factory = new ClassPathXmlApplicationContext("bean.xml");

	private TitoloStudioDAO titoloStudioDAO = (TitoloStudioDAO) factory.getBean("titoloStudioDAO");
	private CandidatoDAO candidatoDAO = (CandidatoDAO) factory.getBean("candidatoDAO");

	// TITOLO DI STUDIO

	// AGGIUNGO TITOLO DI STUDIO AL CANDIDATO
	@RequestMapping(value = "/AggiungiTitoloStudio/{businessUnit}/{id}", method = RequestMethod.POST)
	public String aggiungiTitoloStudio(@ModelAttribute("titoloStudio") TitoloStudio titoloStudio,
			@PathVariable String businessUnit, @PathVariable int id) {
		Candidato candidato = candidatoDAO.get(id);

		List<TitoloStudio> titoloStudioList = new ArrayList<TitoloStudio>();
		titoloStudioList = candidato.getTitoloStudio();
		titoloStudio.setTitoloStudio(titoloStudio.getTitoloStudio().toUpperCase());

		// faccio il save del titolo
		// controllo se questo titolo è gia stato inserito nel database
		TitoloStudio titoloStudioTemp = titoloStudioDAO.getByName(titoloStudio.getTitoloStudio());
		if (titoloStudioTemp != null) {
			titoloStudioList.add(titoloStudioTemp);
			candidato.setTitoloStudio(titoloStudioList);
			candidatoDAO.aggiorna(candidato);
		} else {
			titoloStudio = titoloStudioDAO.inserisci(titoloStudio);
			titoloStudioList.add(titoloStudio);
			candidato.setTitoloStudio(titoloStudioList);
			candidatoDAO.aggiorna(candidato);
		}

		return "redirect:/Candidato/{businessUnit}/{id}";
	}
	

	// MODIFICO TITOLO DI STUDIO DEL CANDIDATO
	@RequestMapping(value = "/ModificaTitoloStudio/{businessUnit}/{id}", method = RequestMethod.POST)
	public String modificaTitoloStudio(@ModelAttribute("titoloStudio") TitoloStudio titoloStudio,
			@PathVariable String businessUnit, @PathVariable int id) {

		titoloStudio.setTitoloStudio(titoloStudio.getTitoloStudio().toUpperCase());
		
		titoloStudioDAO.aggiorna(titoloStudio);

		return "redirect:/Candidato/{businessUnit}/{id}";
	}
	

	// ELIMINO TITOLO DI STUDIO DEL CANDIDATO
	@RequestMapping(value = "/EliminaTitoloStudio/{businessUnit}/{id}", method = RequestMethod.POST)
	public String eliminaTitoloStudio(@RequestParam("titoloStudioIdRemove") int idTitoloStudio,
			@PathVariable String businessUnit, @PathVariable int id) {

		Candidato candidato = candidatoDAO.get(id);

		TitoloStudio titoloStudioTemp = titoloStudioDAO.get(idTitoloStudio);

		titoloStudioDAO.cancella(titoloStudioTemp);

		// candidato.setTitoloStudio(candidato.getTitoloStudio().stream().filter(t ->
		// t.getId() != idTitoloStudio).collect(Collectors.toList()));
		// candidatoDAO.aggiorna(candidato);

		return "redirect:/Candidato/{businessUnit}/{id}";
	}

}
