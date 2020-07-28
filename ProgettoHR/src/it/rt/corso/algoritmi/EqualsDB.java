//package it.rt.corso.algoritmi;
//
//import it.rt.corso.DAO.SinonimoDAO;
//import it.rt.corso.DAOImpl.SinonimoDAOImpl;
//import it.rt.corso.beans.Sinonimo;
//import it.rt.corso.checkstring.CheckString;
//import it.rt.corso.checkstring.CheckWithList;
//
//public class EqualsDB extends CheckWithList {
//
//	public EqualsDB(CheckString next) {
//		super(next);
//	}
//
//	public String check(String input) {
//
//		SinonimoDAO sDAO = new SinonimoDAOImpl();
//		Sinonimo s = sDAO.get(input);
//		if (s != null) {
//			if (s.getControllata() == 1) {
//				System.out.println("Volevi dire " + s.getCompetenza().getNome());
//
//				return s.getCompetenza().getNome();
//			}
//		}
//
//		return null;
//
//	}
//
//}
