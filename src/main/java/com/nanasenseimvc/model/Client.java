package com.nanasenseimvc.model;

public class Client extends User{

 private String nom;
 private String prenom;
 private String email;
 private String adressePostale;
 private String cp;
 private String ville;
 private String pays;
 private String telephone;
public Client() {
	super();
}
public Client(String nom, String prenom, String email, String adressePostale, String cp, String ville, String pays,
		String telephone) {
	super();
	this.nom = nom;
	this.prenom = prenom;
	this.email = email;
	this.adressePostale = adressePostale;
	this.cp = cp;
	this.ville = ville;
	this.pays = pays;
	this.telephone = telephone;
}

public String getNom() {
	return nom;
}
public void setNom(String nom) {
	this.nom = nom;
}
public String getPrenom() {
	return prenom;
}
public void setPrenom(String prenom) {
	this.prenom = prenom;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getAdressePostale() {
	return adressePostale;
}
public void setAdressePostale(String adressePostale) {
	this.adressePostale = adressePostale;
}
public String getCp() {
	return cp;
}
public void setCp(String cp) {
	this.cp = cp;
}
public String getVille() {
	return ville;
}
public void setVille(String ville) {
	this.ville = ville;
}
public String getPays() {
	return pays;
}
public void setPays(String pays) {
	this.pays = pays;
}
public String getTelephone() {
	return telephone;
}
public void setTelephone(String telephone) {
	this.telephone = telephone;
}
public Client(int id, String email, String password, String pseudo, String securityQuestion, String answer,
		String roles) {
	super(id, email, password, pseudo, securityQuestion, answer, roles);
	
}
@Override
public String toString() {
	return "Client [nom=" + nom + ", prenom=" + prenom + ", email=" + email + ", adressePostale=" + adressePostale
			+ ", cp=" + cp + ", ville=" + ville + ", pays=" + pays + ", telephone=" + telephone + ", getId()=" + getId()
			+ ", getPassword()=" + getPassword() + ", getPseudo()=" + getPseudo() + ", getSecurityQuestion()="
			+ getSecurityQuestion() + ", getAnswer()=" + getAnswer() + ", getRoles()=" + getRoles() + ", getClass()="
			+ getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
}



 
}
