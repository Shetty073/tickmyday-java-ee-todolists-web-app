
package com.example.todolistsapp;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class UpdateTodoList extends HttpServlet {

    // POST request is for updating todolist
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int todolistId = Integer.parseInt(request.getParameter("todolistId"));
        String todo = request.getParameter("newtodoitem");
        
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
            
            String inserTodosSql = "INSERT INTO todos (todo , todolist_id) " +
            "VALUES (?, ?)";
            PreparedStatement inserTodosPstmnt = con.prepareStatement(inserTodosSql);

            inserTodosPstmnt.setString(1, todo);
            inserTodosPstmnt.setInt(2, todolistId);

            inserTodosPstmnt.executeUpdate();
            inserTodosPstmnt.close();
            
            
            String urlToRedirect = "editlist.jsp?todolistId=" + todolistId;
            response.sendRedirect(urlToRedirect);
            
            inserTodosPstmnt.close();
            con.close();
            
        } catch(SQLException | ClassNotFoundException ex) {
            String errorMessage = "Database error! Please contact support";
            request.setAttribute("editerror", true);
            request.setAttribute("msg", errorMessage);
            request.getRequestDispatcher("editlist.jsp").forward(request, response);
        }
    }
    
    
    // GET request is for deleting todolist
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int todolistId = Integer.parseInt(request.getParameter("todolistId"));
        
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
            
            String deleteSql = "DELETE FROM todolists WHERE id=?";
            PreparedStatement deletePstmt = con.prepareStatement(deleteSql);
            
            deletePstmt.setInt(1, todolistId);
            
            deletePstmt.executeUpdate();
            
            response.sendRedirect("todolists.jsp");
            
            deletePstmt.close();
            con.close();
            
        } catch(SQLException | ClassNotFoundException ex) {
            String errorMessage = "Database error! Please contact support";
            request.setAttribute("editerror", true);
            request.setAttribute("msg", errorMessage);
            request.getRequestDispatcher("editlist.jsp").forward(request, response);
        }
    }


}
