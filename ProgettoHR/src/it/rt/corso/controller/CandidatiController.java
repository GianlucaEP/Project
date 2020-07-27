package it.rt.corso.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CandidatiController {
	@RequestMapping("/Candidati")
	public String display(Model m) {
		return "InserimentoCandidati";
	}

}
