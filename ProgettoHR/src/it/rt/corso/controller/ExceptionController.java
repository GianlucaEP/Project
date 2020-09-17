package it.rt.corso.controller;

import org.springframework.web.HttpRequestMethodNotSupportedException;
import org.springframework.web.bind.ServletRequestBindingException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.NoHandlerFoundException;


@ControllerAdvice
public class ExceptionController {
	/**
	 * 
	 * Handles 400 Http errors
	 * 
	 */
	@ExceptionHandler({ ServletRequestBindingException.class})
	public String sessionClosed(Exception e) {
		e.printStackTrace();
		return "/notAuthenticated";
	}

	/**
	 * 
	 * Handles 404 and 405 Http errors
	 * 
	 */
	@ExceptionHandler({ NoHandlerFoundException.class, HttpRequestMethodNotSupportedException.class  })
	public String pageNotFound(Exception e) {
		e.printStackTrace();

		return "/PageNotFound";
	}

	/**
	 * 
	 * Handles 500 Http error
	 * 
	 */
	@ExceptionHandler(Exception.class)
	public String notFoundHandler(Exception e) {
		e.printStackTrace();

		return "/InternalServerError";
	}

}
