package it.rt.corso.DAOImpl;

import java.util.List;
import it.rt.corso.DAO.BaseDAO;
import it.rt.corso.DAO.CandidatoDAO;
import it.rt.corso.beans.Candidato;
import it.rt.corso.utility.Utility;

public class CandidatoDAOImpl extends BaseDAO implements CandidatoDAO{

	public Candidato inserisci(Candidato candidato) {
		return (Candidato) super.inserisci(candidato);
	}

	public List<Candidato> getLista() {
		
		Utility.buildSession();
		
		List<Candidato> listacandidati = Utility.getSession().createQuery(" FROM Candidato ").getResultList();
		return listacandidati;
	}

	public Candidato get(int id) {
		return (Candidato) super.get(Candidato.class, id);
	}

	public Candidato cancella(Candidato candidato) {
		return (Candidato) super.cancella(candidato);
	}

	public Candidato aggiorna(Candidato candidato) {
		return (Candidato) super.aggiorna(candidato);
	}

}
