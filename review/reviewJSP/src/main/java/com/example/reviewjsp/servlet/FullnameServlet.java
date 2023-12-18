package com.example.reviewjsp.servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.*;

@WebServlet(name = "FullnameServlet", value = "/FullnameServlet")
public class FullnameServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String name = firstname + " " + lastname;

        session.setAttribute("fullname", name);

        session.setAttribute("firstname", firstname);
        session.setAttribute("lastname", lastname);

//        response.sendRedirect(request.getContextPath() + "/.jsp"); // use when u don't set any attributes

//        request.setAttribute("fullname", name );
//        request.getRequestDispatcher("/index.jsp").forward(request,response);

        session.getServletContext().getRequestDispatcher("/index.jsp").forward(request,response);
    }
}
 