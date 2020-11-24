package it.rt.corso.DAO;

import java.util.List;

import it.rt.corso.beans.UploadFile;

public interface UploadFileDAO {

	/**
	 * Add the given UploadFile entity to file table.
	 * 
	 * @param file given UploadFile entity
	 * 
	 * @return the added UploadFile entity
	 * */
	public UploadFile inserisci(UploadFile file);

	/**
	 * Get a UploadFile entity corresponding to the given UploadFile id.
	 * 
	 * @param id the given id
	 * 
	 * @return the UploadFile object that has been found.
	 * */
	public UploadFile get(int id);
	
	/**
	 * Delete a UploadFile entity corresponding to the given UploadFile Object.
	 * 
	 * @param file the given UploadFile object
	 * 
	 * @return the deleted UploadFile object
	 * */
	public UploadFile cancella(UploadFile file);

	/**
	 * Get the List of all the UploadFile entities referenced to the given Candidato id
	 * 
	 * @param id the given UploadFile id
	 * 
	 * @return the UploadFile object that has been found.
	 * */
	public List<UploadFile> getByIdCandidato(int id);
}
