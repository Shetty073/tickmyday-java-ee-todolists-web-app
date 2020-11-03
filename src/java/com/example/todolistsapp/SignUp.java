package com.example.todolistsapp;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.mindrot.jbcrypt.BCrypt;


public class SignUp extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get the data from signup form
        String fname, lname, email, password1, password2;
        fname = request.getParameter("firstname");
        lname = request.getParameter("lastname");
        email = request.getParameter("email");
        password1 = request.getParameter("password1");
        password2 = request.getParameter("password2");
        
        // Check if input is empty
        if(fname.trim().isEmpty()) {
            String errorMessage = "First name cannot be empty";
            request.setAttribute("signuperror", true);
            request.setAttribute("msg", errorMessage);
            request.getRequestDispatcher("signup.jsp").forward(request, response);
        }
        if(lname.trim().isEmpty()) {
            String errorMessage = "Last name cannot be empty";
            request.setAttribute("signuperror", true);
            request.setAttribute("msg", errorMessage);
            request.getRequestDispatcher("signup.jsp").forward(request, response);
        }
        if(email.trim().isEmpty()) {
            String errorMessage = "Email id cannot be empty";
            request.setAttribute("signuperror", true);
            request.setAttribute("msg", errorMessage);
            request.getRequestDispatcher("signup.jsp").forward(request, response);
        }
        if(password1.trim().isEmpty() || password2.trim().isEmpty()) {
            String errorMessage = "Password cannot be empty";
            request.setAttribute("signuperror", true);
            request.setAttribute("msg", errorMessage);
            request.getRequestDispatcher("signup.jsp").forward(request, response);
        }
        
        // Database info
        ServletContext servletContext = request.getServletContext();
        
        String dbDriver = servletContext.getInitParameter("dbDriver");
        String dbUrl = servletContext.getInitParameter("dbUrl");
        String dbName = servletContext.getInitParameter("dbName");
        String dbUsername = servletContext.getInitParameter("dbUsername");
        String dbPass = servletContext.getInitParameter("dbPass");
        
        Connection con = null;
        
        if(password1.equals(password2)) {
            try {
                Class.forName(dbDriver);
                con = DriverManager.getConnection(dbUrl + dbName, dbUsername, dbPass);
                
                String insertSql = "INSERT INTO users (firstname, lastname, emailid, password) VALUES (?, ?, ?, ?)";
                PreparedStatement insertPstmt = con.prepareStatement(insertSql);
                
                // Hash the password
                String hashedPassword = BCrypt.hashpw(password1, BCrypt.gensalt());
                
                // Set the form data into the prepared statement placeholders
                insertPstmt.setString(1, fname);
                insertPstmt.setString(2, lname);
                insertPstmt.setString(3, email);
                insertPstmt.setString(4, hashedPassword);
                
                // execute the sql query
                insertPstmt.executeUpdate();
                
                insertPstmt.close();
                con.close();
                
                request.setAttribute("signupsuccess", true);
                request.getRequestDispatcher("signup.jsp").forward(request, response);
                
            } catch (SQLException | ClassNotFoundException ex) {
                // ex.getMessage() can be used for logging purposes
                // But we will not display that message to the user
                // instead we will write our own error message
                String errorMessage = "Database error! Please contact support";
                request.setAttribute("signuperror", true);
                request.setAttribute("msg", errorMessage);
                request.getRequestDispatcher("signup.jsp").forward(request, response);
            }
        } else {
            String errorMessage = "Passwords do not match! Please try again";
            request.setAttribute("signuperror", true);
            request.setAttribute("msg", errorMessage);
            request.getRequestDispatcher("signup.jsp").forward(request, response);
        }
        
    }


}
