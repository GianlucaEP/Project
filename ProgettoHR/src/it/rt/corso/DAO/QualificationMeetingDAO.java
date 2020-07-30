package it.rt.corso.DAO;

import java.util.List;
import it.rt.corso.beans.QualificationMeeting;

public interface QualificationMeetingDAO {
	
	public QualificationMeeting inserisci(QualificationMeeting qm);
	public List<QualificationMeeting> getLista();
}
