package it.rt.corso.checkstring;

import java.util.ArrayList;
import java.util.List;
import it.rt.corso.DAO.SinonimoDAO;
import it.rt.corso.DAOImpl.MansioneDAOImpl;
import it.rt.corso.DAOImpl.SinonimoDAOImpl;
import it.rt.corso.beans.Mansione;
import it.rt.corso.beans.Sinonimo;

public abstract class CheckWithList extends CheckString {

	private MansioneDAOImpl competenzadao;
	private static List<Mansione> competenze = new ArrayList<>();

	public CheckWithList(CheckString next) {
		super(next);
	}

	public CheckWithList() {
		super();
	}

	public final String checkstringchild(String input) {

		SinonimoDAO sinonimoDAO = new SinonimoDAOImpl();

		if (competenze.isEmpty()) {
			competenze = competenzadao.getLista();
		}

		for (Mansione standard : competenze) {
			if (check(input, standard.getMansione())) {
				
				Sinonimo sinonimo = new Sinonimo();
				sinonimo.setSinonimo(input);
//				sinonimo.setMansione(standard);
//				sinonimo.setAlgoritmo(this.getClass().getSimpleName());
				sinonimoDAO.inserisci(sinonimo);
				
				System.out.println("Volevi dire " + standard.getMansione());
				System.out.println("Parola trovata con l'algoritmo " + this.getClass().getSimpleName());
				return standard.getMansione();
			}
		}

		return null;

	}
	
	public abstract boolean check(String input, String standard);

	//getter & setter
	public void setCompetenzadao(MansioneDAOImpl competenzadao) {
		this.competenzadao = competenzadao;
	}



}