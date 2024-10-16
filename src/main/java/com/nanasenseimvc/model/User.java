package com.nanasenseimvc.model;

public class User {
	private int id;
	private String email;
	private String password;
	private String pseudo;
	private String securityQuestion;
	private String answer;
	private String roles;
	
	
	public User() {
		super();
	}
		
	


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




		public int getId() {
			return id;
		}




		public void setId(int id) {
			this.id = id;
		}


		public String getEmail() {
			return email;
		}




		public void setEmail(String email) {
			this.email = email;
		}




		public String getPassword() {
			return password;
		}




		public void setPassword(String password) {
			this.password = password;
		}




		public String getPseudo() {
			return pseudo;
		}




		public void setPseudo(String pseudo) {
			this.pseudo = pseudo;
		}


		public String getSecurityQuestion() {
			return securityQuestion;
		}




		public void setSecurityQuestion(String securityQuestion) {
			this.securityQuestion = securityQuestion;
		}




		public String getAnswer() {
			return answer;
		}




		public void setAnswer(String answer) {
			this.answer = answer;
		}




		public void setRoles(String roles) {
			this.roles = roles;
		}




		public String getRoles() {
			return roles;
		}






	
}
