
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


public class DeleteSingleTodoItem extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int todoId = Integer.parseInt(request.getParameter("todoId"));
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
            
            String deleteSql = "DELETE FROM todos WHERE id=?";
            PreparedStatement deletePstmt = con.prepareStatement(deleteSql);
            
            deletePstmt.setInt(1, todoId);
            
            deletePstmt.executeUpdate();
            
            deletePstmt.close();
            con.close();
            
//            String urlToGo = "editlist.jsp?todolistId=" + todolistId;
//            response.sendRedirect(urlToGo);
            
        } catch(SQLException | ClassNotFoundException ex) {
            String errorMessage = "Database error! Please contact support";
            request.setAttribute("editerror", true);
            request.setAttribute("msg", errorMessage);
            request.getRequestDispatcher("editlist.jsp").forward(request, response);
        }
        
    }


}
