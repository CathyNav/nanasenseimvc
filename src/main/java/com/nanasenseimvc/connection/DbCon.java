package com.nanasenseimvc.connection;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbCon {

	private static Connection connection= null;
	
	
												// Si vide :				si correctement rempli
	public static Connection getConnection() throws ClassNotFoundException, SQLException {
		//checker si elle est null
		if(connection==null) {
			//va chercher le driver pour verifier la connexion
			Class.forName("com.mysql.cj.jdbc.Driver");
			//va chercher les informations de connections
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/nana_sensei", "root", "@Irfa2024!");
			System.out.print("je suis connecté à la database! ");
		}
		return connection;
	}

	
	
}