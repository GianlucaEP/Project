package it.rt.corso.DAO;

import org.hibernate.Transaction;
import it.rt.corso.beans.Bean;
import it.rt.corso.utility.Utility;

public abstract class BaseDAO {
	
	protected Object inserisci(Bean bean) {
		
		Utility.buildSession();
		Transaction t = Utility.getSession().beginTransaction();	
		Utility.getSession().save(bean);
		
		t.commit();
		Utility.destroySession();
		return bean;
	}
}
