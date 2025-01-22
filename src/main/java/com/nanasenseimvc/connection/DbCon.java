
package com.nanasenseimvc.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbCon {

    // Static Connection object to be reused
    private static Connection connection = null;
    
    // Method to get database connection
    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        // Check if connection is null (not established yet)
        if(connection == null) {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // Establish connection to the database
            // URL format: jdbc:mysql://host:port/database_name
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/nana_sensei", "root", "@Irfa2024!");
            
            // Print success message to console
            System.out.print("je suis connecté à la database! ");
        }
        // Return the established connection
        return connection;
    }
}