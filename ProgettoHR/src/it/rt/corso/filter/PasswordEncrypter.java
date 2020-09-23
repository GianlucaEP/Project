package it.rt.corso.filter;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.xml.bind.DatatypeConverter;

public class PasswordEncrypter {
	/**
	 * 
	 * Encrypt the given password using MD5 encryption
	 * 
	 * @param password the given password that have to be encrypted
	 * 
	 * @return the encrypted password
	 * 
	 */
	public static String encryptPassword(String password) throws NoSuchAlgorithmException {

		MessageDigest md = MessageDigest.getInstance("MD5");
		md.update(password.getBytes());
		byte[] digest = md.digest();
		String myHash = DatatypeConverter.printHexBinary(digest).toUpperCase();

		return myHash;

	}
}
