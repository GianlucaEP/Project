package it.rt.corso.DAO;

import java.util.List;

import it.rt.corso.beans.UploadFile;

public interface UploadFileDAO {

	public UploadFile inserisci(UploadFile file);

	public UploadFile get(int id);

	public List<UploadFile> getByIdCandidato(int id);
}
