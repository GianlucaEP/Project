package it.rt.corso.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.context.request.WebRequest;

import it.rt.corso.DAO.UtenteDAO;
import it.rt.corso.beans.Candidato;
import it.rt.corso.beans.Utente;

@Controller
@SessionAttributes("utente")
public class LoginController {

	ApplicationContext factory = new ClassPathXmlApplicationContext("bean.xml");
	UtenteDAO udao = (UtenteDAO) factory.getBean("utenteDAO");

	@ModelAttribute("utente")
	public Utente setUpUserForm() {
		return new Utente();
	}

	@RequestMapping(value = "/Login", method = RequestMethod.GET)
	public String display() {

		return "Login";
	}

	@RequestMapping(value = "/LogginIn", method = RequestMethod.POST)
	public String Login(@ModelAttribute Utente utente, Model m) {

		Utente u = udao.getByUsernamePassword(utente.getUsername(), utente.getPassword());

		if (u != null) {

			m.addAttribute("utente", u);
			return "redirect:/";
		}
		m.addAttribute("info", "error");
		return "redirect:/Login";
//	CHIEDERE AL PROF: il link della pagina sembra non essere corretto(logginIn) anche se tutto fila liscio come l olio (info === error)	
	}

	@RequestMapping(value = "/Logout", method = RequestMethod.GET)
	public String Logout(/* HttpServletRequest request */ WebRequest webRequest, SessionStatus status) {
		status.setComplete();
		webRequest.removeAttribute("utente", WebRequest.SCOPE_SESSION);

//		 HttpSession session=request.getSession(); 
//		 System.out.println("session id before invalidating it:"+session.getId());
//		          Utente utente=(Utente)session.getAttribute("utente");
//		          System.out.println("utente obje"+utente.getUsername());
//		          session.removeAttribute("utente");   
//		    session.invalidate(); 
//		System.out.println("session id after invalidating session is:"+session.getId());
		return "redirect:/Login";
	}

}
