package com.nanasenseimvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.nanasenseimvc.model.Client;
// Data Access Object (DAO) class for Client operations
public class ClientDao {
    private Connection con;
    private String query;
    private PreparedStatement pst; 
    private ResultSet  rs;
    // Constructor that takes a database connection
    public ClientDao(Connection con) {
        super();
        this.con = con;
    }
    // Method to update or insert client data
    public Client clientDataUpdate(int id, String nom, String prenom, String email, String adressePostale,
            String cp, String ville, String pays, String telephone) {
        Client client = null;
        try {
            // SQL query to insert client data
            query = "INSERT INTO client (idUser,nomClient, prenomClient,mailClient,adressePostaleClient, codePostaleClient, villeClient, paysClient,numTelClient) values (?, ?, ?, ?, ?, ?, ?, ?, ?);"; 
            pst = this.con.prepareStatement(query);
            // Set parameters for the prepared statement
            pst.setInt(1, id);
            pst.setString(2, nom);
            pst.setString(3, prenom);
            pst.setString(4, email);
            pst.setString(5, adressePostale);
            pst.setString(6, cp);
            pst.setString(7, ville);
            pst.setString(8, pays);
            pst.setString(9, telephone);            
            // Execute the update
            pst.executeUpdate();
            } catch (SQLException e) {
            System.out.println(e.getMessage());
        }        
        return client;
    }
    // Method to delete a client
    public Client deleteClient(int id) {
        Client client = null;
        try {
            // SQL query to delete a client
            query = "DELETE from client WHERE idUser=?;";
            pst = this.con.prepareStatement(query);
            // Set the id parameter
            pst.setInt(1, id);
            // Execute the delete operation
            pst.execute();
        } catch (Exception e) {
            // Exception handling (currently empty)
        }
        return client;
    }
    public Client getClientById(int id) {
        Client client = null;
        try {
            query = "SELECT * FROM client WHERE idUser = ?";
            pst = this.con.prepareStatement(query);
            pst.setInt(1, id);
           rs = pst.executeQuery();

            if (rs.next()) {
                client = new Client();
                client.setId(rs.getInt("idUser"));
                client.setNom(rs.getString("nomClient"));
                client.setPrenom(rs.getString("prenomClient"));
                client.setEmail(rs.getString("mailClient"));
                client.setAdressePostale(rs.getString("adressePostaleClient"));
                client.setCp(rs.getString("codePostaleClient"));
                client.setVille(rs.getString("villeClient"));
                client.setPays(rs.getString("paysClient"));
                client.setTelephone(rs.getString("numTelClient"));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return client;
    }
}
