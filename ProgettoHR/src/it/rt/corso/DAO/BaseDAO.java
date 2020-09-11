package it.rt.corso.DAO;

import java.io.Serializable;

import org.hibernate.Transaction;

import it.rt.corso.beans.Bean;
import it.rt.corso.utility.Utility;

public abstract class BaseDAO {
	/**
	 * 
	 *  Generalized method to execute an insert query for the entity specified by the bean parameter.
	 *  The bean parameter is of type Bean in order to accept any object that implements the Bean interface.
	 *  
	 *  @param bean A Bean type object used to accept any object that implements the interface Bean.
	 *  
	 *  @return a Bean object containing the result of the insert.
	 *  
	 *  */	
	protected Object inserisci(Bean bean) {
		
		Utility.buildSession();
		Transaction t = Utility.getSession().beginTransaction();	
		Utility.getSession().save(bean);
		
		t.commit();
		Utility.destroySession();
		return bean;
	}
	
	/**
	 *  Generalized method to execute a select query by id for the entity specified by the classe parameter, using the id parameter as the where clause.
	 *  
	 *  @param classe this parameter is used so that the method can accept any entity object which will indicate the table targeted for the query
	 *  
	 *  @param id specify the id of the entity that will be searched by the query(where clause)
	 *  
	 *  @return a Bean object containing the result of the select.
	 *  
	 *  */	
	protected Object get(Class<?> classe, Serializable id) {

		Utility.buildSession();
		Transaction t = Utility.getSession().beginTransaction();	
		Bean b = (Bean) Utility.getSession().get(classe, id);

		t.commit();
		Utility.destroySession();
		return b;
	}
	
	/**
	 *  Generalized method to execute a delete query for the object specified by the bean parameter.
	 *  The bean parameter is of type Bean in order to accept any object that implements the Bean interface.
	 *  
	 *  @param bean used to specify the entity that will be targeted by the delete query 
	 *  
	 *  @return a Bean object containing the deleted object.
	 *  
	 *  */	
	protected Object cancella(Bean bean) {
		
		Utility.buildSession();
		Transaction t = Utility.getSession().beginTransaction();	
		Utility.getSession().delete(bean);
		
		t.commit();
		Utility.destroySession();
		return bean;
	}
	
	/**
	 *  Generalized method to execute an update query for the object specified by the bean parameter.
	 *  The bean parameter is of type Bean in order to accept any object that implements the Bean interface.
	 *  
	 *  @param bean used to specify the entity that will be targeted by the update query 
	 *  
	 *  @return a Bean object containing the updated object.
	 *  
	 *  */
	protected Object aggiorna(Bean bean) {
		
		Utility.buildSession();
		Transaction t = Utility.getSession().beginTransaction();	
		Utility.getSession().update(bean);
		
		t.commit();
		Utility.destroySession();
		return bean;
	}
	
}
