package it.rt.corso.filter;

import java.util.Date;

public class InserimentoToFilter{
	private static Date inserimentoTo;
	
	public static boolean isToSelected = false;

	public static Date getInserimentoTo() {
		return inserimentoTo;
	}

	public static void setInserimentoTo(Date inserimentoTo) {
		InserimentoToFilter.inserimentoTo = inserimentoTo;
	}

	public static boolean isToSelected() {
		return isToSelected;
	}

	public static void setToSelected(boolean isToSelected) {
		InserimentoToFilter.isToSelected = isToSelected;
	}
	
	
}
