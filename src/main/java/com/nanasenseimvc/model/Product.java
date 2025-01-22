package com.nanasenseimvc.model;

/**
 * Represents a product in the system.
 * This class encapsulates all the attributes of a product.
 */
public class Product {
    // Product attributes
    private int id;          // Unique identifier for the product
    private String name;     // Name of the product
    private String category; // Category the product belongs to
    private double price;    // Price of the product
    private String image;    // URL or path to the product image
    private int stock;       // Current stock quantity
    private String tags;     // Tags associated with the product for search/filtering
    
    /**
     * Default constructor
     */
    public Product() {
        super();
    }

    /**
     * Parameterized constructor to initialize all product attributes
     */
    public Product(int id, String name, String category, double price, String image, int stock, String tags) {
        super();
        this.id = id;
        this.name = name;
        this.category = category;
        this.price = price;
        this.image = image;
        this.stock = stock;
        this.tags = tags;
    }

    // Getter and Setter methods for all attributes
    public String getTags() {
        return tags;
    }
    public void setTags(String tags) {
        this.tags = tags;
    }
    public int getStock() {
        return stock;
    }
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getCategory() {
        return category;
    }
    public void setCategory(String category) {
        this.category = category;
    }
    public double getPrice() {
        return price;
    }
    public void setPrice(double price) {
        this.price = price;
    }
    public String getImage() {
        return image;
    }
    public void setImage(String image) {
        this.image = image;
    }
    public void setStock(int stock) {
        this.stock = stock;
    }
}