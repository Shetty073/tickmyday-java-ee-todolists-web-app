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
import javax.servlet.http.HttpSession;
import org.mindrot.jbcrypt.BCrypt;


public class SignIn extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get the data from signin form
        String email, password;
        email = request.getParameter("email");
        password = request.getParameter("password");
        
        // Check if input is empty
        if(email.trim().isEmpty()) {
            String errorMessage = "Email id cannot be empty";
            request.setAttribute("signinerror", true);
            request.setAttribute("msg", errorMessage);
            request.getRequestDispatcher("signup.jsp").forward(request, response);
        }
        if(password.trim().isEmpty()) {
            String errorMessage = "Password cannot be empty";
            request.setAttribute("signinerror", true);
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
        
        try {
            Class.forName(dbDriver);
            con = DriverManager.getConnection(dbUrl + dbName, dbUsername, dbPass);
            
            String emailLookupSql = "SELECT emailid FROM users WHERE emailid=?";
            PreparedStatement selEmailPstmt = con.prepareStatement(emailLookupSql);
            
            selEmailPstmt.setString(1, email);
            
            ResultSet emailResultSet = selEmailPstmt.executeQuery();

            if(emailResultSet.next()) {
                // The email id exists
                String passowrdLookupSql = "SELECT * FROM users WHERE emailid=?";
                PreparedStatement selPassPstmt = con.prepareStatement(passowrdLookupSql);
                
                selPassPstmt.setString(1, email);

                ResultSet passResultSet = selPassPstmt.executeQuery();
                passResultSet.next();
                String userPassHash = passResultSet.getString("password");
                int userId = passResultSet.getInt("id");
                
                selPassPstmt.close();
                passResultSet.close();
                
                // Check if the passwords match
                if(BCrypt.checkpw(password, userPassHash)) {
                    // passwords match
                    // Set the session variables
                    HttpSession userSession = request.getSession(true);
                    userSession.setAttribute("userid", userId);
                    
                    // Redirect user to todolists page
                    response.sendRedirect("todolists.jsp");
                } else {
                    // Passwords do not match
                    String errorMessage = "Email id or password is wrong";
                    request.setAttribute("signinerror", true);
                    request.setAttribute("msg", errorMessage);
                    request.getRequestDispatcher("signin.jsp").forward(request, response);
                }
                
            } else {
                // The email does not exist in database
                String errorMessage = "Password cannot be empty";
                request.setAttribute("signinerror", true);
                request.setAttribute("msg", errorMessage);
                request.getRequestDispatcher("signin.jsp").forward(request, response);
            }
            
            selEmailPstmt.close();
            emailResultSet.close();
            
            con.close();
        
        } catch (SQLException | ClassNotFoundException ex) {
            String errorMessage = "Passwords do not match! Please try again";
            request.setAttribute("signinerror", true);
            request.setAttribute("msg", ex.getMessage());
            request.getRequestDispatcher("signin.jsp").forward(request, response);
        }
        
    }

}
