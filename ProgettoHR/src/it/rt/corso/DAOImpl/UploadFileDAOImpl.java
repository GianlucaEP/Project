package it.rt.corso.DAOImpl;

import java.util.List;

import it.rt.corso.DAO.BaseDAO;
import it.rt.corso.DAO.UploadFileDAO;
import it.rt.corso.beans.Costo;
import it.rt.corso.beans.UploadFile;
import it.rt.corso.utility.Utility;

public class UploadFileDAOImpl extends BaseDAO implements UploadFileDAO {

	@Override
	public UploadFile inserisci(UploadFile file) {
		return (UploadFile) super.inserisci(file);
	}

	@Override
	public UploadFile get(int id) {
		return (UploadFile) super.get(UploadFile.class, id);
	}

	@Override
	public List<UploadFile> getByIdCandidato(int id) {

		Utility.buildSession();

		List<UploadFile> listaCosto = Utility.getSession().createQuery(" FROM UploadFile WHERE id_candidato=:id")
				.setParameter("id", id).getResultList();

		return listaCosto;
	}

}
