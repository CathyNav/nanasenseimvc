package com.nanasenseimvc.model;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class Encryption {
    // Converts Bytes to String
    private static String convertToHex(byte[] data) {        
        StringBuffer buf = new StringBuffer(); // StringBuffer class
        // Similar to String class, but can be modified        
        for (int i = 0; i < data.length; i++) {            
            // The >>> operator is an unsigned right shift operator in Java
            // It divides the operand by 4 to the power of the right operand (0x0F)
            int halfByte = (data[i] >>> 4) & 0x0F;
            int two_halfs = 0;
            do {
                // If halfByte is between 0 and 9
                if ((0 <= halfByte) && (halfByte <= 9)) {
                    // Append the character sequence from 0 to 9
                    buf.append((char) ('0' + halfByte));
                } else {
                    // Append the character sequence from a to e
                    buf.append((char) ('a' + (halfByte - 10)));
                }
                halfByte = data[i] & 0x0F;
            } while (two_halfs++ < 1);
        }
        return buf.toString();
    }    
    // Hashing
    public static String getSHA1(String text) throws NoSuchAlgorithmException, UnsupportedEncodingException {
        // This class provides applications with the functionality of a message digest algorithm (e.g., SHA-1 or SHA-256)
        MessageDigest md;
        // Choose an algorithm
        md = MessageDigest.getInstance("SHA-1");
        // Create a byte array of 40 characters
        byte[] sha1hash = new byte[40];        
        md.update(text.getBytes("iso-8859-1"), 0, text.length());        
        // Complete the hash calculation by performing final operations such as padding
        sha1hash = md.digest();        
        return convertToHex(sha1hash);
    }
}