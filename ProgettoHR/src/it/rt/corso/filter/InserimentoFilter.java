package it.rt.corso.filter;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.hibernate.Session;

import it.rt.corso.beans.Candidato;
import it.rt.corso.utility.Utility;

public class InserimentoFilter extends CandidatoFilter{
	@Override
	public List<Predicate> checkFilter(List<Predicate> listaPredicati, Root<Candidato> root, String nomeFiltro,
			String valore) {

		if (nomeFiltro.contains("data")) {

			Session session = Utility.getSession();

			CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
			SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
//			Date dataFrom = date.parse(valore);
//			listaPredicati.add(criteriaBuilder.lessThanOrEqualTo(root.get("dateCreated").as(Date.class), valore));
			return listaPredicati;
		} else {
			return listaPredicati;
		}
		
	}
}
