package it.rt.corso.DAO;

import java.util.List;

import it.rt.corso.beans.TitoloStudio;

public interface TitoloStudioDAO {

	public TitoloStudio inserisci(TitoloStudio titoloStudio);
	public TitoloStudio cancella(TitoloStudio titoloStudio);
	public TitoloStudio get(int id);
	public TitoloStudio getByName(String name);
	public TitoloStudio aggiorna(TitoloStudio titoloStudio);
	public List<TitoloStudio> getLista();
}
