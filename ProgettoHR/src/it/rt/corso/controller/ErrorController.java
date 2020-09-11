package it.rt.corso.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller 
public class ErrorController {
	@RequestMapping(value = "/PageNotFound", method = RequestMethod.POST)
	public String pageNotFound() {

		return "/PageNotFound";
	}
	
	@RequestMapping(value = "/notAuthenticated", method = RequestMethod.POST)
	public String notAuthenticated() {

		return "/notAuthenticated";
	}
}
