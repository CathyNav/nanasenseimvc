package com.nanasenseimvc.model;

// User class to represent a user in the system
public class User {
    // User attributes
    private int id;
    private String email;
    private String password;
    private String pseudo;
    private String securityQuestion;
    private String answer;
    private String roles;
    
    // Default constructor
    public User() {
        super();
    }
    // Parameterized constructor
    public User(int id, String email, String password, String pseudo,
        String securityQuestion, String answer, String roles) {
        super();
        this.id = id;
        this.email = email;
        this.password = password;
        this.pseudo = pseudo;
        this.securityQuestion = securityQuestion;
        this.answer = answer;
        this.roles = roles;
    }
    // Getter for id
    public int getId() {
        return id;
    }
    // Setter for id
    public void setId(int id) {
        this.id = id;
    }
    // Getter for email
    public String getEmail() {
        return email;
    }
    // Setter for email
    public void setEmail(String email) {
        this.email = email;
    }
    // Getter for password
    public String getPassword() {
        return password;
    }
    // Setter for password
    public void setPassword(String password) {
        this.password = password;
    }
    // Getter for pseudo (username)
    public String getPseudo() {
        return pseudo;
    }
    // Setter for pseudo (username)
    public void setPseudo(String pseudo) {
        this.pseudo = pseudo;
    }
    // Getter for security question
    public String getSecurityQuestion() {
        return securityQuestion;
    }
    // Setter for security question
    public void setSecurityQuestion(String securityQuestion) {
        this.securityQuestion = securityQuestion;
    }
    // Getter for security question answer
    public String getAnswer() {
        return answer;
    }
    // Setter for security question answer
    public void setAnswer(String answer) {
        this.answer = answer;
    }
    // Setter for user roles
    public void setRoles(String roles) {
        this.roles = roles;
    }
    // Getter for user roles
    public String getRoles() {
        return roles;
    }
}
