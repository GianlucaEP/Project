package it.rt.corso.DAO;

import java.util.List;

import it.rt.corso.beans.QualificationMeeting;

public interface QualificationMeetingDAO {

	/**
	 * Add the given QualificationMeeting entity to qualification_meeting table.
	 * 
	 * @param economics given QualificationMeeting entity
	 * 
	 * @return the added QualificationMeeting entity
	 * */
	public QualificationMeeting inserisci(QualificationMeeting qm);

	/**
	 * Update a QualificationMeeting entity corresponding to the given QualificationMeeting Object.
	 * 
	 * @param qualificationMeeting the given QualificationMeeting object
	 * 
	 * @return the updated QualificationMeeting object
	 * */
	public QualificationMeeting aggiorna(QualificationMeeting qm);

	/**
	 * Get a QualificationMeeting entity corresponding to the given Candidato id.
	 * 
	 * @param id the given id
	 * 
	 * @return the QualificationMeeting object that has been found.
	 * */
	public QualificationMeeting get(int id);
	
	
	/**
	 * Get all QualificationMeeting entities.
	 * 
	 * @return the QualificationMeeting List of objects that has been found.
	 * */
	public List<QualificationMeeting> getLista();
	
	
	/**
	 * Delete a QualificationMeeting entity corresponding to the given QualificationMeeting Object.
	 * 
	 * @param qualificationMeeting the given QualificationMeeting object
	 * 
	 * @return the deleted QualificationMeeting object
	 * */
	public QualificationMeeting cancella(QualificationMeeting qualificationMeeting);
}
