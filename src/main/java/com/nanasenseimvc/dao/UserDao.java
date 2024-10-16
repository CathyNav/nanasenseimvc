package com.nanasenseimvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.nanasenseimvc.model.User;



public class UserDao {
 private Connection con;
 private String query;
 private PreparedStatement pst;
 private ResultSet rs;
 private Statement st;
 
public UserDao(Connection con) {
	this.con = con;
}
 
 public User userLogin(String email, String password) {
	 User user=null;
	 
	 try {
		 //va aller chercher dans la table user le mdp et le mail
		query="select*from users where email=? and motDePasse=?;";
		//lutter contre les injections SQL
		pst=this.con.prepareStatement(query);  
		pst.setString(1,email);
		pst.setString(2, password);
		
		rs = pst.executeQuery(); // Je prends les résultats de la requete de la base de données
		if(rs.next()) {//si j'ai des données dans mon rs,
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
 
 public User userForgotPassword(String email, String securityQuestion, String answer, String userPassword) {
	 int check=0;
	 User user=null;
	 try {
		query= "SELECT * FROM users WHERE email='"+email+"' and questionDeSecurite='"+securityQuestion+"' and reponse='"+answer+"';";
		st=this.con.createStatement();
		rs=st.executeQuery(query);
		
		while(rs.next()) {
			check=1;
			st.executeUpdate("update users set motDePasse='"+userPassword+"' where email='"+email+"';");
			System.out.print("Password Updated !");
		}
		if(check==0) {
			System.out.print("Password not Updated");
			
		}
		
	} catch (Exception e) {
		System.out.println(e.getMessage());
	}
	 return user;
}
 public User deleteUser(int id) {
		
		User user = null;
		try {
			query= "DELETE from users WHERE idUser=?;";
			pst=this.con.prepareStatement(query);
			pst.setInt(1, id);
			pst.execute();
		} catch (Exception e) {
			
		}

	return user;
	}
 }
