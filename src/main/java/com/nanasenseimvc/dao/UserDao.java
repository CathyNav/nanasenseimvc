package com.nanasenseimvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Logger;

import com.nanasenseimvc.model.User;

// Data Access Object (DAO) class for User operations
public class UserDao {
 private Connection con;
 private String query;
 private PreparedStatement pst;
 private ResultSet rs;
 private Statement st;
 
 // Constructor that takes a database connection
 public UserDao(Connection con) {
    this.con = con;
 }

 // Method to authenticate user login
 public User userLogin(String email, String password) {
    User user = null;    
    try {
        // SQL query to fetch user details based on email and password
        query = "select * from users where email=? and motDePasse=?;";
        // Use prepared statement to prevent SQL injection
        pst = this.con.prepareStatement(query);  
        pst.setString(1, email);
        pst.setString(2, password);        
        rs = pst.executeQuery(); // Execute the query and get results
        if(rs.next()) { // If a matching user is found
            user = new User();
            user.setId(rs.getInt("idUser"));
            user.setPseudo(rs.getString("pseudo"));
            user.setEmail(rs.getString("email"));
            user.setRoles(rs.getString("roles"));    
        }
    } catch (SQLException e) {
        System.out.print(e.getMessage());
    }
    return user;
 }
 
 public boolean userForgotPassword(String email, String securityQuestion, String answer, String newPassword) {
	    boolean updated = false;
	    String checkQuery = "SELECT * FROM users WHERE email = ? AND questionDeSecurite = ? AND reponse = ?";
	    String updateQuery = "UPDATE users SET motDePasse = ? WHERE email = ?";
	    
	    try (PreparedStatement checkStmt = con.prepareStatement(checkQuery);
	         PreparedStatement updateStmt = con.prepareStatement(updateQuery)) {
	        
	        checkStmt.setString(1, email);
	        checkStmt.setString(2, securityQuestion);
	        checkStmt.setString(3, answer);
	        
	        try (ResultSet rs = checkStmt.executeQuery()) {
	            if (rs.next()) {
	                updateStmt.setString(1, newPassword); 
	                updateStmt.setString(2, email);
	                int rowsAffected = updateStmt.executeUpdate();
	                updated = (rowsAffected > 0);
	            }
	        }
	    } catch (SQLException e) {
	        // Log the error properly
	    	System.out.println(e.getMessage());
	    }
	    return updated;
	}
 
 // Method to delete a user
 public User deleteUser(int id) {        
    User user = null;
    try {
        // SQL query to delete a user
        query = "DELETE from users WHERE idUser=?;";
        pst = this.con.prepareStatement(query);
        pst.setInt(1, id);
        pst.execute();
    } catch (Exception e) {
        // Exception handling (currently empty)
    }
    return user;
 }
}
