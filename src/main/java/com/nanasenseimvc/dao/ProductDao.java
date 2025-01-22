package com.nanasenseimvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.nanasenseimvc.model.Cart;
import com.nanasenseimvc.model.Product;

// Data Access Object for Product-related database operations
public class ProductDao {
    private Connection con;
    private String query;
    private PreparedStatement pst;
    private ResultSet rs;

    // Constructor initializing the database connection
    public ProductDao(Connection con) {
        super();
        this.con = con;
    }

    // Method to retrieve all products from the database
    public List<Product> getAllProducts() {
        List<Product> products = new ArrayList<Product>();
        try {
            // SQL query to select all products
            query = "select * from produit";
            // Prepare statement to prevent SQL injection
            pst = this.con.prepareStatement(query);
            // Execute query and get results
            rs = pst.executeQuery();
            // Iterate through results and create Product objects
            while (rs.next()) {
                Product row = new Product();
                // Set product attributes from database results
                row.setId(rs.getInt("idproduit"));
                row.setImage(rs.getString("photoProduit"));
                row.setName(rs.getString("nomProduit"));
                row.setCategory(rs.getString("descriptionProduit"));
                row.setPrice(rs.getDouble("prixUnitaireProduit"));
                row.setStock(rs.getInt("stock"));
                row.setTags(rs.getString("tags"));
                
                // Add product to the list
                products.add(row);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return products;
    }

    // Method to retrieve a single product by its ID
    public Product getSingleProduct(int id) {
        Product row = null;
        try {
            query = "SELECT * FROM produit WHERE idProduit=?";
            pst = this.con.prepareStatement(query);
            pst.setInt(1, id);
            rs = pst.executeQuery();
            
            while (rs.next()) {
                row = new Product();
                // Set product attributes from database results
                row.setId(rs.getInt("idProduit"));
                row.setName(rs.getString("nomProduit"));
                row.setCategory(rs.getString("descriptionProduit"));
                row.setPrice(rs.getDouble("prixUnitaireProduit"));
                row.setImage(rs.getString("photoProduit"));
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return row;
    }

    // Method to add a new product to the database
    public Product addProduct(String reference, String image, String nom, String description, double prix, int stock, String tags) {
        Product product = null;
        try {
            query = "insert into produit (reference,photoProduit,nomProduit,descriptionProduit,prixUnitaireProduit,stock,tags) values (?,?,?,?,?,?,?)";
            pst = this.con.prepareStatement(query);
            // Set parameters for the prepared statement
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

    // Method to delete a product from the database by its ID
    public Product deleteProduct(int id) {
        Product product = null;
        try {
            query = "DELETE from produit WHERE idProduit=?";
            pst = this.con.prepareStatement(query);
            pst.setInt(1, id);
            pst.execute();
        } catch (Exception e) {
            // Exception handling is empty, consider adding proper error handling
        }
        return product;
    }

    // Method to retrieve cart products based on a list of Cart items
    public List<Cart> getCartProducts(ArrayList<Cart> cartList) {
        List<Cart> products = new ArrayList<Cart>();
        try {
            // Check if there are items in the cart
            if (cartList.size() > 0) {
                // Iterate through each item in the cart
                for (Cart item : cartList) {
                    query = "select * from produit where idProduit=?";
                    pst = this.con.prepareStatement(query);
                    pst.setInt(1, item.getId());
                    rs = pst.executeQuery();
                    
                    // Create Cart objects from database results
                    while (rs.next()) {
                        Cart row = new Cart();
                        row.setId(rs.getInt("idProduit"));
                        row.setName(rs.getString("nomProduit"));
                        row.setCategory(rs.getString("descriptionProduit"));
                        row.setPrice(rs.getDouble("prixUnitaireProduit") * item.getQuantity());
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
    }

public double getTotalCartPrice(ArrayList<Cart> cartList){
	 //initialisation somme à 0:
	 double sum=0;
	 try {
		//Aller vérifier s'il y a des articles dans le panier
			if(cartList.size()>0) {
				//boucle sur tout les articles qui sont dans le panier
				for (Cart item : cartList) {
					query= "select * from produit where idProduit=?";
					//requete préparée
					pst =this.con.prepareStatement(query);
					//REcupération id pour la mettre dans la requete
					pst.setInt(1, item.getId());
					rs=pst.executeQuery();
				while (rs.next()) {
					sum += rs.getDouble("prixUnitaireProduit")*item.getQuantity();
				}
			 
		 }		
	}} catch (SQLException e) {
		e.printStackTrace();
		System.out.println(e.getMessage());
	}
	 return sum;
}}