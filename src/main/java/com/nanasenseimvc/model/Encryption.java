package com.nanasenseimvc.model;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class Encryption {
//converti les Bytes en String
	private static String convertToHex(byte[]data) {
		
		StringBuffer buf = new StringBuffer();//la classe String 
		//identique à la classe String, sauf qu'elle peut être
		
		for(int i=0; i<data.length; i++) {
			
			//l'opérateur >>> est un opérateur de décalage de bytes vers la droite non signé en java (en clair)
			// il divise l'opérande par 4 à la puissance de l'opérande à droite(0X0F)
			int halfByte = (data[i]>>>4) & 0x0F;
			
			int two_halfs = 0;
			do {
				//si halfByte entre 0 et 9
				if((0<=halfByte) && (halfByte<=9)) {
					//je récupère la séquence de mes caractères de 0 à 9
					buf.append((char)'0'+halfByte);
				}else {
					//je récupère la séquence de mes caractères de a à e
					buf.append((char)('a'+(halfByte-10)));
									}
				halfByte = data[i]&0x0F;
			}while(two_halfs++<1);
		}
		return buf.toString();
		}
	
	//Hachage
	public static String getSHA1 (String text) throws NoSuchAlgorithmException, UnsupportedEncodingException {
		//cette classe va fournir aux applications la fonctionnalité d'un algo de résumé de message (ex : SHA-1 ou SHA-256)
		MessageDigest md;
		//je prends un algoritme
		md=MessageDigest.getInstance("SHA-1");
		//création d'un tableau de byte de 40 caractères
		byte[] sha1hash=new byte[40];
		
		md.update(text.getBytes("iso-8859-1"),0,text.length());
		
		//je termine le calcul de hashage des opérations finales, telles que le remplissage.
		sha1hash =md.digest();
		
		return convertToHex(sha1hash);
	}
	
}