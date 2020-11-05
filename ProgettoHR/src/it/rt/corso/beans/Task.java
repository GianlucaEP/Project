package it.rt.corso.beans;

import java.util.Date;

public class Task {
	private String nomeTask;
	private String nomeCandidiato;
	private Date dataInizio;
	private Date dataFine;
	public String getNomeTask() {
		return nomeTask;
	}
	public void setNomeTask(String nomeTask) {
		this.nomeTask = nomeTask;
	}
	public String getNomeCandidiato() {
		return nomeCandidiato;
	}
	public void setNomeCandidiato(String nomeCandidiato) {
		this.nomeCandidiato = nomeCandidiato;
	}
	public Date getDataInizio() {
		return dataInizio;
	}
	public void setDataInizio(Date dataInizio) {
		this.dataInizio = dataInizio;
	}
	public Date getDataFine() {
		return dataFine;
	}
	public void setDataFine(Date dataFine) {
		this.dataFine = dataFine;
	}
}
