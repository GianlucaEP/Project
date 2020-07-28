package it.rt.corso.DAO;

import java.io.Serializable;
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
	
	protected Object get(Class classe, Serializable id) {

		Utility.buildSession();
		Transaction t = Utility.getSession().beginTransaction();	
		Bean b = (Bean) Utility.getSession().get(classe, id);

		t.commit();
		Utility.destroySession();
		return b;
	}
}
