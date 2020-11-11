package it.rt.corso.singleton;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import it.rt.corso.DAO.AreaCompetenzaDAO;
import it.rt.corso.DAO.BusinessDAO;
import it.rt.corso.DAO.CandidatoDAO;
import it.rt.corso.DAO.CompetenzaLinguisticaDAO;
import it.rt.corso.DAO.MansioneDAO;
import it.rt.corso.DAO.SeniorityDAO;
import it.rt.corso.DAO.SpecializzazioneDAO;
import it.rt.corso.DAO.StatoCandidatoDAO;
import it.rt.corso.DAO.TipoFeedbackDAO;
import it.rt.corso.beans.AreaCompetenza;
import it.rt.corso.beans.Business;
import it.rt.corso.beans.CompetenzaLinguistica;
import it.rt.corso.beans.Mansione;
import it.rt.corso.beans.Seniority;
import it.rt.corso.beans.Specializzazione;
import it.rt.corso.beans.StatoCandidato;
import it.rt.corso.beans.TipoFeedback;

/**
 * 
 * Singleton structored class used to instantiate all DAO classes and make
 * hibernate queries to get datas from all the tables.
 * 
 */
public class Singleton {

	ApplicationContext factory = new ClassPathXmlApplicationContext("bean.xml");

	// Inizializzazione DAO
	CandidatoDAO candidatoDAO = (CandidatoDAO) factory.getBean("candidatoDAO");
	SpecializzazioneDAO specializzazioneDAO = (SpecializzazioneDAO) factory.getBean("specializzazioneDAO");
	BusinessDAO businessDAO = (BusinessDAO) factory.getBean("businessDAO");
	AreaCompetenzaDAO areaCompetenzaDAO = (AreaCompetenzaDAO) factory.getBean("areaCompetenzaDAO");
	MansioneDAO mansioneDAO = (MansioneDAO) factory.getBean("mansioneDAO");
	SeniorityDAO seniorityDAO = (SeniorityDAO) factory.getBean("seniorityDAO");
	StatoCandidatoDAO statoCandidatoDAO = (StatoCandidatoDAO) factory.getBean("statoCandidatoDAO");
	TipoFeedbackDAO tipoFeedbackDAO = (TipoFeedbackDAO) factory.getBean("tipoFeedbackDAO");
	CompetenzaLinguisticaDAO competenzaLinguisticaDAO = (CompetenzaLinguisticaDAO) factory.getBean("competenzaLinguisticaDAO");

	// static variable single_instance of type Singleton
	private static Singleton single_instance = null;

	private static List<Business> businessList = new ArrayList<Business>();
	private static List<AreaCompetenza> areaCompetenzaList = new ArrayList<AreaCompetenza>();;
	private static List<Mansione> mansioneList = new ArrayList<Mansione>();
	private static List<Specializzazione> specializzazioneList = new ArrayList<Specializzazione>();
	private static List<Seniority> seniorityList = new ArrayList<Seniority>();
	private static List<StatoCandidato> statoCandidatoList = new ArrayList<StatoCandidato>();
	private static List<TipoFeedback> tipoFeedbackList = new ArrayList<TipoFeedback>();
	private static List<CompetenzaLinguistica> competenzaLinguisticaList = new ArrayList<CompetenzaLinguistica>();

	// private constructor restricted to this class itself
	private Singleton() {
		businessList = businessDAO.getLista();
		areaCompetenzaList = areaCompetenzaDAO.getLista();
		mansioneList = mansioneDAO.getLista();
		specializzazioneList = specializzazioneDAO.getLista();
		seniorityList = seniorityDAO.getLista();
		statoCandidatoList = statoCandidatoDAO.getAllFromStato();
		tipoFeedbackList = tipoFeedbackDAO.getLista();
		competenzaLinguisticaList = competenzaLinguisticaDAO.getLista();
	}

	/**
	 * 
	 * Static method used to create instance of Singleton class objects if it's not
	 * have been already instanciated; in that case it will return the already
	 * instantiated object.
	 * 
	 * @return instanciated <code>Singleton</code> type object.
	 * 
	 */
	public static Singleton getInstance() {
		if (single_instance == null)
			single_instance = new Singleton();

		return single_instance;
	}

	public List<Business> getBusinessList() {
		return businessList;
	}

	public List<AreaCompetenza> getAreaCompetenzaList() {
		return areaCompetenzaList;
	}

	public List<Mansione> getMansioneList() {
		return mansioneList;
	}

	public List<Seniority> getSeniorityList() {
		return seniorityList;
	}
	
	public List<CompetenzaLinguistica> getCompetenzaLinguisticaList() {
		return competenzaLinguisticaList;
	}

	public List<Specializzazione> getSpecializzazioneList() {
		return specializzazioneList;
	}

	public List<StatoCandidato> getStatoCandidatoList() {
		return statoCandidatoList;
	}

	public List<TipoFeedback> getTipoFeedbackList() {
		return tipoFeedbackList;
	}

	public List<String> getAreaCompetenzaListString() {
		return areaCompetenzaList.stream().map(AreaCompetenza::getArea).collect(Collectors.toList());

	}

	public List<String> getMansioneListString() {
		return mansioneList.stream().map(Mansione::getMansione).collect(Collectors.toList());
	}

	public List<String> getSpecializzazioneListString() {
		return specializzazioneList.stream().map(Specializzazione::getSpecializzazione).collect(Collectors.toList());
	}

	public void aggiornaAreaCompetenza() {
		areaCompetenzaList = areaCompetenzaDAO.getLista();
	}

	public void aggiornaMansione() {
		mansioneList = mansioneDAO.getLista();
	}

	public void aggiornaSpecializzazione() {
		specializzazioneList = specializzazioneDAO.getLista();
	}
	
	public void aggiornaCompetenzaLinguistica() {
		competenzaLinguisticaList = competenzaLinguisticaDAO.getLista();
	}
}
