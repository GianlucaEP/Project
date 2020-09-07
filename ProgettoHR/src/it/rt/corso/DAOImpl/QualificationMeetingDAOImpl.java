package it.rt.corso.DAOImpl;

import java.util.List;

import it.rt.corso.DAO.BaseDAO;
import it.rt.corso.DAO.QualificationMeetingDAO;
import it.rt.corso.beans.QualificationMeeting;

public class QualificationMeetingDAOImpl extends BaseDAO implements QualificationMeetingDAO{

	public QualificationMeeting inserisci(QualificationMeeting qm) {
		return (QualificationMeeting) super.inserisci(qm);
	}
	
	@Override
	public QualificationMeeting get(int id) {
		return (QualificationMeeting) super.get(QualificationMeeting.class, id);
	}
	
	@Override
	public QualificationMeeting aggiorna(QualificationMeeting qm) {
		return (QualificationMeeting) super.aggiorna(qm);
	}

	public List<QualificationMeeting> getLista() {
		return null;
	}

}
