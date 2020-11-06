package it.rt.corso.beans;

import java.time.LocalDate;

public class Task {
	private String nomeTask;
	private String nomeCandidiato;
	private LocalDate dataInizio;
	private LocalDate dataFine;
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
	public LocalDate getDataInizio() {
		return dataInizio;
	}
	public void setDataInizio(LocalDate dataInizio) {
		this.dataInizio = dataInizio;
	}
	public LocalDate getDataFine() {
		return dataFine;
	}
	public void setDataFine(LocalDate dataFine) {
		this.dataFine = dataFine;
	}
}
