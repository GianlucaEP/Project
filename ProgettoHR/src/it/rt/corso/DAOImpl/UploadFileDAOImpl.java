package it.rt.corso.DAOImpl;

import java.util.List;

import it.rt.corso.DAO.BaseDAO;
import it.rt.corso.DAO.UploadFileDAO;
import it.rt.corso.beans.UploadFile;
import it.rt.corso.utility.Utility;
@SuppressWarnings("unchecked")
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
	public UploadFile cancella(UploadFile file) {
		return (UploadFile) super.cancella(file);
	}

	@Override
	public List<UploadFile> getByIdCandidato(int id) {


		List<UploadFile> listaCosto = Utility.getSession().createQuery(" FROM UploadFile WHERE id_candidato=:id")
				.setParameter("id", id).getResultList();
		Utility.destroySession();
		return listaCosto;
	}

}
