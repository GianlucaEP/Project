package it.rt.corso.controller;


import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


public class CandidatiController {
	@RequestMapping("/Candidati")
	public String display(Model m) {
		return "Candidati";
	}

}
