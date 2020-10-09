package com.example.todolistsapp;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class SignUp extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // response.setContentType("text/html;charset=UTF-8");
        String fname, lname, email, password1, password2;
        fname = request.getParameter("firstname");
        lname = request.getParameter("lastname");
        email = request.getParameter("email");
        password1 = request.getParameter("password1");
        password2 = request.getParameter("password2");
        
        System.out.println(fname + " " + lname + " " + email + " " + password1 + " " + password2);
        
        if(password1.equals(password2)) {
            // 
        }
        
    }


}
