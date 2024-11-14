package com.nanasenseimvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.nanasenseimvc.model.Cart;
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
}

public Product getSingleProduct(int id) {
	Product row = null;
		
		try {
			query ="SELECT * FROM produit WHERE idProduit=? ";//le ? va chercher les info du u_id noté
			pst= this.con.prepareStatement(query);
			pst.setInt(1, id);
			rs = pst.executeQuery();
			
			while (rs.next()) {
				row = new Product();			
				row.setId(rs.getInt("idProduit"));
				row.setName(rs.getString("nomProduit"));
				row.setCategory(rs.getString("descriptionProduit"));
				row.setPrice(rs.getDouble("prixUnitaireProduit"));
				row.setImage(rs.getString("photoProduit"));
				}
			}
			catch (Exception e) {
			e.getStackTrace();
			System.out.println(e.getMessage());
		}
		return row;}

public Product addProduct(String reference,String image, String nom, String description, double prix , int stock, String tags) {
	Product product = null;
	try {
		query="insert into produit (reference,photoProduit,nomProduit,descriptionProduit,prixUnitaireProduit,stock, tags) values (?,?,?,?,?,?,?) ";
		
		pst=this.con.prepareStatement(query);
		pst.setString(1, reference);
		pst.setString(2, image);
		pst.setString(3, nom);
		pst.setString(4, description);
		pst.setDouble(5, prix);
		pst.setInt(6, stock);
		pst.setString(7, tags);
		
		pst.executeUpdate();
		
		
	} catch (Exception e) {
		e.printStackTrace();
		System.out.println(e.getMessage());
	}
	return product;
}

public Product deleteProduct(int id) {
	
	Product product = null;
	try {
		query= "DELETE from produit WHERE idProduit=?;";
		pst=this.con.prepareStatement(query);
		pst.setInt(1, id);
		pst.execute();
	} catch (Exception e) {
		
	}

return product;
}

public List<Cart> getCartProducts(ArrayList<Cart> cartList){
	List<Cart> products = new ArrayList<Cart>();
	try {
		//Aller vérifier s'il y a des articles dans le panier
		if(cartList.size()>0) {
			//boucle sur tout les articles qui sont dans le panier
			for (Cart item : cartList) {
				query= "select*from produit where idProduit=?";
				//requete préparée
				pst =this.con.prepareStatement(query);
				//REcupération id pour la mettre dans la requete
				pst.setInt(1, item.getId());
				rs=pst.executeQuery();
				
				//tant qu'il y a des articles
				while(rs.next()) {
					Cart row = new Cart();
					row.setId(rs.getInt("idProduit"));
					row.setName(rs.getString("nomProduit"));
					row.setCategory(rs.getString("descriptionProduit"));
					row.setPrice(rs.getDouble("prixUnitaireProduit")*item.getQuantity());
					row.setImage(rs.getString("photoProduit"));
					row.setQuantity(item.getQuantity());
					products.add(row);
				}
				
			}
		}
			
		
	} catch (SQLException e) {
		e.printStackTrace();
		System.out.println(e.getMessage());
		
	}
	
	return products;
}}

