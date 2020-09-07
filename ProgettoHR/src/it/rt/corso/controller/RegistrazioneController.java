package it.rt.corso.controller;

import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import it.rt.corso.DAO.UtenteDAO;

import it.rt.corso.beans.Utente;

@Controller
public class RegistrazioneController {

	ApplicationContext factory = new ClassPathXmlApplicationContext("bean.xml");
	UtenteDAO udao = (UtenteDAO) factory.getBean("utenteDAO");

	@RequestMapping("/Registrati")
	public String display(Model m) {

		m.addAttribute(new Utente());
		return "PaginaRegistrazione";

	}

	@RequestMapping(value = "/RegistratiIn", method = RequestMethod.POST)
	public String registrazione(@ModelAttribute("utente") Utente utente, Model m)
			throws NoSuchAlgorithmException, InvalidKeySpecException{
// Now, salts are a fundamental principle of password hashing, and so we need
// one for PBKDF2, too:
//		SecureRandom random = new SecureRandom();
//		byte[] salt = new byte[16];
//		random.nextBytes(salt);
		String password = utente.getPassword();
//Next, we'll create a PBEKeySpec and a SecretKeyFactory which we'll instantiate using the PBKDF2WithHmacSHA1 algorithm:
//		KeySpec spec = new PBEKeySpec(password.toCharArray());
//		SecretKeyFactory factory = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA1");
//The third parameter (65536) is effectively the strength parameter. It indicates how many iterations that this algorithm run for, increasing the time it takes to produce the hash.
//		byte[] hash = factory.generateSecret(spec).getEncoded();
		
		utente.setPassword(password);
		// Finally, we can use our SecretKeyFactory to generate the hash:

		udao.inserisci(utente);
		return "redirect:/Home";

	}

}
