package it.rt.corso.DAO;

import it.rt.corso.beans.TitoloStudio;

public interface TitoloStudioDAO {

	public TitoloStudio inserisci(TitoloStudio titoloStudio);
	public TitoloStudio cancella(TitoloStudio titoloStudio);
	public TitoloStudio get(String id);
	public TitoloStudio aggiorna(TitoloStudio titoloStudio);
}
