package com.nanasenseimvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.nanasenseimvc.model.Product;

public class ProductDao {
	private Connection con;
	private String query;
	private PreparedStatement pst;
	private ResultSet rs;


	public ProductDao(Connection con) {
		super();
		this.con = con;
	}

	public List<Product> getAllProducts(){

		List<Product> products=new ArrayList<Product>();
		try {
			//faire une recherche dans la table SQL spécifique
			query="select*from produit";
			//pour éviter les injections sql je mets en place des requêtes préparées
			pst= this.con.prepareStatement(query);
			//affiche les résultats dans une instance
			rs=pst.executeQuery();
			//tant qu'il y a des produits dans la base, il créera des produits.
			while(rs.next()) {
				Product row = new Product();
						row.setId(rs.getInt("idproduit"));
						row.setImage(rs.getString("photoProduit"));
						row.setName(rs.getString("nomProduit"));
						row.setCategory(rs.getString("descriptionProduit"));
						row.setPrice(rs.getDouble("prixUnitaireProduit"));
						row.setStock(rs.getInt("stock"));
						row.setTags(rs.getString("tags"));
						
						//ajouter des produits à la liste des produits.
						products.add(row);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return products;
}}
