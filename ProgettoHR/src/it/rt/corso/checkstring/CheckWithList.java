package it.rt.corso.checkstring;

import java.util.ArrayList;
import java.util.List;
import it.rt.corso.DAO.SinonimoDAO;
import it.rt.corso.DAOImpl.CompetenzeDAOImpl;
import it.rt.corso.DAOImpl.SinonimoDAOImpl;
import it.rt.corso.beans.Competenza;
import it.rt.corso.beans.Sinonimo;

public abstract class CheckWithList extends CheckString {

	private CompetenzeDAOImpl competenzadao;
	private static List<Competenza> competenze = new ArrayList<>();

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

		for (Competenza standard : competenze) {
			if (check(input, standard.getCompetenza())) {
				
				Sinonimo sinonimo = new Sinonimo();
				sinonimo.setSinonimo(input);
				sinonimo.setCompetenza(standard);
//				sinonimo.setAlgoritmo(this.getClass().getSimpleName());
				sinonimoDAO.inserisci(sinonimo);
				
				System.out.println("Volevi dire " + standard.getCompetenza());
				System.out.println("Parola trovata con l'algoritmo " + this.getClass().getSimpleName());
				return standard.getCompetenza();
			}
		}

		return null;

	}
	
	public abstract boolean check(String input, String standard);

	//getter & setter
	public void setCompetenzadao(CompetenzeDAOImpl competenzadao) {
		this.competenzadao = competenzadao;
	}



}