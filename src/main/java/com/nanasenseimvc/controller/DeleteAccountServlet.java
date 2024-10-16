package com.nanasenseimvc.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nanasenseimvc.connection.DbCon;
import com.nanasenseimvc.dao.ClientDao;
import com.nanasenseimvc.dao.UserDao;

@WebServlet ("/deleteaccount")
public class DeleteAccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public DeleteAccountServlet() {
        super();
      
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
response.setContentType("text/html ; charset:UTF-8");
		try (PrintWriter out = response.getWriter()) {
			String id = request.getParameter("id");
			
			if (id !=null) {
				UserDao userDao = new UserDao(DbCon.getConnection());
				userDao.deleteUser(Integer.parseInt(id));
				
				ClientDao clientDao = new ClientDao(DbCon.getConnection());
				clientDao.deleteClient(Integer.parseInt(id));
				
				System.out.println("User deleted");
				response.sendRedirect("index.jsp");
				request.getSession().removeAttribute("auth");
								
				}else {
					System.out.println("User did'nt delete");
					response.sendRedirect("account.jsp?msg=wrong");
				}
			} catch (SQLException | ClassNotFoundException e) {
				e.printStackTrace();
				System.out.println(e.getMessage());
				
			}
			}
			
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
