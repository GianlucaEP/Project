package it.rt.corso.DAO;

import java.util.List;

import it.rt.corso.beans.QualificationMeeting;

public interface QualificationMeetingDAO {

	public QualificationMeeting inserisci(QualificationMeeting qm);

	public QualificationMeeting aggiorna(QualificationMeeting qm);

	public QualificationMeeting get(int id);

	public List<QualificationMeeting> getLista();
}
