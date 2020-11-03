
package com.example.todolistsapp;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Enumeration;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class CreateNewTodoList extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int userId = (int) request.getSession().getAttribute("userid");
        int todolist_id = 0;
        String title = null;
        ArrayList<String> todos = new ArrayList<String>(); ;
        
        Enumeration<String> paramNames = request.getParameterNames();
        
        
        while(paramNames.hasMoreElements()) {
            String param = paramNames.nextElement();
            if (param.equals("title")) {
                title = request.getParameter(param);
            } else {
                todos.add(request.getParameter(param));
            }
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
            
            String insertTodoListsSql = "INSERT INTO todolists (title, user_id) " +
                "VALUES (?, ?)";
            PreparedStatement insertTodoListsPstmnt = con.prepareStatement(insertTodoListsSql, Statement.RETURN_GENERATED_KEYS);
            
            insertTodoListsPstmnt.setString(1, title);
            insertTodoListsPstmnt.setInt(2, userId);
            
            insertTodoListsPstmnt.executeUpdate();
            ResultSet rs = insertTodoListsPstmnt.getGeneratedKeys();
            if ( rs.next() ) {
                // Retrieve the auto generated key(s).
                todolist_id = rs.getInt(1);
            }
            
            for(String todo: todos) {
                String inserTodosSql = "INSERT INTO todos (todo , todolist_id) " +
                "VALUES (?, ?)";
                PreparedStatement inserTodosPstmnt = con.prepareStatement(inserTodosSql);
                
                inserTodosPstmnt.setString(1, todo);
                inserTodosPstmnt.setInt(2, todolist_id);
                
                inserTodosPstmnt.executeUpdate();
                inserTodosPstmnt.close();
            }
            
            insertTodoListsPstmnt.close();
            con.close();
            response.sendRedirect("todolists.jsp");
            
            
        } catch (SQLException | ClassNotFoundException ex) {
            log(ex.getMessage());
            String errorMessage = "Database error! Please contact support";
            request.setAttribute("createtodoerror", true);
            request.setAttribute("msg", errorMessage);
            request.getRequestDispatcher("addnewtodo.jsp").forward(request, response);
        }        
    }


}
