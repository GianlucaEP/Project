package it.rt.corso.DAOImpl;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;

import org.hibernate.query.Query;

import it.rt.corso.DAO.BaseDAO;
import it.rt.corso.DAO.CandidatoDAO;
import it.rt.corso.beans.Business;
import it.rt.corso.beans.Candidato;
import it.rt.corso.beans.Funzionalita;
import it.rt.corso.utility.Utility;

public class CandidatoDAOImpl extends BaseDAO implements CandidatoDAO {

	@Override
	public Candidato inserisci(Candidato candidato) {
		return (Candidato) super.inserisci(candidato);
	}

	@Override
	public List<Candidato> getLista() {

		Utility.buildSession();
		List<Candidato> listacandidato = Utility.getSession().createQuery("FROM Candidato ").getResultList();

		return listacandidato;
	}

	@Override
	public Candidato get(int id) {
		return (Candidato) super.get(Candidato.class, id);
	}

	@Override
	public Candidato cancella(Candidato candidato) {
		return (Candidato) super.cancella(candidato);
	}

	@Override
	public Candidato aggiorna(Candidato candidato) {
		return (Candidato) super.aggiorna(candidato);
	}

	@Override
	public List<Candidato> getListaByBusinessUnit(String businessUnit) {

		Utility.buildSession();
		Set<Candidato> lista = Utility.getSession().byId(Business.class).getReference(businessUnit).getCandidato();

		List<Candidato> listacandidatoByBusinessUnit = new ArrayList<>(lista);
		return listacandidatoByBusinessUnit;
	}

}
