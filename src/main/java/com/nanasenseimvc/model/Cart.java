// Package declaration
package com.nanasenseimvc.model;

// Cart class definition, extending the Product class
public class Cart extends Product {
    // Private field to store the quantity of the product in the cart
    private int quantity;

    // Getter method for the quantity
    public int getQuantity() {
        return quantity;
    }

    // Setter method for the quantity
    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    // Default constructor
    public Cart() {
        // Call the superclass (Product) constructor
        super();
    }
}
