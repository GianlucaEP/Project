package it.rt.corso.filter;

import java.util.List;

import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import it.rt.corso.DAO.FeedbackDAO;
import it.rt.corso.beans.Candidato;

public class CandidatoFilter implements CandidatoFilterInterface {

	@Override
	public List<Predicate> checkFilter(List<Predicate> listaPredicati, Root<Candidato> root,
			String valore, String nomeFiltro) {
		ApplicationContext factory = new ClassPathXmlApplicationContext("bean.xml");
		List<CandidatoFilter> filterList = (List<CandidatoFilter>) factory.getBean("filterList");
		for(CandidatoFilter filter : filterList) {
			listaPredicati = filter.checkFilter(listaPredicati, root, valore, nomeFiltro);
		}
		
		return listaPredicati;

	}

}
