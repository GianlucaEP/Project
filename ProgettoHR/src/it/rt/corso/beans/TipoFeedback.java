package it.rt.corso.beans;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "tipo_feedback")
public class TipoFeedback implements Bean{
	
	@Column(name = "tipo")
	private String tipo;
	@OneToOne(mappedBy = "tipo_feedback")
	private Feedback feedback;

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}
	
	
}
