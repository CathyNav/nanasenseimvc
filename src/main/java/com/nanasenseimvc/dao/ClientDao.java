package com.nanasenseimvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.nanasenseimvc.model.Client;


public class ClientDao {
	private Connection con;
	 private String query;
	 private PreparedStatement pst;
	
	 	
	public ClientDao(Connection con) {
		super();
		this.con = con;
	}

	public Client clientDataUpdate(int id, String nom, String prenom, String email, String adressePostale,
			String cp, String ville, String pays, String telephone) {
		 Client client=null;
		 try {
			 query = "INSERT INTO client (idUser,nomClient, prenomClient,mailClient,adressePostaleClient, codePostaleClient, villeClient, paysClient,numTelClient) values (?, ?, ?, ?, ?, ?, ?, ?, ?);"; 
			pst=this.con.prepareStatement(query);
			pst.setInt(1, id);
			pst.setString(2, nom);
			pst.setString(3, prenom);
			pst.setString(4, email);
			pst.setString(5, adressePostale);
			pst.setString(6, cp);
			pst.setString(7, ville);
			pst.setString(8, pays);
			pst.setString(9, telephone);
			
			pst.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		 
				return client;
		
	}
	
	 public Client deleteClient(int id) {
			
		 Client client=null;
			try {
				query= "DELETE from client WHERE idUser=?;";
				pst=this.con.prepareStatement(query);
				pst.setInt(1, id);
				pst.execute();
			} catch (Exception e) {
				
			}

		return client;
		}
}
